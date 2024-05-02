class Card < ApplicationRecord
    belongs_to :board
    belongs_to :list

    has_many :card_labels, dependent: :destroy
    has_many :comments, dependent: :destroy 

    validates :title, presence: true
    validates :description, allow_blank: true
    validates :due_date, allow_blank: true
    validates :start_date, allow_blank: true
    validates :due_date_reminder, allow_blank: true
    validates :is_complete, inclusion: { in: [true, false] }
    validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 

end
