class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  attr_accessor :token
  def new
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def record_params
    params.require(:record_address).permit(:postal_code, :area_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: record_params[:token],
        currency: 'jpy'
    )
  end
   
  

end
