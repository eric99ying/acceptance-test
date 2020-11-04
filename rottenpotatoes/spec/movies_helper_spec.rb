require 'rails_helper'

class DummyClass
  include MoviesHelper
end

RSpec.describe MoviesHelper do
  it 'returns odd' do
    dc = DummyClass.new
    expect(dc.oddness(1)).to eq("odd")
  end
  it 'returns even' do
    dc = DummyClass.new
    expect(dc.oddness(2)).to eq("even")
  end
end