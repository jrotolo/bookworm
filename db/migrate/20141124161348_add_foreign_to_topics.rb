class AddForeignToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :bookclub_id, :integer
  end
end
