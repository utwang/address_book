class Address < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A0\d{9,10}\z/

  belongs_to :address_list

  attr_accessible :address_list_id, :city, :country, :email, :first_name, :last_name,
                  :organization, :phone, :postal_code, :prefecture, :street_address1, :street_address2
  
  before_validation { |address| address.phone = phone.try(:gsub!, '-', '') }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}

end
