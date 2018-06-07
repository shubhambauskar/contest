class AddDescriptionToContests < ActiveRecord::Migration
  def change
    add_column :contests, :description, :text
    add_column :contests, :categories, :text
    add_column :contests, :locations, :text
    add_column :contests, :start_date, :date
    add_column :contests, :end_date, :date
    add_column :contests, :terms_and_conditions, :binary
    add_column :contests, :created_at, :datetime
    add_column :contests, :updated_at, :datetime
  end
end
