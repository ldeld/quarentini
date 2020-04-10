import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["urlInput"]

  copy() {
    this.urlInputTarget.select();
    document.execCommand("copy");
    // TODO: show a bpox saying "copied"
  }
}
