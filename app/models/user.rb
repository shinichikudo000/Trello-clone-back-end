class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  has_many :board_members
  has_many :workspace_member
  has_many :activities
  has_many :comments

  after_create :initial_create_user

  private

  def initial_create_user
    ActiveRecord::Base.transaction do
      workspace = Workspace.create(name: 'Trello Workspace', visibility: 'private', tier: 'free')
      workspace_admin = workspace.workspace_members.build(user: self, role: 'admin')
      board = workspace.boards.build(name: 'My Trello Board', visibility: 'workspace')
      board_admin = board.board_members.build(user: self, role: 'admin')
      workspace.save!
    end
  end
end
