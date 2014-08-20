json.splatts @feed do |splatt|
	json.name splatt.name
	json.posted splatt.created_at.strftime("Splatted on %A, %d %b %Y %I:%M %p")
	json.splatt splatt.body
end
