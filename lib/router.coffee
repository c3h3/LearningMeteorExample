
Router.configure
	layoutTemplate: "layout",
	loadingTemplate: "loading",
	waitOn: -> Meteor.subscribe "posts","Tom Coleman"


Router.map -> 
	@route "postsList", path:"/"
	@route "postPage", {path: "/posts/:_id", data: -> Posts.findOne @params._id}

Router.onBeforeAction "loading"