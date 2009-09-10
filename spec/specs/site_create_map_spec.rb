require File.dirname(__FILE__)+'/../spec_helper'
require File.dirname(__FILE__)+'/../../lib/site_create_map'

include ParkingDay

describe SiteCreateMap do
  it "should ensure that slug is alphanumeric" do
    data = {:slug => 'Hello how are you?'}
    map = SiteCreateMap.new
    map.save(data).should == false
    map.errors.should have_key(:slug)
  end
end