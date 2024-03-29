# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'jp_prefecture'

JpPrefecture::Prefecture.all.each do |pref|

Prefecture.create(name: pref.name, code: pref.code)

end


tags = ["グルメ", "観光", "アウトドア", "オフロード", "景色", "競技"]

tags.each do |tag|
  Tag.create(name: tag)
end