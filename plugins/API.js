import Vue from 'vue'
const BASE_URL = 'http://advent/'

class API {
  constructor() {
    window.addEventListener('message', (event) => {
      const eventType = event.data.event
      if (
        eventType !== undefined &&
        typeof this['on' + eventType] === 'function'
      ) {
        this['on' + eventType](event.data)
      }
    })
  }

  async post(method, data) {
    const ndata = data === undefined ? '{}' : JSON.stringify(data)
    const response = await window.jQuery.post(BASE_URL + method, ndata)
    return JSON.parse(response)
  }

  async openDoor(day) {
    await this.post('openDoor', day)
  }

  onOpen() {
    window.dispatchEvent(new CustomEvent('showdoors'))
  }

  onDoor(data) {
    window.dispatchEvent(
      new CustomEvent('getDoors', { detail: { doors: data.doors } })
    )
  }
}

const instance = new API()
Vue.prototype.$api = instance
window.Vue = Vue

export default instance
