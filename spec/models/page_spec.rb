require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should have_one(:source).dependent(:destroy) }
  it { should validate_presence_of(:url) }
end
