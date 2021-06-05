class SearchsController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

    private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif
        method == 'forward_match' 
        User.where(name: content)
      elsif
        method == 'backward_match'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
      
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif
        method == 'forward_match' 
        Book.where(title: content)
      elsif
        method == 'backward_match'
        Book.where(title: content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
