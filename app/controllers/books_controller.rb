class BooksController < ApplicationController
  helper_method :sort_column, :sort_direction


  def index
    @books = Book.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @subject = Subject.find(@book.subject_id)
  end

  def new
    @book = Book.new
    @subjects = Subject.find(:all, :order => 'subject_name')

    #respond_to do |format|
     # format.html # new.html.erb
      #format.xml  { render :xml => @book }
    #end
  end


  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.find(:all, :order => 'subject_name')
  end


  def create
    @book = Book.new(params[:book])
    @subjects = Subject.find(:all, :order => 'subject_name')

   #respond_to do |format|
      if @book.save
       flash[:notice] = "Book was successfully added."
       redirect_to @book
       #format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
       #format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        render :action => 'new'
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    #end
  end


  def update
    @book = Book.find(params[:id])

    #respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = "Book was successfully added."
        redirect_to @book
        #format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        #format.xml  { head :ok }
      else
        render :action => 'edit'
        #format.html { render :action => "edit" }
        #format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
   # end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    flash[:notice] = "Successfully removed the book from the list."
    redirect_to book_url
    #respond_to do |format|
    #  format.html { redirect_to(books_url) }
    #  format.xml  { head :ok }
    #end
  end

  private

  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

