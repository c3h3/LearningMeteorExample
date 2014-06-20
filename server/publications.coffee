#Meteor.publish "posts", -> Posts.find()
Meteor.publish 'posts', (author) -> Posts.find author:author 
