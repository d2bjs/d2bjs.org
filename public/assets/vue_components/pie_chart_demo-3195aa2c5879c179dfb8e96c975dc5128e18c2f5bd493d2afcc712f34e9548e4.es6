Vue.component('pie-chart-demo', {
  template: `
<div class = 'pie-chart-demo demo container'>
  <demo-button name = 'Pie Chart' v-model = 'started'></demo-button>
  <div class = 'demo-chart'>
    <pie-chart :data = 'data' :config = 'config'></pie-chart>
  </div>
</div>
  `,
  components: {
    'pie-chart': d2b.vueChartPie
  },
  data: function () {
    return {
      started: false,
      interval: null,
      config: function (chart) {
        chart.donutRatio(0.5);
        chart.tooltip().html(d => Math.round(d.value * 100) / 100);
      },
      data: [
					{label: 'Arc 1', value: 0},
					{label: 'Arc 2', value: 0},
					{label: 'Arc 3', value: 0},
					{label: 'Arc 4', value: 0},
					{label: 'Arc 5', value: 0},
					{label: 'Arc 6', value: 0}
				]
    };
  },
  created: function () {
    this.randomizeData();
  },
  watch: {
    started: function () {
      if (this.started) {
        this.interval = setInterval(this.randomizeData, 2000);
      } else {
        clearInterval(this.interval);
      }
    }
  },
  methods: {
    randomizeData: function () {
      this.data.forEach(d => d.value = 100 * Math.random());
    }
  }
});
