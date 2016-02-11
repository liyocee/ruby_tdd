require "spec_helper"

describe "Book Test Suite" do
    before :each do
        @book = Book.new("Title", "Author", :category)
    end

    describe "#new" do
        it "takes three parameters and returns a book object" do
            @book.should be_an_instance_of Book
        end
    end

    describe "#title" do
        it "returns the correct title" do
            @book.title.should eql "Title"
        end
    end

    describe "#category" do
        it "returns the correct category" do
            @book.category.should eql :category
        end
    end
end
