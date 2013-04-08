// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(initialize);
function initialize() {
  var source = new EventSource('/chat/chatroom');
  source.addEventListener("message", update);
  $("#message_send").click(function(e){
    $.post('/chat/message', {'message':$("#chat").val()});
  });
}

function update(event) {
  console.log("updat");
  var item = $('<li>').text(event.data);
  $('#chat_window').append(item);
}

