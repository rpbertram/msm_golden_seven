class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render("movies/index.html.erb")
    # redirect_to("https://www.google.com")
  end

  def show
    @movie = Movie.find(params[:id])
    render("movies/show.html.erb")
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:the_title]
    @movie.year = params[:the_year]
    @movie.duration = params[:the_duration]
    @movie.description = params[:the_description]
    @movie.image_url = params[:the_image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    # render("/show.html.erb")
    redirect_to("/movies/#{@movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("/movies/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find_by({ :id => params[:id] })
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    redirect_to("/movies/#{@movie.id}")
  end

  def destroy
    Movie.find_by({ :id => params[:id] }).destroy
    redirect_to("http://localhost:3000")
  end
end
