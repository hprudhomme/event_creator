class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @age = ((Time.zone.now - @user.birthdate.to_time) / 1.year.seconds).floor
    end

    def my_events

        if current_user.id.to_i != params[:id].to_i
            redirect_to root_path
        end

        @i = params[:id]

        @events = Event.where(user_id:current_user.id)
        @events_length = @events.length

        @guests_accepted = Guest.where(name: current_user.firstname, admitted: 2)
        @guest_events_accepted = Array.new
        i = 0
        while i < @guests_accepted.length do
            @guest_events_accepted[i] = @guests_accepted[i].event
            i += 1
        end
        @guest_events_accepted_length = @guest_events_accepted.length


        @guests_waiting = Guest.where(name: current_user.firstname, admitted: 0)
        @guest_events_waiting = Array.new
        i = 0
        while i < @guests_waiting.length do
            @guest_events_waiting[i] = @guests_waiting[i].event
            i += 1
        end
        @guest_events_waiting_length = @guest_events_waiting.length


        @guests_invited = Guest.where(name: current_user.firstname, admitted: 1)
        @guest_events_invited = Array.new
        i = 0
        while i < @guests_invited.length do
            @guest_events_invited[i] = @guests_invited[i].event
            i += 1
        end
        @guest_events_invited_length = @guest_events_invited.length

    end

    def update

        
    end

end