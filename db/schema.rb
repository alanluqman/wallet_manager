# rubocop:disable Metrics/BlockLength

ActiveRecord::Schema[7.0].define(version: 20_230_103_133_234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_categories_on_author_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.string 'name'
    t.float 'amount'
    t.bigint 'author_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_transactions_on_author_id'
    t.index ['category_id'], name: 'index_transactions_on_category_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'categories', 'users', column: 'author_id'
  add_foreign_key 'transactions', 'categories'
  add_foreign_key 'transactions', 'users', column: 'author_id'
end

# rubocop:enable Metrics/BlockLength
