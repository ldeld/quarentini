import { Controller } from "stimulus"
import consumer from '../channels/consumer';

export default class extends Controller {
  static targets = ["card", "player", "activePlayer"]

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
    this.cardTarget.innerHTML = data.card_body;
    this.activePlayerTarget.innerHTML = data.active_player.nickname;
    this.playerTargets.forEach((player) => {
      player.classList.toggle("active", data.active_player.id == player.dataset.playerId)
    })
  }
}
