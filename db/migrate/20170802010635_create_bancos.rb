class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :name
      t.string :logo
      t.decimal :interes_rate

      t.timestamps null: false
    end
  end
end
