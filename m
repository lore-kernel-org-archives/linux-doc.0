Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BA39A7E5;
	Thu, 30 Apr 2026 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591529; cv=fail; b=pIN3ftacFiI0A7jRiX2G2Lk0NPMc3qxm0Fq3/9cVIwSMvIy4bgEaKe7t7AHuRgQrMz2uuom8NKdD+97vO69bIjq6TuK9TGvrEBng0kiLEtWx17X7wANaExt8gRbNzNZ3mC3AYSL/kNEs8ki6/AV79X4qKkRUiAcVG103NE4lzZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591529; c=relaxed/simple;
	bh=PTo+iuPBKaEYuIH58gKL3c3NkNkVEFhWLafQc3dwQ+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHux+jwh3ffIgUAm5pQ6oYceEh46xUYvVD+MCJK0TxreX69ZBSgH1tuF9zyCqaAuy195b09pPsqKieUFOf6Hbcy9oLZjHw8CgjoqzzkJyY23MyKVhKwH8zsFcD1vEObUvmb+k6sCu3W8d6yd2ETTQrc8n2sZ/L8T1Scvl6Vpqu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y8eB/Vzz; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y8eB/Vzz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfOu7h3hYT52h2rY3A0486EPIWbbiXnGwfLrfnLKlhaf6csC0McEFbfzr85NYiAn3YjWFpFYPt3bUz4X8LjdtxSQfZeFNpV6S+pfZeA/fLPkboSayLcWLqYVA1TVZi7BmyyUZAz9ugTKXyw5LxghPDAttUbvk7s1yil3JebM4R4AVmRosmYh8wAfWNtflHX7XJzENSn4G9TCDx45P+mOBpbtysQFGfm9OVD4UrYP7RmgJHpsPen0B50G1IAhqApNWOcaq5d2hhMYe2SSQS5WZNV//KFuLWREYmMzUmufsMG2nlUclT/oGRDOqIGTrZyCOvIAGolUSDaN9RdEsUz1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdjUHDOsZ9O9DGst3mIqoj92vsx2xYBm04BPwzyTFkQ=;
 b=q8Q4bPQZAli9BGIcwH8rx1visUIHTVmBcgx5ggprYoaN6RMSxeOBV4ocR7zfYbDyfP6ba/FC0Cee9Lr/IDClV2RXcC413tpfbyUeYfE14MqKc0Y/H2BJt4BeQOJ09JJT2x/nM+p8R/ecSvDWcm1Ve6dG5TbveK7kkH+kptv3EHYk63BOvtogiprxUbXokq/iHh5SHJx/XOfgMm3U/zp3VO4vzeUqPftlaCyHShKGuneMEGMZAkD//FVHKpNFCe42BcvlafmmDynj0NkgwNlDG1TOkPwIrrONC7NHajcGtGmYkgmBOkmMy/GXVHm4dGffBoipjOXx6+3DBcDBtWaMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdjUHDOsZ9O9DGst3mIqoj92vsx2xYBm04BPwzyTFkQ=;
 b=Y8eB/VzzXCg1+of36QfsIp8Pyi3xh2xmhR55tYjeRTPRpRHQsmqbsOpLZpixbEbW9ZO6SJFrQrG8UBIcW8RnErL/ECWkvbGHlzdk5/x1DdmF1f8GvWOJeitTuzvten95csYPxMMwBHxL95OwDAOE0diV0i+KbIUaJfUbW7OIDEg=
Received: from SN6PR05CA0030.namprd05.prod.outlook.com (2603:10b6:805:de::43)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 23:25:22 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::48) by SN6PR05CA0030.outlook.office365.com
 (2603:10b6:805:de::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Thu,
 30 Apr 2026 23:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:21 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:19 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: [PATCH v3 02/12] x86/resctrl: Add data structures and definitions for PLZA configuration
Date: Thu, 30 Apr 2026 18:24:47 -0500
Message-ID: <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8c91b3-1574-429d-a6f0-08dea70fbfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sngKbEuAMXg7WfcsP39sRNbXfbge0F2TPlbJGQavXi60qaK8jbYpfevZeo8UzJO/vEpqSrDxdPylUJuor7lJD53jeevKq3yqDadfTZWMMeamsOBmYJI3jR9pZR8wjgcugmDFZnqrkWLeixeFII27tdusA88Yx0qCZN1NgE/R6ZYIHNe1wDbbHMhMSN5fMYdP7YlasdpxAD2hfeGH72lc0eYVxGHa2lMTyFcItCJKl8QFNwESQSJVakOj2i83DMbEVB25vBRIq7ShoN5BgCIzJqOP4IfbyiCZsIGkg0RpI/pTv8ekZTyqVA6y/OmLWti+PikUx7g3YlZmhqmyS2ejavTH9uMj10RmwlG7ilUGFmwltOkC9RP/qgbs2mJxozQ+FoWpePjn68vz/EF+QHS3bcLBodPl4NBC5VuriEdZyEQGIQASyaW/ujnzYIBaCAbnF9UDzNk5ru29PPAudKp2b3ITnodMVF0RuVOzoHf1Qhbghl2f3TpeOT+3yIJ8gTWYccVyam83YHxKpqnUH2zfikiUv3f4mqy5YL+A+apoBcF0PrjGE897eFjspEFJEl1ivWAomn9isXQN1Bb83NAXQtHTHNkLo3zG70cLXmjCU+ARJ/VG1AhOIjWD1AwkarbVmVbIKQzCzd0fb1j27JW/D9tNSI4hKo5uMB4D88kZ6o23WHwjlfDM40lJwm+gJag/mfUmCeTRwbIwx/MB6ARfKtwtXQbOKiwjlmNLKxUc3/w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zdmt1PfrJ9d7zfQ764mxKrV9P6LH9hFk4mZ/q0mKx8di4g1mMd/FS4Dyu8JzOlQKyfTO8TZWfxKVUsFbiry2sWtfjrRkLVBccNQ6lKDzek+FRlAlnec3YzNpaFj/AfQS9HLZvLViGL4mMQDdKiERY0hNt/20BznH6I2skh6EuHhwTmKqxQwzwIzD4olYO5e23UNixIv+bs9Qrb7V2PcTlOemlpXvvpokCLyYky0tZKjGd2IWSRv7mDGQqcrvYhY5i1ApRiigyTgkg1Q+AG+SXa7bRAp6RdPvEBMj0rr3FmUu/XHLQGegQNnmEh2CzbNizGFzbylFLCoEJsXiqNKzthN8vF72XW8J7D5q2Kd00YfUOiP9BPwKjFbAhw0ZfPqILcQUwFIum0enGafQSz7RtNl3VzoGLYWuGRwEqE1R94OqE+lz9jjdxTT1rjNlYJZW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:21.9035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8c91b3-1574-429d-a6f0-08dea70fbfef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223

Privilege Level Zero Association (PLZA) is configured per logical processor
via MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc). Software must program RMID and
CLOSID association fields and their enable bits using the layout defined
for the MSR.

Define MSR_IA32_PQR_PLZA_ASSOC and the RMID_EN, CLOSID_EN, and PLZA_EN bit
masks in asm/msr-index.h. Add union msr_pqr_plza_assoc in arch resctrl
internal.h

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: No code changes. Patch order cahnged. Improved changelog.

v2: No changes. Just rebasing on top of the latest tip branch.
---
 arch/x86/include/asm/msr-index.h       |  7 +++++++
 arch/x86/kernel/cpu/resctrl/internal.h | 27 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 9dc6b610e4e2..623628d3c643 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1287,10 +1287,17 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
+/* Lower 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
+#define RMID_EN				BIT(31)
+/* Upper 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
+#define CLOSID_EN			BIT(15)
+#define PLZA_EN				BIT(31)
+
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
 #define MSR_VM_IGNNE                    0xc0010115
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..1c2f87ffb0ea 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -222,6 +222,33 @@ union l3_qos_abmc_cfg {
 	unsigned long full;
 };
 
+/*
+ * PLZA is programmed by writing to MSR_IA32_PQR_PLZA_ASSOC. Bitfield
+ * layout for MSR_IA32_PQR_PLZA_ASSOC (Privilege Level Zero Association).
+ *
+ * @rmid		: The RMID to be configured for PLZA.
+ * @reserved1		: Reserved.
+ * @rmid_en		: Associate RMID or not.
+ * @closid		: The CLOSID to be configured for PLZA.
+ * @reserved2		: Reserved.
+ * @closid_en		: Associate CLOSID or not.
+ * @reserved3		: Reserved.
+ * @plza_en		: Configure PLZA or not.
+ */
+union msr_pqr_plza_assoc {
+	struct {
+		unsigned long rmid	:12,
+			      reserved1	:19,
+			      rmid_en	: 1,
+			      closid	: 4,
+			      reserved2	:11,
+			      closid_en	: 1,
+			      reserved3	:15,
+			      plza_en	: 1;
+	} split;
+	unsigned long full;
+};
+
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
-- 
2.43.0

