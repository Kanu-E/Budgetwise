class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :amount
      t.date :due_date
      t.boolean :
      t.integer :user_id
    end
  end
end
