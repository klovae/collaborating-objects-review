Built through an OO codealong with Avi

authors
  has many stories
  has many categories through stories

stories
  belongs to an author
  belongs to a category

categories
  has many stories
  has many authors through stories

hemingway = Author.new
hemingway.stories = [#<Story>, #<Story> ...]

CHALLENGE: COMPLETED

create
author.build_story("The Name")
story.build_author("New Author")
