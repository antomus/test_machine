class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :benficiary
      t.string :from
      t.decimal :amount
      t.string :state

      t.timestamps
    end
  end
end
