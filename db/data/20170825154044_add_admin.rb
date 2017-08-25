class AddAdmin < SeedMigration::Migration
  def up
    Admin.create(email: 'calvarado@myfactoring.cl', password: '09090909')
  end

  def down
    Admin.find_by(email: 'calvarado@myfactoring.cl').try(:destroy)
  end
end
