class AddColumnUnsubmitNumIntoUsers < ActiveRecord::Migration
  def change
		add_column :users, :unsubmit_num, :integer, :default =>0
  end
end
