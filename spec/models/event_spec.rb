# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create!(name: 'Foobar', password: 'FooBar') }

  subject do
    Event.create!(name: 'event', description: 'event-description',
                  date: Time.now + 1.month, creator_id: user.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'a user can have more than one event' do
    event1 = Event.create!(name: 'event-1', description: 'event-1-description',
                           date: Time.now + 1.month, creator_id: user.id)
    event2 = Event.create!(name: 'event-2', description: 'event-2-description',
                           date: Time.now + 2.month, creator_id: user.id)

    expect(user.reload.events).to eq([event1, event2])
  end

  it 'is not valid without a description' do
    subject.description = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect { subject.valid }.to raise_error(NoMethodError)
  end

  it 'is not valid without an user id' do
    subject.creator_id = nil
    expect(subject).to_not be_valid
  end
end
