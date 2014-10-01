require 'test_helper'

class MedicTest < ActiveSupport::TestCase
  fixtures :medics, :work_units
  
  test "Medico nao salvo" do
  	medic = Medic.new(
      :name => medics(:one).name,
  		:registry => medics(:one).registry,
  		:speciality => medics(:one).speciality,
  		:department => medics(:one).department
  		)
  	assert medic.save

    atual = Medic.find(medic.id)
    assert_equal medic.name, atual.name
  end

  test "associacao medic work_unit" do
    medic = Medic.find(1)
    #name_medic = medic.name
    #work_unit_medic = 
  end

  test "test association medic schedule" do
  end
end
