$LOAD_PATH.unshift File.dirname(__FILE__)
require 'contact_points_collection'

class PublicContactPointsCollection
  include ContactPointsCollection

  def initialize
    attributes_US = {
      id: 1,
      area_served: ["US"],
      contact_type: "customer service",
      phone_number: "1-866-123-4567",
      email: "service@example.com"
    }
    attributes_CA = {
      id: 2,
      area_served: ["CA"],
      contact_type: "customer service",
      phone_number: "1-866-987-6543",
      email: "service@example.ca"
    }
    attributes_GB = {
      id: 3,
      area_served: ["GB"],
      contact_type: "customer service",
      phone_number: "44 1234 567",
      email: "service@example.co.uk"
    }

    contact_point_US = ContactPoint.new(
      attributes: attributes_US,
      organization: Organization.new
    )
    contact_point_CA = ContactPoint.new(
      attributes: attributes_CA,
      organization: Organization.new
    )
    contact_point_GB = ContactPoint.new(
      attributes: attributes_GB,
      organization: Organization.new
    )
    @all_contact_points = [contact_point_US, contact_point_CA, contact_point_GB]
    @ids = [1,2,3]
  end
end
