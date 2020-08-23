class ListsController < ApplicationController
  def index
    #if exist
    @all_boards = Board.where(:id => params[:board_id], :user_id => @user.id) # found one board under that user
    if @all_boards.present? # if there is a board under that user, do the following:
      @all_lists = List.where(:board_id => @all_boards[0].id) # Find all the lists where the model list has the board_id to equal to the id of that particular board. There is only one id of the board that we get from @all_boards. In other words, find all lists where the board_id is equal to the id of the query in @all_boards
      if @all_lists.empty?
        render :json => {
            :response => "There are no lists for this board"
        }
      else
        render :json => @all_lists
      end
    else # if there is no board under this user, then it will render a response of this board does not exist
      render :json => {
          :response => "This board does not exist."
      }
    end
    # end
  end

  def show
    @all_boards = Board.where(:id => params[:board_id], :user_id => @user.id) # found one board under that user
    if @all_boards.present? # if there is no board under that user, do the following:
      @all_lists = List.where(:board_id => @all_boards[0].id)
      @one_list = @all_lists.find_by_id(params[:id])
      if @one_list.present?
        render :json => @one_list
      else
        render :json => {
            :response => "This one list is not found for this board"
        }
      end
    else # if there is no board under this user, then it will render a response of this board does not exist
      render :json => {
          :response => "This board does not exist."
      }
    end

  end

  def create
    @new_list = List.new(list_params)
    @new_list.board_id = params[:board_id]
    if @new_list.save
      render :json => @new_list
    else
      render :json => {
          :response => "Unable to create new list in this board"
      }
    end
  end

  def update
    @all_boards = Board.where(:id => params[:board_id], :user_id => @user.id) # found one board under that user
    if @all_boards.present? # if there is no board under that user, do the following:
      @all_lists = List.where(:board_id => @all_boards[0].id)
      @one_list = @all_lists.find_by_id(params[:id])
      if @one_list.present?
        @one_list.update(list_params)
        render :json => @one_list
      else
        render :json => {
            :response => "Failed to find the list to update."
        }
      end
    else
      render :json => {
          :response => "This board does not exist."
      }
    end
  end

  def destroy
    @all_boards = Board.where(:id => params[:board_id], :user_id => @user.id) # found one board under that user
    if @all_boards.present? # if there is no board under that user, do the following:
      @all_lists = List.where(:board_id => @all_boards[0].id)
      @one_list = @all_lists.find_by_id(params[:id])
      if @one_list.present?
        @one_list.destroy
        render :json => @one_list
      else
        render :json => {
            :response => "Failed to find the list to delete"
        }
      end
    else
      render :json => {
          :response => "This board does not exist."
      }
    end
  end

  private
  # Don't need to check if user exists since only once the user is logged in can they have access to the routes. If user is logged in, then the user does exist, so we don't need to check that.
  # def exist
  #   @existing_user = (User.exists?(@user.id))
  #   @existing_user
  # end
  def list_params
    params.permit(:list_name)
  end
end
