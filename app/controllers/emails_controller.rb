class EmailsController < ApplicationController
    def index
        emails = []
        @emails = Email.all
        @emails.each do |email|
            emails << email
        end
        @all_emails = emails.reverse
    end

    def new
        @emails = Email.new
    end

    def create
        @emails = Email.new(object: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.paragraph)
        if @emails.save
            respond_to do |format|
                format.html { redirect_to emails_path }
                format.js { }
            end
        else
            respond_to do |format|
                format.html { redirect_to emails_path }
                format.js { }
            end
        end
    end

    def show
        @emails = Email.find(params[:id])
       
        respond_to do |format|
            format.html { redirect_to emails_path }
            format.js { }
        end
        
            
    end

    def destroy
        @emails = Email.find(params[:id])
        @emails.destroy
        
        respond_to do |format|
          format.html { redirect_to emails_path }
          format.js { }
        end
    end

    def update
        @email = Email.find(params[:id])
        @email.toggle(:read).save
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js {}
        end
    end
end
