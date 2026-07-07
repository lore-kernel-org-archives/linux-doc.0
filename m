Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F830FF1D;
	Tue,  7 Jul 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459066; cv=fail; b=c1Cp5EneNqvSoaJW+8viPntpk6J5rVYeIZEZlH2txC6iRrlfEmKp+QhdhFAIojDz02LNucz0EXr/BhIHiH+4GvEeVEN6nSbIOc0/7iBDCrFKJ6pI0t8ELJr3Ml6Yr8AC5KjEYX6if0U9RwudvQqjhRywaod5/4L9Ycse8H8+tWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459066; c=relaxed/simple;
	bh=X3/F3IO5+tRBw/cjkNeS1+ka/zH13uXRfva2+59iPQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvagP7MMtIyBmimoJA5b+yL9oJHEYll/R+jAeQ+KDlzw0AR6z3SM1Ounx9DM/1hDZfMhJWr86/U17oIoeMpA6UrPlfHgo3AjKrFzy9z1+bPTzU8+tT/I7ztMQaVKnArpsvd0iBDicnGaRc5BWv+/gkTUGdPB3ioSe12VCzjB3Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aX/V3UjS; arc=fail smtp.client-ip=40.93.198.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aX/V3UjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay3eyouc8qsDXAsC2sQKSzpD7RpUrWMnVYCW7dW5ed5mSIxor9ZCJClyC2gQ6po+HbGG8mFI+U0kIhFmvKV/aml2vRnpAqTG1gx693JVsrYLHTOmOFMl1CskamidyEeYzi8ZXZ2GJZU9VeqhO5hX6/KRY5uPCWVK/QEEnamRkc9rNCWKWE677qzsSIOD76bFfjQcMLt83E4+e1+6iuzyvIF+wpW7jSFYxMqkmZm66GyUBBoi0BnCyWXq2WEE6u+XrootLx0cBQWGMVA9mbEuHDr8uRnuvEuF+j4PnyZ6NUnPzMWKhYxTlwtIbcUQwsqG/OULnFLMvhKV00UhZcuCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KNTqA8xNrV3FPsfb4FibuOgPGXZ2Mg8KU62pPWzuTw=;
 b=x39ti7PFETCU+d0Aw6PGJqwi2xrpIQvj7vYQt4AUHBiIfsolwyMUtT9nXMBr/1ZMKuZ35HMa5FvBD441BMFb2N+w1ggxW3I85ANsBVtyU6VpDY0eiuXZS8ZrsUKuXm7Z8PnVtjeQGSsBOmZgFL4W8UKK3o7f8D+IMz9W26t1THzqZLVNuKUkKaj1Y8vIfEN3oS4LDczEt157w0FFNuCSUXD28C2y1pmXErV1HUox1tu15SEI+hsqRayBRi+pggtV5MTXDE33elVTccxbJue754WnLlCEGIXhvhHSYPPNPEwuUM007qXD3VNALxO14lFCCHbuzWX6xedQXFtADWmbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KNTqA8xNrV3FPsfb4FibuOgPGXZ2Mg8KU62pPWzuTw=;
 b=aX/V3UjSh30BORemtvB3j1qO5sO1NUiqGCN9feuGQC1ELTKEeb5bUaZi/dwf/AIrNM8Xz1OK7PwyLlM9xT7/WX6yEMBXQ/LpfvqkS2Xd9tIsAAcoqMinjRzulEKSLENnfUOvNQjPlqjw1HQq5tR3NpJO3B0kDxuXniq4K5J1cEQ=
Received: from SA0PR11CA0059.namprd11.prod.outlook.com (2603:10b6:806:d0::34)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:17:35 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::8a) by SA0PR11CA0059.outlook.office365.com
 (2603:10b6:806:d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:17:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:33 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
Subject: [PATCH v4 03/15] x86/resctrl: Add data structures and definitions for PLZA configuration
Date: Tue, 7 Jul 2026 16:16:51 -0500
Message-ID: <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783459023.git.babu.moger@amd.com>
References: <cover.1783459023.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: d390f00a-284a-45be-c210-08dedc6d2a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7F6O1xq5mozE68xd8C+DoNwxABNcrZNms6MfiTlI2HTVXENwLD6qbyimasw0Jdl/0CVZbsze7VoSvKXa5Pw+x7uOyl4oLE4Oe/h5z7TFU4QDIyAIbbHDpfs3MUcNDjWJayRfeLeqk5SBQ4QcGwUMw3SFJ6xkboCaGVaHaHIHlpKk0NOEYJFdwiZwsXnJBDT97ssm/dt2jTVxRBTF5ABGI9RWVIUN+9dBl5G+ZWpLttv32noG4Yair3+nn0QBEzt9nKV4eB7gVAT1pH8FQLECtSaT1ChoFLGt3L6GEhx6QA+eRGRjJ/Q5uBnEeuRf/TmqBT1g1cvhLFVx2kT3dx/vL/A5miFAK9aIv8E50QGaENjp2N/p9gwKoDFDmgp8xCWqaBDdMfCOz+OIr/8v8rvSSmcplzjSSJXmT3dW/OXIMN3jl/KGbGwb3uRQj3x+dnvSOnWQ83ZkWXT0QRmP5afd8jtKucPiHhbWOKONzzISHbDsDGvVxGmJWyQzM1sb9dmbuTwDouBmHiphqeLA1KKEdmy67mGxXNlX9i3HlujSePBanCE93+h/koxEVqSYGj4963BIG3lk/x+8fnkUT/gltxRbhaFsurceCDG0rsTV6qxrBzNDr/TmMdDp6RFUec3RIO8ZUC/MjEPkxJQI70cVPsveb4KJC1/i4tUQZ1VwLw6bKIQIZIPuIIEZkjcXugHi9O66kVFJvHMpbohGVgX6UA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KQb/2H9IbCWwuplLZ5Z1y+x690mwEUReosxA5zXbtGyM3wwHGM58igm4HS2+MgqZFjlgcEpHvk9k1NG4agDZZrPS+MoptMj12iICzoQZhgTlpSptMPt8zb1Z8JfnpTljBaIKzYcU+e6BAryHoK2mtCsFoZJ9Sl648AifIRo76CzZgKYSDT/SfHImTRlojEJ40nI6/vDc4nNEOcyyQ6S70hCwPtvDlK8KopKK665/+yB0Vejng990w1Cq44GVN78owtbkqn51EkTJYs/FfFLbuzdHUpdnF8osp+csGmKB1D+vLFBqvMQbTaZRXPaNIGlY4jFwY4kqtB+FdmW5A/YqVaWMdarvowNyI/dTQG/fS6rY91Hsg3FaHKBsRrskCe03rBofTkfdJRXWYxEUsTi1xXNDM7O7SyOxIqCG4Q0pxekv2WAf/23cYIcI3D9+Gi+7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:35.4854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d390f00a-284a-45be-c210-08dedc6d2a7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Privilege Level Zero Association (PLZA) allows the kernel to use a
different CLOSID (and optionally RMID) than user mode on entry to kernel
mode. The CLOSID/RMID association is programmed per CPU via
MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), using RMID/CLOSID values and their
respective enable bits.

Add the MSR definition and union msr_pqr_plza_assoc to represent the MSR
bitfield layout used by subsequent PLZA programming.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Re-wrote the changelog and code comment.

v3: No code changes. Patch order changed. Improved changelog.

v2: No changes. Just rebasing on top of the latest tip branch.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 37 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 18c4be75e927..2503451a95fe 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1292,6 +1292,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..020ebc2c8a1f 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -222,6 +222,43 @@ union l3_qos_abmc_cfg {
 	unsigned long full;
 };
 
+/*
+ * Privilege Level Zero Association (PLZA) is configured by writing to
+ * MSR_IA32_PQR_PLZA_ASSOC. The MSR must be programmed on every CPU in
+ * the QoS domain. Each domain supports only one PLZA CLOSID and/or RMID
+ * association. All fields other than PLZA_EN must hold the same value
+ * across the domain for consistent operation.
+ *
+ * When PLZA_EN is set, the CLOSID/RMID association used at CPL 0 is
+ * taken from MSR_IA32_PQR_PLZA_ASSOC instead of MSR_IA32_PQR_ASSOC.
+ *
+ * @rmid		: RMID associated with PLZA.
+ * @reserved1		: Reserved.
+ * @rmid_en		: Enable RMID association for PLZA.
+ * @closid		: CLOSID associated with PLZA.
+ * @reserved2		: Reserved.
+ * @closid_en		: Enable CLOSID association for PLZA.
+ * @reserved3		: Reserved.
+ * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
+ *			  given CPU. When PLZA is disabled for a CPU, the
+ *			  CLOSID and RMID association defined in the
+ *			  PQR_ASSOC MSR applies, regardless of the CPU's
+ *			  privilege level.
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

