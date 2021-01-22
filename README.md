## Submission of Terraform Project:


Using the AWS Provider in Terraform 0.14.4 have setup Cluster of application server instances and AWS LB, was not sure if you wanted additional &quot;worker instances&quot;; however, can be easily added and for now minimizing costs in us-east-1. The following was also included in the Terraform

- security groups
- terraform modules
- subnets
- gateways (NAT or otherwise)
- other infrastructure components as needed, etc

Provided Aurora database cluster (MySQL Engine, at least 3 instances);

[&quot;us-east-1a&quot;, &quot;us-east-1b&quot;, &quot;us-east-1c&quot;]

Memcached cluster (elasticache)

Redis cluster (elasticache)

There is hope that you see a sensible directory and file structure that there was some use of mapping cloud assets via AWS API (tags)

Cloudfront CDN was considered but recommend Cloudflare and can implement updating with an available API or Bash Script:
[https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a](https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a)

#### Commnands to run and test

**Base Requirements**
 <br>
-  Mac workstation or Linux workstation/server to commandline control the testing exercise.
-  AWS Command Line and Account and authenticated<br>
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.4<br>
    https://www.terraform.io/downloads.html
-  Git Client<br>
    https://git-scm.com

**Steps** 
1. Go to a command line of your workstation
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

Please let me know any questions; if any details are missing or if anything was interpreted incorrectly.

| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | erich.ej.best@gmail.com
| Phone | 201-218-9860
| LinkedIn | https://www.linkedin.com/in/ejbest
