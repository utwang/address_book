# coding: utf-8

require 'spec_helper'

describe "AddressListIndexPages" do
  subject { page }

  let!(:address_list0) { FactoryGirl.create(:address_list, user_id: 1, title: 'プライベート', description: '友人') } 
  let!(:address_list1) { FactoryGirl.create(:address_list, user_id: 1, title: '仕事の取引先') } 
  before { visit address_lists_path }

  describe "GET /address_list_index_pages" do
    it { should have_css('#address_list_0 td.list_title', text: 'プライベート') }
    it { should have_css('#address_list_0 td.list_desc', text: '友人') }
    #TODO アドレス一覧作成後にリンク先のパス変更
    it { should have_link('プライベート', href: '#') }
  end

  describe "create a new address_list" do
    let(:new_list_title) { '新アドレス帳' }
    let(:new_list_description) { '新規のアドレス帳' }

    context 'OK' do
      before do
        fill_in 'アドレス帳名', with: new_list_title
        fill_in '概要', with: new_list_description
        click_button 'Create'
      end

      it { should have_content('新しいアドレス帳を登録しました') }
      it { should have_css('#address_list_2 td.list_title', text: '新アドレス帳') }
      it { should have_css('#address_list_2 td.list_desc', text: '新規のアドレス帳') }
    end

    context 'NG' do
      let!(:address_list2) { FactoryGirl.create(:address_list, user_id: 1, title: '3つ目のアドレス帳') }

      before do
        fill_in 'アドレス帳名', with: new_list_title
        fill_in '概要', with: new_list_description
        click_button 'Create'
      end

      it { should have_content('エラー') }
    end
  end
end
