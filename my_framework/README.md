# Growing a web development framework on Rack
## Purpose
- how Rack is used to create an application
- and how to build up a framework.
  - give a mental model of how frameworks are built.

## Views Folder
- includes ERB view templates for the information we wish to display to the user.
- We have isolated our view related code to a views directory, so that its out of our main application code. 
- Static Page
  - [`index.erb`](views/index.erb) is the default view template for our introduction to ERB application.
  - This simply displays Hello World! to the client in the browser.
  - Then we have a ["not found"](views/not_found.erb) page that outputs error message.
- Dynamic Page
  - We have ["advice"](views/advice.erb) page ([code](advice.rb)) that contains dynamic content, which outputs some good advice when page is loaded/reloaded.

## Minimal Framework Creation: Monroe
- We created a small framework, [Monroe](monroe.rb), to hold the common methods that we may want to use between different web applications. In other words, we extracted some general purpose methods to a framework.
- `response` and `erb` methods are good examples what entails a framework--common methods used throughout web apps.

## RESULT:
- Rack application that focuses solely on handling the request and creating and returning a response. 
- Anything more general purpose has been moved to our framework, [monroe.rb](monroe.rb). 
- This separation of responsibilities keeps things easier to manage. It also help future-proof our application as well.