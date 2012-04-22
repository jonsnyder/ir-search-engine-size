class CollectedMatchesController < ApplicationController
  # GET /collected_matches
  # GET /collected_matches.json
  def index
    @collected_matches = CollectedMatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collected_matches }
    end
  end

  # GET /collected_matches/1
  # GET /collected_matches/1.json
  def show
    @collected_match = CollectedMatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collected_match }
    end
  end

  # GET /collected_matches/new
  # GET /collected_matches/new.json
  def new
    @collected_match = CollectedMatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collected_match }
    end
  end

  # GET /collected_matches/1/edit
  def edit
    @collected_match = CollectedMatch.find(params[:id])
  end

  # POST /collected_matches
  # POST /collected_matches.json
  def create
    @collected_match = CollectedMatch.new(params[:collected_match])

    respond_to do |format|
      if @collected_match.save
        format.html { redirect_to @collected_match, notice: 'Collected match was successfully created.' }
        format.json { render json: @collected_match, status: :created, location: @collected_match }
      else
        format.html { render action: "new" }
        format.json { render json: @collected_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collected_matches/1
  # PUT /collected_matches/1.json
  def update
    @collected_match = CollectedMatch.find(params[:id])

    respond_to do |format|
      if @collected_match.update_attributes(params[:collected_match])
        format.html { redirect_to @collected_match, notice: 'Collected match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collected_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collected_matches/1
  # DELETE /collected_matches/1.json
  def destroy
    @collected_match = CollectedMatch.find(params[:id])
    @collected_match.destroy

    respond_to do |format|
      format.html { redirect_to collected_matches_url }
      format.json { head :no_content }
    end
  end
end
