# coding: utf-8

class AddressesController < ApplicationController
  def index
    @addresses = Address.where(address_list_id: params[:address_list_id])
                        .order(:last_name).page params[:page]
    @address_list = AddressList.find(params[:address_list_id])

    respond_to do |format|
      format.html
    end
  end

  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @address = Address.new(address_list_id: params[:address_list_id])

    respond_to do |format|
      format.html
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(params[:address])
    @address.address_list_id = params[:address_list_id]

    respond_to do |format|
      if @address.save
        format.html { redirect_to address_list_addresses_path(@address.address_list_id), notice: '新しいアドレスを登録しました' }
      else
        flash.now[:error] = "#{@address.errors.count}件のエラーが発生しました"
        format.html { render action: "new" }
      end
    end
  end

  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to address_list_addresses_path(@address.address_list_id), notice: 'アドレスを変更しました' }
      else
        flash.now[:error] = "#{@address.errors.count}件のエラーが発生しました"
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.js
    end
  end
end
