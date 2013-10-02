module ApplicationHelper

  # pass links then build a list of HTML links - just to play around
  # older convention
	def outside_links_old (links)
		# key = URL, value = body
		html = "<ul>"
		links.each do |url, body|
			html += "<li><a href='#{url}'>#{body}</a></li>"
		end
		html += "</ul>"
		return html.html_safe
	end

  # newer convention
	def outside_links (links)
		# key = URL, value = body
		html = "<ul>"
		links.each do |url, body|
			html += "<li>" + link_to(body, url) + "</li>"
		end
		html += "</ul>"
		return html.html_safe
	end

  # this is for debugging purposes to print out params array for inspection
	def show_params
		html = "<div style = 'border:1px red solid; margin: 10px ; padding: 10px;'>"
		html += '<heading>Params</heading><br/>'
		params.each do |key, value|
			html += "#{key}: #{value} <br/>" if key != 'authenticity_token' && key != 'utf8'
		end
		html += '</div>'
		return html.html_safe
	end


end
