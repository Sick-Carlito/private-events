# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  it 'is valid with a name' do
    subject.name = 'Foo Bar'
    subject.password = 'FooBar'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
