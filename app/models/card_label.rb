class CardLabel < ApplicationRecord
    belongs_to :board_label
    belongs_to :card
end
