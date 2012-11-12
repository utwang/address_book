# coding: utf-8

require 'spec_helper'

describe "AddressPages" do
  subject { page }

  describe "GET /address_index_pages" do
    let!(:address_list0) { FactoryGirl.create(:address_list, user_id: 1, title: 'プライベート', description: '友人') } 
    let!(:address0) { FactoryGirl.create(:address, address_list: address_list0, email: 'sample0@example.com') } 
    let!(:address1) { FactoryGirl.create(:address, address_list: address_list0, email: 'sample1@example.com') } 
    before { visit address_list_addresses_path(address_list0) }

    it { should have_context('sample0@example.com') }
    it { should have_context('sample1@example.com') }
  end
end
