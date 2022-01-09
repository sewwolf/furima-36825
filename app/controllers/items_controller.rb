class ItemsController < ApplicationController
  before_action :move_to_new_user_session, only: [:new]
  def index
   # @item = Item.all
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :category_id, :condition_id, :postage_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

