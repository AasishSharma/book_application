class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.references :article, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
       
      t.timestamps null: false
    end
  end
end
