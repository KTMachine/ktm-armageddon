data "aws_subnets" "australia" {
  tags = {
    Name  = "Australia subnet"
  }
depends_on = [aws_subnet._1]
  
}
resource "aws_lb" "australia_alb" {
  provider = aws.australia
  name               = "australia-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._1["australia-sg-server"].id]
  subnets            = [
    aws_subnet._1["australia-a-public"].id,
    aws_subnet._1["australia-b-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "AustraliaLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "australia_http" {
    provider = aws.australia
  load_balancer_arn = aws_lb.australia_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.australia-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.australia_alb.dns_name
#   description = "The DNS name of the Australia Load Balancer."
# }

data "aws_subnets" "california" {
  tags = {
    Name  = "california subnet"
  }
depends_on = [aws_subnet._2]
  
}
resource "aws_lb" "california_alb" {
  provider = aws.california
  name               = "california-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._2["california-sg-server"].id]
  subnets            = [
    aws_subnet._2["california-b-public"].id,
    aws_subnet._2["california-c-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "californiaLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "california_http" {
    provider = aws.california
  load_balancer_arn = aws_lb.california_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.california-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.california_alb.dns_name
#   description = "Whatever let's get this over with."
# }

data "aws_subnets" "hong-kong" {
  tags = {
    Name  = "hong-kong subnet"
  }
depends_on = [aws_subnet._3]
  
}
resource "aws_lb" "hong_kong_alb" {
  provider = aws.hong-kong
  name               = "hong-kong-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._3["hong-kong-sg-server"].id]
  subnets            = [
    aws_subnet._3["hong-kong-a-public"].id,
    aws_subnet._3["hong-kong-b-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "HongKongLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "hong_kong_http" {
    provider = aws.hong-kong
  load_balancer_arn = aws_lb.hong_kong_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hong-kong-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.hong_kong_alb.dns_name
#   description = "It's getting done."
# }

data "aws_subnets" "london" {
  tags = {
    Name  = "London subnet"
  }
depends_on = [aws_subnet._4]
  
}
resource "aws_lb" "london_alb" {
  provider = aws.london
  name               = "london-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._4["london-sg-server"].id]
  subnets            = [
    aws_subnet._4["london-a-public"].id,
    aws_subnet._4["london-b-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "LondonLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "london_http" {
    provider = aws.london
  load_balancer_arn = aws_lb.london_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.london-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.london_alb.dns_name
#   description = "Pip pip cheerio."
# }

data "aws_subnets" "new-york" {
  tags = {
    Name  = "New York subnet"
  }
depends_on = [aws_subnet._5]
  
}
resource "aws_lb" "new_york_alb" {
  provider = aws.new-york
  name               = "new-york-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._5["new-york-sg-server"].id]
  subnets            = [
    aws_subnet._5["new-york-a-public"].id,
    aws_subnet._5["new-york-b-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "NewYorkLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "new_york_http" {
    provider = aws.new-york
  load_balancer_arn = aws_lb.new_york_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.new-york-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.new_york_alb.dns_name
#   description = "Staten Island is the red headed stepchild of New York."
# }

data "aws_subnets" "sao-paulo" {
  tags = {
    Name  = "Sao Paulo subnet"
  }
depends_on = [aws_subnet._6]
  
}
resource "aws_lb" "sao_paulo_alb" {
  provider = aws.sao-paulo
  name               = "sao-paulo-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._6["sao-paulo-sg-server"].id]
  subnets            = [
    aws_subnet._6["sao-paulo-a-public"].id,
    aws_subnet._6["sao-paulo-c-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "SaoPauloLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "sao_paulo_http" {
    provider = aws.sao-paulo
  load_balancer_arn = aws_lb.sao_paulo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sao-paulo-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.sao_paulo_alb.dns_name
#   description = "Rio de Janiero is better."
# }

data "aws_subnets" "tokyo" {
  tags = {
    Name  = "Tokyo subnet"
  }
depends_on = [aws_subnet._7]
  
}
resource "aws_lb" "tokyo_alb" {
  provider = aws.tokyo
  name               = "tokyo-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._7["tokyo-sg-server"].id]
  subnets            = [
    aws_subnet._7["tokyo-a-public"].id,
    aws_subnet._7["tokyo-d-public"].id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "TokyoLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "tokyo_http" {
    provider = aws.tokyo
  load_balancer_arn = aws_lb.tokyo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tokyo-tg.arn
  }
}


# output "lb_dns_name" {
#   value       = aws_lb.tokyo_alb.dns_name
#   description = "NJPW fell off after the Bullet Club."
# }