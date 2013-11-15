class Repo < ActiveRecord::Base
  include HTTParty
	# http://edgeguides.rubyonrails.org/active_record_callbacks.html
	before_validation :parse_and_store_gemms

	has_and_belongs_to_many :gemms

	# Overloading the as_json method
	# to include gemms in the json object returned
	# as_json is automatically called when you return json
	def as_json(options={})
		super(options.merge(include: :gemms))
	end

	private # can only be called from within the model

	def parse_and_store_gemms
    # Ask Github for the name of the repo

		# Using Github, get the Gemfile from the repo
		# Regex/parse the gemfile's data to get an array of gems
    gemm_list = mine_gems
		gemm_list.each do |gemm|
			self.gemms << Gemm.create!(name: gemm)
		end
	end

  def mine_gems
    #binding.pry
    url = "http://raw.github.com/#{repo_username}/#{repo_name}/master/Gemfile"
    response = HTTParty.get(url)
    gemms = []
    begin
      response.each_line do |line|
        gemms << $1 if line =~ ( /gem\s\'(.*?)\'/ || /gem\s\"(.*?)\"/ )
      end
    rescue => err
      puts "Exception: #{err}"
    end
    return gemms
  end
end
