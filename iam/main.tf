provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_user" {
  name = "TJ"
}

resource "aws_iam_policy" "custom_policy" {
  name   = "S3EfsEC2"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"elasticfilesystem:DescribeBackupPolicy",
				"ec2:GetIpamResourceCidrs",
				"ec2:GetInstanceUefiData",
				"ec2:GetIpamPoolCidrs",
				"ec2:GetImageBlockPublicAccessState",
				"ec2:GetSnapshotBlockPublicAccessState",
				"ec2:GetEbsEncryptionByDefault",
				"ec2:ExportClientVpnClientConfiguration",
				"ec2:GetHostReservationPurchasePreview",
				"ec2:GetRouteServerPropagations",
				"ec2:GetConsoleScreenshot",
				"ec2:GetLaunchTemplateData",
				"ec2:GetSerialConsoleAccessStatus",
				"elasticfilesystem:ClientMount",
				"ec2:GetEbsDefaultKmsKeyId",
				"ec2:GetRouteServerAssociations",
				"ec2:GetIpamPrefixListResolverRules",
				"ec2:GetIpamPrefixListResolverVersions",
				"ec2:GetIpamDiscoveredResourceCidrs",
				"ec2:GetEnabledIpamPolicy",
				"ec2:GetManagedPrefixListEntries",
				"ec2:ExportVerifiedAccessInstanceClientConfiguration",
				"ec2:GetNetworkInsightsAccessScopeContent",
				"ec2:GetReservedInstancesExchangeQuote",
				"ec2:GetPasswordData",
				"ec2:GetAssociatedIpv6PoolCidrs",
				"ec2:GetSpotPlacementScores",
				"elasticfilesystem:ReplicationRead",
				"ec2:GetAwsNetworkPerformanceData",
				"ec2:GetImageAncestry",
				"ec2:GetIpamDiscoveredAccounts",
				"ec2:GetResourcePolicy",
				"ec2:GetDefaultCreditSpecification",
				"elasticfilesystem:ListTagsForResource",
				"ec2:StartDeclarativePoliciesReport",
				"ec2:GetCapacityReservationUsage",
				"ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
				"ec2:GetSubnetCidrReservations",
				"ec2:GetConsoleOutput",
				"ec2:ExportClientVpnClientCertificateRevocationList",
				"ec2:GetFlowLogsIntegrationTemplate",
				"ec2:GetSecurityGroupsForVpc",
				"elasticfilesystem:DescribeLifecycleConfiguration",
				"elasticfilesystem:DescribeFileSystemPolicy",
				"ec2:GetActiveVpnTunnelStatus",
				"elasticfilesystem:DescribeMountTargets",
				"ec2:GetIpamDiscoveredPublicAddresses",
				"ec2:GetCoipPoolUsage",
				"ec2:GetAllowedImagesSettings",
				"ec2:GetCapacityManagerMetricData",
				"ec2:GetAssociatedEnclaveCertificateIamRoles",
				"ec2:GetIpamAddressHistory",
				"elasticfilesystem:DescribeTags",
				"ec2:GetCapacityManagerAttributes",
				"ec2:GetDeclarativePoliciesReportSummary",
				"ec2:GetCapacityManagerMetricDimensions",
				"ec2:GetManagedPrefixListAssociations",
				"ec2:GetInstanceTpmEkPub",
				"ec2:GetIpamPrefixListResolverVersionEntries",
				"ec2:GetRouteServerRoutingDatabase",
				"elasticfilesystem:DescribeMountTargetSecurityGroups"
			],
			"Resource": "*"
		}
	]
}
  EOF
}

resource "aws_iam_policy_attachment" "policy_bind" {
    name = "attachment"
    users = [ aws_iam_user.my_user.name]
    policy_arn = aws_iam_policy.custom_policy.arn
}
