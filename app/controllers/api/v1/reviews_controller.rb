#namespace inside of a module matches the routes!
module api
  module V1
    class ReviewsController < ApllicationController
      def create
        review = Review.new(review_params)
        if review.save
          render json: ReviewSerializer.new(review).serialized_json
        else
          render json: {error: review.errors.messages}, status: 422
        end
      end

      def destroy
        review = Review.find_by(params[:id])
        if review.sdestroy
          head :no_content
        else
          render json: {error: review.errors.messages}, status: 422
        end
      end

      private

      def review_params
        params.require(:review).permit(:title, :description, :score, :airline_id)
      end
    end
  end
end