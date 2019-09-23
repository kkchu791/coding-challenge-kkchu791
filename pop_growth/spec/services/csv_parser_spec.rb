require 'rails_helper'

describe "csv_parser", type: :service do
  describe 'initialize' do
    context 'when dependencies are specified' do
      it "assigns file" do
        file = "file"
        expect(CSVParser.instance_variable_get(:file)).to eq(file)
      end
    end
  end
end




#structure of the tests


#initialize
#when dependecies are specified
#assigns a file instance variable


#process_file
  #when type is zip code
    #it should run process_zip_code
  #when type is not zip ZipCode
    #it should run process_core based stat files


#describe process zip code
