class BoardLabel < ApplicationRecord
    belongs_to :color
    
    validates :title, presence: true
end

#change the file name