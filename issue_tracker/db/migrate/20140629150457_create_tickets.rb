class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :text
      t.string :department
      t.string :status
      t.string :ownership
      t.string :customer_id
      t.string :unique

      t.timestamps
    end
  end
end
