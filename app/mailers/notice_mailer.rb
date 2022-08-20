class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_tweet.subject
  #
  def sendmail_tweet(tweet)
    @tweet = tweet 

    mail to: "test@test.com",
    subject: '【TweetApp】お知らせです。'
  end
end
