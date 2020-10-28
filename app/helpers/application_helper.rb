module ApplicationHelper

	def generate_page_title(title)
		title ? "#{title} - #{ENV['APP_NAME']}" : "#{ENV['APP_NAME']} - #{ENV['APP_DESCRIPTION']}"
	end
end
