class BoardsController < ApplicationController
  before_action :authorized

  def index
    if (User.exists?(@user.id))
      @boards = Board.where(user_id: @user.id)
      if @boards.empty?
        render :json => {
            :response => "No boards are made."
        }
      else
        User.where
        render :json => @boards
      end
    end # we do not need an else statement because if the user was not logged in then it wouldn't even hit the index route at all (and if the user is logged in then the @user.id must have existed)
  end

  def show
    if (User.exists?(@user.id))
      @one_board = Board.where(user_id: @user.id).find_by_id(params[:id])
      if @one_board.present?
        render :json => @one_board
      else
        render :json => {
            :response => "This board does not exist."
        }
      end
    end
  end

  def create
    @new_board = Board.new(board_params)
    @new_board.user_id = @user.id
    if @new_board.save
      render :json => @new_board
    else
      render :json => {
          :response => "Failed to create new board"
      }
    end
  end

  def update
    if (User.exists?(@user.id))
      @update_board = Board.where(user_id: @user.id).find_by_id(params[:id])
      if @update_board.present?
        @update_board.update(board_params)
        render :json => @update_board
      else
        render :json => {
            :response => "Failed to update the board you're finding"
        }
      end
    end
  end

  def destroy
    if (User.exists?(@user.id))
      @destroy_board = Board.where(user_id: @user.id).find_by_id(params[:id])
      if @destroy_board.present?
        @destroy_board.destroy
        render :json => @destroy_board
      else
        render :json => {
            :response => "Failed to delete the board you're finding"
        }
      end
    end
  end

  private

  def board_params
    params.permit(:board_name)
  end
end
