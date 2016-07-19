class Story
  attr_accessor :name
  attr_reader :author #belongs to author interface

  def author=(author) #belongs to author interface
    raise AssociationTypeMismatchError, "#{author.class} received, Author expected." if !author.is_a?(Author)
    @author = author
    author.add_story(self) unless author.stories.include?(self)
  end

  attr_reader :category #belongs to author interface

  def category=(category) #belongs to author interface
    raise AssociationTypeMismatchError, "#{category.class} received, Category expected." if !category.is_a?(Category)
    @category = category
    category.add_story(self) unless category.stories.include?(self)
  end

  def build_author(name)
    story_author = Author.new
    story_author.name = name
    self.author = story_author
  end
end
