class User < ApplicationRecord
  has_many :events
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :description,
    length: { maximum: 150 }

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "180x180!").processed
    else
      "profile.jpg"
    end
  end
end
