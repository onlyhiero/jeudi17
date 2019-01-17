require_relative '../lib/app.rb'

describe "trader function" do
  it "finds the size" do
    expect(symbol.size).to eq(2109)
  end

  it "finds the first crypto" do
    expect(symbol[0]).to eq("BTC")
  end

  it "finds the 450th crypto" do
    expect(symbol[450]).to eq("CHSB")
  end

end