# coding: utf-8

class AddressListsController < ApplicationController
  def index
    #TODO user_id対応
    user_id = 1
    @address_lists = AddressList.where(user_id: user_id)
    @new_list = AddressList.new(user_id: user_id)
  end

  def create
    address_list = AddressList.new(params[:address_list])
    #TODO user_id対応
    address_list.user_id = 1

    if address_list.save
      flash[:success] = "新しいアドレス帳を登録しました"
      redirect_to address_lists_path
    else
      #TODO 複数行表示の対応
      flash[:error] = "エラー: #{address_list.errors.messages}"
      redirect_to address_lists_path
    end
  end
end
