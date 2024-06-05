Description:
  - Using Terraform Create a VPC with a private subnet and a public subnet each in 2 different AZs. Create necessary Gateways, Route Tables, and add subnet associations.
  - Create 3 tier architechture using terraform:
      - The NGINX server should be on the public subnet, acting as a proxy to a backend server located in a private subnet. The backend server should also host the database.
