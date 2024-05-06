class ApplicationController < ActionController::API

    private

    def set_workspace
        @workspace = Workspace.find(params[:workspace_id])
    end
  
    def set_board
        @board = Board.find(params[:id])
    end
end
