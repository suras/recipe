module SearchName
  
  extend ActiveSupport::Concern

  def self.search(q)
    self.find(:all, :conditions => {:name => /.*#{q}.*/i})
  end

end