class Bancos < SeedMigration::Migration
  def up
    [
      { name: 'Banco Chile', interes_rate: 4.5},
      { name: 'Banco Santander', interes_rate: 4.7},
      { name: 'Banco Estado', interes_rate: 4.1}
    ].each do |banco|
      Banco.create(banco)
    end
  end

  def down

  end
end
