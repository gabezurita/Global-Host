class ItinerariesController < ApplicationController
  # before_action :find_conversation, only: [:new]

  # def find_conversation
  #   @conversation = Conversation.find(params[:id])
  # end

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = @conversation.itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      @errors = @itinerary.errors.full_messages
      render 'form'
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
  end

  def edit
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activity.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update_attributes(itinerary_params)
    redirect_to @itinerary
    # @activity = @itinerary.activity.find(params[:id])
  end

  private
    def itinerary_params
      params.require(:itinerary).permit(:name, :date)
    end

end
