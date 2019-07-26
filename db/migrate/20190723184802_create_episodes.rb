class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :subtitle
      t.integer :number
      t.text :text
      t.references :novel, foreign_key: true

      t.timestamps
    end
  end
end
