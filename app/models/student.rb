class Student < ApplicationRecord
    validates :name, presence: true 
    belongs_to :instructor
end
