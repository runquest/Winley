class EventsController < ApplicationController

    # before_filter :load_user

  def event_home
    @events = Event.all
  end

  def new
    @event = Event.new
    # @event.users = current_user
  end

  def create
    @event = Event.new(event_params)


    if @event.save
      current_user.events << @event
      redirect_to event_path(@event), notice: "#{@event.event_title}!"

    else
      render :new
    end
  end

  def show
     @events= Event.all
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

    if @event.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end 

  protected

  # def load_user
  #   @user = User.find(session[:user_id])
  # end

  def event_params
    params.require(:event).permit(:event_title, :event_venue, :event_date, :duration, :description)
  end


end
