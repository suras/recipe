class Api::V1::AuthenticationsController <  Api::V1::BaseController

  def create_user
    case params[:provider]
      when "facebook"
        facebook
      when "manual"
        manual
      when "google"
        google
      else
        render json:{error_code: Code[:error_no_resource]}, status: Code[:status_error]
    end
  end

  def facebook
    fbuser = FbGraph::User.me(params[:access_token]).fetch
    uid = fbuser.raw_attributes[:id]
    authentication = Authentication.where(:uid => uid, :provider => "facebook").first
    user = authentication.present? ? User.find(authentication.user_id) : false
    unless user.present?
      user = User.find_by(email: fbuser.email) 
      user = user.present? ? user : User.new
      unless user.persisted?
        user.email = fbuser.email
        user.first_name = fbuser.first_name
        user.last_name = fbuser.last_name
        user.ext_image = fbuser.picture
        user.password = Devise.friendly_token.first(8)
        user.confirmed_at = Time.now
        user.save!
      end
      user.authentications.create!(:provider => "facebook", :uid => uid, :token => params[:access_token])
    end
      render json: user  
  rescue => e
      render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error] 
  end
   

  def google
    google = OmniAuth::Strategies::GoogleOauth2.new("", "") 
    client = OAuth2::Client.new("", "", google.options.client_options) 
    token = OAuth2::AccessToken.new(client, params[:access_token], google.options.token_options)
    google.access_token = token
    authentication = Authentication.where(:uid =>  google.raw_info["id"], :provider => "google").first
    user = authentication.present? ? User.find(authentication.user_id) : false
    unless user.present?
      user = User.find_by(email: google.info[:email]) 
      user = user.present? ? user : User.new
      unless user.persisted?
        user.email = google.info[:email]
        user.first_name = google.info[:first_name]
        user.last_name = google.info[:last_name]
        user.password = Devise.friendly_token.first(8)
        user.ext_image = google.info[:image]
        user.confirmed_at = Time.now
        user.save!
      end
      user.authentications.create!(:provider => "google", :uid =>  google.raw_info["id"], :token => params[:access_token])
    end
      render json: user 
  rescue => e
       render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end


  
  def manual
    user = User.create_or_find_by_email_and_password(params[:email], params[:password])
    if(user.present?)
      render json: user
    else
      render json: {error_code: Code[:error_email_taken], error_message: "incorrect credentials"}, status: Code[:status_error]
    end
  rescue => e
    render json: {error_code: Code[:error_rescue], error_message: e.message}, status: Code[:status_error]
  end
end
