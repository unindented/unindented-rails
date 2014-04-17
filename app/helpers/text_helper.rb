module TextHelper

  def host_text
    SETTINGS.host
  end

  def website_text
    SETTINGS.website
  end

  def author_text
    SETTINGS.author
  end

  def email_text
    SETTINGS.email
  end

  def twitter_text
    SETTINGS.twitter
  end

  def github_text
    SETTINGS.github
  end

  def title_text
    t(:title, website: website_text)
  end

  def subtitle_text
    t(:subtitle, author: author_text)
  end

  def copyright_text
    t('shared.page_meta.copyright',
      author:  author_text,
      license: t('shared.page_meta.license')
    )
  end

end
