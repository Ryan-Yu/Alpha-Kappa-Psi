class Rushee < ActiveRecord::Base

	has_many :rusheeposts, dependent: :destroy

	before_save { self.email = email.downcase }
	before_save { self.grade = grade.capitalize }

	has_attached_file :photograph,
	  :styles => { :medium => "300x300>", :middle => "250x250>", :middlesmall => "225x225>", :small => "200x200>", :thumb => "100x100>" },
	  :storage => :s3,
	  :bucket => "uc-berkeley-akpsi-website",
	  :default_url => '/images/:attachment/missing_:style.png',
	  :url =>':s3_domain_url',
	  :path => '/:class/:attachment/:id_partition/:style/:filename',
	  :s3_credentials => S3_CREDENTIALS
	

	# Validation for name attribute
	validates(:name, presence: true, length: { maximum: 50 } )

	# Validation for email attribute
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } )

end
