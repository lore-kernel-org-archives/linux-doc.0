Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11020112.outbound.protection.outlook.com [52.101.169.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B11CA84
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732010112; cv=fail; b=jgHuH0u7Z40/PdVn7ERNFxyR9h6K1ZhuV7Si0fNtpyxGYe8uAl2h/S8ukNKOAOeXz5wht+mMeSDo87JrQpCGp0cQl3X1pArofc5DbSkLzicP3Ou6J/A54ztD3HEtFeVxwwrhCPykgE0ATIarkwm6LqXcusrJyf0ZDVJUThWgocU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732010112; c=relaxed/simple;
	bh=QMAPClaydXgjpC671bYH2G+9ryQuTrm5OaCU5xwjWkk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Fj7qn5hWOttuReolKsPq/mrcFc0I6fyk4J2uj8LPcJKSzOEooJX6FeKoa4kcJSpm9FpmwYRLvdGJurk4SCNPQMSgVLPcd97VM+XJplIrQKWU51JCGUmZ15oH9hYiZjQcbpsdvfUL1rVEHsYFkt3wn8JZNhkZIE6wevJdZUiqDVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=FGn+VD6F; arc=fail smtp.client-ip=52.101.169.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="FGn+VD6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZSToXfVB1k3Lw+TJ7j3G8Di+0CimJQYFSfg7HPnsfKIDgZuRt8L8u/DTcz5ncM2Wk2OyH/OYLKNEEqogWr/mTGnGkW1juj6FO82cH+u7nY3HNOEKI3ifruWRH4mtADnDvdwrTdz+3hBEBL01nQ4UzX1eDTHQPvJFZF0tuiT0U1Z5TF6Xv6oujR7dyE6VyDZf0+btqIObzDIkl8X7cbrm/tw6SjuujNL4bzpCyIuHXRZcLg1f5PZLTILHCjcWdZAV4Up5+zhlig6fZ/DsLDLORodYE0RNO9EysxnsMe8GQDbj7jgruZxll0wk03oPGJsnW/vnadUyXrtvVCxyS9R6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSGYBkhnKrFXgLMfW6v8tpysEMivjl8F80dt9MdEbEQ=;
 b=e1pJlwjqztA0dL7nJ5X9B659HVGCfRadBmt7j+6sFr1T+XJAiMhzq37Jxg3/NTG92e8NfoaVUcPAtGFJpOj2773i9WWQ+jz4HiQiA6aNNkvaCA8+oWna9nQZdhy9niZCM3OcBHntJS9X1t539XJVDX0Ih5V7MkG+OVitb55UaS3FO678rEHyHxKG7GpX89sPyV3pCukMKNqGoHgYFk3KGWkAOyIT8hWqrzxtZJq/+3RTg+RGu2fyKyeUYfSSKpEVhBN0B+u8lNNPPEXhaL/ZZ+qIHKWhP4dS3MC1EXwCNZgjZ9xg/DNBYnPC93VqsCdZ1rAYnNOrQ/7Umd9dd3Gvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSGYBkhnKrFXgLMfW6v8tpysEMivjl8F80dt9MdEbEQ=;
 b=FGn+VD6FR5cKSuQmEHD/8lLf2y95ij5p3xoBcsSO0u6nZSI2cFHRsaaWa9gqjxeiQtTf9imeJC/VwWGXo9t1AqKviVl4hZnbVmkzI76FBgHwp1+o6QirM3ir6dP/aXDzwdF+ecSGMXyb92afXWw4j1YzhBASkJ6WUWp9zKvh4a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by BEZP281MB2818.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:55:07 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%5]) with mapi id 15.20.8182.013; Tue, 19 Nov 2024
 09:55:06 +0000
From: Thorsten Scherer <t.scherer@eckelmann.de>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Thorsten Scherer <t.scherer@eckelmann.de>
Subject: [PATCH] bpf, docs: Fix tcpdump option
Date: Tue, 19 Nov 2024 10:49:58 +0100
Message-ID: <20241119094958.50574-1-t.scherer@eckelmann.de>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|BEZP281MB2818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2520e875-0129-4228-a8cf-08dd08803f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QGaX11ruW2KJv/ABMxrTITa6wHXrTm/lvBWUkXHNlakhsxMlvPVwInUB76Ru?=
 =?us-ascii?Q?cyPr0zmJcpmw8Ni4ukyxaNEKGjyyispjK2AnPjvxF3wZq//PUvLcM8HriJ/L?=
 =?us-ascii?Q?rd1TlZHid/4htk8uJW2XQbpokrv6HO4Nbhlz26OMz2q+aEXm28leDw9DWMdn?=
 =?us-ascii?Q?1iQTV221lrQFKtEaPvcJeBoiRtd2JVg4z+SvTLAnfTFOU2dykLeURoIr1hPH?=
 =?us-ascii?Q?/mKh3FKtjgV2M1Mp8ubUlo2vZkcYvV7Yt5+A+bc4i8OGPiQNbVD8y2YKB9jU?=
 =?us-ascii?Q?iOTUZnPMuSdo1inXAfHaMeCZhOFJVDyj6P4mp5NptFE8uGZ96sLQbLXJVtgA?=
 =?us-ascii?Q?si5u0H3+ifsF+mWMD2lqBqoXP9Qn+mOuWdUBSlleo/SdcAG/rjxcxFIY2+Jh?=
 =?us-ascii?Q?A7TUEvSVWsjvFnBRHLlAJXw1JuO63+1y80nF/edq191nXzr1/x0rUX4SfASa?=
 =?us-ascii?Q?WMBSZsChWY+ITAkHfR4bwoZHJcJjJLg1D5H1pmHwWznQi7UbtLt1z+lQSgRE?=
 =?us-ascii?Q?naDAp5tMdn552UJXGsYRSs6CKJKTBFKb87n3H7pt7yRlPWADPyC//5pC0uus?=
 =?us-ascii?Q?sQMkCZjjxWr5EZbLRSrlT/mIpArTZkqAmliyOwKw8KqBaWEGuL2oH4brY4ot?=
 =?us-ascii?Q?gxOWSVQZytBHpN9hXHD7WYldmNB/3qOVhM7wWv0MO+C+1qZsUDXjNcw8d9Ja?=
 =?us-ascii?Q?iP0GnHigTA9s0zandTeWJU3nvkeZq0G+GUjVNU4O55R+a1RdKkUn+L5xp395?=
 =?us-ascii?Q?8OGUW8/1NTBWX3FoB7SDQa+YKVQoEDlHq4oK13kqHg03TdCsDb6xfvd9nJqx?=
 =?us-ascii?Q?FE2nwBQ4eh9/v6quMtbWcUPCTcFX5ulqaxv1gjRFr0K9qYhTy0CecewTNGrf?=
 =?us-ascii?Q?7EbweKfSzPfDRsBabmgR5rveeIg/aiPihh5I+C6zTMgKzgxDEl5GeA8jQXqu?=
 =?us-ascii?Q?hkE1BaaI8kkBbJqqa3oPtiyCo4CiNcVCYcRMTUi9XzlEPWloPkRn+ooE8Y2h?=
 =?us-ascii?Q?+v2z5O7JmB+RAsZ/4qzpnT0JeemhYCGUYkfXeoOvPiyIXw14j8WNVbM0Z4mL?=
 =?us-ascii?Q?bFJ2tXG1be+x4hJGKLxxP0CaHgeAkKCrK5J/GuSSO7yWwlYrilKFcA9/ocuf?=
 =?us-ascii?Q?AA+YArJ8kI1F0FMTt+j7Yo/Qjg/oLoNX46JhE2+cUYMseuO8s7cDckD23rBT?=
 =?us-ascii?Q?/NrIhkvNhGQ0anlZBontLrwFS2f6Ifjl2fINCzAYN9+hHzS9mg2pwyWzu7BD?=
 =?us-ascii?Q?9ZsUAEk8szWJryNHDFMsp9g/HREKcAGbH+ujSkyou4vYTs6mrmDbAkqY4Mj+?=
 =?us-ascii?Q?aplSsINWf6dxai3mtwAlKD/2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MtWJkQJZ8WD/PJK3GO2fDg/di651kh2FwBokFawJaX6h5R0uV8ahanCy13U3?=
 =?us-ascii?Q?WyxkJuJucUkZ7H3VADvUQHQwrZK5vVl7YTnlEoTefW7gGIPpX4NxjXYjSz5a?=
 =?us-ascii?Q?aw/swK6z4Hr6TRns5BAf5Ha1k9oCAxDhynJTbVvUWw7UkzgWFCwNALNzua+t?=
 =?us-ascii?Q?R15RUC9Vsdr+elauSiLjljIc5S/xt0cShlJ0j3T8JLXQxTj9+vAfxTl/69d2?=
 =?us-ascii?Q?3WglJlVSN15iEgSEZv6fbrzY7xQqjoBF6QxKTUzvSq0j++4HLTGuIfqSB23a?=
 =?us-ascii?Q?qND34gwEupn/clVnXx0gSu73euWhMRiE7kmBVIWm8AN0s7T7gtbR6BoKd7l+?=
 =?us-ascii?Q?XaRiH5CC4oxgFchptlhNtKPIjolldN2vEVBOr9xD0cGsdI0Mkkr0+B4JPSmz?=
 =?us-ascii?Q?G1/i3SXFo60b3U0YOu+p1J/V74rAWZqvCKnRle/jDxjPXFkYkc4EAt/yFa/a?=
 =?us-ascii?Q?vVq+RDj259iDmR3sF601+kqpcpa7icmDXn7j37d/T99zDpWY8euvCRKhbbkq?=
 =?us-ascii?Q?vuW4DvV32IeGJo38zf9KDEJhiuNPA7Ggw4Jk61zvSOgrXHZhtoZR++56pTUf?=
 =?us-ascii?Q?kyT3xeVvHXsaH4qSm1vkUufsx6jPYwHgoyIi8aEdlJqmN3kyy14VSkusSm/z?=
 =?us-ascii?Q?//o6SJTTq6dyhnZQMoidyMIdt7AYKNSX8PzlvpzhH3og6m+klObz367ddra2?=
 =?us-ascii?Q?DY+LK68uD8hJIMAC0uU22J22ndMSHRQU4cWTmmIVXoIiGBhT42AZhCrEUMtd?=
 =?us-ascii?Q?wq33fQYc/3XYt54DtzWoU3v/SukKWBgaLGEVai2m4uhvTGvjByJQ2C5UEGTx?=
 =?us-ascii?Q?8kb0tSPjlwXbXBs0l2r9BrNyF+rxPqXf2cAlLC1vizBNatVJtlKqxzENRK7Z?=
 =?us-ascii?Q?SK6zlwohm4Xhg3zZZE9wwv01VgGVLILV2ZSP3ErD1PjnZJe04iFkHUUvTR0f?=
 =?us-ascii?Q?HcyXOXeWMbLD5pAft/pSAL+y9CF/4RgKWnaL08C+far+9N3R9a0yMQD//KVj?=
 =?us-ascii?Q?AKLXVOWaV/AxbAAurEz1HvLjh4tGgqHpPby2VpmcAKHRnhGlzv+cs8fKs2cB?=
 =?us-ascii?Q?hLA9vIB3GETtXyAV4dzKCqcEWDfmKczoEA3IJYEsI4Rh5EaRecOXHjP+CZFb?=
 =?us-ascii?Q?ZXxX+mHH5QiPOyitGC/smpkFniPbmAiMFfN/bjOsgS2zYFMk2lC8aYjmC3GK?=
 =?us-ascii?Q?XxsvElnvtDQ0nP+W8FtbVjTxvB1MtMTwwFNHxBFTZPV1qxFy99ot5EluiLij?=
 =?us-ascii?Q?DW3AeWGuRuhl6jC8pEqAY5eFkexEgIfNPe0EKo1QMayCR8rigZUTiCfoyryW?=
 =?us-ascii?Q?qAwpOCJgfgwMZ9jT1zTwDMz5BrSjodKfkQDw1TGCtjHsKBDx9bluoCGN5dlL?=
 =?us-ascii?Q?GpaLk/4PtWnjiqQN2e1LTuPADR0OhCI2rsq4/uaENNRF/ib3LHuvl770+c4H?=
 =?us-ascii?Q?4KuodCfCS1O9cCDDdAT7MT9NOxx53lM1HvJ14s4wDu8T4sgOMV1w/n1BMdXT?=
 =?us-ascii?Q?T6xJED+CcsdzhCUeUQPiICQQOlC5QiAZu3Rj5h/vGdrRojFHMsyzs9QLjvhN?=
 =?us-ascii?Q?1qM8ElQuJWl24IY3W1qkRY8+amDM1LH5i62BmGG5nIRMUS8I+iGZ+fONOB9s?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2520e875-0129-4228-a8cf-08dd08803f4a
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:55:06.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9s1MjvOL8qILlnpsfp/kLGCdZgt9e1YkYsprxbnwdMUCSl+9QYD4dhPW1t7+3cVhFr8GG8gHE/lzsqIIGifjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2818

From tcpdump(8):

        -dd    Dump packet-matching code as a C program fragment.

Fixes: 7924cd5e0b3a ("filter: doc: improve BPF documentation")
Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
---
 Documentation/networking/filter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 8eb9a5d40f31..06e244094f49 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -49,7 +49,7 @@ assured that the filter will be kept until the socket is closed.
 The biggest user of this construct might be libpcap. Issuing a high-level
 filter command like `tcpdump -i em1 port 22` passes through the libpcap
 internal compiler that generates a structure that can eventually be loaded
-via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -ddd`
+via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -dd`
 displays what is being placed into this structure.
 
 Although we were only speaking about sockets here, BPF in Linux is used
-- 
2.45.2

