require 'test_helper'

class MedicTest < ActiveSupport::TestCase
  fixtures :medics, :work_units, :schedules

    def setup
        @medic = medics(:one)
        @work_unit = work_units(:one)
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
        assert Medic.search(@medic.speciality, @work_unit.name)
    end

    test "Search with speciality field empty" do
        assert Medic.search("Informe a Especialidade", @work_unit.name)
    end

    test "Search with work_unit field empty" do
        assert Medic.search(@medic.speciality, "Informe a Região")
    end

    test "Search with both fields empty" do
        assert_nil Medic.search("Informe a Especialidade", "Informe a Região")
    end

    test "Search with fields invalids" do
        assert_equal 0, Medic.search("ERROR", @work_unit.name).size()
        assert_nil Medic.search(@medic.speciality, "ERROR")
        assert_nil Medic.search("ERROR", "ERROR")
    end
end
