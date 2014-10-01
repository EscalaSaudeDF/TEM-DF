require 'csv'
require 'medic'
require 'date'
require 'schedule'
require 'work_unit'

class Parser < ActiveRecord::Base
	file = 'csv/escalas.csv'
	def save_parse(file)
		CSV.foreach(file, :col_sep => ';', :headers =>true ) do |row|

			start_date = DateTime.parse(row["	Data de Inicio da Escala"] + " " + row["	Horario de Entrada"])

			formatted_start_date = start_date.strftime('%a %b %d %H:%M')
			
			end_date = DateTime.parse(row["	Data  Final da Escala"] + " " + row["	Horario de Saida"])
			
			formatted_end_date = end_date.strftime('%a %b %d %H:%M')
                	
        	work_unit_record = WorkUnit.find_or_create_by(:name_work_unit => row[0])

	    	medic_record = work_unit_record.medics.find_or_create_by(:name => row["	Nome do Servidor"],
				:registry => row["	Matricula Funcional"],
        		:speciality => row["Cargo do Servidor"],
        		:department => row["	Descricao da Lotacao"])

        	medic_record.schedules.create(:in => formatted_start_date, 
	    		:out => formatted_end_date)

		end
	end
end
