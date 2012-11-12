class AddressListsController < ApplicationController
  def index
    user_id = 1
    @address_lists = AddressList.where(user_id: user_id)
    @new_list = AddressList.new(user_id: user_id)
  end

  def create
    address_list = AddressList.new(params[:address_list])

    if address_list.save
      redirect_to address_lists_path
    else
      render 'index'
    end
  end
end
