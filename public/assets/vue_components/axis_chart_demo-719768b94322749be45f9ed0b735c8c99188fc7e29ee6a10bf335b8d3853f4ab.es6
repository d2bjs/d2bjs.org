Vue.component('axis-chart-demo', {
  template: `
<div class = 'axis-chart-demo demo container'>
  <demo-button name = 'Axis Chart' v-model = 'started'></demo-button>
  <div class = 'demo-chart'>
    <axis-chart :data = 'data'></axis-chart>
  </div>
</div>
  `,
  components: {
    'axis-chart': d2b.vueChartAxis
  },
  data: function () {
    let graphA = {label: 'Graph A', values: this.randomValues(1)},
        graphB = {label: 'Graph B', values: this.randomValues(2)},
        graphC = {label: 'Graph C', values: this.randomValues(3)},
        graphs = [graphA, graphB, graphC];

    let line = d2b.svgLine(),
        area = d2b.svgArea();

    line.line().curve(d3.curveBasis);
    area.area().curve(d3.curveBasis);

    return {
      started: false,
      interval: null,
      graphs: graphs,
      data: {
				sets: [
          {
						generators: [area, line],
						graphs: graphs
					}
				]
			}
    };
  },
  watch: {
    started: function () {
      if (this.started) {
        this.interval = setInterval(() => {
          this.graphs.forEach((graph, i) => {
            graph.values = this.randomValues(i + 1);
          });
        }, 2000);
      } else {
        clearInterval(this.interval);
      }
    }
  },
  methods: {
    randomValues: function(mult){
      var data = [];
      for(var i=0; i<30; i++){
        data.push({
          x: i,
          y: Math.round(Math.random() * 20 * mult)
        });
      };
      return data;
    }
  }
});
