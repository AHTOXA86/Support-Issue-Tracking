class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :department
      t.string :accaunt_type

      t.timestamps
    end
  end
end
