Vue.component('demo-button', {
  props: {
    value: {
      default: false
    },
    name: {
      default: ''
    }
  },
  template: `
<div class = 'demo-button' @click = 'toggle'>
  <div class = 'demo-message'>{{ name }}</div>
  <div class = 'demo-toggle'>{{ message }}</div>
</div>
  `,
  computed: {
    message: function () {
      return this.value ? 'Stop Demo' : 'Start Demo';
    }
  },
  methods: {
    toggle: function () {
      this.$emit('input', !this.value);
    }
  }
});
