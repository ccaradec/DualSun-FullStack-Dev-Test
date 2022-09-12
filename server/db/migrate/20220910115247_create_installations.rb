class CreateInstallations < ActiveRecord::Migration[6.1]
  def change
    create_table :installations do |t|
      t.references :company, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :country
      t.datetime :installation_date

      t.timestamps
    end
  end
end
