class AddUserIdToNestComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :nest_comments, :user, null: false, foreign_key: true
  end
end
