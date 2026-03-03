Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8553128CF;
	Tue,  3 Mar 2026 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562996; cv=fail; b=FDPHNyclev4X+S9IetYKTNjVh2j/OdLAvLGSQZ8GJb/C3rBFEAQT5ThVrq4XyeAgG+PCjeqkHRH39YLPJvmDpGUJk1A9JJNlDUsD1vPzeBmWxp5ODWSstbIuNm+9kMnhb8WMpR5ctAm5FRySIK0T/i0LQBgYuSB9nWzGhJ0Z/OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562996; c=relaxed/simple;
	bh=iZH2Lxn9X9pDgMBKRjSFVrIOIO+LDvRSAXQRefp8E5w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qeDLUvhKuZ8mk6B39gls+ZD5mDnZbD02pKrzTA7eRHTX5nIBqK7oI1g96SSx7X0rDZyh9MrT2Klgb7rMh+8nAxjEI/xwuo7vQhZ7Z8g5LC5+wafg00B6C8MIivVBcWKuFhaHkjiNfibJDot0QVp2LznKj2lqEQqm5JBAzi/3rdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JK3CR0aa; arc=fail smtp.client-ip=52.101.46.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JK3CR0aa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QltOvF6wB2rDq9N4eZs+vuhjcBZRvADe6KuIPI/tdkVFprZUeqMkoAkkiQeAPsa8IDfS3ejqifcxVAMpoVHC98fVjmLt2EOvvAdXBEgpf66LqX48X53q3cg1ys+XUGV+0dHXEkdpHcyg1xPsJXgxWdveZLYM8dWV5kDU8yQeJO5A56xoH/NZhXwsYRuJcY+/NOs40738rPT56BRXlbnBXQ3pvU0a7dFvRlq41WJMzcy8aLBJHqRnAHaL79lSTF1ezhTA7+uol2TCAqdtpjMztQrAhYfv4C2zmqOCtpACHBuj6394O3/wI2yh/AlY0LjwtQ9JcD4l7cFO1AsHLTNL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roE8crKN4Yr4c7co2ibwKldX00L4yPSx6aa2fzILM7k=;
 b=Qb2l9sJntVNThAHDZkbuQ8Ns6On9KnDbfJqxwdjOdeJNkjjO7YCceghU4l+vctFIckkXHXULf46HytulvBoSOmdL9z1cq0erK1rimA/ZoJDpMKiNulXrobiJ9nL6PoPkhmman2ADuIqsmE9YVicL9I28EioeuSbxW0PDcmgK2h9sJY34VtEWHp63qAlg/xwR6Fuy84R9dx3V2/RMpWv6Ekpe7ELRS+fZavW7/b/iAC4b7OlwDEiej3gcjCbZOdE9QpWOcw0SV+ceitQ8tuYO75m2+h2cje/fb0h85+uiDE+kOE7R14PKkrA6TmPSgYfNXWFth51SKwABu4mkyaOKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roE8crKN4Yr4c7co2ibwKldX00L4yPSx6aa2fzILM7k=;
 b=JK3CR0aapLZwVPdPnKx8s83lAfxyaZndIFd+uGp+nlYFy3X0Rhf7xPWZNU2oFeAAM+rxW2usVE90WJiggT9zoVKnwIf9ouzxg0et9aSxmUsisXdP8HawHx/bgxeqrTRdgvM4LOO0Bqv+pk/ctAySLHJaw5vVFuWErZjMciC5xE4=
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by CY8PR10MB7367.namprd10.prod.outlook.com (2603:10b6:930:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:36:32 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::a5) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 18:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 18:36:32 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:36:31 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:36:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:36:31 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623IaVTV2618078;
	Tue, 3 Mar 2026 12:36:31 -0600
From: Andrew Davis <afd@ti.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2] docs: driver-api: device-io: Split out relaxed access mention
Date: Tue, 3 Mar 2026 12:36:28 -0600
Message-ID: <20260303183628.80776-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CY8PR10MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: d96a30ed-81a5-400f-a021-08de7953cab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	aidMMZ8yAfVaVFpmZ64ktpT3oigXyF5rl4zVA/bSIIpXeO8eeW85lMMOM6iY6/woFVn5Vbly6JvP5tCD6huTbDx0yJLd7LbxnaiCmaFX96hLlBs0ThNWIcrw66/8nL/Pj6s1N4E08f7atgcQm0fApRMOTGaTaRatbCh10rYvM0nL/PG/IM54d12crb06LMU/IluFVakC8xgMRBTa0FgaZkgWVAMYq8PW6DIzo80LQ1+aV3JE4iDuqPH1jvSWaIl9hOYTNcdL1yuCbjIr1wmLChPMCMbajDeH7LWfoCBuK+Vc4tBMwVWTM/mKes7oFJceR5Ko1wYwHODJyx0dUk0fr/eu62/eg1Lyb+HjSwmy1nBKA7EXruC8HCRIY/xpYmA/rV1Ykt+qBq1pZzSR1vPPJ47sEc3kMJLvIf9Ul1kGiDzMZc+OyjX+jeO8W221ReUkJDUwIln0skWCrRN+iPt3t4YWjQ5OrFXl++Nxkp7RM6M0PzpNt2K+anD8vHsg4x3oulBCYU9BYkixkaVpuoQMDp8VDCsIuMz/FNgcJ8HvLFBsoyDfIhwOwIfiF2UzuCeUQmLdp6mM2vFoIzr358tN+GBIAdgcnFoBj4l6L1EJ+rkCzG6RdgRpNhkHRP9++tAGql6UknrR7BOhVykbZKNqv5tk/S62HPU4YerQgwOh3IZKDe6hyxYSzk6FNWiiQpmhD1fyFeuYdtEqAHwgtbhFIZjelaIB4qBxsK9mi4pGS5w0V7noJzarfxUHB9pr9FlgDdiCeJ85Cu/E7Q8IOUFBI1G94C1L4jETAg3UjF62akrnmz9uh+L370WGJUMiGDlxx8X3WPk36nTNMrl0qy4kqg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SkFfqEEP4SEUNxCd7mNvwbpOR4GRIe0/v4aCzri90iDC3nGjVaw6aikHA1uziV88kiZ5dy/YFoGEHrabB7Q6GkI7LU3YLLfh5U8aTY3bgXYqx9rT0d2li7sbe5HJHfk2N8+2goVzG3WtUSibyN89tY6XgKdMx7g9wmYekm/At2Z67n30pKUEcSLFSHaKLKBdQiWH9w0oXc1LclEUDMHnQbdh6dhIZVj44uLJAlZlcef0WZEc0TnjMyD+4qiq55nrh/7zTicqzaxzLanztCOqaxdE5gEzzRjbrbmprvg5yb2M/7SdqAp0di2/wg7iGmbgpkpN4zZ9FVFEvZrnrU+sq4daR3zInJGjZoPysVaY1Dl0bUl7giUnYyVc7Y4e0ykm0AEZke7OKOEBSUmRCtqou/rtXdFirqkUEvyRsb5C/TWAllcrmzhOr8FFwhifioyo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:36:32.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96a30ed-81a5-400f-a021-08de7953cab0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7367

We list all the normal non-relaxed device io functions first, but also
list just the "read" versions of the relaxed device io functions.
Instead of adding the "write" versions to that list, fix a statement
below which should describe the relaxed versions so it is understood
that both read and write have relaxed versions.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - None, rebase on v7.0-rc2 and resend

 Documentation/driver-api/device-io.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
index d1aaa961cac4d..5b94973f44762 100644
--- a/Documentation/driver-api/device-io.rst
+++ b/Documentation/driver-api/device-io.rst
@@ -56,7 +56,6 @@ Both read and write accesses are supported; there is no prefetch support
 at this time.
 
 The functions are named readb(), readw(), readl(), readq(),
-readb_relaxed(), readw_relaxed(), readl_relaxed(), readq_relaxed(),
 writeb(), writew(), writel() and writeq().
 
 Some devices (such as framebuffers) would like to use larger transfers than
@@ -67,7 +66,7 @@ guaranteed to copy data in order.
 
 The read and write functions are defined to be ordered. That is the
 compiler is not permitted to reorder the I/O sequence. When the ordering
-can be compiler optimised, you can use __readb() and friends to
+can be compiler optimised, you can use readb_relaxed() and friends to
 indicate the relaxed ordering. Use this with care.
 
 While the basic functions are defined to be synchronous with respect to
-- 
2.39.2

