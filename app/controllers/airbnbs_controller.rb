class AirbnbsController < ApplicationController
  def index
    matching_airbnbs = Airbnb.all

    @list_of_airbnbs = matching_airbnbs.order({ :created_at => :desc })

    render({ :template => "airbnbs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_airbnbs = Airbnb.where({ :id => the_id })

    @the_airbnb = matching_airbnbs.at(0)

    render({ :template => "airbnbs/show.html.erb" })
  end

  def create
    the_airbnb = Airbnb.new
    the_airbnb.location = params.fetch("query_location")
    the_airbnb.price = params.fetch("query_price")
    the_airbnb.website = params.fetch("query_website")
    the_airbnb.photo = params.fetch("query_photo")

    if the_airbnb.valid?
      the_airbnb.save
      redirect_to("/airbnbs", { :notice => "Airbnb created successfully." })
    else
      redirect_to("/airbnbs", { :notice => "Airbnb failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_airbnb = Airbnb.where({ :id => the_id }).at(0)

    the_airbnb.location = params.fetch("query_location")
    the_airbnb.price = params.fetch("query_price")
    the_airbnb.website = params.fetch("query_website")
    the_airbnb.photo = params.fetch("query_photo")

    if the_airbnb.valid?
      the_airbnb.save
      redirect_to("/airbnbs/#{the_airbnb.id}", { :notice => "Airbnb updated successfully."} )
    else
      redirect_to("/airbnbs/#{the_airbnb.id}", { :alert => "Airbnb failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_airbnb = Airbnb.where({ :id => the_id }).at(0)

    the_airbnb.destroy

    redirect_to("/airbnbs", { :notice => "Airbnb deleted successfully."} )
  end
end
