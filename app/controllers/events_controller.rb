class EventsController < ApplicationController
    before_action :set_event, only: %i[show update destroy]
  
    # GET /events
    def index
      @events = Event.all
      render json: @events
    end
  
    # GET /events/:id
    def show
      render json: @event
    end
  
    # POST /events
    def create
      @event = Event.new(event_params)
      if @event.save
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /events/:id
    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /events/:id
    def destroy
      @event.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :event_date)
    end
  end
  