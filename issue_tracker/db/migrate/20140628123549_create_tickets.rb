class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :status
      t.integer :ownership
      t.integer :department
      t.string :subject
      t.text :text
      t.string :unique_id

      t.timestamps
    end
  end
end
