class EnginesController < ApplicationController
  # GET /engines
  # GET /engines.json
  def index
    @engines = Engine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @engines }
    end
  end

  # GET /engines/1
  # GET /engines/1.json
  def show
    @engine = Engine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @engine }
    end
  end

  # GET /engines/new
  # GET /engines/new.json
  def new
    @engine = Engine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @engine }
    end
  end

  # GET /engines/1/edit
  def edit
    @engine = Engine.find(params[:id])
  end

  # POST /engines
  # POST /engines.json
  def create
    @engine = Engine.new(params[:engine])

    respond_to do |format|
      if @engine.save
        format.html { redirect_to @engine, notice: 'Engine was successfully created.' }
        format.json { render json: @engine, status: :created, location: @engine }
      else
        format.html { render action: "new" }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /engines/1
  # PUT /engines/1.json
  def update
    @engine = Engine.find(params[:id])

    respond_to do |format|
      if @engine.update_attributes(params[:engine])
        format.html { redirect_to @engine, notice: 'Engine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engines/1
  # DELETE /engines/1.json
  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy

    respond_to do |format|
      format.html { redirect_to engines_url }
      format.json { head :no_content }
    end
  end
end
