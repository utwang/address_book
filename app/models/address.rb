class Address < ActiveRecord::Base
  belongs_to :address_list

  attr_accessible :address_list_id, :city, :country, :email, :first_name, :last_name,
                  :organization, :phone, :postal_code, :prefecture, :street_address1, :street_address2
end
