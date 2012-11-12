# coding: utf-8

require 'spec_helper'

describe "AddressListIndexPages" do
  subject { page }

  let!(:address_list0) { FactoryGirl.create(:address_list, user_id: 1, title: 'プライベート', description: '友人') } 
  let!(:address_list1) { FactoryGirl.create(:address_list, user_id: 1, title: '仕事の取引先') } 

  describe "GET /address_list_index_pages" do
    before { visit address_lists_path }
  
    it { should have_css('#address_list_0 td.list_title', text: 'プライベート') }
    it { should have_css('#address_list_0 td.list_desc', text: '友人') }
    #TODO アドレス一覧作成後にリンク先のパス変更
    it { should have_link('プライベート', href: '#') }
  end
end
