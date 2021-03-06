(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);

	app.factory("User", function($resource) {
		return $resource("http://vanderloo.sqrawler.com/api/users/:id.json");
	});

	app.controller('UserController', function(User) { 
        // add your user code below

	this.hello = "Hello, world";
	this.u = User.get({id:1});
	this.feed = feed;	

	// add your user code above	
	});


        // add your form controller below

	app.controller("UpdateFormController", function() {
		this.data = {};
		this.updateUser = function(user) {
			user.u.name = this.data.name;
			this.data = {}; //clears the form
		}
	});

        // add your form controller above

	// mock data
        var u1 = {
          id: 1,
          name: "Jane Doe",
          email: "jane@doe.com",
          blurb: "Sometimes I feel anonymous."
	};	

        var u2 = {
          id: 2,
	  name: "Bob Smith",
	  email: "bob@smith.org"
	};

       var feed = [
         {
	   id: 3,
           user_id: 2,
           body: "This is Bob's most recent splatt.",
	   created_at: "2014-08-17T22:00:00Z"
	 },
         {
	   id: 2,
           user_id: 2,
           body: "This is Bob's second splatt.",
	   created_at: "2014-08-16T13:25:00Z"
         },
         {
	   id: 1,
           user_id: 2,
           body: "This is Bob's first splatt.",
	   created_at: "2014-08-16T10:25:00Z"
	 }
       ];
})();
