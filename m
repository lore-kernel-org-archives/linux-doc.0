Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35332517A4
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948451; cv=fail; b=lZRSQfptLRjtjQPoWQVL1HvlWwcGcDArrtOd5VXqK54X5n+DUtQS8SF1r34kIBl85U1569GCBuko4NRS9bIoPPovZEI1T+nbBsIzfG38jyy4NTxHdvZkltOIK6NK2xTfbuUf6XWMYOlQdQCILFn4nG6ko9q2mHQngybXnd3WmT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948451; c=relaxed/simple;
	bh=//f7e7gNc4JWIQ1I+dcuJCCC+1N1I/D+ZdIlq7qaCEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gnUhIhIjjwiuLIJcLknFsVCcfLvluuFcS/opTB+hRgcLWk0clrzHEEpSKawoFQjQdM+nQ16WrtjK59LsNmC+GAvKywfx/626HkMhVPuWSN2W9A7+dYWRQKPOwFORAXUi5TKPEDzez2y4kjffgunfwYr5bAoIgbxwTXdbGUmIIxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=naLahmfN; arc=fail smtp.client-ip=40.107.220.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="naLahmfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT5FZnjvPKn+XUXOSz7sEbw6wpi1XfUpPbKrHgWDxz+bD8tc8lUtGpWmBhhReDV7HFozJaMLkz20kG891mEHQZ82ZL7hejp79cbxMWtdq618GxuJsJ/Y9fNvyjtZ4KQCVOW6ZnmCum/AlX/VueloZjGho1rftrIW11Od+mUSyMt3jaKnEoYug4UXov7iD1bX/X2OwDElFS8crq3gbRvSHEDfXdOl1TagAmZChg04trWpQ4UXJjGBH5mFd6KqG9UHjq0koSv3XYb8U4520ddTQzd/Qg3VkfAKPtsK3EVIxv0CYqUa5KMAE94iDTiE1W5DDFCVx5Iob7wuhx3yQo2kKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv4ilvTtWoH1vIl6nXo9XaC8Ki9+dUwiJhC5XSpur1g=;
 b=E24rmxYha+EFDH+C4aAu4SQvmLH4OrD3nDbgGWgN3GIhzFe/e+sEZ2fparsMZ6Dk2xCUPfk7hbVQQQ039+FXlL4LFGbPV/GU6PIWaKhiUUXDn/MLy1I23/9qNn4GiQEOgJZZPCWMERtC5rbKxN+FUMTWVXuIlOnSELq3g9GycjTcwHCdJX4BrkbTzaVCuYZtVMaK2xdteZsuUfXW404FO9+JZcdKfM4tDpkQDPC+u5Iygrj2Hb1jcEe5WrQSBWaNt6Wk7WB0FSGB4shJo1NSI+tnhJd6keBxp9yGKPe6rT2ENMtdABZqPY5MMY0dNNn/uwReWSpbGTiHj1GgL4l7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=zeniv.linux.org.uk
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv4ilvTtWoH1vIl6nXo9XaC8Ki9+dUwiJhC5XSpur1g=;
 b=naLahmfNcN8X9byRJCDYdYDKfotoHchOP4QM+bKFEExdbpWX1LzKwx6S7db8gSs8qKftDll/CCowQX0qzYdtp0GNQ/q9bpEUW64lCuPLVpW8FvDcKsIVOIP9ThlBwXF03y66BxgDk8vBX33hMJ1jkpOJ2dfq7r5JgoTa4PGp+NDjlGHDJNU6Gnsnat/dd3lJ9kWSeypDuAMYgNRoYipY81JXl1bW+2PfVA1nywFs0dEW6BSPaQaat/CGaXDGHHyCMjAcPl6TB9XBrR14xAZ2dyUtlRJ9cHTjAladLW3smVFSu6Ckyhw1sJrCNKMxarKBzXCXFwrIrj1cYS2Qib4Cqw==
Received: from CH0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:610:b1::15)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 17:40:42 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::ac) by CH0PR13CA0010.outlook.office365.com
 (2603:10b6:610:b1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.17 via Frontend Transport; Tue,
 29 Apr 2025 17:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 17:40:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 10:40:24 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 29 Apr
 2025 10:40:23 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Al Viro <viro@zeniv.linux.org.uk>, <linux-doc@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Date: Tue, 29 Apr 2025 12:39:58 -0500
Message-ID: <20250429173958.3973958-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 144e21a2-4910-40a7-4017-08dd8744f66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EAJNNN6mrE+TiV4RGPwdstETcl9mC9j6DI1cD39Ic6qyPGV4e9wdfAHCs6JK?=
 =?us-ascii?Q?nNHyUZCGjZVt6lIfOiob79ib19aVSThCESWWO+3WiQdN2oH7enQo1cDfqVic?=
 =?us-ascii?Q?86LhbCHeToTtYJCU8qxIXGZa1YP108Qoy3v0eOMF4DIrtJ5h+xJSpqh87iyf?=
 =?us-ascii?Q?gpS283/uh42L70y8LJo1APAdOpPinloKjxgLg1aFWfkiHXU0/zr5B2cw19JA?=
 =?us-ascii?Q?t0vxOV2zximQT9JNbkOlrqWKEm54TPox5Tf7HD3P3KVLbB+tx0wS95rCD76J?=
 =?us-ascii?Q?luAM7tzTA6d1Ly5qpafSAIEQ16p2jIwvMERapfF3oJOOzf9NyT0adbfLhVK8?=
 =?us-ascii?Q?SqhYcp2KC8Fi6fTHNsknPC7cyvAv9FaXU5l7asXQxRYRePjweTT9bAJEwic+?=
 =?us-ascii?Q?pLCZHxVVf1iCDxJ86uPb2Ac3+/PwTJyQ/4yCBUCok8RuJdHSn82A2d5lmRSj?=
 =?us-ascii?Q?ZIaGjPRs3NWUKDEvGEjRYUtOTRwLNMcQ0kDWSCdmEuJG1pcT1Vz+0GfpGq2O?=
 =?us-ascii?Q?ptNTFRj4DZmgPrPpdE7jUDqw1gO/NBmR7hncp04TJ5YnCNf96shOhci85W/6?=
 =?us-ascii?Q?QMtVkJT/oNwWXv5Wxcjum228jccpPJeYOTowIllFto+fe2ey9O70DYrpHJXq?=
 =?us-ascii?Q?ECLwmULX2tw4fHv9fp/LIj5btmQ3wYbtgthn06g1Se2Zt4VeVKErH8M6UhVJ?=
 =?us-ascii?Q?y9AP3NIywoiklqRbHd/wg3L9Wh5+zkazW2/lvz7ibGRhM0f0BDdg0/L+4BaL?=
 =?us-ascii?Q?8rUiDV5hxsLfh8nJSEFiMv33i6W6F3Tc8eL7W8y91/kw4SG52teLIkd40I67?=
 =?us-ascii?Q?udtrZGjupfW4AwkA4tXgLBHg8qauRHh9fk7DZ9oaZW0kpVnnC7K3Tq+83STS?=
 =?us-ascii?Q?SbxuKjFbh/5oQeLIuRoFNeQ6UYbn51az1PLQs4RI0Q3A9SQCbl/61GpzrUlz?=
 =?us-ascii?Q?r75IIZwGsKSRwPCOKpgC5kAYnb/3Ael08kTp9Orpq+dIptc5sN/+EP/e3jl+?=
 =?us-ascii?Q?HKDBqIMvnJzuTYZETThYFMURyp1YjAmfbVGfU4t58sFAy9a6a22qXA2RPnzc?=
 =?us-ascii?Q?LtaRypg0hbEr3gGu7Aw4yPuhNebQVHqTQGh0IqLG6buHX6LOkbREnZFa5kJ7?=
 =?us-ascii?Q?1Ju9dLl/9dPspv/98xDtnuHMwyTvziVroUfx9ebh+IlfqNm75cNjRFcHL0r6?=
 =?us-ascii?Q?YGDpesKWsY5zv6OIA+W0LE0kW2DFtb1mE6RvPynMCqyafpGFb2VBQOsxl4Fu?=
 =?us-ascii?Q?t3omB0DZOaOjHQwfVgsYTtob7IMRnuLrIspZYdgAoJsYjdQzPS0slwx/73Yb?=
 =?us-ascii?Q?BZDs0RwUsBuPhruOlXOmDk3CkfVeMjCmoI2co7F6PpQO2xTCjKvsWLUhx9kf?=
 =?us-ascii?Q?HpQwrC5wNJ59kasA+7iZgiu4RdqHHjpR1JJwdpEG0eY8G2VX3jF7Db/hE1sc?=
 =?us-ascii?Q?dWV1DVkyOupuP/g504zjgGwEMySXcHfG+al3bGb/Wr3Cy6L+ZCymaHtsuowI?=
 =?us-ascii?Q?H2OWtH2s8y+Ia4P1p/YMT2t1Czg+pJOe0FPBMCcksigVY7ZOveZTB0e6Ww?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:40:41.6967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144e21a2-4910-40a7-4017-08dd8744f66f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053

Update the debugfs documentation to indicate that debugfs_remove()
should be used to clean up debugfs entries.

In commit a3d1e7eb5abe ("simple_recursive_removal(): kernel-side rm -rf
for ramfs-style filesystems"), function debugfs_remove_recursive()
was made into an alias for debugfs_remove():

    #define debugfs_remove_recursive debugfs_remove

Therefore, drivers should just use debugfs_remove() going forward.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 Documentation/filesystems/debugfs.rst         | 19 ++++++-------------
 .../driver_development_debugging_guide.rst    |  2 +-
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index 610f718ef8b5..55f807293924 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -229,22 +229,15 @@ module is unloaded without explicitly removing debugfs entries, the result
 will be a lot of stale pointers and no end of highly antisocial behavior.
 So all debugfs users - at least those which can be built as modules - must
 be prepared to remove all files and directories they create there.  A file
-can be removed with::
+or directory can be removed with::
 
     void debugfs_remove(struct dentry *dentry);
 
 The dentry value can be NULL or an error value, in which case nothing will
-be removed.
-
-Once upon a time, debugfs users were required to remember the dentry
-pointer for every debugfs file they created so that all files could be
-cleaned up.  We live in more civilized times now, though, and debugfs users
-can call::
-
-    void debugfs_remove_recursive(struct dentry *dentry);
-
-If this function is passed a pointer for the dentry corresponding to the
-top-level directory, the entire hierarchy below that directory will be
-removed.
+be removed.  Note that this function will recursively remove all files and
+directories underneath it.  Previously, debugfs_remove_recursive() was used
+to perform that task, but this function is now just an alias to
+debugfs_remove().  debugfs_remove_recursive() should be considered
+deprecated.
 
 .. [1] http://lwn.net/Articles/309298/
diff --git a/Documentation/process/debugging/driver_development_debugging_guide.rst b/Documentation/process/debugging/driver_development_debugging_guide.rst
index 46becda8764b..aca08f457793 100644
--- a/Documentation/process/debugging/driver_development_debugging_guide.rst
+++ b/Documentation/process/debugging/driver_development_debugging_guide.rst
@@ -155,7 +155,7 @@ The general idea is:
     ``my_variable``
 
 - Clean up the directory when removing the device
-  (``debugfs_remove_recursive(parent);``)
+  (``debugfs_remove(parent);``)
 
 For the full documentation see :doc:`/filesystems/debugfs`.
 
-- 
2.43.0

