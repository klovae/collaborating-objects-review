describe Story do
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}
  let(:category){Category.new.tap{|c| c.name = "Fiction"}}
  let(:author){Author.new.tap{|a| a.name = "Ernest Hemingway"}}
  it 'has a name' do
    # Expectation
    expect(story.name). to eq("The Old Man and the Sea")
  end

  context 'with an author' do
    describe '#author=' do
      it 'can set an author' do
        story.author = author
        expect(story.author).to eq(author)
      end

      it 'throws an error if you assign anything besides an instance of Author' do
        expect{story.author = "Ernest Hemingway"}.to raise_error(AssociationTypeMismatchError)
      end

      it 'reciprocates the story into the authors stories collection' do
        story.author = author

        expect(author.stories).to include(story)
      end
    end

    describe '#build_author' do
      it "creates an author instance from a name and assigns the story to that author" do
        lighthouse = Story.new
        lighthouse.name = "To the Lighthouse"
        lighthouse.build_author("Virginia Woolf")

        expect(lighthouse.author.name).to eq("Virginia Woolf")
      end
    end
  end

  context 'with a category' do
    describe '#category=' do
      it 'can set an category' do
        story.category = category
        expect(story.category).to eq(category)
      end

      it 'throws an error if you assign anything besides an instance of Category' do
        expect{story.category = "Fiction"}.to raise_error(AssociationTypeMismatchError)
      end

      it "reciprocates the story into the category's stories collection" do
        story.category = category

        expect(category.stories).to include(story)
      end
    end
  end
end
