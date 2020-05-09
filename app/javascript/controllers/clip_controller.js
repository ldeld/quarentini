import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["urlInput", "copyBtn"]

  copy() {
    this.urlInputTarget.select();
    document.execCommand("copy");
    this.copyBtnTarget.innerText = "Copied!"
    setTimeout(() => this.copyBtnTarget.innerText = "Copy", 6000)
  }
}
