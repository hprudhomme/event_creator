class EventController < ApplicationController
    before_action :authenticate_user!
    
    def index

      if  params[:searchCategorie].present? && params[:searchDate].present? && params[:searchCity].present?

        @city = params[:searchCity]

        i = 0;
        while i < @city.length do
            if(i == 0)
                @city[i] = @city[i].upcase
            else
                @city[i] = @city[i].downcase
            end
            i += 1
        end

        @all_events = Event.where(catégorie: params[:searchCategorie], city: @city, public: true)
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

      elsif  params[:searchCategorie].present? && params[:searchDate].blank? && params[:searchCity].present?

        @city = params[:searchCity]

        i = 0;
        while i < @city.length do
            if(i == 0)
                @city[i] = @city[i].upcase
            else
                @city[i] = @city[i].downcase
            end
            i += 1
        end

        @events = Event.where(catégorie: params[:searchCategorie], city: @city, public: true)
        @events = @events.where.not(user_id: current_user.id)

      elsif  params[:searchCategorie].blank? && params[:searchDate].present? && params[:searchCity].present?

        @city = params[:searchCity]

        i = 0;
        while i < @city.length do
            if(i == 0)
                @city[i] = @city[i].upcase
            else
                @city[i] = @city[i].downcase
            end
            i += 1
        end

        @all_events = Event.where(city: @city, public: true)
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


      elsif  params[:searchCategorie].present? && params[:searchDate].present? && params[:searchCity].blank?

        @all_events = Event.where(catégorie: params[:searchCategorie], public: true)
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



      elsif params[:searchCategorie].present? && params[:searchDate].blank? && params[:searchCity].blank?

        @events = Event.where(catégorie: params[:searchCategorie], public: true)
        @events = @events.where.not(user_id: current_user.id)



      elsif params[:searchDate].present? && params[:searchCategorie].blank? && params[:searchCity].blank?

        @events = Event.where(public: true)
        @all_events = @events.where.not(user_id: current_user.id)
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
        
        @events = Event.where(public: true)
        @events = @events.where.not(user_id: current_user.id)
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

        @city = @params_event["city"]

        i = 0;
        while i < @city.length do
            if(i == 0)
                @city[i] = @city[i].upcase
            else
                @city[i] = @city[i].downcase
            end
            i += 1
        end
 

        @event = Event.new(user_id: @id, title: @params_event["title"], description: @params_event["description"], catégorie: @params_event["catégorie"], date: @params_event["date"], public: @public, city: @city)

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
      if @event.update(title: params[:title], description: params[:description], catégorie: params[:catégorie], date: params[:date], public: @public, city: @city)
          redirect_to request.referrer;
      else
        redirect_to request.referrer;
      end
    end
end
