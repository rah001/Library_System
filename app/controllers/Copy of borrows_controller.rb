class BorrowsController < ApplicationController
  
  layout 'design'

def new
    puts "borrows -> new"
        @borrow = Borrow.new
  end



  def create
    
  puts @Book_ID=params[:borrow][:BookID]
	puts @Member_ID=params[:borrow][:MemberID]
    
  #@condi = Borrow.find(:all ,
    #                              :conditions => "BookID = #{params[:borrow][:BookID]} and MemberID = #{params[:borrow][:MemberID]}")  
                                  
  
  
  #if @condi == []                                    

		@book=Book.find(:first,:conditions => "BookID = #{params[:borrow][:BookID]}")
    
		@member = Member.find(:first , :conditions => " MemberID = #{params[:borrow][:MemberID]}")
    
		#puts @book.NumberOfAvailbleBooks.to_i
		puts "Available copies of book are"
		puts numberOfAvailbleBooks = @book.NumberOfAvailbleBooks.to_i
		numberOfBorrowedBooks = 1 + @book.NumberOfBorrowedBooks.to_i
    #puts "~~~~~~~~~ #{numberOfBooks} "
		numberOfBooks = 1 + @member.NumberOfBooks.to_i
    puts "~~~~~~~~~ #{numberOfBooks} ~~~~~~~~~~~~~~"
    
		if numberOfAvailbleBooks == 1 
					numberOfAvailbleBooks -= 1
					@bookborrowcounter=@book.Ranking.to_i+1
					puts "-----#{@book.Ranking.to_i+1}"
                
                @book.update_attributes(:BookID => "#{params[:borrow][:BookID]}",
                                                  :NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
                                                  :NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
                                                  :Availble => "Not Available",
                                                  :Ranking => "#{@bookborrowcounter}") 
                
                 
                @member.update_attributes(:MemberID => "#{params[:borrow][:MemberID]}",
                                                      :NumberOfBooks => "#{numberOfBooks}") 
                
                 @borrow = Borrow.new(params[:borrow])
			  
                 if @borrow.save
                        flash[:notice] = 'You have Borrowed book successfully'
                        render :action => "new" 
                else
                      render :action => "new" 
                end
    
		elsif numberOfAvailbleBooks > 1
				puts "in else .."
        
				numberOfAvailbleBooks -= 1
				puts numberOfAvailbleBooks
				@bookborrowcounter=@book.Ranking.to_i+1
				puts "-----#{@book.Ranking.to_i+1}"
				@book.update_attributes(:BookID => "#{params[:borrow][:BookID]}",
                                                  :NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
                                                  :NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
                                                  :Ranking => "#{@bookborrowcounter}") 
                
                 
				@member.update_attributes(:MemberID => "#{params[:borrow][:MemberID]}",
                                                      :NumberOfBooks => "#{numberOfBooks}") 
                
				@borrow = Borrow.new(params[:borrow])
				if @borrow.save
					flash[:notice] = 'You have Borrowed book successfully'
					render :action => "new" 
				else
					render :action => "new" 
                    end
		else
				render :text => "This book is borrowed"
		end
      
	#else
        #render :text => "alert(Already You have this Book');"
      #  flash[:notice] = "hi"
        #render :update, :layout => false, :content_type => "text/javascript" do |page|
          #        page.call :alert, "Im JS"
          #end
        
        #render :update do |page|
         #     page.alert("Already You have this Book")
        #end
   
   #end
   

    
  
  end

def reserve
	puts "borrws -> reserve"
  
	

end

 
end
