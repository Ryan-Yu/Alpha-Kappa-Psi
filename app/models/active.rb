class Active < ActiveRecord::Base

  has_many :rusheeposts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
