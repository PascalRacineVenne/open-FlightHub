#namespace inside of a module matches the routes!
# module Api
#   module V1
    class AirlinesController < ApplicationController
      # before_action :set_airline, only: [:show, :update, :destroy]

      def index
        airlines = Airline.all
        # Pass the value to the AirlineSerializer
        render json: serializer(airlines, options)
      end

      def show
        airline =  Airline.find_by(slug: params[:slug])
        render json: serializer(airline, options)
      end

      def create
        airline = Airline.new(airline_params)
        if airline.save
          render json: serializer(airline)
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end

      def update
        airline = Airline.find_by(slug: params[:slug])
        if airline.update
          render json: serializer(@airline, options)
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end

      def destroy
        airline =  Airline.find_by(slug: params[:slug])
        if airline.destroy
          head :no_content
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end

      private

      def airline_params
        params.require(airline).permit(:name, "image_url")        
      end

      def serializer(records, options = {})
        AirlineSerializer.new(records, options).serialized_json
      end

      def options
        # Include associated review data to our Airline JSON payload, compound document: optional options{} as a 2nd argument.
        # ||= if value on the left is false or nil it will assign the value on the right to the variable.
        # %i array of symbols
        @options ||= { include: [:reviews]} 
      end
    end
#   end
# end