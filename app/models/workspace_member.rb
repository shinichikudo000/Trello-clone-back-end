class WorkspaceMember < ApplicationRecord
    belongs_to :user
    belongs_to :workspace

    validates :user_id, uniqueness: { scope: :workspace_id }

    enum :role [:member, :admin]

    scope :member, -> { where(role: 'member')}
    scope :admin, -> { where(role: 'admin')}
    
end
