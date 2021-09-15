class BrandsController < ApplicationController
    get "/brands" do
        # render all the brands from json
        # pulling relationship with electronics and post only specific attributes to json
        Brand.all.to_json(include: [electronics: {except: [:id, :brand_id, :description]}], except: [:headquarter, :id])
    end

    # restful routes, create, update, destroy
    get "/brands/:id" do
        # looking based on the id number indicated by end user
        brand = Brand.find(params[:id])
        # send to json to display result
        brand.to_json(include: [:electronics])
    end

    post '/brands/new' do
        binding.pry
    #    look if brand exists currently
        if brand = Brand.find(params[:id])
            { errors: ["Brand already exists!"]}
        else
            brand = Brand.create(
                name: params[:name],
                headquarter: params[:headquarter]
            )
            brand.to_json
        end
    end

    # private
    #     def find_brand
    #         @brand = Brand.find(params[:id])
    #     end

end