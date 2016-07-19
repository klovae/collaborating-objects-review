class Author
  attr_accessor :name

  def initialize
    @stories = [] #has many stories interface
  end

  def stories
    @stories.dup.freeze #has many stories interface
  end

  def add_story(story) #has many stories interface
    raise AssociationTypeMismatchError, "#{story.class} received, Story expected." if !story.is_a?(Story)
    @stories << story
    story.author = self unless story.author == self
  end

  def build_story(name)
    story = Story.new
    story.name = name
    add_story(story)
  end

  def bibliography
    self.stories.collect{|s| s.name}
  end

  def categories #has many categories through stories interface
    self.stories.collect{|s| s.category}.uniq
  end

end
