class CreateLsoas < ActiveRecord::Migration[8.0]
  def change
    create_table :lsoas do |t|
      t.string :name

      t.timestamps
    end
  end
end
