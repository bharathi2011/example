class ToysController < ApplicationController
  # GET /toys
  # GET /toys.xml
  def index
    @toys = Toy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @toys }
    end
  end

  # GET /toys/1
  # GET /toys/1.xml
  def show
    @toy = Toy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @toy }
    end
  end

  # GET /toys/new
  # GET /toys/new.xml
  def new
    @toy = Toy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @toy }
    end
  end

  # GET /toys/1/edit
  def edit
    @toy = Toy.find(params[:id])
  end

  # POST /toys
  # POST /toys.xml
  def create
    @toy = Toy.new(params[:toy])

    respond_to do |format|
      if @toy.save
        format.html { redirect_to(@toy, :notice => 'Toy was successfully created.') }
        format.xml  { render :xml => @toy, :status => :created, :location => @toy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @toy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toys/1
  # PUT /toys/1.xml
  def update
    @toy = Toy.find(params[:id])

    respond_to do |format|
      if @toy.update_attributes(params[:toy])
        format.html { redirect_to(@toy, :notice => 'Toy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @toy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toys/1
  # DELETE /toys/1.xml
  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy

    respond_to do |format|
      format.html { redirect_to(toys_url) }
      format.xml  { head :ok }
    end
  end
end
