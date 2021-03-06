require "rails_helper"

RSpec.describe "MonitoringReports", type: :request do
  let(:mr) { create :monitoring_report }

  describe "GET /" do
    it "returns http success" do
      get "/monitoring_reports/#{mr.to_param}"
      expect(response).to have_http_status(:success)
    end
  end
end
