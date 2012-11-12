class RemoveUserIdFromAddressLists < ActiveRecord::Migration
  def up
    remove_column :address_lists, :user_id
  end

  def down
    add_column :address_lists, :user_id, :integer
  end
end
