class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.text :content
      t.boolean :shareable
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
