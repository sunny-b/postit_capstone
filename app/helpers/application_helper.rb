module ApplicationHelper
  def fix_url(url)
    return url if /^https?:\/\//.match url

    "http://#{url}"
  end

  def datetime(dt)
    dt.strftime("%b %d, %Y %I:%M %p %Z")
  end
end
