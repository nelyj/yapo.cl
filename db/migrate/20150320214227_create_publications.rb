class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.float :price
      t.string :titulo
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
