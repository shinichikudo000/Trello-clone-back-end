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

    validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
    validates :description, allow_blank: true

end
