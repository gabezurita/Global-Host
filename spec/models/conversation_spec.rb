require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let!(:sender) {User.create!(first_name: "Patrick", last_name: "DeWitte", city: "Chicago", password_digest: "password",
    email: "p@p.p", state_province: "IL", country: "USA", personal_info: "Is a cool guy", language: "English", gender: "male", is_host: false)}
  let!(:recipient) {User.create!(first_name: "Andrey", last_name: "Slonski", city: "Cincinatti", password_digest: "password",
  email: "a@a.a", state_province: "OH", country: "USA", personal_info: "Is a cool guy too", language: "English", gender: "male", is_host: true)}

  let!(:conversation) {Conversation.create(sender: sender, recipient: recipient)}

  describe "Conversation validations" do
    it "is valid with a conversation id" do
      expect(conversation).to be_valid
    end

    # xit "is not valid without a user id" do
    #   expect(conversation).to_not be_valid
    # end
  end

  xdescribe "Make Itinerary" do
    sender_id = 1
    host_id = 5
    conversation_id = 6
    let(:itin) { Itinerary.create(visitor_id: sender_id, host_id: recipient_id, conversation_id: id) }

    it "creates an itinerary" do
      expect(make_itinerary).to eq(itin)
    end

  end


  describe "Conversation structure" do
    it "is started by one user" do
      expect(conversation.sender).to eq sender
    end

    it "is continued by another user" do
      expect(conversation.recipient).to eq recipient
    end
  end
end
