Vue.component('sunburst-chart-demo', {
  template: `
<div class = 'sunburst-chart-demo demo container'>
  <demo-button name = 'Sunburst Chart' v-model = 'started'></demo-button>
  <div class = 'demo-chart'>
    <sunburst-chart :data = 'data'></sunburst-chart>
  </div>
</div>
  `,
  components: {
    'sunburst-chart': d2b.vueChartSunburst
  },
  data: function () {
    return {
      started: false,
      interval: null,
      config: function (chart) {
        chart.donutRatio(0.5);
        chart.tooltip().html(d => Math.round(d.value * 100) / 100);
      },
      data: {
        label: 'root',
        children: [
          {
            label: 'child 1',
            children: [
              {
                label: 'child 1-1',
                size: 0
              },
              {
                label: 'child 1-2',
                children: [
                  {
                    label: 'child 1-2-1',
                    size: 0
                  },
                  {
                    label: 'child 1-3-1',
                    size: 0
                  }
                ]
              },
              {
                label: 'child 1-3',
                children: [
                  {
                    label: 'child 1-3-1',
                    children: [
                      {
                        label: 'child 1-3-1-1',
                        size: 0
                      },
                      {
                        label: 'child 1-3-1-2',
                        size: 0
                      }
                    ]
                  },
                  {
                    label: 'child 1-3-2',
                    size: 0
                  }
                ]
              }
            ]
          },
          {
            label: 'child 2',
            size: 0
          }
        ]
      }
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
      this.data.children.forEach(d => this.randomizeNode(d));
    },
    randomizeNode: function (node) {
      if (node.children) {
        node.children.forEach(d => this.randomizeNode(d));
      } else {
        node.size = Math.random() * 100;
      }
    }
  }
});
