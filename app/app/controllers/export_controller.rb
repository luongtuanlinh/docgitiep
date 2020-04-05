class ExportController < ApplicationController
  def index
    @test = [1, 2, 3]
    # render xlsx: 'export', template: 'index'
    respond_to do |format|
      format.html
      format.xlsx
    end
  end
end
