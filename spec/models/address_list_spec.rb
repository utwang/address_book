# coding : utf-8
require 'spec_helper'

describe AddressList do
  describe 'association' do
    it { should have_many(:addresses) }
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(6).with_short_message(/6文字以上/) }
    it { should ensure_length_of(:title).is_at_most(40).with_long_message(/40文字以内/) }
    
    describe 'total counts of address lists ' do
      subject { FactoryGirl.build(:address_list, user_id: 1) }
    
      context 'with in limits' do
        before { FactoryGirl.create_list(:address_list, 2, user_id: 1) }
        it { should be_valid }
      end

      context 'exceed limits' do
        before { FactoryGirl.create_list(:address_list, 3, user_id: 1) }
        it { should_not be_valid }

        # TODO 余裕があればリファクタリング
        context 'with error message' do
          before { subject.valid? }
          it { subject.errors.messages[:lists_counts].should include('アドレス帳の登録は3つまでとなります。') }
        end
      end
    end
  end
end
