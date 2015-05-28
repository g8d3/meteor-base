# self = this

# route = (from, to, options = {}) ->
# 	Router.route from, ->
# 		@render to, options

# route '/', 'home'

Router.route '/(.*)', (a,s,d) ->
	try
		@render new URL(a.url).pathname
	catch e
		@render a.url

