module "route53_records" {
    source = "../"

    simple_records = [
        {
            name    = "test"
            type    = "CNAME"
            ttl     = 300
            zone_id = "Z3P5QSUBK4POTI"
            records = ["example.com."]
        }
    ]

    alias_records = [
        {
            name                   = "www"
            type                   = "A"
            zone_id                = "Z3P5QSUBK4POTI"
            alias_name             = "dualstack.awseb-e-q-AWS-ELB.amazonaws.com."
            alias_zone_id          = "Z35SXDOTRQ7X7K"
            evaluate_target_health = true
        }
    ]
}