variable "name" {
  description = "Name of instance"
  type        = string
}

variable "environment" {
  description = "Environment to deploy to (for tagging)"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Instance type to launch"
  type        = string
}

variable "os" {
  description = "AMI ID for launching this instance"
  type        = string
}

// Subnet ID: This variable is used to specify the ID of the subnet where the primary Elastic Network Interface (ENI) will be placed.
// If no subnet ID is provided, it will default to an empty string and the subnet will be selected based on the subnet name.
variable "subnet_id" {
  description = "ID of subnet to place primary ENI in"
  type        = string
  default     = ""
}

// Subnet Name: This variable is used to specify the name of the subnet where the primary ENI will be placed.
// If no subnet name is provided, it will default to 'DefaultPublicSubnetCreatedByIDP'.
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "DefaultPublicSubnetCreatedByIDP"
}

variable "create_new_key" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "Name of existing key pair to use"
  type        = string
  default     = null
}

variable "pubkey" {
  description = "Public key for new key pair"
  type        = string
  default     = null
}

variable "associate_public_ip" {
  description = "Whether to assign a public IP"
  type        = bool
  default     = false
}

variable "eip_id" {
  description = "Allocation ID of Elastic IP to associate with"
  type        = string
  default     = null
}

variable "detailed_monitoring" {
  description = "Enable detailed monitoring for the instance"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "User data in plain text; overridden by user_data_base64"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "User data in base64; overrides user_data"
  type        = string
  default     = ""
}

variable "iam_role_name" {
  description = "Name of IAM Role to use as instance role"
  type        = string
  default     = null
}

variable "encrypt_volumes" {
  description = "Whether to encrypt EBS volumes"
  type        = bool
  default     = true # CKV_AWS_8
}

variable "ebs_key_id" {
  description = "ARN of KMS key to use for EBS encryption"
  type        = string
  default     = null
}

variable "root_volume_iops" {
  description = "Provisioned IOPS for root volume (provisioned volume types only)"
  type        = number
  default     = null
}

variable "root_volume_throughput" {
  description = "Provisioned throughput for root volume (provisioned volume types only)"
  type        = number
  default     = null
}

variable "root_volume_size" {
  description = "Root volume size in GiB"
  type        = number
  default     = null
}

variable "root_volume_type" {
  description = "Type of EBS volume for the root volume"
  type        = string
  default     = null
}

variable "ebs_block_device" {
  description = "List of extra EBS volumes to attach (see ebs_block_device on aws_instance)"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Common tags to apply to each resource"
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "Tags to apply to EBS volumes"
  type        = map(string)
  default     = {}
}

variable "instance_tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "instance_desired_state" {
  description = "The desired state of the instance"
  type        = string
  default     = "running"
}
