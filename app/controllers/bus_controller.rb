class BusController < ApplicationController
    def search_by_location
        from_location=params[:from_location]
        to_location=params[:to_location]
        sql = 'SELECT * FROM buses WHERE from_location = :from_location AND to_location = :to_location'
        sql2= ActiveRecord::Base.sanitize_sql_array([sql,from_location:from_location,to_location:to_location]);
        result = ActiveRecord::Base.connection.execute(sql2);
        render json: result.to_a
    end

    def search_by_id
        bus_id = params[:id]
        sql = 'SELECT * FROM buses WHERE buses.bus_id=:bus_id'
        sql2= ActiveRecord::Base.sanitize_sql_array([sql,bus_id:bus_id]);
        result = ActiveRecord::Base.connection.execute(sql2)
        render json: result.to_a
    end
    
    
    def login
        email = params[:email]
        password = params[:password]
        sql = 'SELECT * FROM users WHERE email=:email AND password=:password'
        sql2= ActiveRecord::Base.sanitize_sql_array([sql,email:email,password:password]);
        result = ActiveRecord::Base.connection.execute(sql2)
        if result.present? && result.length >= 1
          render plain: 'success'
        else
          render plain: 'failure'
        end
    end
    def register
        email = params[:email]
        password = params[:password]
        name=params[:name]
        phone=params[:phone]
        puts email
        if User.exists?(email: email)
            render plain:'user exist'
        else    
            user=User.create(email:email,password:password,phone:phone,name:name);
            
            if user.save
                render plain: 'success'
            else
             render plain: 'registration failed'
            end
        end
    end

    def more_info_driver
        driver_id = params[:driver_id]
        phones = DriverPhone.where(driver_id: driver_id).pluck(:phone)
        render json: phones
    rescue StandardError => e
        render plain: 'error'
    end
    
    
    
end
