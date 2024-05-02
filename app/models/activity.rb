class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :board
    belongs_to :card

    validates :activity, presence: true

    enum :tag, [:create, :update, :comment]

    scope :create, -> { where(tag: 'create')}
    scope :update, -> { where(tag: 'update')}
    scope :comment, -> { where(tag: 'comment')}
end
