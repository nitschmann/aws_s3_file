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
		location = params[:into]
		destination = params[:as] || File.join(location, file)
		owner = params[:owner]
		group = params[:group]
		mode = params[:mode]

		directory File.dirname(destination) do
    	recursive true
    	action :create
  	end

	  execute "download #{params[:name]} from S3" do
	    command "s3cmd get -c /root/.s3cfg s3://#{bucket}/#{file} #{destination}"
	    only_if { Dir.glob(destination).blank? }
	  end

	  if owner != nil && group != nil 
	  	bash "change owner for #{file}" do 
	  		cwd location
	  		code %(chown -R #{owner}:#{group} #{file})
	  	end 
	  end

	  if mode != nil 
	  	bash "change mode for #{file}" do
	  		cwd location 
	  		code %(chmod -R #{mode} #{file})
	  	end
	  end
	end

end 