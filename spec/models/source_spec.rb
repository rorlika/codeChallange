require 'rails_helper'

RSpec.describe Source, type: :model do
  it { should belong_to(:page) }
end
