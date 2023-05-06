class AddPasswordDigestAndIsDeletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :is_deleted, :boolean
    add_column :users, :email, :string
    add_column :users, :bio, :text
  end
end
