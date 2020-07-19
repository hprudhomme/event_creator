class User < ApplicationRecord
  has_many :events
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :description,
    length: { maximum: 150 }

  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "180x180!").processed
    else
      "/default_profile.jpg"
    end
  end
end
