#provider_aws: string

#parameter: {
    provider: #provider_aws
    name: string
    environment: string
    instance_type: *"t2.micro" | "t2.nano" | "t2.small" | "t2.medium" | "t2.large" | "t2.xlarge" | "t2.2xlarge"
    os: *"Ubuntu" | "Amazon Linux"
    public_key: string
    instance_state: *"running" | "stopped"
}

template: {
    components: [
      {
        name: "aws-standalone-ec2-basic"
        type: "aws-standalone-ec2-basic"
        properties: {
            providerRef: {
              name: parameter.provider
            }
            name: parameter.name
            environment: parameter.environment
            instance_type: parameter.instance_type
            associate_public_ip: true
            os: parameter.os
            subnet_name: "DefaultPublicSubnetCreatedByIDP"
            create_new_key: true
            pubkey: parameter.public_key
            instance_desired_state: parameter.instance_state        
          }
      }
    ]
}
