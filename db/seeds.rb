# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubyXL'

Exercise.destroy_all

workbook = RubyXL::Parser.parse 'gymdataset.xlsx'
worksheets = workbook.worksheets

lista_exercicios = []

worksheets.each do |worksheet|
  worksheet.each do |row|
    exercicio = {
      name: row[0].value,
      muscle: row[5].value,
      equipment: row[7].value,
      rating: row[8].value
    }

    lista_exercicios << exercicio
  end
end

Exercise.create!([lista_exercicios])

p "Created #{Exercise.count} exercises"
