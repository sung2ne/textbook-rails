ActiveRecord::Schema[8.0].define(version: 2025_04_19_120000) do
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",     null: false
    t.text     "content"
    t.boolean  "published", default: false, null: false
    t.integer  "views_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published"], name: "index_posts_on_published"
  end
end