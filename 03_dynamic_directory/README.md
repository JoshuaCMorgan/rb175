# Code Challenge: Dynamic Directory Index

## Instructions
In this code challenge, you'll be given a list of requirements. The goal is to create a Sinatra application that satisfies these requirements using what we've covered so far in this course.

Sinatra will, by default, serve any file placed in a public directory that lives in the same directory as the Sinatra application. You can try this out by putting an image or any other file in that directory and then attempting to access it through your application.
Requirements

- When a user visits the root path, /, they should be presented with a listing of all of the files in the public directory. The listing for a file should only display the file's name and not the names of any directories.
- When a user clicks one of the filenames in the list, they should be taken directly to that file. Take advantage of Sinatra's built-in serving of the public directory.
- Create at least 5 files in the public directory to test the listing page.
- Add a parameter that controls the sort order of the files on the page. They should be sorted in an ascending (A-Z) order by default, or descending (Z-A) if the parameter has a certain value.
- Display a link to reverse the order. The text of the link should reflect the order that will be displayed if it is clicked: "Sort ascending" or "Sort descending".


## Steps I took
- Create gemfile in root directory that holds our gems: 
  - include source
  - include gems:
    - sinatra
    - sinatra-contrib
    - erubis
- Bundle gems/install dependencies:
  - run `bundle install` on the command line in the root
  - this will create our Gemfile.lock file
- create Ruby file where Sinatra will handle routing
  - `server.rb`
  - put in root directory
- create public directory with 5 files
  - Sinantra will check the 'public' file if given text-based file and serve it.
- In `server.rb` create method that will get a listing of all files within a given directory.
  - looks like we need to sort the files, even though the files are in numeric order in the file.
```ruby 
files = Dir.glob("*", base: "public").sort
```
- present clickable list of the files to the user that displays the content.
  - We need to have the method return only one object.
  - `map` method will give us the strings in one array object.
  - Rack will take any object that responds to `#each` method. So, this is our best option.
  ```ruby
  get '/' do
    files = Dir.glob("*", base: "public").sort
    files.map do |file|
      "<a href='#{file}'> #{file}</a><br>"
    end
  end
   ```  
- Add a paramater, only for decending order.
  - I suspect this means that we add URL paramaters and not method parameters. Sinatra works with URL parameters.
  - So, I suspect this means we will request something like: `http://localhost/4567/?sort=descending`
  - Sinatra documentation says that "Routes may also utilize query parameters". Following the example, we can produce something like:
  ```ruby
  get '/' do
    files = Dir.glob("*", base: "public").sort

    param = params['sort']
    files.reverse! if param == 'decending'

    files.map do |file|
      "<a href='#{file}'> #{file}</a><br>"
    end
  end
  ```
- Create a dynamic link that lets the user reverse the current order of the list.  The link should tell the user the type of ordering that will occur if link is pushed.
  - Ok.  since we have to create a dynamic link, that means we need html, which means we need ERB
  - We create a "views" folder and put a created `erb` file in there. and put some simple HTML
  - next, a simple necessary step will be to put `erb` method call and argument with HTML file name into the route.
    - since our file is called `index.erb`, the method call will be  `erb(:index)`.
  - We can trasnfer our method to produce linked list of each file to the HTML.
    - We will need to tranpose the syntax to meet ERB standard.

```ruby
<ul>
    <% @files.each do |file|  %>
      <li><a href="<%= file %>"><%= file %></a></li>
    <% end %>
</ul>
```
  - Now, we need to create a way for the user to switch between ascending and descending.  
    - We can use the URL for this. The link will just switch between two paths.

```ruby
<p>Would you like to reverse the order?</p>
    <% if @param == "descending" %>
      <a href="/">Sort ascending</a>
      <% else %>
      <a href="?sort=descending">Sort descending</a>
    <% end %><p>Would you like to reverse the order?</p>
    <% if @param == "descending" %>
      <a href="/">Sort ascending</a>
      <% else %>
      <a href="?sort=descending">Sort descending</a>
    <% end %>
```

