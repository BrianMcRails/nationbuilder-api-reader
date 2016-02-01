class NbUsersController < ApplicationController
  before_action :set_nb_user, only: [:show, :edit, :update, :destroy]

  # GET /nb_users
  # GET /nb_users.json
  def index
    @nb_users = NbUser.all
    @response = HTTParty.get("https://brianmcauley.nationbuilder.com/api/v1/people?__nonce=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b&limit=200&__proto__=&access_token=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b",
 :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
    @result = @response.body
    respond_to do |format|
   format.json { render :json => JSON.parse(@result) }
   format.html { render "index.html.erb" }
    end
  end

  # GET /nb_users/1
  # GET /nb_users/1.json
  def show
      response = HTTParty.get("https://brianmcauley.nationbuilder.com/api/v1/people?__nonce=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b&limit=200&__proto__=&access_token=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b",
 :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      user = JSON.parse(response)
       user.each {|line| puts line['email']['id']}
  #the "['user']['id']" is because of the nested JSON object that is returned after the parse.
  end

  # GET /nb_users/new
  def new
    @nb_user = NbUser.new
  end

  # GET /nb_users/1/edit
  def edit
  end

  # POST /nb_users
  # POST /nb_users.json
  def create
    @nb_user = NbUser.new(nb_user_params)

    respond_to do |format|
      if @nb_user.save
        format.html { redirect_to @nb_user, notice: 'Nb user was successfully created.' }
        format.json { render :show, status: :created, location: @nb_user }
      else
        format.html { render :new }
        format.json { render json: @nb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nb_users/1
  # PATCH/PUT /nb_users/1.json
  def update
    respond_to do |format|
      if @nb_user.update(nb_user_params)
        format.html { redirect_to @nb_user, notice: 'Nb user was successfully updated.' }
        format.json { render :show, status: :ok, location: @nb_user }
      else
        format.html { render :edit }
        format.json { render json: @nb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nb_users/1
  # DELETE /nb_users/1.json
  def destroy
    @nb_user.destroy
    respond_to do |format|
      format.html { redirect_to nb_users_url, notice: 'Nb user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def request_from_nb

        @cfg = '__nonce=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b'
        @limit = '200'
        @access_token = 'adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b'
        @url_new_string = 'https://brianmcauley.nationbuilder.com/api/v1/people?'+@cfg+'&limit='+@limit+'&__proto__=&access_token='+@api_key
        # "https://brianmcauley.nationbuilder.com/api/v1/people?__nonce=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b&limit=200&__proto__=&access_token=adb0731da1b0cf4f6f230c898f8e746b3142a1157bcf9dd9745388f3bbe6358b"  - this is what is created by @url_new_string
        response =  HTTParty.get(@url_new_string.to_str)  #submit the string to get the token
        @parsed_and_a_hash = JSON.parse(response)
        @result = @parsed_and_a_hash["email"]
       # @token = @parsed_and_a_hash["token"]


        #make a new string with the token

       # @urlstring_to_post = 'https://api.squishlist.com/rest/?cfg='+@cfg+'&token='+@token+'&method=squish.issue.submit&prj='+@project

        #submit and get a result

       # @result = HTTParty.post(@urlstring_to_post.to_str, :body => {:subject => 'This is the screen name', :issue_type => 'Application Problem', :status => 'Open', :priority => 'Normal', :description => 'This is the description for the problem'})

    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nb_user
      @nb_user = NbUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nb_user_params
      params.require(:nb_user).permit(:email, :lastname, :firstname, :emailoptin, :updatedat, :externalid)
    end
end
