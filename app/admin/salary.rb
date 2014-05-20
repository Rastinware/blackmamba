  ActiveAdmin.register_page "Import Salaries" do
    content do
      render "import_salaries"
    end

    page_action :import_csv, :method => :post do
      delete_previous = params[:delete_previous] == "1"
      year = params[:year].to_i
      month = params[:month].to_i
      file = params[:file]

      result = Salary.import(delete_previous, year, month, file)

      redirect_to admin_import_salaries_path, :notice => "اطلاعات حقوق " + month.to_s + " " + year.to_s + " با موفقیت بارگذاری شد." + " imported: " + result[0].to_s
    end
  end