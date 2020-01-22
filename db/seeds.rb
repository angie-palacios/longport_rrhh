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
unless User.where(:email => "angie@gmail.com").exists?
  User.create({
    :email => "angie@gmail.com",
    :password => "123456",
    :password_confirmation => "123456",
    :documentation => "1000792143",
    :name => "Angie Camila Palacios Pedraza",
    :date_initiated => "2019-07-02",
    :analytical_account => "OVH",
    :position => "AUXILIAR EN GESTION HUMANA",
    :sex => "FEMENINO",
    :date_birth => "2000-04-16",
    :salary => "877.803",
    :contract => "TERMINO INDEFINIDO",
    :address => "CARRERA 38 #13-126",
    :neighborhood => "SOACHA - CIUDAD VERDE",
    :phone => "317 870 8553 / 902 6038",
    :marital_status => "SOLTERA",
    :profession => "TEGNOLOGO EN ANALISIS Y DESARROLLO EN SISTEMAS DE INFORMACION",
    :eps => "FAMISANAR",
    :afp => "SURA",
  })
end
unless User.where(:email => "camila@gmail.com").exists?
  User.create({
    :email => "camila@gmail.com",
    :password => "123456",
    :password_confirmation => "123456",
    :documentation => "1000792144",
    :name => "Camila Palacios Pedraza",
    :date_initiated => "2019-07-02",
    :analytical_account => "TECH",
    :position => "AUXILIAR EN GESTION HUMANA",
    :sex => "FEMENINO",
    :date_birth => "2000-04-16",
    :salary => "877.803",
    :contract => "TERMINO INDEFINIDO",
    :address => "CARRERA 38 #13-126",
    :neighborhood => "SOACHA - CIUDAD VERDE",
    :phone => "317 870 8553 / 902 6038",
    :marital_status => "SOLTERA",
    :profession => "TEGNOLOGO EN ANALISIS Y DESARROLLO EN SISTEMAS DE INFORMACION",
    :eps => "SANITAS",
    :afp => "SURA",
  })
end