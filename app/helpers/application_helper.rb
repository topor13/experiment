module ApplicationHelper
	def title()
	content_for :title, page_title.to_s
	end
end
