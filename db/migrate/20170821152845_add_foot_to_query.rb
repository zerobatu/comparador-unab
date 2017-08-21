class AddFootToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :foot, :integer
  end
end
