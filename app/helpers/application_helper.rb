module ApplicationHelper
	def pluralize_without_count(count, singular, plural=nil)
		(count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize)
	end

	def set_title(title)
		content_for :title, title.concat(' | Tiny Vessel')
	end
end
