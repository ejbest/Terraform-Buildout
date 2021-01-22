**Here is what was completed in Terraform: **

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

Cloudfront CDN was considered but recommend Cloudflare and can implement updating with an available API or Bash Script Below

[https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a](https://gist.github.com/Tras2/cba88201b17d765ec065ccbedfb16d9a)