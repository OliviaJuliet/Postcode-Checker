class CreateServedPostcodes < ActiveRecord::Migration[8.0]
  def change
    create_table :served_postcodes do |t|
      t.string :postcode

      t.timestamps
    end
  end
end
