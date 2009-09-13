require File.dirname(__FILE__)+'/../spec_helper'
require File.dirname(__FILE__)+'/../../lib/site_create_map'

include ParkingDay

describe SiteCreateMap do
  it "should accept valid data" do
    data = {:slug => 'a_slug'}
    map = SiteCreateMap.new
    site = map.save(data)
    site.slug.should == 'a_slug'
    
  end
  
  it "should ensure that slug is alphanumeric" do
    data = {:slug => 'Hello how are you?'}
    map = SiteCreateMap.new
    map.save(data).should == false
    map.errors.should have_key(:slug)
  end
end