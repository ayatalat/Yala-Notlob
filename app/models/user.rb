class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_friendship
  has_many :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   acts_as_follower
   has_many :orders
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
