<template>
  <div id="partlices" style="display: none">
    <div id="modal1" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <span class="close">&times;</span>
          <h2 id="modal-titel">
            Falsches Türchen!
          </h2>
        </div>
        <div class="modal-body">
          <p id="modal-text">
            Bist du sicher, dass du schon Zählen kannst?
          </p>
          <br>
        </div>
      </div>
    </div>
    <div class="grid grid-cols-6 gap-4">
      <Door
        v-for="door in doors"
        :key="door.price"
        :url="door.url"
        :day="door.day"
        :price="door.price"
        :opened="door.opened"
        :class="sizes(door.day)"
      />
    </div>
  </div>
</template>

<script>

export default {
  data () {
    return {
      doors: [
        {
          day: 13,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 2,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 17,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 6,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 9,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 18,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 11,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 13,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 24,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 23,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 5,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 10,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 3,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 16,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 14,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 22,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 1,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 19,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 20,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 12,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 4,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 7,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 15,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 8,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        },
        {
          day: 21,
          url: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg',
          price: '',
          opened: false
        }
      ]
    }
  },
  mounted () {
    const BASE_URL = 'https://advent/'
    window.addEventListener('keyup', (event) => {
      if (event.key === 'Escape' || event.key === 'Backspace') {
        window.jQuery.post(BASE_URL + 'hide')
        document.getElementById('partlices').style.display = 'none'
      }
    })
    window.addEventListener('message', (event) => {
      const eventType = event.data.event
      if (eventType === 'open') {
        document.getElementById('partlices').style.display = 'block'
      } else if (eventType === 'door') {
        this.doors = event.data.doors
      }
    })
    require('particles.js')
    window.particlesJS('partlices', {
      particles: {
        number: {
          value: 52,
          density: {
            enable: true,
            value_area: 631.3280775270874
          }
        },
        color: {
          value: '#fff'
        },
        shape: {
          type: 'circle',
          stroke: {
            width: 0,
            color: '#000000'
          },
          polygon: {
            nb_sides: 5
          },
          image: {
            src: 'img/github.svg',
            width: 100,
            height: 100
          }
        },
        opacity: {
          value: 0.5,
          random: true,
          anim: {
            enable: false,
            speed: 1,
            opacity_min: 0.1,
            sync: false
          }
        },
        size: {
          value: 5,
          random: true,
          anim: {
            enable: false,
            speed: 40,
            size_min: 0.1,
            sync: false
          }
        },
        line_linked: {
          enable: false,
          distance: 500,
          color: '#ffffff',
          opacity: 0.4,
          width: 2
        },
        move: {
          enable: true,
          speed: 1.5,
          direction: 'bottom',
          random: false,
          straight: false,
          out_mode: 'out',
          bounce: false,
          attract: {
            enable: false,
            rotateX: 600,
            rotateY: 1200
          }
        }
      },
      interactivity: {
        detect_on: 'canvas',
        events: {
          onhover: {
            enable: false,
            mode: 'bubble'
          },
          onclick: {
            enable: true,
            mode: 'repulse'
          },
          resize: true
        },
        modes: {
          grab: {
            distance: 400,
            line_linked: {
              opacity: 0.5
            }
          },
          bubble: {
            distance: 400,
            size: 4,
            duration: 0.3,
            opacity: 1,
            speed: 3
          },
          repulse: {
            distance: 200,
            duration: 0.4
          },
          push: {
            particles_nb: 4
          },
          remove: {
            particles_nb: 2
          }
        }
      },
      retina_detect: true
    })
    const element = document.getElementsByClassName('particles-js-canvas-el')[0]
    const top = element.parentNode
    top.insertBefore(element, top.firstChild)

    // Get the modal
    const modal = document.getElementById('modal1')

    // When the user clicks the button, open the modal
    window.addEventListener('triggerModal', (event) => {
      document.getElementById('modal-titel').innerHTML = event.detail.titel
      document.getElementById('modal-text').innerHTML = event.detail.text
      modal.style.display = 'block'
    })

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target === modal) {
        modal.style.display = 'none'
      }
    }
  },
  methods: {
    sizes (door) {
      if (door === 24) { return 'row-span-3 col-span-2' }
      if (door === 19) { return 'col-span-2 row-span-2' }
      return ''
    }
  }
}
</script>

<style>
* {
  z-index: 2;
}
#partlices,
#partlices > canvas {
  z-index: -1 !important;
  position: absolute;
}
#partlices {
  background: url(https://immortal-roleplay.one/Images/TS.png) no-repeat
    top center #82d8cb;
  background-size: cover;
  width: 100%;
  height: 100%;
}
.title {
  display: flex;
  align-items: center;
  justify-content: center;
}

.title img {
  width: 50%;
  height: auto;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 3; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
  -webkit-animation-name: fadeIn; /* Fade in the background */
  -webkit-animation-duration: 0.4s;
  animation-name: fadeIn;
  animation-duration: 0.4s;
}

/* Modal Content */
.modal-content {
  position: fixed;
  bottom: 0;
  background-color: #fefefe;
  width: 100%;
  -webkit-animation-name: slideIn;
  -webkit-animation-duration: 0.4s;
  animation-name: slideIn;
  animation-duration: 0.4s;
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {
  padding: 2px 16px;
}
</style>
