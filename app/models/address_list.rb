class AddressList < ActiveRecord::Base
  has_many :addresses
  attr_accessible :description, :title, :user_id
end
