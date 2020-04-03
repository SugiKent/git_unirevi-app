class ReviewsController < ApplicationController
    def new
        @tweet = Tweet.find(params[:tweet_id])
        @review = Review.new
    end
    def create
        Review.create(create_params)
    end
    
    
     before_action :ranking
  def ranking
    tweet_ids = Review.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    @ranking = tweet_ids.map {|id| Tweet.find(id) }
  end
    
    private 
    def create_params
        params.require(:review).permit(:rate, :score, :review).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
    end
    
end
