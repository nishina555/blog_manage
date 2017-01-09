class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :blog, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
