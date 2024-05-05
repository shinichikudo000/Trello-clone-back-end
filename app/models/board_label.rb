class BoardLabel < ApplicationRecord
    belongs_to :color

    has_many :card_labels, dependent: :destroy
    
    validates :title, presence: true
end

#change the file name