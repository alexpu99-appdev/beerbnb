class LikedTripsController < ApplicationController
  def index
    users_liked_trips = LikedTrip.where({ :user_id => @current_user.id })

    @list_of_liked_trips = users_liked_trips.order({ :created_at => :desc })

    render({ :template => "liked_trips/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_liked_trips = LikedTrip.where({ :id => the_id })

    @the_liked_trip = matching_liked_trips.at(0)

    render({ :template => "liked_trips/show.html.erb" })
  end

  def create
    the_liked_trip = LikedTrip.new
    the_liked_trip.user_id = params.fetch("query_user_id")
    the_liked_trip.trip_id = params.fetch("query_trip_id")

    if the_liked_trip.valid?
      the_liked_trip.save
      redirect_to("/liked_trips", { :notice => "Liked trip created successfully." })
    else
      redirect_to("/liked_trips", { :notice => "Liked trip failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_liked_trip = LikedTrip.where({ :id => the_id }).at(0)

    the_liked_trip.user_id = params.fetch("query_user_id")
    the_liked_trip.trip_id = params.fetch("query_trip_id")

    if the_liked_trip.valid?
      the_liked_trip.save
      redirect_to("/liked_trips/#{the_liked_trip.id}", { :notice => "Liked trip updated successfully."} )
    else
      redirect_to("/liked_trips/#{the_liked_trip.id}", { :alert => "Liked trip failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_liked_trip = LikedTrip.where({ :id => the_id }).at(0)

    the_liked_trip.destroy

    redirect_to("/liked_trips", { :notice => "Liked trip deleted successfully."} )
  end
end
