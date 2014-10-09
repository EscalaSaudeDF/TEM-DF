class Medic < ActiveRecord::Base
	belongs_to :work_unit
	has_many :schedules

		def self.search(search)
		  if search
		    #find(:all, :conditions => ['name = ?', "%#{search}%"])
		    #find_by_speciality(search)
		    where("speciality =  ?", search).all
		  else
		    find(:all)
		 end
	end
end
