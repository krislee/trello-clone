class ItemsController < ApplicationController

  def index
    @all_boards = Board.where?(:id => params[:board_id],:user_id => @user.id) #asking for the id that matches the board id
    if @all_boards.present?
      @all_lists = List.where?(:board_id => all_boards[0].id) #gets all of the lists from our single board id
      if @all_lists.present?
        @all_items = Item.where?(:list_id => all_list[0].id) #All the items from the one list.
        if @all_items.empty?
          render :json => {
              :response => "There are no items in this list"
          }
        else
          render :json => @all_items
          end
      else
        render :json => {
            :response => "There are no lists in this board"
        }
      end
    else
      render :json => {
          :response => "There are no boards to show"
      }
    end
  end


def create
  @new_item = Item.new(items_params)
  @new_item.list_id = params[:list_id]
  if @new_item.save
    render :json => @new_item
  else
    render :json => {
        :response => "Unable to create a new item"
    }
    end
end

  private
  def items_params
    params.permit(:items_name)
  end
end



