Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012063.outbound.protection.outlook.com [40.107.75.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C538E8B0;
	Wed, 13 May 2026 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666700; cv=fail; b=NmDyhjHLowzpFb6ibfeNhIQU8TQGf6lmJOOV3p1bcQk0rE0yJel+dGH/+cf4ToSLTWReBSVa0Qw//bcU9dJUudROud0U/dJ4GYIY19nzV8rH258GAcSNwEA2Me/BMrMw3X8f/KcC+uABo52H3CSCMwOlTgVScUKOwRYs24pjWGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666700; c=relaxed/simple;
	bh=/F5DKzJR0e91a6Mw9HiUd48arqAO8kVHMUU88TSq8LM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KVnsYQu0cPuBkrk1l1N3J8OGGjbhf9HBDAu++eQFvLuplHdau+GFPzRybYa9Ci2lNw+Lx05fM5xBs+uhqdwwzQykBmUThUjinwOIZ79nqHN+PN5u9SeRsXq9N7jSnNrA0eaGPoxqTe3sVqTSs6cDXeygS/RrKpHpsArQO5iwJDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=h2gZH/xZ; arc=fail smtp.client-ip=40.107.75.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="h2gZH/xZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGs76JUK8sE5hOU3CnCwWgqcbJZy9yb+0pQVvb3NDPwfWiwufsyCjZ3ixMT0WvDIVHzzpp5WOp9l0TgzjHH37i12HAI8/4QEjuPdi/J2VGbc7AXwLe0CGZAYIegT1qUFrrdcthhPG2ZO6klsbNss7bf4LTGkG1NT6+t5uGxKunUBufBK1/raGEIU1ut34MA5GA1sNn9C45sAUohGw2yaKvA2zJg+XtgH5Q8vRelAnGl98ggtB3rJ5TLi/21Be7vD8SPwsyEqXiOxLOGBgNxCPM/a+heM5BX3NlwnQHbV6UhjzLoBZrvwCC00b5CGDTSI6oupg/JALaA6qq0icg0sjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zihDLH9cXne2s1Uy6IVFERErv70lE3luW+XJUdZQU/c=;
 b=a1XcgbGciM/azyVbaSr80jFxldLDJ7ktxJlWZZUbS3gGg2SUdfS71Kzke8DHO6KODOEYD1/VrTAjfK7uI0wCfO1UJJF/Kn58019Y6xhcGcQV4Fyja5ekGuwSr83EF+5cWFY/A8qh2FUh/77JiwInkhsid0wycYfuDX1cpdlp4ecb2Li66vZLyKq8MNPdLfJifwy9Gpq+nHf/WqMxtHYAcGGMMvARJvgxUVIRqpxHfn7toaEsgroRov1Hc9HoJ2eVBkxTbh0rTMgIyjWhJbI87N6CHIGjzGjvRwsyYNwTOju7Fkk2mQ5gQVT05CSubFj9FhhnJEZTz6hWmw4Ps/ej6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zihDLH9cXne2s1Uy6IVFERErv70lE3luW+XJUdZQU/c=;
 b=h2gZH/xZeLQ9j45kN5OndovD1vohmho+tDpzBnOkz2iZwOKpSAcBgXF+xgV+O8GfbgFxMf2GS+3DNuoklYwDEezojxTGhYqhi8hJhToU1YmEWbJyUgqyIIiNGsG5QfzHw3mSvl5ysHvqPGkzfQVcXpKar3mR58lSBUtRUPMRpA/xUAliJ0mnYSXNZNbh8O32kAfjn5F/wA4Lh60CQiBUJfwJqtNkFemDhsUmw+f5iXXMlMlAjT2jqtA9MnEukoIWvLuNn+0OY2MRAOOkmesCdTpgaN/k4ZGVjPZIePvccfU6UMacsq+fYrbSbwqQO3WiGefEwF8xs5k6kJq0tS2gsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:04:53 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:04:53 +0000
From: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/3] Documentation: f2fs: document encrypted inline data
Date: Wed, 13 May 2026 18:04:30 +0800
Message-Id: <20260513100431.299904-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513100431.299904-1-liaoyuanhong@vivo.com>
References: <20260513100431.299904-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0031.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::12) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: f34a766c-db3d-4e23-e2aa-08deb0d713ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|11063799003|3023799003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	N+ncZ3OX3e/DI4ivZamos4sGwuO4yW4cOz8qmkpONdta+ae/E6GBEFNRdUeBzkPshExHPlyhPmGMJ5CbpRizwl2xcikkudMbKsd/IurhHWDzzeD8rioQeP4tn6QfX1LOVUJlTajtBzCMz+h5LYFBCfl/vSydVSbdX5k+hXsACwDQubOoTmaUEMZDF57W4ypUqe/Qv5QspBjr4G+kdcrHMztZloVtY8Klj/PelOv/kSfU9qU/6dK6euOnNPm4XsPpcKgzo+7cuK1F/Hb61VpB4DL5uH6jHdZPlGgLokShjfaIyBerbrCvqVf2dBKUy0tG1XO6PZwW8JYFoBL74dBWY4dhKEJybmaHoUxyOPeh5QhwBpnNfaHfpF/WZQ0JSejDXdlzIYnTsUG4JxcVURBKXsVNMI4VnKA6GbFHL2TyaFNxmYkhhSJSeKSsqyAK6KL6i1giALi4eqoxofbSkipkrLLKh0ynUX5B7yV7FQtjkXK/Sce91gbat5sha2G/lnbVemhQtdwHi+BpvJPZMAtqARppibPjw0kcCvXk5+9UjcR/sHja7gPWSNO8Es0czht/MLpBX6RQhh3xLlKqze+4cjgPymr9QiDFGdYlszy0KziDBYhTv6VR1rFhbnJBQXq/6eMYAWWd/w6kiZ0QNuDeXhVJTUT6ChgM8aX6H7V1OalkK+vMdnZeVJQBGlgSroJnPJf4DlxCbtI76xCzztqyE1K2p6wkFEti+IFnJmfUIf14TaoDfPqjEIt5UdMU3nnA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(11063799003)(3023799003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OMwLQPhaWDMFEO7ti6SnR4cCijYYGs4CHhinNJB+5kYVfj5N2SY6BKyM1EJu?=
 =?us-ascii?Q?9e5g6vPncTHVKzr4UurybMF468LAWOL3WoIrkEWpIwM6IMLTvFe8bOKDzy0x?=
 =?us-ascii?Q?VPfk7pN4+0Dy0aqAdFEJspr7vt+rc3OLr2X0yDySMW7tgnl7c1LTXxQcOpbE?=
 =?us-ascii?Q?yyhzQVYNA04GSXgt7M3PiCPEXNwQcPVXaDWrC9GFCb70mjNcWNID39SXIXbm?=
 =?us-ascii?Q?PvSH0wvVvLplMWwy1umDxYzL5VTOI+KcLvEk1p+HtHrVkin4+nH7KbZPBnZs?=
 =?us-ascii?Q?CiicasPFR2Lx53l7+RZmKRd4Z5ZEk5i8PQ8eFvfuTB9ePRUyi4//+3xHat/S?=
 =?us-ascii?Q?7vdd9YSQ5NXt0i4jEujF/aIldcAcoI32q+KWeY0/uNp02BH31XojIpBACpGQ?=
 =?us-ascii?Q?H8HATL8r5plZly8971L4/8Z3PjmH4A1IaXQh0vjc3QUMaGhfIOHnA57HEFiT?=
 =?us-ascii?Q?8xftHeZz0RNqeXIb3vemYgLxxlxxN+H9AaLk0O4PgRpnuVetbyEuE1ncp/gV?=
 =?us-ascii?Q?1dsXt4uGnOyqRGF/SCP1L+tJ5Y77Crtuuuij9/h/jnzR8i/OXUT3oU+r3vGw?=
 =?us-ascii?Q?yACoxBJbzBzF5wRiV5Y0aHgxhGY3GnRxfsq6dOUI71iY81ME1bB8SnRvzCTJ?=
 =?us-ascii?Q?8L2YOpS8xkfkcZBKqYtwCh76rDNG/sqfoXDhqrSwvAb/pCqnHqpyeOHJTnQ+?=
 =?us-ascii?Q?OJsOpC7NqkDQxJkr5ja4fnAEBgB4BpdmjrKE+jeMo0WiX2mzpsP6tFchSxOP?=
 =?us-ascii?Q?gcJq0ngvYN4ox/ZqjUZFMWi17/TrHgtMaa8+lNYWH/OEHQDDN7+QAh6c7Id5?=
 =?us-ascii?Q?SzCaNbHK7eSb3NMDsJagLAuP/ZXH/gUKQXpfSRrd7k/qm7qe1KU8HoLGt1J1?=
 =?us-ascii?Q?mJmJJT4PjlFgwY9cYw8Mm6J8ELyqgdUEzeR/O8tG1Zie++ogmmqGWzxLBchM?=
 =?us-ascii?Q?6DyEF6FYMcu/p6h2bduunG+c9IGMVxyh5jQu4bpt6JqtJYXTzWHvFaSv7OrA?=
 =?us-ascii?Q?uGL0KyluNUGox70U1NkSeF0tPDv1vgMWsZKsUNG+etPETKYxAoQL9UaomGJU?=
 =?us-ascii?Q?/gSaFl+eOIi/OXukH5QXFjBdKgdrIFESvAcuL+aOQU4zucrkSkAxBk+OEB/8?=
 =?us-ascii?Q?9E+RMJb1+LEAxhuWfDBbLas4BAauK0fulOyB6ZVJJlK3e/CQ4oGbtTwPqzmW?=
 =?us-ascii?Q?PgYTlauk/prw65223UoKU7DPaE5KpSgjUNaaR0aa1fXDG1zv7Iwgrz92phJ5?=
 =?us-ascii?Q?8LRP+dfEDFw5Fz3FbN7IGudTVxI3/pNQc6GDouVL3JBlO6JjJ8+F6nkDxwpu?=
 =?us-ascii?Q?WZHElkXGA0UlKLkcvFjCj/VGJ2rNjmxxne2cY8FkKGgD5zH64bRyBMZxzBSp?=
 =?us-ascii?Q?I9cIXndB68ZNcrxvaNUwTjMY+GrwCW/C3kUxgbBVGqrgjGgkYOjNofzaHqrf?=
 =?us-ascii?Q?fTFhYIifWEdYEhkK9CpugdrFBr9UtkB/mHNPhMxknwMZvWDgZS8bAPmrBgMb?=
 =?us-ascii?Q?QjsXgDOWSZXfsAPOwM02JRpGKAGeJKBPkVDrsecdUWmUibkLCf4J4Er/t+0J?=
 =?us-ascii?Q?Ef37xlIFSWBjVOXhACwSBKF1V/HqkE8X/VS9G45KqmkPA1v7P/6B9sveHYHj?=
 =?us-ascii?Q?mYqwksM/UoGRAKzG1sLBd5qc0PnhsY67BzY4X13TklYLbB3QrpP8byl/T/nz?=
 =?us-ascii?Q?uoBTmtYXwuiXQC4Yo/P6Sxqd26qyVHry2a5XfHx/t6mYWHeikRwJcgd+ZKgf?=
 =?us-ascii?Q?u3orOZSUig=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34a766c-db3d-4e23-e2aa-08deb0d713ec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:04:53.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Xq28HCsQKw5dtIs4+fThb/kqcYzbsAsdmg0AvUiOPjzmCr41hngTVvwxww2P4x3zUMz3M0jSLv+qMbWMTUaMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884

From: Liao Yuanhong <liaoyuanhong@vivo.com>

Document the F2FS encrypted_inline_data feature, including the on-disk
feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA dependency,
how inline payloads are encrypted and decrypted, and the truncate
behavior.

Also list encrypted_inline_data in the supported F2FS feature sysfs
documentation.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++--
 Documentation/filesystems/f2fs.rst      | 27 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 27d5e88facbe..dad483fb2fc1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -258,7 +258,8 @@ Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
 		encryption, block_zoned (aka blkzoned), extra_attr,
 		project_quota (aka projquota), inode_checksum,
 		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
-		verity, sb_checksum, casefold, readonly, compression.
+		verity, sb_checksum, casefold, readonly, compression,
+		encrypted_inline_data.
 		Note that, pin_file is moved into /sys/fs/f2fs/features/.
 
 What:		/sys/fs/f2fs/features/
@@ -271,7 +272,7 @@ Description:	Shows all enabled kernel features.
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
 		atomic_write, pin_file, encrypted_casefold, linear_lookup,
-		fserror.
+		fserror, encrypted_inline_data.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 5bc37a1c4e51..1f3e02352dd1 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -420,6 +420,33 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			     ================== ========================================
 ======================== ============================================================
 
+Encrypted inline data
+=====================
+
+F2FS normally disables inline data for encrypted regular files, since inline
+data is stored inside the inode block and does not pass through the regular
+block I/O path.  When a filesystem is formatted with the encrypted_inline_data
+feature, encrypted regular files may keep small file contents in the inode
+block.  The inline payload is encrypted with fscrypt contents-key semantics
+before it is written to the inode, and it is decrypted back to page-cache
+plaintext when it is read.
+
+This feature requires the encrypt feature on disk and kernel support for
+CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA.  It is intended to be used together with
+the inline_data mount option.  When the normal encrypted file contents path uses
+blk-crypto, fscrypt also prepares a software contents-key transform for the
+filesystem-managed inline payload.
+
+Encrypted inline data is stored in fscrypt contents-aligned units.  Therefore,
+the maximum plaintext size that can stay inline may be slightly smaller than the
+ordinary inline data capacity.  If an encrypted inline-data file is truncated
+from a non-zero offset, F2FS first converts the inline payload to normal data
+blocks and then applies the truncate operation.
+
+Recovery copies inline payloads as on-disk bytes.  Encryption and decryption are
+performed only when moving data between the inode inline area and page-cache
+plaintext.
+
 Debugfs Entries
 ===============
 
-- 
2.34.1
