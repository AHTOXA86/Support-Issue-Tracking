class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :ticket_id
      t.text :text
      t.datetime :date

      t.timestamps
    end
  end
end
