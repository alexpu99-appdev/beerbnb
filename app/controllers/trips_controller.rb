class TripsController < ApplicationController
  def index
    
    if Trip.count <= (Airbnb.count * Bar.count)
      the_trip = Trip.new
      the_trip.airbnb_id = Airbnb.all.sample.id
      the_trip.bar_id = Bar.all.sample.id

      if the_trip.valid?
        the_trip.save
      end
    end
    
    sample_trip = Trip.all.sample

    @beerbnb = sample_trip
    @beerbnb_air = Airbnb.where({ :id => @beerbnb.airbnb_id }).at(0)
    @beerbnb_bar = Bar.where({ :id => @beerbnb.bar_id }).at(0)

      # @list_of_trips = matching_trips.order({ :created_at => :desc })

    render({ :template => "trips/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show.html.erb" })
  end

  def create
    the_trip = Trip.new
    the_trip.airbnb_id = Airbnb.all.sample.id
    the_trip.bar_id = Bar.all.sample.id

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "How about this one?" })
    else
      redirect_to("/trips", { :notice => "Oops, something went wrong! Try again!" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.airbnb_id = params.fetch("query_airbnb_id")
    the_trip.bar_id = params.fetch("query_bar_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => "Trip failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
