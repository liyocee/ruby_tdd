require "spec_helper"

describe "Library Test suite" do
    before :all do
        lib_obj = [
            Book.new("Js:Goood Parts", "Douglas Coukford", :programming),
            Book.new("Don't make me think", "Steve Krug", :usability),
            Book.new("Js Patterns", "Stoyan Steve", :design)
        ]
        File.open("books.yml", "w") do |f|
            f.write(YAML::dump(lib_obj))
        end
    end

    before :each do
        @lib = Library.new("books.yml")
    end

    describe "#new" do
        context "with no parameters" do
            it "has no books" do
                lib = Library.new
                lib.books.length.should == 0
            end
        end

        context "with a yaml file parameter" do
            it "has 3 books" do
                @lib.books.length.should == 3
            end
        end
    end

    it "should return all the books in a particular category" do
        @lib.get_books_in_category(:programming).length.should == 1
    end

    it "should accept new books" do
        @lib.add_book(Book.new("Design for the web", "Mark", :design))
        @lib.get_book("Design for the web").should be_an_instance_of Book
    end
end
