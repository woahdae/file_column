require File.dirname(__FILE__) + '/abstract_unit'
require File.dirname(__FILE__) + '/fixtures/entry'

#	this seems to be required now (jake)
require File.dirname(__FILE__) + '/../lib/file_column_helper'

class RMagickViewOnlyTest < Test::Unit::TestCase
  include FileColumnHelper

  def setup
    Entry.file_column :image
    @request = RequestMock.new
  end

  def teardown
    FileUtils.rm_rf File.dirname(__FILE__)+"/public/entry/"
  end

  def test_url_for_image_column_without_model_versions
    e = Entry.new(:image => upload(f("skanthak.png")))
    
    assert_nothing_raised { url_for_image_column e, "image", "50x50" }
  end
end
