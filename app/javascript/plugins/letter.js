import Typed from 'typed.js'

const initUpdateTitle = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find a campsite in Arizona", "Find a campsite in Oregon", "Find a campsite in California", "A safe place for your family", "Find a campsite in Utah", "Find a campsite in Washington", "Find a campsite in Nevada"],
    typeSpeed: 30,
    loop: true
  })
}

export { initUpdateTitle };