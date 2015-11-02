# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Datum.delete_all
Category.delete_all
Widget.delete_all
Entry.delete_all

image_dir = "#{Rails.root}/db/seeds/images"

user = User.create email: "admin@academicdashboards.com", password: "informaticsUNM"

cat_dashboards = Category.create(
  name: 'Dashboards'
)
cat_web_appliactions = Category.create(
  name: 'Web Applications'
)
cat_analytics = Category.create(
  name: 'Analytics'
)
cat_data_warehousing = Category.create(
  name: 'Data Warehousing'
)
cat_d2bjs = Category.create(
  name: 'd2b.js'
)
cat_other_jsplugins = Category.create(
  name: 'Other js-plugins'
)

Entry.create(
  name: 'Workforce',
  # markdown: '#Test Markdown',
  thumbnail: File.new("#{image_dir}/workforce/thumbnail.png"),
  widgets: [
    IframeWidget.create(iframe_url: "http://workforce.unm.edu")
  ],
  categories: [cat_dashboards]
)

Entry.create(
  name: 'Branch Campus Sunburst',
  # markdown: '#Test Markdown',
  thumbnail: File.new("#{image_dir}/branch_campus_sunburst/thumbnail.png"),
  widgets: [
    IframeWidget.create(iframe_url: "http://informatics.unm.edu/unm_branches/sunburst_dynamic_toggle_period.html")
  ],
  categories: [cat_dashboards]
)

Entry.create(
  name: 'Faculty Gender Equality',
  # markdown: '#Test Markdown',
  thumbnail: File.new("#{image_dir}/faculty_gender_equality/thumbnail.png"),
  widgets: [
    ImageWidget.create(
      image: File.new("#{image_dir}/faculty_gender_equality/image_1.png")
    ),
    ImageWidget.create(
      image: File.new("#{image_dir}/faculty_gender_equality/image_2.png")
    )
  ],
  categories: [cat_dashboards]
)
