class AddIsDegreeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_degree, :boolean, :default => false
  end
end
