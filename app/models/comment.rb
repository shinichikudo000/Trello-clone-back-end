class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :card

    validates :comment, presence: true
    validates :is_edited, inclusion: { in: [true, false] }
end
