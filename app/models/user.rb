class User < ActiveRecord::Base
	attr_accessor :email_confirmation
	attr_accessor :add1
	attr_accessor :add2
	attr_accessor :add3
	attr_accessor :phone1
	attr_accessor :phone2
	attr_accessor :phone3
	attr_accessor :firstname
	attr_accessor :lastname
 
    before_save { if (self.id == nil) then self.email = email.downcase; self.hospitaladdress = add1  + "," + add2 + "," + add3; self.phone = phone1 + phone2 + phone3; self.name = firstname + " " + lastname; end}
  	before_create :create_remember_token
	validates :firstname, presence: true, length: { maximum: 25 }
	validates :lastname, presence: true, length: { maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	validate :check_email
	

	def check_email
	  errors.add(:email, "addresses are different!") if email.downcase != email_confirmation.downcase
	end
	
	def check_phone
	  errors.add(:phone, "number is Incorrect!") if (!(/\A\d+\z/ === phone))
	end
	
	def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def User.hash(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    private

		def create_remember_token
		  self.remember_token = User.hash(User.new_remember_token)
		end
end
