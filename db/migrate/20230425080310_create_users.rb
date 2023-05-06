class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.boolean :is_activated , :boolean , default: false 

      t.timestamps
    end
  end
end
