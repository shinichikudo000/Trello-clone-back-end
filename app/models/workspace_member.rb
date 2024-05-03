class WorkspaceMember < ApplicationRecord
    belongs_to :user
    belongs_to :workspace

    enum :role [:guest, :member, :admin]

    scope :guest, -> { where(role: 'guest')}
    scope :member, -> { where(role: 'member')}
    scope :admin, -> { where(role: 'admin')}
    
    validates :role, numericality { only_integer: true, less_than_or_equal_to: 2}
end
