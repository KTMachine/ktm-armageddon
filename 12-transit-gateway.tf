resource "aws_ec2_transit_gateway" "australia-tgw" {
    provider = aws.australia
    description = "australia-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "Australia TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "australia-attachment" {
    provider = aws.australia
    transit_gateway_id = aws_ec2_transit_gateway.australia-tgw.id
    subnet_ids = [
    aws_subnet._1["australia-a-public"].id,
    aws_subnet._1["australia-b-public"].id
  ]
    vpc_id = aws_vpc.australia-vpc.id

    tags = {
        Name = "australia-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_1" {
#   for_each = local.vpcs.australia
  provider = aws.australia
  transit_gateway_id = aws_ec2_transit_gateway.australia-tgw.id

  tags = {
    Name = "australia-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_1" {
#   for_each = local.vpcs.australia
  provider = aws.australia
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.australia-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._1.id
}

resource "aws_ec2_transit_gateway" "california-tgw" {
    provider = aws.california
    description = "california-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "California TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "california-attachment" {
    provider = aws.california
    transit_gateway_id = aws_ec2_transit_gateway.california-tgw.id
    subnet_ids = [
    aws_subnet._2["california-b-public"].id,
    aws_subnet._2["california-c-public"].id
  ]
    vpc_id = aws_vpc.california-vpc.id

    tags = {
        Name = "california-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_2" {
#   for_each = local.vpcs.australia
  provider = aws.california
  transit_gateway_id = aws_ec2_transit_gateway.california-tgw.id

  tags = {
    Name = "california-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_2" {
#   for_each = local.vpcs.australia
  provider = aws.california
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.california-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._2.id
}

resource "aws_ec2_transit_gateway" "hong-kong-tgw" {
    provider = aws.hong-kong
    description = "hong-kong-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "Hong Kong TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "hong-kong-attachment" {
    provider = aws.hong-kong
    transit_gateway_id = aws_ec2_transit_gateway.hong-kong-tgw.id
    subnet_ids = [
    aws_subnet._3["hong-kong-a-public"].id,
    aws_subnet._3["hong-kong-b-public"].id
  ]
    vpc_id = aws_vpc.hong-kong-vpc.id

    tags = {
        Name = "hong-kong-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_3" {
#   for_each = local.vpcs.australia
  provider = aws.hong-kong
  transit_gateway_id = aws_ec2_transit_gateway.hong-kong-tgw.id

  tags = {
    Name = "hong-kong-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_3" {
#   for_each = local.vpcs.australia
  provider = aws.hong-kong
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hong-kong-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._3.id
}

resource "aws_ec2_transit_gateway" "london-tgw" {
    provider = aws.london
    description = "london-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "London TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "london-attachment" {
    provider = aws.london
    transit_gateway_id = aws_ec2_transit_gateway.london-tgw.id
    subnet_ids = [
    aws_subnet._4["london-a-public"].id,
    aws_subnet._4["london-b-public"].id
  ]
    vpc_id = aws_vpc.london-vpc.id

    tags = {
        Name = "london-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_4" {
#   for_each = local.vpcs.australia
  provider = aws.london
  transit_gateway_id = aws_ec2_transit_gateway.london-tgw.id

  tags = {
    Name = "london-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_4" {
#   for_each = local.vpcs.australia
  provider = aws.london
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._4.id
}

resource "aws_ec2_transit_gateway" "new-york-tgw" {
    provider = aws.new-york
    description = "new-york-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "New York TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "new-york-attachment" {
    provider = aws.new-york
    transit_gateway_id = aws_ec2_transit_gateway.new-york-tgw.id
    subnet_ids = [
    aws_subnet._5["new-york-a-public"].id,
    aws_subnet._5["new-york-b-public"].id
  ]
    vpc_id = aws_vpc.new-york-vpc.id

    tags = {
        Name = "new-york-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_5" {
#   for_each = local.vpcs.australia
  provider = aws.new-york
  transit_gateway_id = aws_ec2_transit_gateway.new-york-tgw.id

  tags = {
    Name = "london-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_5" {
#   for_each = local.vpcs.australia
  provider = aws.new-york
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.new-york-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._5.id
}

resource "aws_ec2_transit_gateway" "sao-paulo-tgw" {
    provider = aws.sao-paulo
    description = "sao-paulo-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "Sao Paulo TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "sao-paulo-attachment" {
    provider = aws.sao-paulo
    transit_gateway_id = aws_ec2_transit_gateway.sao-paulo-tgw.id
    subnet_ids = [
    aws_subnet._6["sao-paulo-a-public"].id,
    aws_subnet._6["sao-paulo-c-public"].id
  ]
    vpc_id = aws_vpc.sao-paulo-vpc.id

    tags = {
        Name = "sao-paulo-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_6" {
#   for_each = local.vpcs.australia
  provider = aws.sao-paulo
  transit_gateway_id = aws_ec2_transit_gateway.sao-paulo-tgw.id

  tags = {
    Name = "london-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_6" {
#   for_each = local.vpcs.australia
  provider = aws.sao-paulo
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.sao-paulo-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._6.id
}

resource "aws_ec2_transit_gateway" "tokyo-tgw" {
    provider = aws.tokyo
    description = "tokyo-tgw"
    auto_accept_shared_attachments = "enable"
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    transit_gateway_cidr_blocks = ["10.0.0.0/8"]

    tags = {
        Name = "Tokyo TGW"
    }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo-attachment" {
    provider = aws.tokyo
    transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id
    subnet_ids = [
    aws_subnet._7["tokyo-a-public"].id,
    aws_subnet._7["tokyo-d-public"].id
  ]
    vpc_id = aws_vpc.tokyo-vpc.id

    tags = {
        Name = "tokyo-attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "_7" {
#   for_each = local.vpcs.australia
  provider = aws.tokyo
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id

  tags = {
    Name = "london-tgw-rt"
    }
}

resource "aws_ec2_transit_gateway_route" "_7" {
#   for_each = local.vpcs.australia
  provider = aws.tokyo
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._7.id
}

