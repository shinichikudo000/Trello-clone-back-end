class API::V1::BoardsController < ApplicationController
    before_action :set_workspace, only: [:create, :show]
    before_action :set_board, only: [:show, :destroy]
  
    def create
        ActiveRecord::Base.transaction do
            check_workspace_board_capacity

            @board = @workspace.boards.build(board_params)
            create_activities
            build_default_board_labels
    
            if @board.save
                render json: @board, status: :created
            else
                render json: @board.errors, status: :unprocessable_entity
            end
        end
    end
  
    def show
        render json: @board, include: [:lists, :cards]
    end
  
    def destroy
        @board.destroy!
        head :no_content
    end
  
    private
  
    def create_activities
        activity_descriptions = [
            'created this board',
            "added this board to #{@workspace.name}"
        ]
        activity_descriptions.each do |description|
            @board.activities.build(workspace: @workspace, activity: description)
        end
    end
  
    def build_default_board_labels
        default_board_labels.each do |label_name|
            color = Color.find_by(name: label_name)
            @board.labels.build(color: color)
        end
    end
  
    def default_board_labels
        ['green', 'yellow', 'orange', 'red', 'purple', 'blue']
    end
  
    def board_params
        params.require(:board).permit(:name, :visibility, :description)
    end

    def check_workspace_board_capacity
        unless @workspace.can_add_board?
            render json: { error: "Workspace cannot have more than 10 open boards"}, status: :unprocessable_entity
        end
    end
end