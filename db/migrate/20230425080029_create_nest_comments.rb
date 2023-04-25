class CreateNestComments < ActiveRecord::Migration[7.0]
  def change
    create_table :nest_comments do |t|
      t.text :description
      t.timestamps
    end
  end
end
