class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :entry_id
      t.string :type, default: 'EmbeddedWidget'
      t.string :name
      t.string :iframe_url
      t.attachment :image
      t.text :markdown
      t.text :caption
      t.integer :index
      t.text :html, default: "<div class='chart'></div>"
      t.text :css, default: ".chart{}"
      t.text :js, default: "var chart = d2b.CHARTS.axisChart();\n\n"+
                           "chart.select('.chart')\n"+
                           "\t.width($(window).width())\n"+
                           "\t.update();\n\n"+
                           "window.onresize = function(){\n"+
                           "\tchart.width($(window).width()).update();\n"+
                           "};"


      t.timestamps null: false
    end
  end
end
