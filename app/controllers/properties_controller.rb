class PropertiesController < ApplicationController
	before_action :set_property, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, :except => [:index]

	# GET /articles
  	# GET /articles.json
	def index
		@items_per_page = 100
	    @latest_properties = Property.all_sort_by_date_skip_first
	    @locations = Property.locations
		@properties = Property.order_and_paginated(params[:page], @items_per_page)
		
	end

	def new
		@property = Property.new
		authorize @property
	end

	def create
		@property = Property.new(property_params)
		authorize @property

		if @property.save
			redirect_to @property, alert: "Property offer succesfully created"
		else
			render new_property_path, alert: "Oops!, please try again!"
		end
	end

	def edit
		authorize @property
	end

	def update
		authorize @property
		@property.update(property_params)
		redirect_to @property, alert: "Property offer succesfully updated"
	end

	def destroy
		authorize @property
		@property.destroy
		redirect_to root_path, alert: "Property offer succesfully deleted"
	end

	private
		def set_property
			@property = Property.find(params[:id])
		end

		def property_params
			params.require(:property).permit(:title, :description, :url, :location, :category_id, :owner_id)
		end

end
