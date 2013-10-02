class ReviewsController < ApplicationController
  #before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_review, only: [:destroy]

  # This controller manages the Review database

  # GET /reviews
  # GET /reviews.json
  #def index
  #  @reviews = Review.all
  #end

  # GET /reviews/1
  # GET /reviews/1.json
  #def show
  #end

  # GET /reviews/new
  #def new
  #  @review = Review.new
  #end

  # GET /reviews/1/edit
  #def edit
  #end

  # POST /reviews
  # POST /reviews.json
  def create
    # nested routes created :topic_id to access the correct topic
    @topic = Topic.find(params[:topic_id])
    # originally had @review =@topic.reviews.create(params[:review]) but that keep getting errors??
    @review = @topic.reviews.create(title: params[:review][:title], author: params[:review][:author], content: params[:review][:content], rating: params[:review][:rating])
    # update the rating average for the topic
    @topic.avg_rating = @topic.reviews.average(:rating)
    # save into database
    @topic.save
    # puts "this is topic reviews average rating #{@topic.reviews.average(:rating)}"
    redirect_to idea_path(@topic)

  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
 # def update
 #   respond_to do |format|
 #     if @review.update(review_params)
 #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
 #       format.json { head :no_content }
 #     else
 #       format.html { render action: 'edit' }
 #       format.json { render json: @review.errors, status: :unprocessable_entity }
 #     end
 #   end
 # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @topic = Topic.find(params[:topic_id])
    @review = @topic.reviews.find(params[:id])
    @review.destroy
    redirect_to idea_path(@topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :author, :content, :rating, :topic_id)
    end

end
