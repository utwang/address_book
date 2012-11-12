class Address < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /^0[\d-]{11,12}$/

  belongs_to :address_list

  attr_accessible :address_list_id, :city, :country, :email, :first_name, :last_name,
                  :organization, :phone, :postal_code, :prefecture, :street_address1, :street_address2

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}

end
