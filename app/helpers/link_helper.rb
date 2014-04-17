module LinkHelper

  def email_link(text = email_text, opts = {})
    link_to(text, email_url(email_text, opts))
  end

  def github_link(text = "@#{github_text}", opts = {})
    link_to(text, github_url(github_text, opts))
  end

  def twitter_link(text = "@#{twitter_text}", opts = {})
    link_to(text, twitter_url(twitter_text, opts))
  end

  def tweet_link(text = "@#{twitter_text}", opts = {})
    link_to(text, tweet_url(opts))
  end

end
