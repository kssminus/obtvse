// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(chatroom_connect);
function chatroom_connect() {
  var source = new EventSource('/chat/chatroom');
  source.addEventListener("message", update);
  $("#message_send").click(function(e){
    $.post('/chat/message', {'message':$("#chat").val()});
  });
}

function update(event) {
  $('#chat_window').append("\n"+event.data);
}

