define :aws_s3_file, :action => :download do 

	template '/root/.s3cfg' do
		source 's3cfg.erb'
		cookbook 'aws_s3_file'
		mode '0600'
	end 

	if params[:action] == :download 
		if params[:bucket]
			bucket = params[:bucket]
		else
			bucket = node[:aws_s3][:default_bucket]			
		end		
		file = params[:file]
		location = params[:location]
		destination = params[:as] || File.join(location, file)
		owner = params[:owner]
		group = params[:group]
		mode = params[:mode]

		directory File.dirname(destination) do
    	recursive true
    	action :create
  	end


	end

end 