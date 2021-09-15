class ElectronicsController < ApplicationController
    get "/electronics" do
        # render all the electronics from json
        # pulling relationship with brands and post only specific attributes to json
        Electronic.all.to_json(include: [brand: {except: [:headquarter, :id]}], except: [:brand_id, :description])
    end

    get "/brands/:brand_id/electronics" do
        find_brand
        @brand.electronics.to_json
    end

    get "/electronics/:id" do
        # looking based on the id number indicated by end user
        find_electronic
        # send to json to display result
        @electronic.to_json(include: [:brand])
    end
    
    post "/brands/:brand_id/electronics/new" do
        find_brand
        @electronic = @brand.electronics.build(params)
        if @electronic.save
            # return object as json if saved
            @electronic.to_json
        else
            # return error message
            @electronic_error_message
        end
    end

    patch "/electronics/:id" do
        find_electronic
        if @electronic
            @electronic.update(
                description: params[:description]
            )
            @electronic.to_json
        else
            electronic_error_message
        end
    end

    delete "/electronics/:id" do
        find_electronic
        if @electronic
            # delete electronic
            @electronic.destroy
            # display in json
            @electronic.to_json
        else
            # display custom error message to json
            { errors: ["Electronic doesn't exist!"] }.to_json
        end
    end

    private
        def find_electronic
            @electronic = Electronic.find(params[:id])
        end

        def find_brand
            @brand = Brand.find(params[:brand_id])
        end

        def electronic_error_message
            { errors: electronic.errors.full_messages }.to_json
        end
    
end