class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :instalment
      t.integer :amount
      t.text :result

      t.timestamps null: false
    end
  end
end
