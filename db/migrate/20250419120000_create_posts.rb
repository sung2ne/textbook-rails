class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string  :title,     null: false
      t.text    :content
      t.boolean :published, default: false, null: false

      t.timestamps  # created_at, updated_at 자동 추가
    end

    add_index :posts, :published
  end
end