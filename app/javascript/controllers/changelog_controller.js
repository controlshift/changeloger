// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static values = { log: String }

  promote(event) {
    const promoted = event.target.checked

    const token = document.querySelector('[name="csrf-token"]') || {content: 'no-csrf-token'}

    axios.post(`/changelogs/${this.logValue}/promote`, {
      promoted: promoted
    }, {headers: {'X-CSRF-Token': token.content}})
  }
}
