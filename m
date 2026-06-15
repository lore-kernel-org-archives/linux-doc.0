Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013023.outbound.protection.outlook.com [52.101.127.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1BA3F23CC;
	Mon, 15 Jun 2026 12:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528141; cv=fail; b=k8ztlMWnzGl3dytDpnjrxf4mGwCnlQezvQyHh0sFU5IsAErpKSSu4wykx1RQDXZJSD/PjDie0g/1SqUAu6L5T/LBYpyzZqqTM0b+R+NUyzIRbqplRkr2iZXpnAMVbD9G2BJQ4/NvJZpFTyXB6zFwFhjKYJeW3qFXwAVgN0HlTUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528141; c=relaxed/simple;
	bh=tU1KfRKtIYlZNGbh+T3BzQnU7E8zdZNe1mFHyYcOSFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pr2LwKW3Yxm5uEmOagOUrqol1R77h1a5FM2sESkKLRR9gljsizJhwbOdwD5tRFp9TroKSPYefoidilrWOs6s07TV1dTeHfnYB4R8gfRMhw3+6IW9ZbUSS6VJkXHY0RCOPicRe9guuOrENVbGFxcSVgzJzoyc7gzlmz9vL/QTGmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=J5deS/Wb; arc=fail smtp.client-ip=52.101.127.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="J5deS/Wb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtTRRXUUj2plu99zMntR8jQStFRmQ+GCxkd98TokeAmptq4gdRzJtM7aw+5Xrqjk/mHi5k6pnJS6dA18eZVlDQxTYuJbRBlPu49STOMv+LpOLmlECRv3GZKT081/awBVyiX7lUD9ft0Gf5Sy3sjeIVYAW14PW16iCOCrQevfUwJSkpp8MelH+MSF5j2qLFoKUqULvps/QQ3/MsRxpJp1y+D4uJ7febg6zZfKR6HGvVkYoehEtTWhYMEFEgUJvU7oqwErd7mE1vrR2EutpMQxJ5NGDdBnxRDAmDWXIWds6zbAGMq9ibnIES4uP4sO9F40q0irC8MXax5uh+exKEKVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=;
 b=yjTa+7DoP+rOqStrP+M4KapRYFHMV8NTAnIyWUbSQyNL75j5zH7ZlNkqKwXpzAow0EcxtOuchCtwFiAMeXmqhkDgpqP3cepbF5zLc+WoED671B22Wu7nW6U757GlkivOAkVTgGU5jHs7SPnyc638klo0GhBPJkOiJmLxkQ6Bjsz/4j33Yh8uYSHAo7L8JX9qzSWGoSQJ5B5EKIg+PqVvNj4aJpQftVTruEnIFE9OiGrD+jiGDPc9JoOdPKrKZHdpJo9ByTeqmZUcfWuPMMUjdWZ87gI77+DTfYFG2F1UXCJ9HR0fvbrWIWwmERcDPcA5eaoTp0a59bG15ErA99rBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=;
 b=J5deS/WbnSIsVuVPUt45fmkqGV4tLYWJa1TSOaPekpB57P35iqCGqnoIvlzfE+1WK3OguA9flQMkFhjxIys8tw+k37nXtcs/hqVQy6bYLNy3J4YdSL9ZZBDiF0gKd/K6JFmqZuE4g1xUiMQUl3RlQS2Bi1mGGeqrEEhTe8YU1FehQguqKm8M6c8r0j6yMsjOoIonlD4CgKr6fZBd0Crdb+f9jwhEPurTIGTp8y+eiFxr/nta+VJppJAmBn7NW0i+IxNVXkO1w9JFjF37UNzv4Bl79Dww1yFqx8cq59u8nMouVtgPkWU0jwR5OloRdbp6jZsXeQv6/9kh+DeP6/FjQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSNPR06MB8687.apcprd06.prod.outlook.com (2603:1096:604:493::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:55:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:55:37 +0000
From: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Subject: [PATCH v3 3/3] Documentation: f2fs: document encrypted inline data
Date: Mon, 15 Jun 2026 20:55:15 +0800
Message-Id: <20260615125517.362294-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615125517.362294-1-liaoyuanhong@vivo.com>
References: <20260615125517.362294-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSNPR06MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b96b41-fad4-493c-2777-08decadd6577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	gFUMCw2goqyQImWsmImYLzdpjhb2F7KZo3r2WwsY4QfFRjzCmeWK200HRy5QNRu892yPqdFMNTPd6rC066e9bzcMZSuXCTwLE3oI8aeK53Dese+UK/2JghOHxtj0w+ZWA25uyXNyBSgJDe/hBdBZcY0vTpoWF7Xngb5SY9/6HgQ4okaS0VLOTQ9GDXO42TLezARvRh+ek/0MDk4w05mfNBjgYHupIwQIIDVq+sdvquU1Z5899EoKTkgD4DmlrORjKdTMyVLv5jVrGVezw6y8duOD5RGGYbk6245ghnyEiQFGnbBAnFmNnIcjUjuVdg+U+FfjVZlHLkPmq/gp14avSDD+s6Qj6SpgEnYzb5ee31S99c8NJ88sTMlNXhXWnYMj0sCOCvjcfuwahsGWCdgLz5ferVD0E7hU8y8cv7It37IIKxe2zSmB4UVfrKKKSWdYDOEfwO46XllmAIez8ULZoX895W035hiVb7nyExX4ScQqL+z3zeCYp5cFgwDYy4d0AfSXRBcm2FH54RUdRqM3CT8HOL9s1xinYPGY1NKCHyFn2wJd4/7rZBs5gzbBxODn62wOGJWEBX1UOsODTY+uvxtSPa69kuUVuBpjatA1rV4b1LXgxwvTGwhTh+kNmS0IfCoFS978HTTE25VfoX4Cvhs45M1HHSgJwjr7lWzAt4h24DkaJUlPXXhzMUWWXBUDl8zwj9nSONYoxKLu29vqxxj3SFLeuXWrUj3+BLgIGXutn+RovSIaCrvDFdDfZVsv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tv6R5Uclmm8iLjY1gBbXkC+925wSo2vaAs0axw+jglcP/xtx1B0gWbBPWS9c?=
 =?us-ascii?Q?bOKf8fSI5OCUz++CADsN+oc+4gVlPtvDr/A+BbDmGKcD0u5N7ayrWYb10F9r?=
 =?us-ascii?Q?YW7ZmidpLQNCp4pdMLwDHQKb12t9EdfxATcdYYX7N92PKNDCxqlavg/yNvDH?=
 =?us-ascii?Q?6RzNfhka68iQ2liHbobc8mYK3bZyz61HD7m+TCRbgiFVBK6wI0vPy1PtyFm/?=
 =?us-ascii?Q?zgODeCqhx2ghsFZJnciozbskEY1HbaWCeyY+m5yNvxOK+0C+F24/Ej5JDuH5?=
 =?us-ascii?Q?JoLedpTQVtbBTKRtOCJbxM7/dlgDcXSG6sr2m/ZhuRU33zxdQg7b9q/2ccOf?=
 =?us-ascii?Q?fiZTrToHK6wJFP0Cz96QURAee1WNYo2IxEHfX6lNAUM+JGbik30JjIxuDtKl?=
 =?us-ascii?Q?wj/YphVn8fCH9YyCNprlz+JeMHiYgKpzncUH4k9MuE0l/p9OOK2Mc/NuxUr7?=
 =?us-ascii?Q?LKSwGlaLj1YWElp8Ign9aB+ULQZXhCbB5ER6nPDaXKdRZWd5CLWMFVLa2Ylt?=
 =?us-ascii?Q?DuBhv3N92niZvAREhfWhxz6nGm9/UIJ9iE8Hr0bAiJ48+jtHmRVgx3+J5XGg?=
 =?us-ascii?Q?DCV1FuLaazWcro++TMfEOavPAt0RsD2boqhyjUkD9HV6QtciPnaqlhj+Q6sN?=
 =?us-ascii?Q?Q02VKuwK5KgmPF7DGTJAyEUXlnsoe6MP2OTs+6mn4lSvUzxrCI8DPrl4y+1T?=
 =?us-ascii?Q?y/7lMKV3UFTN/oWiJboxw5GaZCH5fwSh3fMY+ER8SKlhbyrIUulX8oFuR/7I?=
 =?us-ascii?Q?ekQj1yU6JJDbxNEI/JBQwf97x2DZm4lQxUSG60K9Kx7Q1QRw+f038jrA0LNM?=
 =?us-ascii?Q?oKZg+lzN0hZqqBTTDDtOgRvOSaeKIfk2qLiMtFONBi5Vrg4CrAYi3c2/EKWg?=
 =?us-ascii?Q?jK5vjEFYNgLaj0JCtYxGdJGtzPHsIJRAvOeltAn1LVDMdam7dRmbmePH/sHU?=
 =?us-ascii?Q?JE3+qWUUjDplnm6dMonqGMXpEVd7BXaAdhqsOxzcq/wnxEfh2UqqRKj4n2B0?=
 =?us-ascii?Q?NnTgJlQoWf2rZFQu6tZzjn1tHf3Ac95eHq807j8BwYprscUzI4WO3lKoPdeF?=
 =?us-ascii?Q?qNGweX2QwjaL1s6FbbpnjWEconrpv8FTQi5ay+ML/+vmiBn1D50MzEjYRaCD?=
 =?us-ascii?Q?tWlojDOIGi6/ygms1wt5rUnTgNGpC1UAKe++vGNowfGGB7X5CHtLALqiZ0Da?=
 =?us-ascii?Q?oiLDKisaubtvh925gMNHdmmAlzZkh3tkdxh19MpwCpao0+8W5Hc0xGxOtaHP?=
 =?us-ascii?Q?D/iD/1jtCPlrSIUVI/xuF7DTRtNEYIrpJizhjAIw+hChG7em3zF3e2ZCW1lP?=
 =?us-ascii?Q?S0uvmPOrY3g/lG2CNpSTFzqsRbOpEM2jHiHsiaDbMnOhRIPHRuU30kwhc+zL?=
 =?us-ascii?Q?3QN8xvV/Dexz9qd2zkMXjQGNx1XYyXCse6U48V6NVrJHm9gEMjcF0VgfHc1D?=
 =?us-ascii?Q?0I/KB2GuoRDqqizWnteGdlx32+GF8AxzNoraspQesX1sV2sUcAZXMZUwXP1p?=
 =?us-ascii?Q?nkd17+3o+ep0eipm5b1Ny/XXcf3+h7s3Ev3nQfnntPChoYmLoxNQspMXND70?=
 =?us-ascii?Q?YPiNfzy0r8CgqVEj9MTKYN7OLxjZfaCVl0IscOSv3wo3whof0jgD736vCcYz?=
 =?us-ascii?Q?y++BiBrCU/+sJUvo8MIInFhLQRVtZzFtb6oCc28kz+UIPY6XQwpkLLL61x8g?=
 =?us-ascii?Q?hmxZAJvBppAz+/s4IVKK53vTcgmyYuttw8iQENo7YdJWOVmmdP2/oPpCXod3?=
 =?us-ascii?Q?fO6nYTPV1A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b96b41-fad4-493c-2777-08decadd6577
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:55:37.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +26W8Q2e9C2D839s96X/VhKir/YGy9ubv4NVG17pv+Ow1f8xPbQ6DrY48gF9NYYecNGpZdKMSF5r+SD4XQR9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8687

Document the F2FS encrypted_inline_data feature, including the on-disk
feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA dependency,
how inline payloads are encrypted and decrypted, and the truncate behavior.

Also document the supported key combinations.  Files using filesystem-layer
encryption reuse the normal software transform.  Inlinecrypt is supported
for v2 IV_INO_LBLK_64/32 policies, including hardware-wrapped key
configurations supported by fscrypt.  Per-file inlinecrypt keys and
DIRECT_KEY policies are not supported for encrypted inline data.

List encrypted_inline_data in the supported F2FS feature sysfs
documentation.

Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
---
Changes in v3:
- Update the documented key support matrix.

 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++--
 Documentation/filesystems/f2fs.rst      | 30 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

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
index 5bc37a1c4e51..651e84e8dd98 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -420,6 +420,36 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
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
+the inline_data mount option.  Files using filesystem-layer encryption reuse the
+normal software contents-key transform.  When the normal encrypted file
+contents path uses blk-crypto, encrypted inline data is supported for v2
+IV_INO_LBLK_64/32 policies, including hardware-wrapped key configurations
+supported by fscrypt.  Per-file inlinecrypt keys and DIRECT_KEY policies are
+not supported for encrypted inline data.
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
