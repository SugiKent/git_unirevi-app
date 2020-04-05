# インデントが整っていない

class ReviewsController < ApplicationController
    #  これは全てのactionの上（class ReviewsController の下に書く）
     before_action :ranking
    #  Reviewのeditはなくてよい？
    def new
        @tweet = Tweet.find(params[:tweet_id])
        @review = Review.new
    end
    def create
        # 保存成功時・失敗時の処理が書かれていない
        Review.create(create_params)

        @review = Review.new(review_porams)
        if @review.save
            # 成功時の処理
            # 大体redirectとflashのセット
        else
            # 失敗時の処理
            # 大体 render :new とflashのセット
        end
    end

    # 複数のcontrollerで実行するのならapplication_controllerに書くのでも良さそう
    # 定義はapplication_controllerでだけ書いておけば、ApplicationControllerを継承している全てのcontrollerクラスで before_action :ranking で呼び出せる
    # ApplicationControllerが肥大化しすぎる問題はあるが、それはまたその時考えればよい
  def ranking
    tweet_ids = Review.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    # N+1を引き起こすコード
    # rankingという変数名も中身を想像しづらいので、@tweetsの方がいい
    @ranking = tweet_ids.map {|id| Tweet.find(id) }

    # これでいいんじゃないかなー
    @tweets = Tweet.joins(:reviews).group(:tweet_id).order('count(tweet_id) desc').limit(10)
end

    private
    # rails way的にはreview_paramsの方がいいかな
    def create_params
        params.require(:review).permit(:rate, :score, :review).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
    end

end
