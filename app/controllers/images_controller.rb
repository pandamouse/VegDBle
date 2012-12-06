class ImagesController < ApplicationController
  before_filter :load_imageable
  # GET /:imageable/:imageable_id/images
  # GET /:imageable/:imageable_id//images.json
  def index
    @images = @imageable.images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /:imageable/:imageable_id/images/1
  # GET /:imageable/:imageable_id/images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = @imageable.images.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = @imageable.images.create(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to :id => nil, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

private

  def load_imageable
    resource, id = request.path.split('/')[1,2]
    @imageable = resource.singularize.classify.constantize.find(id)
  end
  
  def find_imageable
    params.each do |name, value|
      $1.classify.constantize.find(value) if name =~ /(.+)_id$/
    end
  end
end
