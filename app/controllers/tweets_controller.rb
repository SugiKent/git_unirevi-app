class TweetsController < ApplicationController
    def index
        @tweets =Tweet.where(id: 1..335).page(params[:page]).per(40)
        @tuesday =Tweet.where(id: 336..694).page(params[:page]).per(40)
        @wednesday =Tweet.where(id: 696..909).page(params[:page]).per(40)
        @thursday =Tweet.where(id: 911..1331).page(params[:page]).per(50)
        @friday =Tweet.where(id: 1333..1646).page(params[:page]).per(40)
        @staurday =Tweet.where(id: 1647..1661).page(params[:page]).per(40)
        
    end
    def show
        @tweet =Tweet.find(params[:id])
    end
    
     before_action :ranking
  def ranking
    tweet_ids = Review.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    @ranking = tweet_ids.map {|id| Tweet.find(id) }
  end
end
