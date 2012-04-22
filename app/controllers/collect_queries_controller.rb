class CollectQueriesController < ApplicationController
  # GET /collect_queries
  # GET /collect_queries.json
  def index
    @collect_queries = CollectQuery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collect_queries }
    end
  end

  # GET /collect_queries/1
  # GET /collect_queries/1.json
  def show
    @collect_query = CollectQuery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collect_query }
    end
  end

  # GET /collect_queries/new
  # GET /collect_queries/new.json
  def new
    @collect_query = CollectQuery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collect_query }
    end
  end

  # GET /collect_queries/1/edit
  def edit
    @collect_query = CollectQuery.find(params[:id])
  end

  # POST /collect_queries
  # POST /collect_queries.json
  def create
    @collect_query = CollectQuery.new(params[:collect_query])

    respond_to do |format|
      if @collect_query.save
        format.html { redirect_to @collect_query, notice: 'Collect query was successfully created.' }
        format.json { render json: @collect_query, status: :created, location: @collect_query }
      else
        format.html { render action: "new" }
        format.json { render json: @collect_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collect_queries/1
  # PUT /collect_queries/1.json
  def update
    @collect_query = CollectQuery.find(params[:id])

    respond_to do |format|
      if @collect_query.update_attributes(params[:collect_query])
        format.html { redirect_to @collect_query, notice: 'Collect query was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collect_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collect_queries/1
  # DELETE /collect_queries/1.json
  def destroy
    @collect_query = CollectQuery.find(params[:id])
    @collect_query.destroy

    respond_to do |format|
      format.html { redirect_to collect_queries_url }
      format.json { head :no_content }
    end
  end
end
