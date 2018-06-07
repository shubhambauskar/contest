class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title
    end
  end
end
