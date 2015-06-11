require_relative "../spec_helper.rb"

Capybara.app = CompanyContactsApi

describe "root path", :type => :feature do
  it "should redirect to the named home page" do
    visit '/'
    expect(current_path).to eq("/home")
  end

  it "should send the Content-Type for JSON API" do
    content_type = "application/vnd.api+json"
    visit '/'
    expect(page.response_headers['Content-Type']).to eq(content_type)
  end
end

describe "the home page", :type => :feature do
  base_url = "http://localhost:3000"

  it "should have a link to itself" do
    visit '/home'
    expect(page).to have_content "#{base_url}/home"
  end

  it "should have a links element with a link to itself" do
    links_pattern = {
      links: {
          self: "#{base_url}/home"
      }
    }.ignore_extra_keys!
    visit '/home'
    expect(JSON.parse(page.body)).to match_json_expression(links_pattern)
  end

  it "should have a relationship link to the Organization" do
    relationships_pattern = {
      data: [{
        relationships: {
          organization: {
            links: {
              self: "#{base_url}/relationships/organization",
              related: "#{base_url}/organization"
            }
          }
        }
      }]
    }.ignore_extra_keys!
    visit '/home'
    expect(JSON.parse(page.body)).to match_json_expression(relationships_pattern)
  end
end