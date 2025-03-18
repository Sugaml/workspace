# AWS Networking Components

## Virtual Private Cloud (VPC)
A VPC is an isolated network in AWS that allows you to define IP addressing, security groups, and routing for your cloud resources.

## Subnet
A subnet is a range of IP addresses within a VPC where AWS resources are deployed. Subnets can be:

### Public Subnet: 
    Has direct internet access via an Internet Gateway (IGW).
#### Private Subnet: 
    Restricted from direct internet access, using a NAT Gateway if outbound internet access is required.

## Internet Gateway (IGW)
An IGW enables resources in a public subnet to communicate with the internet while ensuring inbound traffic control via security groups and network ACLs.

## NAT Gateway
A NAT Gateway allows resources in private subnets to initiate outbound internet requests (e.g., software updates) while blocking inbound internet traffic.

## Route Table
A Route Table contains routing rules that direct network traffic within a VPC, defining how resources communicate with each other and the internet.
