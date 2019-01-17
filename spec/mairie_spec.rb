require_relative '../lib/mairie.rb'

describe "mairie function" do
  it "finds the size" do
    expect(get_townhall_urls.size).to eq(2109)
  end

  it "finds the size" do
    expect(get_townhall_urls[0]).to eq("http://annuaire-des-mairies.com/95/ableiges.html")
  end

end