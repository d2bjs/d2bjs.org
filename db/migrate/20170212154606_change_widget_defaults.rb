class ChangeWidgetDefaults < ActiveRecord::Migration
  def change
    change_column_default :widgets,
                          :html,
                          "<div id = 'chart'></div>"
    change_column_default :widgets,
                          :css,
                          "#chart{\n"+
                          "\theight: 500px;\n"+
                          "}"
    change_column_default :widgets,
                          :js,
                          "var pie = d2b.chartPie();\n\n"+
                          "var chart = d3.select('#chart')\n"+
                          "\t.datum([\n"+
                          "\t\t{label: 'arc 1', value: 23},\n"+
                          "\t\t{label: 'arc 2', value: 31},\n"+
                          "\t\t{label: 'arc 3', value: 80},\n"+
                          "\t\t{label: 'arc 4', value: 8}\n"+
                          "\t])\n"+
                          "\t.call(pie);\n\n"+
                          "window.addEventListener('resize', function(){\n"+
                          "\tchart.call(pie);\n"+
                          "});"
  end
end
