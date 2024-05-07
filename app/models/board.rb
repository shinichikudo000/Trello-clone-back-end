class Board < ApplicationRecord
    belongs_to :workspace
    
    has_many :lists, dependent: :destroy
    has_many :cards, dependent: :destroy
    has_many :board_label, dependent: :destroy

    validates :name, presence: true
    validates :description, allow_blank: true

    enum :visibility [:workspace, :public, :private, :organization]

    scope :workspace_visible, -> { where(visibility: 'workspace')}
    scope :public, -> { where(visibility: 'public')}
    scope :private, -> { where(visibility: 'private')}
    scope :organization_visible, -> { where(visibility: 'oranization')}
    
end
