class EventsController < ApplicationController

  before_filter :restrict_access, :except => [:show, :index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def show
   @event = Event.find(params[:id])     
  end

 def destroy
  @event = Event.find(params[:id])
  @user = current_user
  @event.destroy
  flash[:notice] = "You just updated #{@event.title} event!"
  redirect_to user_path(@user)
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
    redirect_to event_path(@event)
    flash[:notice] = "You just updated #{@event.title} event!"
  else
    render :edit
  end
end 

# def delete_bottle
#   e = Event.find(params[:event_id])
#   f = Flight.find(params[:flight_id]).destroy
#   # e.bottles.find(params[:bottle_id]).destroy
#   redirect_to event_path(e)
# end

  protected

  def event_params
    params.require(:event).permit(:user_id, :title, :venue, :date, :duration, :event_image, :description)
  end

end
