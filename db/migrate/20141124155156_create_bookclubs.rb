class CreateBookclubs < ActiveRecord::Migration
  def change
    create_table :bookclubs do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
