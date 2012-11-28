class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.json

  def index
    ratingSize = Rating.count

    @rating1 = Rating.first(:conditions => ["id = ?", rand(ratingSize-1) +1])
    @rating2 = Rating.first(:conditions => ["id = ?", rand(ratingSize-1) +1])
    while @rating2.pic_url==@rating1.pic_url
      @rating2 = Rating.first(:conditions => ["id = ?", rand(ratingSize-1)+1])
    end
    #@rating1 = Rating.limit(1)
    #@rating2 = Rating.limit(1)
    while @rating2.id==@rating1.id
      @rating2 = Rating.order("RAND()").first
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rating1, :json => @rating2 }
    end
  end


  def list

    @pics = Rating.order('rating desc')

    respond_to do |format|
      format.html # list.html.erb
      format.json { render :json => @pics }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.json
  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, :notice => 'Rating was successfully created.' }
        format.json { render :json => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.json
  def update

    # reset all pics ratings
    # Rating.update_all("rating= 1400.0", nil)
    #to do - handle errors
    if (params[:pic_won].present?)
      #http://gobase.org/studying/articles/elo/
      pic_won = Rating.first(:conditions => ["id = ?", params[:pic_won]])
      pic_lost = Rating.first(:conditions => ["id = ?", params[:pic_lost]])
      c = 30
      p = 1/(1 + 10**((pic_lost.rating - pic_won.rating)/400))
      points = (c*p).round(0)
      pic_won_new_rating = pic_won.rating + points
      pic_lost_new_rating = pic_lost.rating - points


      respond_to do |format|
        if pic_won.update_attribute(:rating, pic_won_new_rating) and
            pic_lost.update_attribute(:rating, pic_lost_new_rating) and
            format.html { redirect_to ratings_url, :notice => 'Rating was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => pic_won.errors, :status => :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to rating_url }
      format.json { head :no_content }
    end
  end

end
