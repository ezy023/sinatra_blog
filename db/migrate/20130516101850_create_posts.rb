class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :content, :title
      t.timestamps
  end
end
