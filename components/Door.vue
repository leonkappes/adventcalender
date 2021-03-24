<template>
  <div>
    <label @click="test">
      <input
        type="checkbox"
        :checked="opened"
        :disabled="isDisabled"
        @click="sendDoor"
        @input="opened = $event.target.checked"
      />
      <div class="door">
        <div class="front">{{ day }}</div>
        <div class="back" :style="urlStyle"></div>
      </div>
    </label>
  </div>
</template>

<script>
export default {
  props: {
    day: {
      default: 1,
      type: Number,
    },
    url: {
      default: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
      type: String,
    },
    price: {
      default: '',
      type: String,
    },
    opened: {
      default: false,
      type: Boolean,
    },
  },
  computed: {
    urlStyle() {
      return 'background-image: url("' + this.url + '")'
    },
    isDisabled() {
      const d = new Date()
      return this.day > d.getDate() || this.opened
    },
  },
  methods: {
    sendDoor() {
      if (process.client) {
        const d = new Date()
        if (this.day <= d.getDate()) {
          this.$api.openDoor(this.day)
          window.dispatchEvent(
            new CustomEvent('triggerModal', {
              detail: {
                text: this.price,
                titel: 'Türchen Nummer ' + this.day,
              },
            })
          )
        }
      }
    },
    test() {
      if (process.client) {
        const d = new Date()
        if (this.day > d.getDate()) {
          window.dispatchEvent(
            new CustomEvent('triggerModal', {
              detail: {
                text: 'Bist du sicher, dass du schon Zählen kannst?',
                titel: 'Falsches Türchen',
              },
            })
          )
        }
      }
    },
  },
}
</script>

<style>
input {
  display: none;
}

label {
  perspective: 1000px;
  transform-style: preserve-3d;
  cursor: pointer;

  display: flex;
  min-height: 100%;
  width: 100%;
  height: 120px;
}

.door {
  width: 100%;
  transform-style: preserve-3d;
  transition: all 300ms;
  border: 2px dashed transparent;
  border-radius: 10px;
}

.door div {
  position: absolute;
  height: 100%;
  width: 100%;
  backface-visibility: hidden;

  border-radius: 6px;

  display: flex;
  align-items: center;
  justify-content: center;

  font-family: 'Kalam', cursive;
  color: #fff;
  font-size: 2em;
  font-weight: bold;
  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.2);
}

.door .back {
  background-size: contain;
  background-position: center center;
  background-repeat: no-repeat;
  background-color: #2e313d;
  transform: rotateY(180deg);
}

label:hover .door {
  border-color: #fff;
}

:checked + .door {
  transform: rotateY(180deg);
}
</style>
