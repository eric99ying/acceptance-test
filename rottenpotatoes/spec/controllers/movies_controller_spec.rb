require 'rails_helper'
require 'monkey_patch'

RSpec.describe MoviesController, type: :controller do
  
  describe 'looking up movie by director' do
    
    before(:each) do
      Movie.create(title:"The Terminator", director:"bob")
      Movie.create(title:"Aladdin")
    end
    
    it 'redirects to success page' do
      t = Movie.find_by(:title => 'The Terminator')
      get :similar, id:t.id
      expect(response).to render_template(:similar)
    end
    
    it 'redirects to fail page' do
      t = Movie.find_by(:title => 'Aladdin')
      get :similar, id:t.id
      expect(response).to redirect_to(movies_path)
    end
  end
  
  describe 'create' do
    
    it 'redirects to index page' do
      post :create, movie:{title: "aaa", rating:'G', description:"sdf", director:'bob', release_date:"1-1-1990"}
      expect(response).to redirect_to(movies_path)
    end
  end
  
  describe 'destroy' do
    
    it 'redirects to index page' do
      m = Movie.create(title:"aaa")
      get :destroy, id:m.id
      expect(response).to redirect_to(movies_path)
    end
  end
  
end
