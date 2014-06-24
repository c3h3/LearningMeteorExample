@Posts = new Meteor.Collection "posts"

#@Posts.allow
#	insert: (userId, doc) -> !! userIds

Meteor.methods
	post: (postAttributes) ->
		user = Meteor.user()
		postWithSameLink = Posts.findOne url: postAttributes.url

		if !user
			throw new Meteor.Error 401, "You need to login to post new stories"

		if !postAttributes.title
			throw new MeteorError 422, "Please fill in a headline"

		if postAttributes.url && postWithSameLink
			throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

		post = _.extend _.pick(postAttributes,"url", "title", "message"),
			userIf: user._id
			author: user.username
			submitted: new Date().getTime()

		postId = Posts.insert post

		postId






