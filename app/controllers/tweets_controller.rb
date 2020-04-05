# インデントが整っていない

class TweetsController < ApplicationController
    before_action :authenticate_user!, only: :show
    def index
        # whereでid指定するのは厳しい
        # 拡張性に乏しく、例えば授業が増えてTweetのidが変わった時に全部書き換えないといけない
        # できれば、Tweet modelにdayのカラムを追加して .where(day: 0) みたいにしたい
        # せめてこのwhere句をmodelのscopeにまとめたい
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

    # そもそもTweet（授業だよね？）を削除する時ってあるのだろうか
   def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      # destroy成功時の処理がない
     tweet.destroy
   end
 end

#  これは一番上がいい
 before_action :ranking
  def ranking
    # reviews_controllerでの指摘と同じ
    tweet_ids = Review.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    @ranking = tweet_ids.map {|id| Tweet.find(id) }
  end
end
