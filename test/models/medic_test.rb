require 'test_helper'

class MedicTest < ActiveSupport::TestCase
  fixtures :medics, :work_units, :schedules

    def setup
        @medic = Medic.new(
            :name => medics(:one).name,
            :registry => medics(:one).registry,
            :speciality => medics(:one).speciality,
            :department => medics(:one).department)
    end
  
    test "Medic Saved" do
    	assert @medic.save

        actual = Medic.find(@medic.id)
        assert_equal @medic.name, actual.name
    end

    test "Association between Medic and WorkUnit" do
        work_unit = WorkUnit.create(:name => work_units(:one).name)
        medic = work_unit.medics.create(
            :name => @medic.name,
            :registry => @medic.registry,
            :speciality => @medic.speciality,
            :department => @medic.department)

        assert_equal work_unit.medics.size, 1
        assert_equal work_unit.medics.first.name, medic.name
    end

    test "Association between Medic and Schedule" do
        @medic.save
        schedule = @medic.schedules.create(:in => schedules(:one).in, 
            :out => schedules(:one).out)

        assert_equal @medic.schedules.size, 1
        assert_equal @medic.schedules.first.in, schedule.in
    end

    test "Search with both fields filled" do
        work_unit = WorkUnit.create(:name => medics(:one).name, :id => medics(:one).id)
        medic = Medic.create(:name => work_units(:one).name, :work_unit_id => work_units(:one).id)
        assert Medic.search(medic.speciality, work_unit.name) 
    end

    test "Search with speciality field empty" do
        work_unit = WorkUnit.create(:name => medics(:one).name, :id => medics(:one).id)
        medic = Medic.create(:name => work_units(:one).name, :work_unit_id => work_units(:one).id, :speciality => "Informe a Especialidade")
        assert Medic.search(medic.speciality, work_unit.name) 
    end

    test "Search with work unit field empty" do
        work_unit = WorkUnit.create(:name => "Informe a Região", :id => medics(:one).id)
        medic = Medic.create(:name => work_units(:one).name, :work_unit_id => work_units(:one).id)
        assert Medic.search(medic.speciality, work_unit.name) 
    end

    test "Search with both fields empty" do
        work_unit = WorkUnit.create(:name => "Informe a Região", :id => medics(:one).id)
        medic = Medic.create(:name => work_units(:one).name, :work_unit_id => work_units(:one).id, :speciality => "Informe a Especialidade")
        assert Medic.search(medic.speciality, work_unit.name) 
    end
end
