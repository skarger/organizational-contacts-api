require 'spec_helper'

describe "home page related links", type: :feature do
  include RackTestHelper

  context 'related organizations link' do
    it "should successfully respond" do
      get '/home/organizations'
      expect(last_response.status).to eq(200)
    end

    it "should have a links object with a link to itself" do
      top_level_links_pattern = {
        links: {
          self: "#{base_url}/home/organizations"
        }
      }.ignore_extra_keys!
      visit '/home/organizations'
      expect(page.body).to match_json_expression(top_level_links_pattern)
    end

    it "should have a data object with serialized organization collection" do
      organizations_data_pattern = {
        data: [primary_organization_data]
      }.ignore_extra_keys!
      visit '/home/organizations'
      expect(page.body).to match_json_expression(organizations_data_pattern)
    end
  end
end
