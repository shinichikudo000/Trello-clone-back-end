
class API::V1::ListController < ApplicationController
    before_action :set_board, only: [:create]

    def create
        ActiveRecord::Base.transaction do
            @list = @board.lists.build(list_params)
            @board.activities.build(activity: "added #{list_params[:name]} to this board", user: current_user)

            if @list.save
                render json: @list, status: :created
            else
                render json: @list.errors, status: :unprocessable_entity
            end
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :position)
    end
end