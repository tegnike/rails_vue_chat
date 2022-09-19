<template>
  <div>
    <h1>{{ title }}</h1>
    <p v-if="isEnabled">{{ subscribe }}</p>
    <button @dblclick="toggle">トグルする</button>
    <p>{{ text }}</p>
  </div>
</template>

<script>
export default {
  data () {
    return {
      title: '初めてのVue.jsアプリです',
      subscribe: 'ようこそ',
      isEnabled: true
    }
  },
  computed: {
    text () {
      if (this.isEnabled) {
        return 'こんちには'
      } else {
        return 'さよなら'
      }
    }
  },
  methods: {
    toggle () {
      this.isEnabled = !this.isEnabled
    }
  }
}

</script>