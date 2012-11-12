# coding: utf-8

require 'spec_helper'

describe "AddressListIndexPages" do
  subject { page }

  let!(:address_list0) { FactoryGirl.create(:address_list, title: 'プライベート', description: '友人') } 
  let!(:address_list1) { FactoryGirl.create(:address_list, title: '仕事の取引先') } 
  before { visit address_lists_path }

  describe "GET /address_list_index_pages" do
    it { should have_css("#address_list_#{address_list0.id} td.list_title", text: 'プライベート') }
    it { should have_css("#address_list_#{address_list0.id} td.list_desc", text: '友人') }
    it { should have_link('プライベート', href:  address_list_addresses_path(address_list0) ) }
  end

  describe "create a new address_list" do
    let(:new_list_title) { '新アドレス帳' }
    let(:new_list_description) { '新規のアドレス帳' }

    context 'OK' do
      before do
        fill_in 'アドレス帳名', with: new_list_title
        fill_in '概要', with: new_list_description
        click_button '登録する'
      end

      it { should have_content('新しいアドレス帳を登録しました') }
      it { should have_content('新アドレス帳') }
      it { should have_content('新規のアドレス帳') }
    end

    context 'NG' do
      let!(:address_list2) { FactoryGirl.create(:address_list, title: '3つ目のアドレス帳') }

      before do
        fill_in 'アドレス帳名', with: new_list_title
        fill_in '概要', with: new_list_description
        click_button '登録する'
      end

      it { should have_content('エラー') }
    end
  end
end
