class Url < ActiveRecord::Base
	validates :long_url, presence: true 
	validate :http
	before_save :shorten 

	def shorten
		self.short_url = SecureRandom.hex(3)
	end 

	def http 
		if self.long_url[0..3] != 'http' && self.long_url[0..2] == 'www'
			self.long_url = 'http://' + self.long_url 
		elsif self.long_url[0..2] != 'www' && self.long_url[0..3] != 'http'
			self.long_url = 'http://www.' + self.long_url 
		end 
	end 

end
