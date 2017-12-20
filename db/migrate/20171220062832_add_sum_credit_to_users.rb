class AddSumCreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sum_credit, :integer, :default => 0
  end
end
