class AddDegreeCreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree_credit, :integer, :default => 0
  end
end
