class List < ApplicationRecord
    belongs_to :board

    has_many :cards

    validates :name, presence: true
    validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
end
