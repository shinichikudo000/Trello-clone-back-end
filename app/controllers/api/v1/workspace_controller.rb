class API::V1::WorkspaceController < ApplicationController
    def index
        @guest_workspaces = guest_workspaces
        @member_workspaces = member_workspaces
        render json: {@guest_workspaces, @member_workspaces}
    end
    
    def create
        create workspace with the workspace params
        if save!
            workspace.tier :free
            workspace.visibility :private
            workspace.short_name = workspace id
            
    end

    private
    
    def workspace_params
        params.require(:workspace).permit(:name, :short_name, :description, :website, :visibility, :tier)
    end

    def guest_workspaces
        WorkspaceMember.where(user_id: current_user.id, role: :guest).includes(:workspace).map(&:workspace)
    end
  
    def member_workspaces
        WorkspaceMember.where(user_id: current_user.id, role: [:member, :admin]).includes(:workspace).map(&:workspace)
    end
end