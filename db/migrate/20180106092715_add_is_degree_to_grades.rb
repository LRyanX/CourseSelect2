class AddIsDegreeToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :is_degree, :boolean, :default => false
  end
end
