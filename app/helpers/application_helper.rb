module ApplicationHelper

    def isAlreadyGuest(user, event)
        @event = Event.find_by(id:event.id);
        @event.guests.each do |guest|
            if guest.name == current_user.firstname
                return true
            end
        end
        return false
    end


end
