# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
    :afp => "SURA"
  })

  unless Business.where(:name => "LONGPORT COLOMBIA LTDA").exists?
  Business.create ({
    :name => "LONGPORT COLOMBIA LTDA",
    :nit => "800.202.909-9",
    :phone => "(+57) 415 6781",
    :address => "Carrera 103 No. 25B - 20 Bogotá D.C",
    :site_web => "www.longportsecurity.com.co",
    :email => "info.co@longportaviation.com",
    :description => "PREVENIR ACTOS DE INTERFERENCIA ILÍCITA EN LA AVIACIÓN CIVIL"
  })
end