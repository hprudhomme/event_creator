class GuestController < ApplicationController
    def create
        @id = current_user.id
        @guest = Guest.new(event_id: params[:event_id], name: current_user.firstname)

        if @guest.save
          puts "Save"
          @user = User.find_by id:@id;
          redirect_to event_index_path;
        else
          puts "fail";
          redirect_to event_index_path;
        end
    end


    def update
      puts params

      @guest = Guest.find(params[:id])
      if @guest.update(admitted: true)
          redirect_to request.referrer;
      else
        redirect_to request.referrer;
      end
    end

    def destroy
      @guest = Guest.find(params[:id])
      @guest.destroy
    
      redirect_to request.referrer;
    end
end
