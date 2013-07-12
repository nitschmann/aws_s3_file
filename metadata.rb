maintainer 'Florian Nitschmann'
maintainer_email 'florian.nitschmann@infopark.de'
description 'File download directly from AWS S3'
version '0.1'
supports 'ubuntu', '>= 8.04'

attribute 'aws_s3/access_key',
	:display_name => 'AWS S3 Access Key ID',
	:description => 'The Access Key ID for AWS S3'
	:default => ''

attribute 'aws_s3/access_key_secret',
	:display_name => 'AWS S3 Access Key Secret',
	:description => 'The AWS S3 Access Key Secret'
	:default => ''

attribute 'aws_s3/default_bucket',
	:display_name => 'Default AWS S3 bucket for stored files'
	:description => 'A default bucket on AWS S3 where files should be downloaded from'
	:default => ''