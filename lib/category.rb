class Category
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
    story.category = self unless story.category == self
  end

  def authors #has many authors through stories interface
    self.stories.collect{|s| s.author}.uniq
  end
end
