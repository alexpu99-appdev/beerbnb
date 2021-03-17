class BarsController < ApplicationController
  def index
    matching_bars = Bar.all

    @list_of_bars = matching_bars.order({ :created_at => :desc })

    render({ :template => "bars/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bars = Bar.where({ :id => the_id })

    @the_bar = matching_bars.at(0)

    render({ :template => "bars/show.html.erb" })
  end

  def create
    the_bar = Bar.new
    the_bar.photo = params.fetch("query_photo")
    the_bar.website = params.fetch("query_website")
    the_bar.location = params.fetch("query_location")
    the_bar.name = params.fetch("query_name")

    if the_bar.valid?
      the_bar.save
      redirect_to("/bars", { :notice => "Bar created successfully." })
    else
      redirect_to("/bars", { :notice => "Bar failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bar = Bar.where({ :id => the_id }).at(0)

    the_bar.photo = params.fetch("query_photo")
    the_bar.website = params.fetch("query_website")
    the_bar.location = params.fetch("query_location")
    the_bar.name = params.fetch("query_name")

    if the_bar.valid?
      the_bar.save
      redirect_to("/bars/#{the_bar.id}", { :notice => "Bar updated successfully."} )
    else
      redirect_to("/bars/#{the_bar.id}", { :alert => "Bar failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bar = Bar.where({ :id => the_id }).at(0)

    the_bar.destroy

    redirect_to("/bars", { :notice => "Bar deleted successfully."} )
  end
end
