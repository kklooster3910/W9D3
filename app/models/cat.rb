class Cat < ApplicationRecord
    validates :birth_date, :name, :sex, :description, presence: true 
    validates :color, presence: true
end