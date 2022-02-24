#namespace inside of a module matches the routes!
module api
  module V1
    class AirlinesController < ApllicationController
      before_action :set_airline, only: [:show, :update, :destroy]
      def index
        airlines = Airlines.all
        # Pass the value to the AirlineSerializer
        render json: AirlineSerializer.new(airlines, options).serialized_json
      end

      def show
        render json: AirlineSerializer.new(airline, options).serialized_json
      end

      def create
        airline = Airline.new(airline_params)
        if airline.save
          render json: AirlineSerializer.new(airline).serialized_json
        else
          render :json {error: airline.errors.messages}, status: 422
        end
      end

      def update
        if airline.update
          render json: AirlineSerializer.new(airline, options).serialized_json
        else
          render :json {error: airline.errors.messages}, status: 422
        end
      end

      def destroy
        if airline.destroy
          head :no_content
        else
          render :json {error: airline.errors.messages}, status: 422
        end
      end

      private

      def airline_params
        params.require(airline).permit(:name, "image_url")        
      end

      def set_airline
        airline =  Airline.find_by(slug: params[:slug])
      end

      def options
        # Include associated review data to our Airline JSON payload, compound document: optional options{} as a 2nd argument.
        # ||= if value on the left is false or nil it will assign the value on the right to the variable.
        # %i array of symbols
        @options ||= { include: %i[:reviews]} 
      end
    end
  end
end