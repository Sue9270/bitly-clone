class Url  < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
   before_create :shorten
   validates :long_url, :format  => URI::regexp(%w(http https))	


	def shorten
		shorturl = SecureRandom.hex(5)
		self.short_url = shorturl
	end 

end


