class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :github_name, :string
    add_column :users, :provider, :string, limit: 50, null: false, default:''
    add_column :users, :uid, :string, limit: 50, null: false, default:''
    add_column :users, :avatar_url, :string
    add_column :users, :status, :integer, default: 0
  end
end
