Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2183.outbound.protection.outlook.com [40.92.62.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC31C6AB
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.183
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709589389; cv=fail; b=Xmo+6EblC+VsQfNnFJjEIUGYUq3TY+8Z4aIvcEvz2fX/Yd6Po6cDeOEb5FsnK80Wmkqz0UTis2wk1yxEFhgIZMCf80oVlC4RNJc1WxsoV4CafnWshpOhGklBSrAww3i1Njq1LRRdAPrXPmOsEes/NFNpr7owqcKRy6dpUQbBKP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709589389; c=relaxed/simple;
	bh=IsWGDk/45uwW1NawNvCZByKkQ1rlbI5hkalvR0DbEwg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cR6mN6ArJUBcTdL5KkTAi2zGt7204ojKjs6ub5bKjy7lP0a7QNj2+oPig67yKHnDbvucrqpIjgnd3gZ2eQN5SH7d04yrpDLk+gjX2U4XSX3/TFWm275xmoOKkXX6bWuPBCnc7Sz03ksLM0lOo9lw22pZlbtkTsaGMaht2+O2QiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CcnWAgiE; arc=fail smtp.client-ip=40.92.62.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CcnWAgiE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDzd/Nt6aIfIfnWCKOwZFE5h7GLYrs4ohwUM7Nfp+T5TVKERKv+vl5s+kTy1TLdkvdHn9hBiQqIvANeP0mbswjiJvPS4lBBERTbSTHeO3NzFTh07h8S98OdCEItY5eYGs/LSj4v+lX/G+IeVRgOau1F91F1GN+lHAyRzHiPkW3+WcaGDSAPf7+hmv6QVyWD0qjXrUHeLuZjjkupogc5YORzf8Im8RR9zOB87gMYI5sO3Vj6OSPgsjmMfwRo63nk487xGEgPZSemcZKPh7+CQ3FiOsADQV5HYYhEAvs7DEdMkZNQmGnUbgelNKn9ZBGbNySADpAYXF1/zYhkZqIeiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+17QXWjKMRvYmbPYbytAbTbyGo1KIFmr6tXNrqHqln0=;
 b=b1g//1pgUAL25M1KagcLyyRPXwag8apSZwOu5t+i7NGqzAfFpRGphVHXqqOGSvbuHp00BiUudhbwykFeUkaoi+8hZEyS+NzDljYfFMtNTB/CSbg2v8YKtu0kwZdGHp2rWrqrKP+cuITeR2SAO4M6aoEs8/r23o5lmtUwZqv810ONnOh7WEKwsLZ8epEE14clVXpricoawo70i6zOZGL0e0m823LJGLS/s90tOmVJ/hbjLqyVM1M4jL9NZpaoKCrli0eOmIRoNbkQK15Yi59N744NBqvQMrgMgWOevgZPPOVQYuyArlClaG1G2q8C/5oQpYSOsJWOJQUE0wZKsATBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+17QXWjKMRvYmbPYbytAbTbyGo1KIFmr6tXNrqHqln0=;
 b=CcnWAgiE8P43lMKr77ooMzgDUZFNR1GUhd9w9Mu0tuzvx/Mpd3ifXRC8dvnmj4atQZFLAjRoYuZZn/9abe4tb+T5Mbz+k2lsSw5hjPwV0Ubs+JrJhPrZjekMAIUWMcxqx3mPfO15DupibTDpyUYNSikryBEqv8CjUsHemwDDYiBHbwFEng3fXOV3JQylqxINFbm16XwCXwgfDTBfLAKQjwoT1DDUHb8aFoYBX6LTKQYswysGw1ycN/pVAKlbkwRArKur2sLyek7cOWQwJlgEaEWO8zVx0py4ebaMLk88vQqrm70MqGqtx1Yat2G2fCDIB5wlsEly8yuHY0Zst69Lag==
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:88::12) by
 SYYP282MB0848.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:ba::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.39; Mon, 4 Mar 2024 21:56:23 +0000
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a7f3:f4ce:d396:bd7b]) by SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a7f3:f4ce:d396:bd7b%7]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 21:56:23 +0000
From: Moody Liu <mooodyhunter@outlook.com>
To: linux-doc@vger.kernel.org,
	x86@kernel.org
Cc: mingo@redhat.com,
	dave.hansen@linux.intel.com,
	tglx@linutronix.de,
	ak@linux.intel.com,
	Moody Liu <mooodyhunter@outlook.com>
Subject: [PATCH] docs: x86_64: fix a typo in fsgs.rst
Date: Mon,  4 Mar 2024 21:56:07 +0000
Message-ID:
 <SYCP282MB0461A3FB2A62030F63663583D3232@SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [J5S5cA8SsQSdn9fUcyX0CpT0YT+pX/pp]
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:88::12)
X-Microsoft-Original-Message-ID:
 <20240304215607.320042-1-mooodyhunter@outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYCP282MB0461:EE_|SYYP282MB0848:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d83f91-8973-477c-9fdb-08dc3c95ee7e
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrNYJ0sT0SxbxAd9SKsy+fa1GOZfmBfCqpQSheM8JELjuauGg4PET/qp0y1Gj/jci9uX/DHJ2ukC7m4+c7Om8Rr/OqJCV+JBa2YtwO8c2c3RNIKIe+OwN6h5ABQD8AVBsGy7Dg72WI21lRNsSNlvlQXXEd4CmsliYDU9woNqKv6zPp2zTpxNHQbU6/UcLcW5Ui+1liiC8TezeR0y7TtA6/2870ehDV9iwODi8WltUDkJmCMB75W+QOkTklcgtIlQ88fYCFBgLnvS2QRJYpz3XfHiL9E4SEjmhyZe48JVlP2or4vvXpP3J1sFyEnJv6FF3ZNG+dvfx+nXztuYELRqHKtWllRk7+bv+Fqr0axH2uHr9ptGZdsNejTcr1N0SLttHBr7AN/n+s0f74m5k7Uv0/t0tKad90bWqPnimQz4oH28I4FpKirmHo8C7husfE+HoxAivlXm4I3lJW9jeYC3FwQjoarCtCpnfHHq8TjRg3+z2pQH2RB+TMT7XNLoI3FbPk6DM1TO4sFUAfxToUxdG1HlO5KzUseqWJJInCu5idcWIW/VvHgflZ2hP2nzwPjrGaKcLzLwJKFunz17NDdJjTMatwjHTq2LOP3w0Pvua+3a3w/VJJ1Z0bdkcY8L+S1IFs3QZmeZCrVYpUWzLIAAkb3F6SqMEkUEGUmVQdElY3A5FsD7UgZa5dC80EgZzQDERXInpF+FU3mv/AHJPU+Q/LyE7rCi/+LWaGUYYEcclVvk+Pwsd6WSqkRw5hUPHBAF9xY=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O63DaEzJrvwSvMIqxBbK/WYar7x8l1RDd36s+LfLAk0cgZYM8QSokrLATqnzcpj13WmaNpC3Yl1ZynPQzkCmedlDNwNmsbpk6ffPmLZ0MwQ+VfYfExpA7cGa6UwfgEEyoleTDFybBxr3i7VBWx0UGDb+ZjD5z9js0EVFTDHjRV/cqiDD8OcNnLgv3kkPNNLbxtSwEu4Rnwg2x82dJo5YEqmGR5P5C4DTrYXsyqxDun+S11eImp0vC/PWKqjqjXKY0fbcpTj/E5GDZ9+EX/9g5h2lqFPvWttXw8mRlMtV8Q/HqHVS/ce9YF3Q7ohata6PLJZK/iJSy8NKVmFctSnbObUDnmzCQ4ivCrztKHmcrJAhM9HK2R7u/3KixYrHNNle+qgFDVB7TFGbDXx7bwxINNCNMWZ0iTfV7cl8LHvUP7BiGvGpLrYMql+3WikQBTZWOFg4P5okkZE7okS7GxUB1C7DMNAtz2M93gJksPCMzChp/NBMfduX3VftF3+nE2Z28th+iYb6EkV8X3nZV7aO3qnjb+9Bjp5TA5+PXO7bC6UXzwkUhTRu8sj+w5uN5dfpwEAinC0YM6f7s20KHaNEy4taVyEE6WXZojxsnxEQcFE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZZTQ1EcfTqLProavo0B+P6q7Sw0aBtYTVlpgSZ6eWRTvVUW55NqZdR2z8jKV?=
 =?us-ascii?Q?elRtvvAUgF0GV1kT/PP7WlV6JOLqq6wzHAcvDDm7equdvkq8dmFYEUz0uBIw?=
 =?us-ascii?Q?A1TMdioit1e/Wu+jaBe4KC/nui+JeP0NPCL+ibzHwvf63KMGXiEWUxyiR9lB?=
 =?us-ascii?Q?+KnklTwSPM48jap3FoXyPUgYKrZQtzU0rf+vFTuW8s4Ug6RnYqfxoCK3Cw2A?=
 =?us-ascii?Q?4gYs+f8QhLJWs4LnbNGHdVFNG7fhLyww0F0ahyDNW51JFmGD4UPMrihFCEJP?=
 =?us-ascii?Q?L5yJGKy0/rYtOZPfRRpATkRTAnwTNEB1Wv8Chs9hirV8StZl7Ix3pncUzQhx?=
 =?us-ascii?Q?eOpG68pyQen+WQkYy/HX/4K6kLTBbj8mmoOoMUc2Cmr/zIkBd7DPQZSf8MM8?=
 =?us-ascii?Q?aoe8tsmiF8rBiAHry6DrGD5rZfgblkMwrFWXNGEVAh/RYssiw0vFk7GkQZM2?=
 =?us-ascii?Q?pAlOkeEFUb14UMMOAoNS3/ib52lcd4u3TxuKbDGjyoBytvGtIK44b+M58ZWN?=
 =?us-ascii?Q?S6WXUIQHxBqehh0IBc8ScRtaF4Ka6KJgX/nDgCIhwp7j3ZGs5iF4PWWdx4II?=
 =?us-ascii?Q?/FW83ufGHmCSxhCFg4n8oWYpmiSd7RcPxyPSkelw3VbbOnZ0v2h22ZpvGOQq?=
 =?us-ascii?Q?jW7csVph5sum1p1GenQ0w5+SeJxXrgUBPpPiKjGEmzCXgWw4vPkeAxzJgnLw?=
 =?us-ascii?Q?rRj8IKljIctLxBMFaq4S9FnJ/Ks5RYjjYCrxvZHWM58JGFYflXloMnugsulm?=
 =?us-ascii?Q?gzH+4YsEnvtmWKSXcCjn0rcqhVSBHAXQpJC1wnFcHb/T+8A9VxFGgZA0Nq7r?=
 =?us-ascii?Q?zk9TGUluOm8lwUfyC6SNikwKg7JnYVelJov6M1k2LMm11hKab1hEbO4khpeq?=
 =?us-ascii?Q?CnWfjcmiA+WVtj9S7WPeeUQFsqhF6JQK+E09hnSKenEbXeUb7+w6qEVkgFXw?=
 =?us-ascii?Q?4f/wxOsX4KPlrABDUIUK5PX9/m1oNMgWbSSrJuUDqNUPUyCNRS35fczVrHkW?=
 =?us-ascii?Q?rjRzbBcNJBioXoPk8MEtj+GuWu7N6xNJ6D8mGI0UBGvB5S55o930+YYuJ9/A?=
 =?us-ascii?Q?5IapxrFYdptj24KCc8EeYBg4sM4+G9/eoeheYbPKQBQ3oSLgWOv9dIeYwxlM?=
 =?us-ascii?Q?jHkHY1v34Fr8OJMpPV7We7eIFGAfXjuFpCO9JdU+3Ynkr3lDbsrCuna/kheQ?=
 =?us-ascii?Q?tBxheZ+w0hGo9iE6OZUS3oJaWGQLQOaTdngJsVnGIyW59KPEnHBGoDkXA+k?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d83f91-8973-477c-9fdb-08dc3c95ee7e
X-MS-Exchange-CrossTenant-AuthSource: SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 21:56:23.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB0848

The function name should be `_readgsbase_u64`.

Signed-off-by: Moody Liu <mooodyhunter@outlook.com>
---
 Documentation/arch/x86/x86_64/fsgs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
index 50960e09e1f..92fde4cffff 100644
--- a/Documentation/arch/x86/x86_64/fsgs.rst
+++ b/Documentation/arch/x86/x86_64/fsgs.rst
@@ -130,7 +130,7 @@ instructions. Clang 5 supports them as well.
 
   =================== ===========================
   _readfsbase_u64()   Read the FS base register
-  _readfsbase_u64()   Read the GS base register
+  _readgsbase_u64()   Read the GS base register
   _writefsbase_u64()  Write the FS base register
   _writegsbase_u64()  Write the GS base register
   =================== ===========================
-- 
2.44.0

