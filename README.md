## Submission of Terraform Project:

This was an enjoyable project and only wish to have a bit more tribal knowledge for completeness and application details.
Thank you very much for this opportunity and hope we can continue discussions and considerations.

Using the AWS Provider in Terraform 0.14.4 have setup Cluster of application server instances and AWS LB, was not sure if you wanted additional &quot;worker instances&quot;; however, can be easily added and for now minimizing costs in us-east-1. The following was also included in the Terraform

- security groups
- terraform modules
- subnets
- gateways (NAT or otherwise)
- other infrastructure components as needed, etc

Provided Aurora database cluster (MySQL Engine, at least 3 instances); there seems to be much that can be learned about Aurora and excited to do so.

[&quot;us-east-1a&quot;, &quot;us-east-1b&quot;, &quot;us-east-1c&quot;]

Memcached cluster (elasticache)

Redis cluster (elasticache)

There is hope that you see a sensible directory and file structure that there was some use of mapping cloud assets via AWS API (tags).
- Tags are getting better with AWS but has some distance.

Cloudfront CDN was considered (cost again) but recommend Cloudflare and can implement updating with an available API or Bash Script:
[https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a](https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a)
With a bit more time could have done more with this.

#### Commnands to run and test

##### Base Requirements
 <br>
-  Mac workstation or Linux workstation/server to commandline control the testing exercise.
-  AWS Command Line and Account and authenticated<br>
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.4<br>
    https://www.terraform.io/downloads.html
-  Git Client<br>
    https://git-scm.com

**Steps** 
1. Go to a command line of your work
station
- script was tested on Linux and Mac
- create and go to a folder of your choice for the test
<pre>
    mkdir mytestfolder
    cd mytestfolder
</pre>
2. Clone the files from git
<pre>
    git clone git@github.com:ejbest/Terraform-Buildout.git
</pre>
3. Go to the folder that was just created
<pre>
    cd Terraform-Buildout
    cd application
</pre>
4. Change Directory to the Terraform Folder and run the following commands
<pre>
    cd terraform
    terraform init
    terraform plan
    terraform apply
    # check for output for success or error messages
</pre>
5. Go to the Application Console
<pre>
    Load balancer and get the LB link (DNS would have been better (acknowledged))
    Nginx is serving out the WebPage on 80
    Redis
    Memcache
    Security Groups
    Docker Containers
</pre>
5. Database Initial Logins (passwords should be changed)
<pre>
    Initial Settings for the DB was set in Terraform for the 3 AZs
    database_name    = "mydb"
    master_username  = "myuser"
    default          = "mypassword"
</pre>

Please let me know any questions; if any details are missing or if anything was interpreted incorrectly.

| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | reach me on linked in for phone / email
| Phone | reach me on linked in for phone / email
| LinkedIn | https://www.linkedin.com/in/ejbest
