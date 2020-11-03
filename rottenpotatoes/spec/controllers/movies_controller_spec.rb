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
end
