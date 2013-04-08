class ChatController < ApplicationController
  include ActionController::Live


  def index
    @categories = Category.all 
    respond_to do |format|
      format.html
    end
  
  end
  
  def message 
    redis = Redis.new
    if redis.publish('chatroom', params['message'])
      #redis.quit
      render json: { result: 'ok'}.to_json
    else
      render json: { result: 'error'}.to_json
    end
    
  end

  def chatroom 
    response.header['Content-Type'] = "text/event-stream"
    redis = Redis.new
    redis.subscribe('chatroom') do |on|
      on.message do |event, data|
        response.stream.write("data: #{data}\n\n") 
      end
    end
      
  ensure 
    response.stream.close
    #redis.quit
  end 
  
end
