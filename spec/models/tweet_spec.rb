require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe ".last_tweets" do
    let(:user) { "screencastmint" }
    let(:numbers) { 2 }

    context "valid informations" do
      subject { Tweet.last_tweets(user, numbers) }

      it "return two elements" do
        expect(subject.count).to eq(2)
      end

      it "order by desc" do
        first_date = subject.first.created_at
        second_date = subject.last.created_at

        expect(first_date).to be >= second_date
      end
    end
  end

  describe ".count_followers" do

    context "current followers" do
      subject { Tweet.count_followers }

      it "return integer" do
        expect(subject).to be_kind_of(Fixnum)
      end

      it "must be greater or equal than one" do
        expect(subject).to be >= 1
      end
    end
  end

end
