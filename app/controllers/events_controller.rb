include ApplicationHelper

class EventsController < ApplicationController
  before_filter :deny_unless_officer, only: [:new, :create, :edit, :update, :delete]

  def new
    @event = Event.new if current_user_is_officer?
    @title = "New Event"
  end

  def create
    @event = Event.new(params[:Event])
    if @event.save
      flash[:success] = "Event created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
    @event = Event.find(params[:id])
    @title = "Edit Event"
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

  def delete
  end
end
