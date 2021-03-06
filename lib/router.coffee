
Router.configure
	layoutTemplate: "layout",
	loadingTemplate: "loading",
	waitOn: -> Meteor.subscribe "posts"#,"Tom Coleman"


Router.map -> 
	@route "postsList", path:"/"
	@route "postPage", {path: "/posts/:_id", data: -> Posts.findOne @params._id}
	@route "postEdit", {path: "/posts/:_id/edit", data: -> Posts.findOne @params._id}
	@route "postSubmit", {path:"/submit"}


requireLogin = (pause) -> 
	if !Meteor.user()
		if Meteor.loggingIn()
			@render @loadingTemplate
		else
			@render "accessDenied"
			pause()


Router.onBeforeAction "loading"
Router.onBeforeAction requireLogin, {only: "postSubmit"}