class API::V1::WorkspaceController < ApplicationController 
    before_action :set_workspace, only: [:show, :destroy]

    def index
        @guest_workspaces = guest_workspaces
        @member_workspaces = member_workspaces
        render json: {@guest_workspaces, @member_workspaces}
    end
    
    def show
        render json: @workspace.include(:board)
    end

    def create
        ActiveRecord::Base.transaction do 
            @workspace = Workspace.new(workspace_params)
            @workspace.tier = :free
            @workspace.visibility = :private
            
            if @workspace.save
                render json: @workspace, status: :created
            else
                render json: @workspace.errors, status: :unprocessable_entity
            end
        end
    end

    def destroy
        @workspace.destroy!
        head :no_content
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