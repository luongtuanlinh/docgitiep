class HomepageController < ApplicationController
  def index
    render "template/index"
  end

  def single
    render "template/single-post"
  end

  def category_post
    render "template/catagory-post"
  end

  def category
    render "template/catagory"
  end

  def contact
    render "template/contact"
  end

  def recipe
    render "template/receipe"
  end
end
