class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @age = ((Time.zone.now - @user.birthdate.to_time) / 1.year.seconds).floor
    end

    def my_events
        @events = Event.where(user_id:current_user.id)
        @events_length = @events.length

        @guests = Guest.where(name: current_user.firstname)
        @guest_events = Array.new
        i = 0
        while i < @guests.length do
            @guest_events[i] = @guests[i].event
            i += 1
        end
        @guest_events_length = @guest_events.length
    end

end
