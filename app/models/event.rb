class Event < ApplicationRecord
    has_many :guests, dependent: :destroy
    has_many :messages, dependent: :destroy

    belongs_to :user

    def self.search(search)
        where("name LIKE ?", "%#{search}%") 
        where("content LIKE ?", "%#{search}%")
    end
end
