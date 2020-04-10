import consumer from "./consumer"

// TODO: place this in a stimulus controller?
const roomContainer = document.getElementById('room-container');
if (roomContainer) {
  consumer.subscriptions.create({
      channel: "RoomChannel",
      slug: roomContainer.dataset.roomSlug
    },
    {
      connected() {
          // Called when the subscription is ready for use on the server
        },

        disconnected() {
          // Called when the subscription has been terminated by the server
        },

        received(data) {
          console.log(data);
          const playerDiv = document.querySelector(".players")
          const html = `<li>${data}</li>`
          playerDiv.insertAdjacentHTML("beforeend", html)
        }
  });
}
