class Event < ApplicationRecord
    has_many :guests, dependent: :destroy

    belongs_to :user

    def self.search(search)
        where("name LIKE ?", "%#{search}%") 
        where("content LIKE ?", "%#{search}%")
    end
end
