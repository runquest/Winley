class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @bottle = Bottle.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
      params[:bottle_id].each do | bottle_id |
        @bottle = Bottle.find(bottle_id)
        @event.bottles << @bottle
      end
    redirect_to event_path(@event), notice: "#{@event.title}" 
  end

  def show
     @event = Event.find(params[:id])     
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root
  end

  def edit
      @event = Event.find(params[:id])
  end

   def update
    @event = Event.find(params[:id])


    if current_user == nil

      if @event.update_attributes(event_params)
        redirect_to event_path, notice: "#{@event.title}!"
      else
        render :edit
      end

    else
        current_user.events << @event
        redirect_to event_path(@event), notice: "#{@event.title}!"
    end


  end 

  protected

  def event_params
    params.require(:event).permit(:title, :venue, :date, :duration, :description)
  end

end
