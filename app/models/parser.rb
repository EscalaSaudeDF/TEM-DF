require 'csv'
require 'medic'
require 'date'
require 'schedule'
require 'work_unit'

class Parser < ActiveRecord::Base
	def saveMedic()
		CSV.foreach('csv/escalas.csv', :col_sep => ';', :headers =>true ) do |row|

			dateInicio = DateTime.parse(row["	Data de Inicio da Escala"] + " " + row["	Horario de Entrada"])
			formatted_dateInicio = dateInicio.strftime('%a %b %d %H:%M')

			dateFim = DateTime.parse(row["	Data  Final da Escala"] + " " + row["	Horario de Saida"])
			formatted_dateFim = dateFim.strftime('%a %b %d %H:%M')
        	
        	m = Medic.find_or_create_by(
        	:name => row["	Nome do Servidor"],
        	:registry => row["	Matricula Funcional"],
        	:speciality => row["Cargo do Servidor"],
        	:department => row["	Descricao da Lotacao"])
        	
        	m.schedules.create(:in => formatted_dateInicio, :out => formatted_dateFim)
			m.work_units.create(:name_work_unit => row[0])
			

		end
	end
end
