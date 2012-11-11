# coding: utf-8

require 'spec_helper'

describe Address do
  describe 'association' do
    it { should belong_to(:address_list) }
  end

  describe 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_format_of(:email).with('xyz.abc@example.com') }
    it { should validate_format_of(:email).not_with('xyz.abc@example')
                                          .with_message(/無効なメールアドレス/) }
    it { should validate_format_of(:email).not_with('xyz_abc@example.com')
                                          .with_message(/無効なメールアドレス/) }
    it { should validate_format_of(:email).not_with('xyz.abcexample.com')
                                          .with_message(/無効なメールアドレス/) }
  end
end
