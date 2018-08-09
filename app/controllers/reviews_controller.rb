class ReviewsController < ApplicationController
  
  def index
    # For URL like /movies/1/reviews
    # Get the recipe with id=1
    @recipe = Recipe.find(params[:recipe_id])
    
    # Access all reviews for that recipe
    @reviews = @recipe.reviews
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    # For URL like /movies/1/reviews/2

    # Find an review in recipes 1 that has id=2
    @review = @recipe.reviews.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    # Associate an review object with recipe 1
    @review = @recipe.reviews.build

  end
  
  # POST /movies/1/reviews
  def create
    @recipe = Recipe.find(params[:recipe_id])
    # For URL like /recipes/1/reviews
    # Populate a review associate with recipe 1 with form data
    # Recipe will be associated with the review
    # @review = @recipe.reviews.build(params.require(:review).permit!)
    @review = @recipe.reviews.build(params.require(:review).permit(:details))
    
    if @review.save
        # Save the review successfully
        redirect_to recipe_review_url(@recipe, @review)
    else
      render :action => "new"
    end
  end


  def edit
    @recipe = Recipe.find(params[:movie_id])
    # For URL like /recipes/1/reviews/2/edit
    # Get review id=2 for recipe 1
    @review = @recipe.reviews.find(params[:id])

  end
  
  # PUT /movies/1/reviews/2
  def update
    @recipe = Recipe.find(params[:movie_id])
    @review = Review.find(params[:id])
    
    if @review.update_attributes(params.require(:review).permit(:details))
      
    # Save the review successfully
    redirect_to recipe_review_url(@recipe, @review)
    
    else
      render :action => "edit"
    end
  end
  
  # DELETE /movies/1/reviews/2
  def destroy
    @recipe = Recipe.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    
    respond_to do |format|
      format.html { redirect_to recipe_reviews_path(@recipe) }
      format.xml { head :ok }
    end
  end
end
