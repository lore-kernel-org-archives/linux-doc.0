Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795113363;
	b=wKc2ZPhtBUS80/ib5O9FgTpcLqILzTth9K1lDZ2pS/YEvacd6/8QpBfxGSku8HmDLY5T
	 xXymo0ASV7mdDU6hICAzeU4K4FwXX9193rOa/hBbAetfiSsmZOqKMRh8rGDG2JMxHaA6o
	 HpNPpwuOybk8gC75jbMITuhGckVJ4dl7ZLHiQ1MkvKcaay6T7jFbEuKwW1nuIOwAZ6Rcf
	 msdIv/b1Vo31tEpEKlUYeBHUQ3c773BXuIiKy22nlcnAunWfvz51yLNIk0Up2Jxb8CKPR
	 pqUAdtWKG6dgarYLFPtbliTBMBa373HQq286M9pqSs+h33URG3KJvWedhein1BAc2fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113363;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=od1GSfuoSqZWB/6QghNc7DN3SwX4fpXmjOoaiKX5Yxg=;
	b=U1xibh+bjub7VCXg3gODVf4mNnXtbnK4QzO8CTN/XaIbw8i54/7wsf1UEwc5fo+FwKDS
	 E7lgp7vXEcZKP3WdRRMCr6zu2nYPRmmKiB4t9zbX9BMpKDGQ4U6QH1V7dXu6+htWhIj4w
	 78w/ykBV66uWGMmZAKjOIuGzSl0/UMzgugUqEk9tEkwQnBz2Ef2T8QH1Lly2XZDTETEh6
	 BS4PQm0ZmksNgj4F5lz0crbR3XTzEGJydipwi9OgNKpDHZe2kYET1kMb95VrL0C4ppEz6
	 6lfQ1aOD7M+Ez1Pxl2pMaMJ8Ohnod+gb1oRwH6IHcH53dq7SvkXFE7Rxrl2KhfDsWpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fHKToPNa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.27
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1037606A325;
	Thu, 19 Nov 2026 18:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1037606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fHKToPNa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljrVRr5eonz5ZIFKNBCru3Ld6qbVCc18bYEWh0WKT2AKE6OR5hERSOh0dgtIyYt/N86snhFsAmMauRx4S+1CBU+A4U3S9wKbN8QnyintV9GvEY5QTgysVCyUYKNN9/mHzrHkiBFN5aupsXiTYdRCSZficXJw82uJS7s4BSPUpxfLw23PFmtqYaVkojjVgmpcpBUZCa1l1sD7SHC2rT3iOAIWdMs+/5orVuM7fMuXWJEGsohFdvKX3Fn1jFyM3EUONijLAe8tRkaFPIHWMu7VpLFyVY3Pauwek1hAGSAyv/u5RaUt8OznodKnjV2SSFBkIcjmFzjZXNFoZHOecliqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od1GSfuoSqZWB/6QghNc7DN3SwX4fpXmjOoaiKX5Yxg=;
 b=IIk3IDqjJoxMCntsvylvEE7yEz8wAT3yZWNWhSGUTVAQ+vjuFV3nEWpxYikKsLYSyiDZBSTaUJXHlhZv0AG/HWjAQmPQ6omI4KaKx51FJAo010qhk5OdAd1fFVWnZWKBsA7Vnn69hSSI3PByh+zPjt1eft1xA15QaQyWNYXOOLuRu6wPrBGaR732lEomOzmB8iP884Gkfy5I45yujgpeqK2oVYZXdJpUPK37II6DbkK/oARnWhbcYlY6fyHjEKKqCZnZ13Qbps6vnDJRtbdUSpbRRqwqxTKFRGngGf3tVEJuhDLu4vUREcwrsZjw8Q+FpwSZy9FZQTy6WaEyl6GnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od1GSfuoSqZWB/6QghNc7DN3SwX4fpXmjOoaiKX5Yxg=;
 b=fHKToPNaZi19we8/4MvejOs1q82NrLWGan5LoAdzVRAs64CpVfaAsWVRkAn9e3GrzBF4ga1cwHTlGE13ErRZhYCbXlCJFMstkFm65IvcEr/ToiYjLqxZGCW5Rk/4PsXehKG5EuLiJrlkoH6zwSmq/Fy9nd446BL0l8eYMbDEReg=
Received: from MW4PR04CA0354.namprd04.prod.outlook.com (2603:10b6:303:8a::29)
 by PH9PR12MB145095.namprd12.prod.outlook.com (2603:10b6:510:415::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:35:55 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8a:cafe::ad) by MW4PR04CA0354.outlook.office365.com
 (2603:10b6:303:8a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 18:35:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 18:35:55 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 12:35:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Thu, 19 Nov 2026 12:35:47 -0600
Subject: [PATCH v2] Documentation: amd-debugging: update amd-debug-tools
 URL
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261119-master-v2-1-00c5a7d76ef1@amd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNwQ6CMBBEf4X07Bq2Uaye/A/DocAKNZSSbks0h
 H+3xZg5veTNzCqYvCEWt2IVnhbDxk0J5KEQ7aCnnsB0iYUsZYWIV7CaA3lQF005eJKNSPLs6Wn
 e+9Cj/jHH5kVtyO1sDIaD85/9acHs/UcVcJzJWwRtO+ioiT0E50aG6EdYEFJKecaKlNKlvifr2
 Dor6m3bvhQ60R/BAAAA
X-Change-ID: 20261119-master-87aeaeae142b
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH9PR12MB145095:EE_
X-MS-Office365-Filtering-Correlation-Id: c02adf5b-b917-415e-b571-08df466bf297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|1800799024|36860700016|261102123227099003|10067099003|261026121527099003|56012099006|261021135927099003|11063799006|261021121427099003|261026140227099003|261021123027099003|261021130227099003|261026130827099003|261022105027099003|261022115727099003|261021133027099003|261026135527099003|261028144727099003|261022075727099003|261022113327099003|261009223027099003|6133799003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	pYbBn9KHotLA36jNE2o9d6jsU1qvocQyAwK9gqVpSUV7IVqdRXnpMDr/PkbnNiBphprH/owvks/C/f0X1wDTZ7Dx/ZpzOBqtcYV6KYZor13319NQnwHCocLuvHjAhPfPT+QIHnlnwzr+dIAPp/UC/YOnjvoaEpXYIFy+HHI8BQisWbaoUWR3gsdoQPqpzWDeI/uFn9UXTziXrdwpVKCItR1tgT4BtY5x+KpTeyfcaCN1NCtdRRLtW4cKNEynePSYR1iPktDWK7nmWeVyaiRiX/BQYILS7IypvFAg28nXgNFZ9S9ba/bsnPbDSpCoqeIy3TOWQ6QB6hNZiz/BdDbX8/LLzqnDUaXZDuOl+advHGPmG2h1xH0HOShIxQqqGkVAzM9gdd2m3fEjDc3gU4T9MTdAhA9pY+2sH5B84T7798gjU26ZpqD4V3zJPmdkVE9WpuLIOxSuFeRSapwi/8qgjRCCJowIbMdrLeSWTWnezeSZSIDrh8MRwxIZ+p/O3uu8Te6nNyRz8WMqgRacUeVqIY8VHA902LDOQ1o4sS35A4A5Zl18utg3vnsDl/qIJA+bGxpAyjRKev+oLilEmzEDmqIHaW4FtvexUQ4nbLgQEDMscI9RxN4cxjY2Dvep9rn5VXs7z5yYVdJLxt/VmIBVKNBcWASfjnh7/93nqE7yqj0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(1800799024)(36860700016)(261102123227099003)(10067099003)(261026121527099003)(56012099006)(261021135927099003)(11063799006)(261021121427099003)(261026140227099003)(261021123027099003)(261021130227099003)(261026130827099003)(261022105027099003)(261022115727099003)(261021133027099003)(261026135527099003)(261028144727099003)(261022075727099003)(261022113327099003)(261009223027099003)(6133799003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cW5QM0D/UjkxlaQ4MV4ba5IM5YpRcV+x4XzXClh1JWBk9PtGxJfA7qTlWRaKE1fMoLrkgEzacrNhnR+zBil848b2QRuHQpyMRFtgl9SrpqG132dZ2PuHXPJWOTblenvNnoMMYZRfknsVpAEm6927h4U5Es+tDx0RYC4al93e4BgLmngGdMk1vWEuy4rzlSJ0hkjsGJ4hacNg5pHa9gfWRDF1ssZWBEUHTLMLhqPCctwSdQ1qUkIocdV1pIhrYdoufFC25b7u0FzhTYEVglY68hFzYB2bocmVEbfJYU0BbPS5t1sLKirO2P5AONyyO1bglIqTP1zh8EfAojrLSPew6EkonUFz0m+8aveVXZgXYk4eitGxwrlvHUjRCUrOWoPIIF046FTBDwUnhlI5keMcQEbeNPlZf+BqAPgxyGzPmBtW4EXjbcIE5c82i88tFXhU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:35:55.4277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02adf5b-b917-415e-b571-08df466bf297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB145095

The amd-debug-tools project has moved development from git.kernel.org
to GitHub so that it can take advantage of forge flows that don't
exist at git.kernel.org.

* pull requests
* CI
* automated PyPi releases

Update the link in the s2idle debugging tool section to point at the new
location.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Changes in v2:
- Correct second location (Sashiko, Dave)
- Link to v1: https://patch.msgid.link/20261118-superm1-amd-debug-tools-url-v1-1-102516e88a0a@amd.com
---
 Documentation/arch/x86/amd-debugging.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 3176a1240feeb..6ebb3c862dd3f 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -42,7 +42,7 @@ s2idle debugging tool
 
 As there are a lot of places that problems can occur, a debugging tool has been
 created at
-`amd-debug-tools <https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/about/>`_
+`amd-debug-tools <https://github.com/rocm/amd-debug-tools>`_
 that can help test for common problems and offer suggestions.
 
 If you have an s2idle issue, it's best to start with this and follow instructions
@@ -321,7 +321,7 @@ Tool assisted Parsing
 ---------------------
 As mentioned above, parsing by hand can be tedious, especially with a lot of
 messages.  To help with this, a tool has been created at
-`amd-debug-tools <https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/about/>`_
+`amd-debug-tools <https://github.com/rocm/amd-debug-tools>`_
 to help parse the messages.
 
 Random reboot issues

---
base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
change-id: 20261119-master-87aeaeae142b

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

