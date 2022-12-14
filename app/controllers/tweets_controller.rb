class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      # 一覧画面へ遷移して"入力設定が完了しました！"とメッセージを表示します。
      redirect_to tweets_path, notice: "入力設定が完了しました！"
      NoticeMailer.sendmail_tweet(@tweet).deliver
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
    redirect_to tweets_path, notice: "更新が完了しました！"
  end
 
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"
  end

  private
   def tweet_params
    params.require(:tweet).permit(:content)
   end

   def set_tweet
    @tweet = Tweet.find(params[:id])
   end

 end
