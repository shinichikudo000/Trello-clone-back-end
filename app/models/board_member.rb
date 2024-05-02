class BoardMember < ApplicationRecord
    belongs_to :board
    belongs_to :user

    enum :role, [:member, :admin]
    
    scope :member, -> { where(role: 'member')}
    scope :admin, -> { where(role: 'admin')}
end
