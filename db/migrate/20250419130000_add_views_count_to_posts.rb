class AddViewsCountToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :views_count, :integer, default: 0, null: false
    add_index  :posts, :views_count

    # 컬럼 제거
    # remove_column :posts, :published, :boolean

    # 컬럼명 변경
    # rename_column :posts, :views_count, :view_count

    # 컬럼 타입/옵션 변경
    # change_column :posts, :title, :string, limit: 200
    # change_column_null :posts, :title, false
    # change_column_default :posts, :published, from: nil, to: false
  end
end