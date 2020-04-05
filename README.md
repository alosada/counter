# Counter

## Notes

### The method

For this application we'll go with a lean approach, where Version 1 will be a Minimum Viable Product and each iteration will add further features or stretch goals:
v1 - MVP: Test, Model, Auth, API routes.
v2 - UI: Simple UI, un-styled. StimulusJS.
v3 - Style: We'll add style to our mostly un-styled app.
v4 - OAuth: Add 1 OAuth
v5 - Add more OAth.

### The tools.

We'll try to avoid fishing with dynamite, and use lightweight tools:
-Back end will run on Sinatra with a minimum implementation of ActiveRecord
- Testing with rspec and Rack-Test 
-Authentication will relay on Bcrypt and JWT.
-FrontEnd will run on StimulusJS to enhance HTML and SCSS

### Date
2020/04/05

### Location of deployed application
Will update with heroic location tomorrow. Heroku tool belt is complaining about by Xcode being too old on my 6 year old machine :)

### Time spent
Started at: 2020/04/04 - 10:40 CST
Lunch Break started 2020/04/04 15:00 CST
Lunch Break Ended 2020/04/04 16:05 CST
6 Hour cut off: 2020/04/04 18:40 CST
Final push for v2 2020/04/04 19:29 CST
Finished at: Intend on putting more work on it, but not in master branch.

### Assumptions made
I’m assuming there is SSL encryption to keep data secure.
I’m assuming the token won’t need to expire

### Shortcuts/Compromises made

Aside from a few Sinatra template files, I purposely avoided shortcuts. In a rial-life scenario, if I needed to deploy something in 6 hours, I would have use RoR scaffold and probably Devise for the authentication and perhaps other gems.

### Stretch goals attempted
The plan was to attempt all stretch goals.
A single page UI is in place, although horrible looking :(

### Instructions to run assignment locally

to run the application run:
`rake db:create`
`date db:migrate`
and 
`rackup -p 4567`
to launch the server
the use your browser to navigate to
`http://localhost:4567/`

To run test run
`rake db:create`
`date db:migrate RACK_ENV=test`
and 
`rake spec`

### What did you not include in your solution that you want us to know about?
Were you short on time and not able to include something that you want us to know
about? Please list it here so that we know that you considered it.

### Other information about your submission that you feel it's important that we know if applicable.

This is my first time using StimulusJS. I wanted something light and that worked well with plain HTML, while avoiding full fledged frameworks. I ran into some snags and might have been mistaken, given the time constrains

In fact, should I have gone full Ruby On Rails Gemarggedon with generators, devise, etc; things would have move faster. 

### Your feedback on this technical challenge

I think this is a great challenge. Definitely goes after Real life scenarios rather than obscure algorithms. I enjoyed working on it.