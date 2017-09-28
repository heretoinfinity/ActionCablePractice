class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast "room_channel", message: data['message']
    # just output the message back to the screen as an alert
    Message.create! content: data['message']
  end
end
