class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true  # user_id 컬럼 + 외래키 제약
      t.string :title, null: false
      t.text   :content
      t.timestamps
    end
  end
end