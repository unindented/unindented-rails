module ScriptHelper

  def webfonts_script_tag
    config = content_tag(:script) do
      %Q{
      var WebFontConfig = #{webfonts_config};
      }.html_safe
    end
    library = javascript_include_tag(webfonts_url, async: true)
    (config + library).html_safe
  end

  def mathjax_script_tag
    config = content_tag(:script, type: 'text/x-mathjax-config') do
      %Q{
      MathJax.Hub.Config(#{mathjax_config});
      }.html_safe
    end
    library = javascript_include_tag(mathjax_url, async: true)
    (config + library).html_safe
  end

  def fixurl_script_tag
    config = content_tag(:script) do
      %Q{
      var GOOG_FIXURL_LANG = (navigator.language || '').slice(0, 2);
      var GOOG_FIXURL_SITE = location.host;
      }.html_safe
    end
    library = javascript_include_tag(fixurl_url)
    (config + library).html_safe
  end

  def tagman_noscript_tag
    content_tag(:noscript) do
      content_tag(:iframe, {
        src:    tagman_url_nojs(tagman_id),
        height: 0,
        width:  0,
        style:  'display: none; visibility: hidden;'
      }) {}
    end
  end

  def tagman_script_tag
    config = content_tag(:script) do
      %Q{
      var dataLayer = [{ 'gtm.start': new Date().getTime(), event: 'gtm.js' }];
      }.html_safe
    end
    library = javascript_include_tag(tagman_url_js(tagman_id), async: true)
    (config + library).html_safe
  end

  private

  def webfonts_config
    webfonts_config_process(SETTINGS.webfonts.config_as_a_hash).to_json
  end

  def webfonts_config_process(config)
    config.reduce({}) do |memo, (k, v)|
      memo[k] = if k == 'families'
        v.map { |family, styles| "#{family}:#{styles.join(',')}" } 
      else
        webfonts_config_process(v)
      end
      memo
    end
  end

  def webfonts_url
    SETTINGS.webfonts.url
  end

  def mathjax_config
    mathjax_config_process(SETTINGS.mathjax.config_as_a_hash).to_json
  end

  def mathjax_config_process(config)
    config.deep_transform_keys { |k| k.camelize(:lower) }
  end

  def mathjax_url
    SETTINGS.mathjax.url
  end

  def fixurl_url
    SETTINGS.fixurl.url
  end

  def tagman_url_nojs(id)
    "#{SETTINGS.tagman.url_nojs}?id=#{id}"
  end

  def tagman_url_js(id)
    "#{SETTINGS.tagman.url_js}?id=#{id}"
  end

  def tagman_id
    SETTINGS.tagman.id
  end

end
