class Workspace < ApplicationRecord
    has_many :boards, dependent: destroy

    enum visibility: [:public, :private]
    enum tier: [:free, :standard, :premium, :enterprise]

    #visibility scope
    scope :public, -> { where(visibility: 'public')}
    scope :private, -> { where(visibility: 'private')}

    #tier scope
    scope :free, -> { where(tier: 'free')}
    scope :standard, -> { where(tier: 'standard')}
    scope :premium, -> { where(tier: 'premium')}
    scope :enterprise, -> { where(tier: 'enterprise')}

    validates :name, presence: true
    validates :short_name, presence: true, uniqueness: true, on: :create
    validates :short_name, presence: true, on: :update
    validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
    validates :description, allow_blank: true
    validates :tier, numericality: { only_integer: true, less_than_or_equal_to: 3 }, presence: true
    validates :visibility, numericality: { only_integer: true, less_than_or_equal_to: 1}, presence: true

    before_validation :generate_short_name, on: :create

    private

    def generate_short_name
        self.short_name ||= "userworkspace#{SecureRandom.hex(5)}"
    end

    def can_create_board
        if free? && self.boards.where(is_closed: false).count >= 10
            return false
        else 
            return true
        end
    end
end
