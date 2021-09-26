require "csv"
namespace :import do
  desc "Import active_admin_comments to Product comment"
  task products: :environment do
    CSV.foreach("active_admin_comments.csv", headers: true) do | row |
      
      product = Product.find_by(id: row["id"])
      product.comment =  row["comment"]
      product.save
      p product.comment

      # p row["comment"]
    end
  end

end
