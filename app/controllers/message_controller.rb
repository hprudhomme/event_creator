class MessageController < ApplicationController
    def create
        @id = current_user.id
        @message = Message.new(event_id: params[:event_id], content: params[:content], author: @id)

        if @message.save
          puts "Save"
          @user = User.find_by id:@id;
          redirect_to request.referrer;
        else
          puts "fail";
          redirect_to request.referrer;
        end
    end
end
