class CreatePanels < ActiveRecord::Migration[6.1]
  def change
    create_table :panels do |t|
      t.references :installation, null: false, foreign_key: true
      t.integer :panel_type, default: 0
      t.string :panel_id

      t.timestamps
    end
  end
end
