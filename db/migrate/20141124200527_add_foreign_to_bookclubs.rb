class AddForeignToBookclubs < ActiveRecord::Migration
  def change
    add_column :bookclubs, :user_id, :integer
  end
end
