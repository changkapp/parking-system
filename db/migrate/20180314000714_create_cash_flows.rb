class CreateCashFlows < ActiveRecord::Migration
  def change
    create_table :cash_flows do |t|
    	t.float :entry_cash
    	t.float :cash_outflow
      t.timestamps null: false
    end
  end
end
