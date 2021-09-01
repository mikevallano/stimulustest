import { Controller } from 'stimulus';
export default class extends Controller {
  connect() {
    console.log("hello from StimulusJS")
  }

  greet() {
    console.log('Hola mundo!')
  }

  // See tutorial for ways to add arrays of targets:
  // https://betterprogramming.pub/how-to-add-stimulus-js-to-a-rails-6-application-4201837785f9
  tweak() {
    let clicky = 'OOh, you got clicky!'
    let subhead = document.getElementById('subhead')
    let original = 'Hola'
    if (subhead.innerText == original) {
      subhead.innerText = clicky
    } else {
      subhead.innerText = original
    }
  }
}
