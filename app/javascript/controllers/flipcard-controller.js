import { Controller } from "stimulus"

export default class extends Controller {
  flip() {
    event.preventDefault();
    this.element.classList.add("flipped")
  }
}
