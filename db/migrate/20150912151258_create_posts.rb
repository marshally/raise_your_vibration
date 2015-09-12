class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :posted_at

      t.timestamps null: false
    end
  end
end
