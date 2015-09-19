class CreatePaymentEvents < ActiveRecord::Migration
  def change
    create_table :payment_events do |t|
      t.integer :payment_id
      t.string :action

      t.timestamps
    end
  end
end
