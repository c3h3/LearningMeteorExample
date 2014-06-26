Template.postItem.helpers
	ownPost: ->
		@userId == Meteor.userId()

	domain: -> 
		a = document.createElement "a"
		a.href = @url
		a.hostname
	
	userId: ->
		@userId	

	MuserId: ->
		Meteor.userId()	

	ABC: ->
		@_id