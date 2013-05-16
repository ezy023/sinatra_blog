class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :content
      t.text      :title
      t.timestamps
    end
  end
end
