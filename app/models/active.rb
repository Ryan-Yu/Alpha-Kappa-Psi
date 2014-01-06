class Active < ActiveRecord::Base

  before_save :default_values
  before_save { self.name = name.titleize }

  has_many :rusheeposts, dependent: :destroy

  has_attached_file :photograph,
    :styles => { :medium => "300x300>", :middle => "250x250>", :small => "200x200>", :thumb => "100x100>" },
    :storage => :s3,
    :bucket => "uc-berkeley-akpsi-website",
    :default_url => '/images/:attachment/missing_:style.png',
    :url =>':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename',
    :s3_credentials => S3_CREDENTIALS

  validates :name, presence: true, length: { maximum: 50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Make all actives visible or not visible by default on creation
  # (should be false on production verison of site)
  def default_values
    self.display_on_index = true if self.display_on_index.nil?
  end

end
