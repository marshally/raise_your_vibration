class AddBodyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :body, :string
  end
end
