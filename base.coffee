

@Collection = new Meteor.Collection('collections')

@index = (col, name, type) ->
	[fields, options] = [{}, {}]
	fields[name]  = 1
	options[type] = 1
	col._ensureIndex(fields, options)

if Meteor.isServer
	Collection.remove({})
	false

class Definer

	string: (name) -> console.log name

# @definer = ->
	# string = (name) -> console.log name

@_model = {}

@model = (name, def) ->
	# getter
	unless def
		_def = Collection.findOne(name: name).def
		return @_model[name] ||= _(new Meteor.Collection(name)).extend(def: _def)

	# setter
	Collection.insert name: name, def: def



if Meteor.isServer
	model 'posts',
		# remove fields leave direct types, validations and callbacks
		string:
			'title'
			'body'
		before:
			save: [
				'title.length < 150'
			]

		

	model 'settings', {}