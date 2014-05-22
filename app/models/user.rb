class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  before_save :ensure_authentication_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # fields
  ## Database authenticatable
  field :first_name,         type: String, default: ""
  field :last_name,          type: String, default: ""
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :ext_image,         type: String 
  field :auth_token, type: String
  field :confirmed_at, type: Time
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  # relations
  has_many :recipe_items
  has_many :authentications, dependent: :delete
  has_many :ingredients
  has_many :workflows

  # methods

  def self.create_or_find_by_email_and_password(email, password)
    user = User.where(email: email).first
    if(user.present?)
      return user if user.valid_password?(password)
      return false
    else
      user = User.create!(email: email, password: password)
      return user
    end
  end

  def ensure_authentication_token
    if auth_token.blank?
      self.auth_token = generate_authentication_token
    end
  end
 
  def send_password_reset
    self.reset_password_token =  SecureRandom.random_number(88888888)
    self.reset_password_sent_at = Time.zone.now
    save!
    # Notifier.password_reset(self).deliver
  end

  # mongoid devise session issue for rails 4.1 fix
  # https://github.com/plataformatec/devise/issues/2949
  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key.to_s)
      record if record && record.authenticatable_salt == salt
    end
  end

  private
    
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(auth_token: token).first
      end
    end

end
