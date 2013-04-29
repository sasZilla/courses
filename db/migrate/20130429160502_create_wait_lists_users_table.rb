class CreateUsersWaitListsTable < ActiveRecord::Migration
  def self.up
    create_table :users_wait_lists, :id => false do |t|
        t.references :wait_list
        t.references :user
    end
    add_index :wait_lists_users, [:wait_list_id, :user_id]
    add_index :wait_lists_users, [:user_id, :wait_list_id]
  end

  def self.down
    drop_table :wait_lists_users
  end
end
