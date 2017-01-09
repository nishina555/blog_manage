class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :entry, foreign_key: true
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
