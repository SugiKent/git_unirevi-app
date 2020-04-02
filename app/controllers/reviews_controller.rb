class ReviewsController < ApplicationController
    def new
        @tweet = Tweet.find(params[:tweet_id])
        @review = Review.new
    end
    def create
        Review.create(create_params)
    end
    
    private 
    def create_params
        params.require(:review).permit(:rate, :score, :review).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
    end
end
