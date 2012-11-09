class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :address_list_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :organization
      t.string :country
      t.text :street_address1
      t.text :street_address2
      t.string :city
      t.string :prefecture
      t.string :postal_code
      t.string :phone

      t.timestamps
    end
  end
end
