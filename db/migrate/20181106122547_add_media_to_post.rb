class AddMediaToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :media, :text
  end
end
