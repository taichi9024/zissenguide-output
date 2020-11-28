describe "String" do
    describe "#<<" do
      example "文字の追加" do
        a = "ABC"
        a << "D"
        expect(a.size).to eq(4)
      end
    end
end