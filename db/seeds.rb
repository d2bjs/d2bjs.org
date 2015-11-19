# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.delete_all
# Datum.delete_all
# Category.delete_all
# Widget.delete_all
# Entry.delete_all
#
image_dir = "#{Rails.root}/db/seeds/images"

user = User.create email: "admin@academicdashboards.com", password: "informaticsUNM"

# cat_dashboards = Category.create(
#   name: 'Dashboards'
# )
# cat_web_applications = Category.create(
#   name: 'Web Applications'
# )
# cat_analytics = Category.create(
#   name: 'Analytics'
# )
# cat_data_warehousing = Category.create(
#   name: 'Data Warehousing'
# )
# cat_d2bjs = Category.create(
#   name: 'd2b.js'
# )
# cat_other_jsplugins = Category.create(
#   name: 'Other js-plugins'
# )
#
# Entry.create(
#   name: 'Workforce',
#   description: 'Dashboard for tracking graduates after they have left New Mexico universities.',
#   markdown: "###Dashboard Vision \n"+
#             "This dashboard was built in conjunction with workforce solutions. "+
#             "The hope is that we can now have better (more informed) "+
#             "comparisons between New Mexico universities. As well as expose "+
#             "degrees with higher salaries as well as those that lead to a "+
#             "higher contribution in the New Mexico workforce.",
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/workforce/thumbnail.png"),
#   widgets: [
#     IframeWidget.create(iframe_url: "http://workforce.unm.edu")
#   ],
#   categories: [cat_dashboards]
# )
#
# Entry.create(
#   name: 'Branch Campus Sunburst',
#   description: 'Sunburst to measure how many students are in a branch (satellite) campus. Breakdowns help to distinguish the distribution of gender, time status, etc..',
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/branch_campus_sunburst/thumbnail.png"),
#   widgets: [
#     IframeWidget.create(iframe_url: "http://informatics.unm.edu/unm_branches/sunburst_dynamic_toggle_period.html")
#   ],
#   categories: [cat_dashboards]
# )
#
# Entry.create(
#   name: 'University Dashboard',
#   description: 'Public facing dashboard built for the University of New Mexico, that provides insight for employee data, student success, student enrollment.',
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/university_dashboard/thumbnail.png"),
#   widgets: [
#     IframeWidget.create(iframe_url: "http://informatics.unm.edu")
#   ],
#   categories: [cat_dashboards]
# )
#
# Entry.create(
#   name: 'Faculty Gender Equality',
#   description: 'Dashboard that helps pinpoint any gender unequalities within a workplace. Takes into account salary and experience.',
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/faculty_gender_equality/thumbnail.png"),
#   widgets: [
#     ImageWidget.create(
#       image: File.new("#{image_dir}/faculty_gender_equality/image_1.png")
#     ),
#     ImageWidget.create(
#       image: File.new("#{image_dir}/faculty_gender_equality/image_2.png")
#     )
#   ],
#   categories: [cat_dashboards]
# )
#
# Entry.create(
#   name: 'Curriculum Credit Hours',
#   description: 'Track the improvement (lowering) of required credit hours for each degree program.',
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/curriculum_credit_hours/thumbnail.png"),
#   widgets: [
#     IframeWidget.create(iframe_url: "http://informatics.unm.edu/degrees/degrees.html")
#   ],
#   categories: [cat_dashboards]
# )
#
# Entry.create(
#   name: 'Degrees',
#   description: 'Help students to stay on track and plan ahead for their current or prospective degree plans.',
#   # markdown: '#Test Markdown',
#   thumbnail: File.new("#{image_dir}/degrees/thumbnail.png"),
#   widgets: [
#     IframeWidget.create(iframe_url: "http://degrees.unm.edu")
#   ],
#   categories: [cat_web_applications]
# )

## Example Entries

axisChart = ExampleCategory.create(
  name: 'Axis Chart',
  thumbnail: File.new("#{image_dir}/categories/axisChart.png"),
)

axisChart.entries.create(
  name: 'Line Chart',
  description: 'Simple x, y line chart.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

sunburst = ExampleCategory.create(
  name: 'Sunburst',
  thumbnail: File.new("#{image_dir}/categories/sunburst.png"),
)

sunburst.entries.create(
  name: 'Sunburst',
  description: 'Basic sunburst chart layout.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

sunburst.entries.create(
  name: 'Inverted Sunburst',
  description: 'Sunburst example using the inverted control.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

sankey = ExampleCategory.create(
  name: 'Sankey',
  thumbnail: File.new("#{image_dir}/categories/sankey.png"),
)

sankey.entries.create(
  name: 'Sankey',
  description: 'Simple sankey chart layout.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

utilities = ExampleCategory.create(
  name: 'Utilities',
  thumbnail: File.new("#{image_dir}/categories/utilities.png"),
)

utilities.entries.create(
  name: 'Loader',
  description: 'Asynchronous file loader.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

utilities.entries.create(
  name: 'Legend',
  description: 'Basic chart legend.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

utilities.entries.create(
  name: 'Axis',
  description: '2D axis utility.',
  # markdown: '',
  widgets: [EmbeddedWidget.create()]
)

## Getting Started Entries

setup = GettingStartedCategory.create name: 'Setup'

setup.entries.create(
  markdown: 'Here you can get started by downloading the lates of d2b.'
)
