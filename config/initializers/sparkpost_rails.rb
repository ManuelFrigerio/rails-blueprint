SparkPostRails.configure do |c|
  c.api_key = ENV['SPARKPOST_API_KEY']
  c.sandbox = false                               # default: false
  c.track_opens = true                            # default: false
  c.track_clicks = true                           # default: false
  c.transactional = true                          # default: false
  c.inline_css = true                             # default: false
  c.html_content_only = true                      # default: false
end