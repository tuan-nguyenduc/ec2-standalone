#provider_aws: string

#parameter: {
    provider: #provider_aws
    name: string
    environment: string
    instance_type: *"t2.micro" | "t2.nano" | "t2.small" | "t2.medium" | "t2.large" | "t2.xlarge" | "t2.2xlarge"
    os: *"Ubuntu" | "Amazon Linux"
    create_new_key: bool | *true
    public_key: string
    public_ip: bool | *true
    key_pair_name: string | *null
    detailed_monitoring: bool | *false
    user_data: string | *null
    subnet_name: string | *"DefaultPublicSubnetCreatedByIDP"
    user_data_base64: string | *""
    iam_role_name: string | *null
    encrypt_volumes: bool | *true
    ebs_key_id: string | *null
    root_volume_iops: number | *null
    root_volume_throughput: number | *null
    root_volume_size: number | *null
    root_volume_type: string | *null
    ebs_block_device: [...any] | *[]
    volume_tags: [string]: string | *{}
    instance_tags: [string]: string | *{}
    instance_desired_state: *"running" | "stopped"
    tags: [string]: string | *{}
}

template: {
    components: [
      {
        name: "aws-standalone-ec2-advanced"
        type: "aws-standalone-ec2-advanced"
        properties: {
            providerRef: {
              name: parameter.provider
            }
            name: parameter.name
            environment: parameter.environment
            instance_type: parameter.instance_type
            os: parameter.os
            create_new_key: parameter.create_new_key
            pubkey: parameter.public_key
            associate_public_ip: parameter.public_ip
            detailed_monitoring: parameter.detailed_monitoring
            user_data: parameter.user_data
            subnet_name: parameter.subnet_name
            key_pair_name: parameter.key_pair_name
            user_data_base64: parameter.user_data_base64
            iam_role_name: parameter.iam_role_name
            encrypt_volumes: parameter.encrypt_volumes
            ebs_key_id: parameter.ebs_key_id
            root_volume_iops: parameter.root_volume_iops
            root_volume_throughput: parameter.root_volume_throughput
            root_volume_size: parameter.root_volume_size
            root_volume_type: parameter.root_volume_type
            ebs_block_device: parameter.ebs_block_device
            volume_tags: parameter.volume_tags
            instance_tags: parameter.instance_tags
            instance_desired_state: parameter.instance_desired_state
            tags: parameter.tags
        }
      }
    ]
}
