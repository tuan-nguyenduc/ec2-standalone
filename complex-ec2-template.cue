#provider_aws: string

#parameter: {
    provider: #provider_aws
    name: string
    environment: string
    environment: *"sit"| "uat" | "prod"
    instance_type: *"t2.micro" | "t2.nano" | "t2.small" | "t2.medium" | "t2.large" | "t2.xlarge" | "t2.2xlarge"
    ami_id: string | *"ami-0c55b159cbfafe1f0"
    create_new_key: bool | *true
    public_key: string
    public_ip: bool | *true
    detailed_monitoring: bool | *false
    user_data: string | *null
    tags: [string]: string | *{}

    subnet_name: string | *"DefaultPublicSubnetCreatedByIDP"
    key_pair_name: string | *null
    eip_id: string | *null
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
}

template: {
    components: [
      {
        name: "aws-standalone-ec2"
        type: "aws-standalone-ec2"
        properties: {
            providerRef: {
              name: parameter.provider
            }
            name: parameter.name
            environment: parameter.environment
            instance_type: parameter.instance_type
            ami_id: parameter.ami_id
            create_new_key: parameter.create_new_key
            key_pair_name: parameter.name
            pubkey: parameter.public_key
            associate_public_ip: parameter.public_ip
            detailed_monitoring: parameter.detailed_monitoring
            user_data: parameter.user_data
            tags: parameter.tags

            subnet_name: parameter.subnet_name
            key_pair_name: parameter.key_pair_name
            eip_id: parameter.eip_id
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
        }
      }
    ]
}
