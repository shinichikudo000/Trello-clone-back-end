class Color < ApplicationRecord
    has_many :board_labels
    
    validates :color, presence: true, format: { with: /\A#(?:[0-9a-fA-F]{3}){1,2}\z/, message: "should be a valid hexadecimal color code" }
    validates :name, presence: true
  end