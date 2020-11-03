require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:each) do
    Movie.create(title:"The Terminator", director:"bob")
    Movie.create(title:"The Help", director:"bob")
    Movie.create(title:"Chocolat")
    Movie.create(title:"Amelie")
  end
  
  describe 'similar success' do
    it 'returns matched movies' do      
      res = Movie.find_movies_same_director("bob")
      term = Movie.find_by(:title=>'The Terminator')
      help = Movie.find_by(:title=>'The Help')
      expect(res).to include(term)
      expect(res).to include(help)
    end
  end
  
  describe 'similar failure' do
    it 'does not return not matched movies' do
      res = Movie.find_movies_same_director("bob")
      choco = Movie.find_by(:title=>'Chocolat')
      amelie = Movie.find_by(:title=>'Amelie')
      expect(res).not_to include(choco)
      expect(res).not_to include(amelie)
    end
  end

end
