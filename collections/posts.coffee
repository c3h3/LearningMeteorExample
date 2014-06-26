@Posts = new Meteor.Collection "posts"

#@Posts.allow
#	insert: (userId, doc) -> !! userIds

Meteor.methods
	post: (postAttributes) ->
		user = Meteor.user()
		postWithSameLink = Posts.findOne url: postAttributes.url

		if not user
			throw new Meteor.Error 401, "You need to login to post new stories"

		if not postAttributes.title
			throw new MeteorError 422, "Please fill in a headline"

		if postAttributes.url && postWithSameLink
			throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

		post = _.extend _.pick(postAttributes,"url", "title", "message"),
			title: postAttributes.title + if @isSimulation then '(client)' else '(server)'
			userId: user._id
			author: user.profile.name
			submitted: new Date().getTime()

		if not @isSimulation
			console.log "[in not isSimulation]"
			Future = Npm.require "fibers/future"
			future = new Future()
			Meteor.setTimeout (-> future.return()), 5*1000
			future.wait()

		console.log post

		postId = Posts.insert post

		postId






