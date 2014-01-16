class RushApplication < ActiveRecord::Base

  belongs_to :rushee

  has_attached_file :cover_letter,
                    :storage => :s3,
                    :bucket => "akpsi-alpha-beta",
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => S3_CREDENTIALS

  has_attached_file :resume,
                    :storage => :s3,
                    :bucket => "akpsi-alpha-beta",
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => S3_CREDENTIALS

  has_attached_file :transcript,
                    :storage => :s3,
                    :bucket => "akpsi-alpha-beta",
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => S3_CREDENTIALS

  has_attached_file :additional_transcript,
                    :storage => :s3,
                    :bucket => "akpsi-alpha-beta",
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => S3_CREDENTIALS

  has_attached_file :photograph,
                    :styles => { :medium => "300x300>", :middle => "250x250>", :middlesmall => "225x225>", :small => "200x200>", :thumb => "100x100>" },
                    :storage => :s3,
                    :bucket => "akpsi-alpha-beta",
                    :default_url => '/images/:attachment/missing_:style.png',
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => S3_CREDENTIALS

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, :phone_number, :address, :city, :state, :country, :zip_code, :grade,
            :first_major, :first_major_gpa, :cumulative_gpa,
            :academic_schedule, presence: true

  validates_attachment :cover_letter, :resume, :transcript,
                      content_type: {content_type: "application/pdf"},
                      presence: true,
                      size: {in: 0..1.megabytes}

  validates_attachment :additional_transcript,
                      content_type: {content_type: "application/pdf"},
                      size: {in: 0..1.megabytes}

  validates_attachment :photograph,
                      content_type: {content_type: ["image/jpg", "image/gif", "image/png", "image/jpeg"]},
                      presence: true,
                      size: {in: 0..3.megabytes}

end
