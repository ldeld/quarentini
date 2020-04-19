import { Controller } from "stimulus"
import consumer from '../channels/consumer';


export default class extends Controller {
  static targets = ["players"]

  connect() {
    console.log(this.data.get("slug"))
    this.channel = consumer.subscriptions.create({
      channel: "RoomChannel",
      slug: this.data.get("slug")
    },
    {
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this)
    });
  }

  _cableConnected() {
    // Called when the subscription is ready for use on the server
  }

  _cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  _cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel
    switch (data.action) {
      case 'playerJoin':
        const html = `<p>${data.player_name}</p>`;
        this.playersTarget.insertAdjacentHTML("beforeend", html);
      case 'gameStart':
        window.location.reload();
    }
  }
}
