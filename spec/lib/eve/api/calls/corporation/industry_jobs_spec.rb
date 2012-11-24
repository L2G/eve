require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#industry_jobs" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'industry_jobs',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of industry jobs" do
        subject.jobs.should behave_like_rowset('jobID,assemblyLineID,containerID,
            installedItemID,installedItemLocationID,installedItemQuantity,
            installedItemProductivityLevel,installedItemMaterialLevel,
            installedItemLicensedProductionRunsRemaining,outputLocationID,
            installerID,runs,licensedProductionRuns,installedInSolarSystemID,
            containerLocationID,materialMultiplier,charMaterialMultiplier,
            timeMultiplier,charTimeMultiplier,installedItemTypeID,outputTypeID,
            containerTypeID,installedItemCopy,completed,completedSuccessfully,
            installedItemFlag,outputFlag,activityID,completedStatus,installTime,
            beginProductionTime,endProductionTime,pauseProductionTime')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'industry_jobs') }.should raise_error(ArgumentError)
      end
    end
  end
end
