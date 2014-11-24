class BookClubsController < ApplicationController

  # The default BookClub page renders all
  # created BookClubs in a list
  def index
    #@book_clubs = Bookclub.all
  end
 
  # Creates a new BookClub
  def new
    #@book_club = Bookclub.new
  end
  
  # Show a BookClub by :id
  def show
    #@book_club = BookClub.find(params[:id])
  end
  
  # Creates and saves a new BookClub
  def create
   # @book_club = BookClub.new(params)
   # if @book_club.save
   #   flash[:success] = "Bookclub created!"
  #    redirect_to @book_club
  #  else
  #    render 'new'
  #  end
  end
end
