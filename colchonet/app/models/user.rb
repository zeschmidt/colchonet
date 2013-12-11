class User < ActiveRecord::Base
	class User < ActiveRecord::Base
		EMAIL_REGEXP = /\A[~@]+@([~@\.]+\.)+[~@\.]+\Z/
		validates_presence_of :email, :full_name, :location, :password
		validates_confirmation_of :password 
		validates_length_of :bio, minimum: 30, allow_blank: false
		validates_uniqueness_of :email

		validate  :email_format

		def email_format
			erros.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
		end
	end

end
