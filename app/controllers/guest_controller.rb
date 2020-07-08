class GuestController < ApplicationController
    def create
        @id = current_user.id

        if params[:id_of_user].present?
          @name = User.find(params[:id_of_user]).firstname
        else
          @name = current_user.firstname
        end

        @guest = Guest.new(event_id: params[:event_id], name: @name, admitted: params[:admitted])

        if @guest.save
          puts "Save"
          @user = User.find_by id:@id;
          redirect_to request.referrer;
        else
          puts "fail";
          redirect_to request.referrer;
        end
    end


    def update
      puts params

      @guest = Guest.find(params[:id])
      if @guest.update(admitted: 2)
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
