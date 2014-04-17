module UrlHelper

  def absolute_url(path, opts = {})
    url_with_params("#{host_text}#{path}", opts)
  end

  def current_url(opts = {})
    url_with_params("#{host_text}#{request.original_fullpath}", opts)
  end

  def email_url(email = email_text, opts = {})
    url_with_params("mailto:#{email}", opts)
  end

  def github_url(handle = github_text, opts = {})
    url_with_params("https://github.com/#{handle}", opts)
  end

  def twitter_url(handle = twitter_text, opts = {})
    url_with_params("https://twitter.com/#{handle}", opts)
  end

  def tweet_url(opts = {})
    url_with_params("https://twitter.com/intent/tweet", opts)
  end

  private

  def url_with_params(url, opts = {})
    "#{url}#{opts.present? ? "?#{opts.to_query}" : ''}"
  end

end
