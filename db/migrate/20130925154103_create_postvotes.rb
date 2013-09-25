class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :vote
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
