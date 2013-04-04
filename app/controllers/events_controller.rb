include ApplicationHelper

class EventsController < ApplicationController
  before_filter :deny_unless_officer, only: [:new, :create, :edit, :update, :delete]

  def new
    @event = Event.new if current_user_is_officer?
    @title = "New Event"
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Event created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @title = @event.title
  end

  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
    @event = Event.find(params[:id])
    @title = "Edit Event: #{@event.title}"
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event Updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def attend
    if user_signed_in?
      @event = Event.find(params[:id])
      if not @event.nil?
        if !current_user.events.include?(@event)
          flash[:success] = "Thank you for attending #{@event.title}!"
          current_user.events << @event
          redirect_to @event
        else
          flash[:warning] = "You are already attending this event."
          redirect_to @event
        end
      else
        flash[:error] = "Event not found"
        redirect_to current_user
      end
    else
      flash[:error] = "You are not signed in. Please sign in to attend events."
      redirect_to signin_path
    end
  end

  def delete
  end
end
