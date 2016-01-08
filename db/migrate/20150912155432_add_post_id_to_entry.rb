class AddPostIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :post_id, :integer
  end
end
