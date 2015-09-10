class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fb_id
      t.string :token
      t.string :fb_image

      t.timestamps null: false
    end
  end
end
