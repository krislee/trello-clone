class ItemsController < ApplicationController

  def index
    @one_board = Board.where(:id => params[:board_id],:user_id => @user.id) #asking for the id that matches the board id
    if @one_board.present?
      @one_list = List.where(:board_id => @one_board[0].id, :id => params[:list_id]) #gets one of the lists from our single board id
      if @one_list.present?
        @all_items = Item.where(:list_id => @one_list[0].id) #All the items from the one list.
        if @all_items.empty?
          render :json => {
              :response => "There are no items in this list"
          }
        else
          render :json =>  @all_items
        end
      else
        render :json => {
            :response => "This list does not exist in this board. Failed to find the items in this list."
        }
      end
    else
      render :json => {
          :response => "This board does not exist"
      }
    end
  end

  # don't need to show one item card in a list, we will show all the item cards in a list

  def create
    @new_item = Item.new(items_params)
    @new_item.list_id = params[:list_id]
    if @new_item.save!
      render :json => @new_item
    else
      render :json => {
          :response => "Unable to create a new item",
          :data => @new_item
    }
    end
  end

  def update
    @one_board = Board.where(:id => params[:board_id],:user_id => @user.id) #asking for the id that matches the board id
    if @one_board.present?
      @one_list = List.where(:board_id => @one_board[0].id, :id => params[:list_id]) #gets one of the lists from our single board id
      if @one_list.present?
        @update_item = Item.where(:list_id => @one_list[0].id, id: params[:id]) #All the items from the one list.
        if @update_item.exists?
          @update_item.update(items_params)
          render :json =>  @update_item
        else
          render :json => {
              :response => "Item is not found. Failed to update."
          }
        end
      else
        render :json => {
            :response => "This list does not exist in this board. Failed to update item."
        }
      end
    else
      render :json => {
          :response => "This board does not exist."
      }
    end
  end

  def destroy
    @one_board = Board.where(:id => params[:board_id],:user_id => @user.id) #asking for the id that matches the board id
    if @one_board.present?
      @one_list = List.where(:board_id => @one_board[0].id, :id => params[:list_id]) #gets one of the lists from our single board id
      if @one_list.present?
        @destroy_item = Item.where(:list_id => @one_list[0].id, id: params[:id]) #All the items from the one list.
        if @destroy_item.present?
          @destroy_item.destroy(params[:id])
          render :json => @destroy_item
        else
          render :json => {
              :response => "Item is not found. Failed to delete."
          }
        end
      else
        render :json => {
            :response => "This list does not exist in this board. Failed to delete item."
        }
      end
    else
      render :json => {
          :response => "This board does not exist."
      }
    end
  end

  private
  def items_params
    params.permit(:item_name)
  end
end



