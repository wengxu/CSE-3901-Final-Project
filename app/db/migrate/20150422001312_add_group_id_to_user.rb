class AddGroupIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :group
  end
end
