import consumer from "./consumer"

// TODO: place this in a stimulus controller?
// const roomContainer = document.getElementById('room-container');
// if (roomContainer) {
//   consumer.subscriptions.create({
//       channel: "RoomChannel",
//       slug: roomContainer.dataset.roomSlug
//     },
//     {
//       connected() {
//           // Called when the subscription is ready for use on the server
//       },

//       disconnected() {
//         // Called when the subscription has been terminated by the server
//       },

//       received(data) {
//         console.log(data)
//         switch (data.action) {
//           case 'playerJoin':
//             const playerDiv = document.querySelector(".lobby-players");
//             const html = `<li>${data.body}</li>`;
//             playerDiv.insertAdjacentHTML("beforeend", html);
//           case 'gameStart':
//             window.location.reload();
//           case 'cardNext':
//             // const cardDiv = document.querySelector("#current-card");
//             // cardDiv.innerHTML = data.card_body;
//             // console.log(data.active_player_id);
//         }
//       }
//   });
// }
