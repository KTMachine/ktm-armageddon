resource "aws_autoscaling_group" "australia_asg" {
  provider              = aws.australia
  name_prefix           = "australia-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._1["australia-a-public"].id,
    aws_subnet._1["australia-b-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.australia-tg.arn]

  launch_template {
    id      = aws_launch_template.australia-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "australia_scaling_policy" {
  provider = aws.australia
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.australia_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "australia_asg_attachment" {
  provider = aws.australia
  autoscaling_group_name = aws_autoscaling_group.australia_asg.name
  lb_target_group_arn   = aws_lb_target_group.australia-tg.arn
}

resource "aws_autoscaling_group" "california_asg" {
  provider              = aws.california
  name_prefix           = "california-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._2["california-b-public"].id,
    aws_subnet._2["california-c-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.california-tg.arn]

  launch_template {
    id      = aws_launch_template.california-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "california_scaling_policy" {
  provider = aws.california
  name                   = "california-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.california_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "california_asg_attachment" {
  provider = aws.california
  autoscaling_group_name = aws_autoscaling_group.california_asg.name
  lb_target_group_arn   = aws_lb_target_group.california-tg.arn
}

resource "aws_autoscaling_group" "hong_kong_asg" {
  provider              = aws.hong-kong
  name_prefix           = "hong-kong-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._3["hong-kong-a-public"].id,
    aws_subnet._3["hong-kong-b-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.hong-kong-tg.arn]

  launch_template {
    id      = aws_launch_template.hong-kong-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "hong_kong_scaling_policy" {
  provider = aws.hong-kong
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.hong_kong_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "hong_kong_asg_attachment" {
  provider = aws.hong-kong
  autoscaling_group_name = aws_autoscaling_group.hong_kong_asg.name
  lb_target_group_arn   = aws_lb_target_group.hong-kong-tg.arn
}

resource "aws_autoscaling_group" "london_asg" {
  provider              = aws.london
  name_prefix           = "london-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._4["london-a-public"].id,
    aws_subnet._4["london-b-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.london-tg.arn]

  launch_template {
    id      = aws_launch_template.london-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "london_scaling_policy" {
  provider = aws.london
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.london_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "london_asg_attachment" {
  provider = aws.london
  autoscaling_group_name = aws_autoscaling_group.london_asg.name
  lb_target_group_arn   = aws_lb_target_group.london-tg.arn
}

resource "aws_autoscaling_group" "new_york_asg" {
  provider              = aws.new-york
  name_prefix           = "new-york-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._5["new-york-a-public"].id,
    aws_subnet._5["new-york-b-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.new-york-tg.arn]

  launch_template {
    id      = aws_launch_template.new-york-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "new_york_scaling_policy" {
  provider = aws.new-york
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.new_york_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "new_york_asg_attachment" {
  provider = aws.new-york
  autoscaling_group_name = aws_autoscaling_group.new_york_asg.name
  lb_target_group_arn   = aws_lb_target_group.new-york-tg.arn
}

resource "aws_autoscaling_group" "sao_paulo_asg" {
  provider              = aws.sao-paulo
  name_prefix           = "sao-paulo-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._6["sao-paulo-a-public"].id,
    aws_subnet._6["sao-paulo-c-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.sao-paulo-tg.arn]

  launch_template {
    id      = aws_launch_template.sao-paulo-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "sao_paulo_scaling_policy" {
  provider = aws.sao-paulo
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.sao_paulo_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "sao_paulo_asg_attachment" {
  provider = aws.sao-paulo
  autoscaling_group_name = aws_autoscaling_group.sao_paulo_asg.name
  lb_target_group_arn   = aws_lb_target_group.sao-paulo-tg.arn
}

resource "aws_autoscaling_group" "tokyo_asg" {
  provider              = aws.tokyo
  name_prefix           = "tokyo-auto-scaling-group-"
  min_size              = 3
  max_size              = 6
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet._7["tokyo-a-public"].id,
    aws_subnet._7["tokyo-d-public"].id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tokyo-tg.arn]

  launch_template {
    id      = aws_launch_template.tokyo-lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tokyo_scaling_policy" {
  provider = aws.tokyo
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tokyo_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tokyo_asg_attachment" {
  provider = aws.tokyo
  autoscaling_group_name = aws_autoscaling_group.tokyo_asg.name
  lb_target_group_arn   = aws_lb_target_group.tokyo-tg.arn
}