class EventController < ApplicationController
    before_action :authenticate_user!
    
    def index

      if  params[:searchCategorie].present? && params[:searchDate].present?

        @all_events = Event.where(catégorie: params[:searchCategorie])
        @all_events = @all_events.where.not(user_id: current_user.id)

        @same_date_events = Array.new
        i = 0
        j = 0
        while i < @all_events.length do
            if @all_events[i].date.strftime("%F") == params[:searchDate]
              @same_date_events[j] = @all_events[i]
              j += 1
            end
            i += 1
        end 
        @events = @same_date_events

      elsif params[:searchCategorie].present? && params[:searchDate].blank?

        @events = Event.where(catégorie: params[:searchCategorie])
        @events = @events.where.not(user_id: current_user.id)

      elsif params[:searchDate].present? && params[:searchCategorie].blank?

        @all_events = Event.where.not(user_id: current_user.id)
        @same_date_events = Array.new

        i = 0
        j = 0
        while i < @all_events.length do
            if @all_events[i].date.strftime("%F") == params[:searchDate]
              @same_date_events[j] = @all_events[i]
              j += 1
            end
            i += 1
        end 
        @events = @same_date_events
        
      else

        @events = Event.where.not(user_id: current_user.id)
        @url = request.url

      end
    end

    def show
      @event = Event.find(params[:id])
    end


    def new
      
    end

    def create
        @id = current_user.id

        if !params[:public].present?
          @public = false
        else
          @public = true
        end

        if params[:event].present?
          @params_event = params[:event]
          @public = false
          if @params_event["public"] == "true"
            @public = true
          end
        end
 

        @event = Event.new(user_id: @id, title: @params_event["title"], description: @params_event["description"], catégorie: @params_event["catégorie"], date: @params_event["date"], public: @public)

        if @event.save
          puts "Event Save"
          puts params
          @user = User.find_by id:@id;
          redirect_to request.referrer;
        else
          puts "fail";
          redirect_to request.referrer;
        end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
    
      redirect_to request.referrer;
    end

    def search
    end

    def edit
      @id = params[:id]
    end

    def update     
        if !params[:public].present?
          @public = false
        else
          @public = true
        end

      @event = Event.find(params[:id])
      if @event.update(title: params[:title], description: params[:description], catégorie: params[:catégorie], date: params[:date], public: @public)
          redirect_to request.referrer;
      else
        redirect_to request.referrer;
      end
    end
end
