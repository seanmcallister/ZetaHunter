require "spec_helper"
require "logger"

describe Utils do
  let(:klass) { Class.new { extend Utils } }
  let(:logger) { Logger.new STDERR }

  describe "#log_cmd" do
    it "prints command to Logger level debug"
  end

  describe "#escape_dashes" do
    it "returns str with each '-' replaced with '\-'" do
      str = "-app--le---p"
      expect(klass.escape_dashes str).to eq '\-app\-\-le\-\-\-p'
    end
  end

  describe "#dash_to_underscore" do
    it "returns str with dashes replaces with underscores" do
      str = "-app--le---p"
      expect(klass.dash_to_underscore str).to eq '_app__le___p'
    end
  end

  describe "has_dash?" do
    it "returns true if string has a dash" do
      str = "apple-pie"
      expect(klass.has_dash? str).to be true
    end

    it "returns false if string doesn't have a dash" do
      str = "applepie"
      expect(klass.has_dash? str).to be false
    end
  end

  describe "#gap?" do
    context "the character is an A C T G U or N (case insensitive)" do
      it "returns false" do
        %w[a c t g u n A C T G U N].each do |char|
          expect(klass.gap? char).to be false
        end
      end
    end

    context "the character is anything else" do
      it "returns true" do
        gap_chars =
          (0..255).map { |n| n.chr } - %w[a c t g n u A C T G N U]

        gap_chars.each do |n|
          expect(klass.gap? n.chr).to be true
        end
      end
    end
  end

  describe "#get_cluster_method" do
    context "with good input" do
      it "returns file ext for cluster method" do
        results = [klass.get_cluster_method("furthest"),
                   klass.get_cluster_method("average"),
                   klass.get_cluster_method("nearest"),]
        expect(results).to eq ["fn", "an", "nn"]
      end
    end

    context "with bad input" do
      it "raises AbortIf::Exit" do
        expect{klass.get_cluster_method "apple"}.
          to raise_error AbortIf::Exit
      end
    end
  end
end
