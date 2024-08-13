# hackney-council

Hackney Council Exercises

- Create a Terraform module that creates an EC2
- The EC2 should be placed in a subnet provided to the module
- Each EC2 would need an additional EBS volume
- The module should expect
  - Instance type (Should be restricted to t3.micro or t3.small)
  - AMI
  - Root volume size (Should not be greater than 100GB)
  - Additional volume size (Should be bigger than 50GB and no bigger than 100GB)
  - Subnet for the EC2
  - VPC for the EC2
  - Tags : The EC2 should be tagged with
   - Application name
   - Cost code
   - Product team
- The EC2 should allow ingress traffic on port 80 from anywhere
- The EC2 should allow ingress traffic on port 22 from IP 10.20.1.1
- The EC2 should allow egress to anywhere on any port
- The module should return the Instance ID and the private IP address of the instance
- Create some Terraform that would use your module to create an EC2 (you can provide dummy values for the Subnet/VPC)
- Output the Instance_ID and Private_IP returned by your module
