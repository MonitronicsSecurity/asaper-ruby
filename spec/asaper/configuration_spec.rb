require 'spec_helper'

describe Asaper::Configuration, "#api_key" do
  it "has an api_key" do
    subject.api_key = API_KEY
    expect(subject.api_key).to eq API_KEY
  end
end

describe Asaper::Configuration, "#api_env=" do
  shared_examples_for "Api Url" do |env, url|
    it "has the correct url" do
      subject.api_env = env
      expect(subject.api_url).to eq url
    end
  end

  context "staging" do
    it_behaves_like "Api Url", :staging, "https://api.asaper-staging.com/api/v1"
  end

  context "sandbox" do
    it_behaves_like "Api Url", :sandbox, "https://api.asaper-sandbox.com/api/v1"
  end

  context "production" do
    it_behaves_like "Api Url", :production, "https://api.asaper.com/api/v1"
  end
end
