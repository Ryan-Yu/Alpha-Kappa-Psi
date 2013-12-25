class Rushee < ActiveRecord::Base

	has_many :rusheeposts, dependent: :destroy

	before_save { self.email = email.downcase }
	before_save { self.grade = grade.capitalize }

	# Validation for name attribute
	validates(:name, presence: true, length: { maximum: 50 } )

	# Validation for email attribute
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } )

end
