class Event < ApplicationRecord
    has_many :guests, dependent: :destroy
    has_many :messages, dependent: :destroy

    belongs_to :user

    validates :title,
        presence: true,
        length: { maximum: 30 }
    
    validates :description,
        presence: true,
        length: { maximum: 200 }

    validates :date,
        presence: true
    
    validates :city,
        presence: true

    def self.search(search)
        where("name LIKE ?", "%#{search}%") 
        where("content LIKE ?", "%#{search}%")
    end
end
