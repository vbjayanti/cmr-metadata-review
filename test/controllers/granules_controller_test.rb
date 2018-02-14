require 'test_helper'

class GranulesControllerTest < ActionController::TestCase
  describe "DELETE #replace" do
    it "prevents DAAC curators from replacing the Granule" do
      user = User.find_by role: "daac_curator"
      sign_in(user)

      granule = Granule.first
      record  = granule.records.find(5)

      delete :replace, id: granule.id, record_id: record.id

      assert_redirected_to general_home_path
      assert_equal "You are not authorized to access this page.", flash[:alert]
    end

    it "prevents replacement on Granules in review" do
      user = User.find_by role: "admin"
      sign_in(user)

      granule = Granule.first
      record  = granule.records.find(5)
      collection = granule.collection

      delete :replace, id: granule.id, record_id: record.id

      assert_redirected_to collection_path(id: 1, concept_id: collection.concept_id)
      assert_equal "This granule is in review, and can no longer be changed to a different granule", flash[:alert]
    end

    it "will delete and replace the granule" do
      user = User.find_by role: "admin"
      sign_in(user)

      granule = Granule.first
      record  = granule.records.find(15)
      collection = granule.collection

      Granule.any_instance.expects(:delete_self)
      Collection.any_instance.expects(:add_granule)

      delete :replace, id: granule.id, record_id: record.id

      assert_redirected_to collection_path(id: 1, concept_id: collection.concept_id)
      assert_equal "A new granule has been selected for this collection", flash[:notice]
    end
  end
end