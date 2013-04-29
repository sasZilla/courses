class CreateWaitLists < ActiveRecord::Migration
  def change
    create_table :wait_lists do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
