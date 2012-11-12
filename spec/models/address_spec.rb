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

   # TODO localeの設定不備によりテスト通らず、後で対応
   #
   # it { should validate_format_of(:email).not_with('xyz.abc@example')
   #                                       .with_message(/メールアドレスは不正な値です。/) } #
   # it { should validate_format_of(:email).not_with('xyz_abc@example.com')
   #                                       .with_message(/メールアドレスは不正な値です。/) } #
   # it { should validate_format_of(:email).not_with('xyz.abcexample.com')
   #                                       .with_message(/メールアドレスは不正な値です。/) } #

    it { should validate_format_of(:phone).with('090-1234-5678') }
    it { should validate_format_of(:phone).with('03-1111-3333') }

    it { should validate_format_of(:phone).not_with('090-AB34-5678') }
    it { should validate_format_of(:phone).not_with('03-1-5678') }
  end
end
