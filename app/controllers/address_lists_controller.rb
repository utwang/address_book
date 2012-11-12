# coding: utf-8

class AddressListsController < ApplicationController
  def index
    @address_lists = AddressList.all
    @address_list = AddressList.new
  end

  def create
    @address_lists = AddressList.all
    @address_list = AddressList.new(params[:address_list])

    if address_list.save
      flash[:success] = "新しいアドレス帳を登録しました"
      redirect_to address_lists_path
    else
      #TODO 複数行表示の対応
      flash[:error] = "エラー: #{address_list.errors.messages}"
      redirect_to address_lists_path
    end
  end

  def edit
    @address_list = AddressList.find(params[:id])
  end

  def update
    @address_list = AddressList.find(params[:id])

    if @address_list.update_attributes(params[:address_list])
      redirect_to address_lists_path, notice: 'Address was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @address_list = AddressList.find(params[:id])
    @address_list.destroy

    respond_to do |format|
      format.js
    end
  end

end
