# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Business.where(:name => "LONGPORT COLOMBIA LTDA").exists?
  Business.create ({
    :name => "LONGPORT COLOMBIA LTDA",
    :nit => "900.053.309-2800.202.909-9",
    :phone => "(+57) 415 6781",
    :address => "Carrera 103 No. 25B - 20 Bogotá D.C",
    :site_web => "www.longportsecurity.com.co",
    :email => "info.co@longportaviation.com",
    :description => "PREVENIR ACTOS DE INTERFERENCIA ILÍCITA EN LA AVIACIÓN CIVIL"
  })
end
unless Business.where(:name => "LONGPORT AIRPORT SERVICES SAS").exists?
  Business.create ({
    :name => "LONGPORT AIRPORT SERVICES SAS",
    :nit => "900.053.309-2",
    :phone => "(+57) 475 5335",
    :address => "Carrera 9 No. 80 – 45 Piso 4 Bogotá D.C",
    :site_web => "www.longportsecurity.com.co",
    :email => "info@longportaviation.com",
    :description => ""
  })
end
unless Rol.where(:name => "Administrator/Adminisrador").exists?
  Rol.create ({
    :code => "administrator",
    :name => "Administrator/Adminisrador",
    :description => "Administrator"
  })
end
unless Rol.where(:name => "User/Usuario").exists?
  Rol.create ({
    :code => "user",
    :name => "User/Usuario",
    :description => "User/Usuario"
  })
end
unless User.where(:email => "adsi2.co@longportaviation.com").exists?
  User.create({
    :name => "Angie",
    :date_birth => "2000-04-16",
    :email => "adsi2.co@longportaviation.com",
    :password => "123456",
    :password_confirmation => "123456",
    :rol_id => Rol.first.id
  })
end
unless User.where(:email => "angie@gmail.com").exists?
  User.create({
    :name => "Angie",
    :date_birth => "2000-04-16",
    :email => "angie@gmail.com",
    :password => "123456",
    :password_confirmation => "123456",
    :rol_id => Rol.first.id
  })
end