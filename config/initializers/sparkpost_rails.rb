SparkPostRails.configure do |c|
  c.api_key = 'YOUR API KEY'
  c.sandbox = true                                # default: false
  c.track_opens = true                            # default: false
  c.track_clicks = true                           # default: false
  c.transactional = true                          # default: false
  c.inline_css = true                             # default: false
  c.html_content_only = true                      # default: false
  c.subaccount = "123"                            # default: nil
end