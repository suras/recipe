module SearchName
  
  def search(q)
  	self.any_of({ :name => /.*#{q}.*/i })
  end

end