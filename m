Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AAA3939DB;
	Thu, 30 Apr 2026 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591561; cv=fail; b=NLuP2jAHqgMlQ1TVLxnTGLC66SNsFe49FHF3O//MOZiUQQDJqjmxDIBpiApyUYzJT19xHswsqOvE/kcfIr6XiB9qp/18NqjdcuUzdSOExQG9p58BuPdecPMS8+3AuX8oIaewC1E1jxNuPDsU5+qJPDkvFLhbb7v49HE+bcbtNqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591561; c=relaxed/simple;
	bh=XL+8M0+9C8nCj3l+qFbZAKbC/2WkHr8p3nhQwUc8u74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ct7kKDgSWGBAEja1VCkomaVVcRte+qN1XN3G32woWpG2Hpf+S/YN/Ii1gCUh0DfMgfYaDuQXXLQA5dDthaWHc9BNp1+i4VYdR+xTlnIpQqB8Kq9HfhN0IeLaXGFmXhIaIc/V3cnkRQuH/0BqJzIFQhkSzcxALQRbLz4GX6uR+Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=glraDawX; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="glraDawX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svp4VlLuaaH3lhygkN1cN1pix7AooOPVw7NKWm0LqwXSYwQzeVATSQY4EryUrE/yQSKs9AX0p1dFkjfln6VbhoaF3dnTyu4wFINQRPuwRG7DUg5kIImCKBialFg+hDvkN77/ARKvy6JJQBgjswdYy7Vp/bZm41aohY3QHHwpZC1LO45o+nlKlv95lJxD5veOizwKaB6flMZ9YgojQc+5w6qIYNeixqi6a6Vhxt+9+U4gjuFV1y8pB2KRkVPdJ5eGm+4/oB92FNYozfcPir3qw4zEDID6e9khnejI/5S4Rx04+2CBoez7QvV0bKHxdzejSs1W+1QJfJicZj/g9+muLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3wNUh+EYo3ygKN3Gl//5KCo8ArGaNmrqkl36FdZWD0=;
 b=RktSx4Da/vkPql7YwEmDr9umkViezCRwJM8WOy3yLNtu57ginxQc79B+9aPq6dxaRFSUQNW0IyjzAvSokSpXJxin+Sz3WeLI9z0AeCX3HZBxlRMvg/c+RaIZOYZalNzn5zADn//kE6N1sMeIhPUIlsr6UrzZ7OKS2JJaLd9odEXF/6syFr22hpIaZhJuPxDUnygAl4eyBt9iw0aR7zA+8JoHiCZVd61QK7rAxqQboDueU0sOCG41VrNMCXiKMgSW/L8mggTC2cxu2E0xGC6uMVS6no2c3e80/r6UFGrFrHGPONSUzFhKksni9LV2diW5Hgv2ewWcpc6g3IsP6BBpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3wNUh+EYo3ygKN3Gl//5KCo8ArGaNmrqkl36FdZWD0=;
 b=glraDawXp8RPIWOz6h4COLFskhwHb2IZDKE0neBzklYfggHDw2k9RCWuucv6SmKT2YVoaImXo+WVPqnHwyIuPi+uL3ntFmy1FJniJRDu3TbdrpILl6Moq2RhM+K4XSUNRcn0Ak56EBbW7xKmtlenzJX5/HqIM1XzmLSWG+63vsA=
Received: from SA0PR11CA0132.namprd11.prod.outlook.com (2603:10b6:806:131::17)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 23:25:52 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::b4) by SA0PR11CA0132.outlook.office365.com
 (2603:10b6:806:131::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 23:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:52 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:50 -0500
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
Subject: [PATCH v3 05/12] x86/resctrl: Initialize supported kernel modes for PLZA
Date: Thu, 30 Apr 2026 18:24:50 -0500
Message-ID: <95188117225c9235be89753edcace115cf5c2e5f.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 835987a3-3813-45f3-84b0-08dea70fd21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RZzl7blm4TwKyZCndMxFCFy57vBCeMeu7c5JPJvUQROR5mcI4+873h9Fr91kjkhBa2LPRoezStZS/fNXbk26ismehlSNAwhudpfAUyZpSdDViip/TUeDn9XyIYL/0NmvzFouuvLnckR4hLKMiKOQumWZUvQK3zV/6+W/eXIUoIb51aKA7og2u3vqy+O4IsDxSBoNUpn9wBwDqf4eb+3B0D3bayfgD4qgutmIv68hiQ3/leSCwEmoMsUcdTamIzpHvuqneuAcR4JG4r/911gNMQueabyED5m8k//p82itg/kH+iGSoqCH2kMuirzVpWIyYHUm0GZTayC3VOpN2USH1n4D8tU1eqaWwoUG+cdojoZDcMf/+OsF9L/F+yUvzG7hS+mIrwQNpVYQtTOG15eSF821MrDyQoKc9kGD8DpawZaxl9i5x1cy0eqluwn9Kh5QjWGQu2p8mIjaztQ5+KB/npamhJyWoeqtpKQoWf/kP6fwrRFyW3EBKoRg+B+u+69Z6ZHkMoWkx7CtG3yNUjcz3+EJETRfV+t7vL4m2mCLyQ+bhW6qMp/fZHOeIpIyjL2g0EHLw1pv//s0Brd+uQTbWq7DGxnMKZgKSlnR3N+Pw7uI28//ZWJiSkusygO8c8joE9HAnwbZ9LQGnrnxM/IaeYHeAF9Szl5Bins6Ioo6TN6vEik+Et68GbpqE4gDNbPzz9uzZBiPaN3TFdtxOvgHBYEuQJCXqDeornJZTDfyjPQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DU+/1olxiBLmFYmQKT3Gf+0YBcIunlRp6hnXW7DAMhEip+50QC81od2HYvYHGLRS2Q6zShw8+Q+olIf0FYNa8bflfHo5y59zt0AXPljBSWudciz4+E4aa6JwafqIHka0VVJxDvGq/lsSfAIZdZlj1ZO0tf0nWqf9Un8054VN7HDV50/C6hTojTLzeIn4Pf241bIw6XDizZArPr1T7QlD1Fml78YlbVAXdPcqeVMdSWcaD0X0SJS8qwW8uaC5XYxfkFMIYQjVeKpEIdrfEevXPqQobGK7wzu9doNoQch8iBhm2QL99W9M5BvC3ZAETgjTILzsyDRTnp23hL5jq7OjsRhhzm1n6uaRrRHEW+W3H20vOfYxcu+CRTriYBuUHu+u0MLBZiPgQPcBeNuGr+Yh+/e2lMWpCMhzXn9deJV34frroHW03pm/ke33+Mp0UZuz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:52.4100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 835987a3-3813-45f3-84b0-08dea70fd21e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

Resctrl subsystem tracks which kernel-mode CLOSID/RMID policies the
platform can offer via struct resctrl_kmode_cfg and
resctrl_arch_get_kmode_support(). AMD PLZA (Privilege Level Zero
Association) is the x86 feature that allows kernel traffic to use an
assigned CLOSID alone or CLOSID and RMID together.

Report the available kernel-modes when x86 PLZA is enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to report all the supported kernel mode by arch.
---
 arch/x86/kernel/cpu/resctrl/core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 4a8717157e3e..699d8bb82875 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -894,6 +894,21 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 	}
 }
 
+/**
+ * resctrl_arch_get_kmode_support() - x86: record which kernel-mode policies hardware supports
+ * @kcfg:	Cumulative snapshot; OR bits into @kcfg->kmode (see &struct resctrl_kmode_cfg).
+ *
+ * When PLZA is present (CPUID X86_FEATURE_PLZA), the kernel may assign a CLOSID
+ * for kernel work alone or assign CLOSID and RMID together.  Advertise both
+ * assign-style modes in @kcfg->kmode using &enum resctrl_kernel_modes indices.
+ */
+void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg)
+{
+	if (rdt_cpu_has(X86_FEATURE_PLZA))
+		kcfg->kmode |= BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) |
+				BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
+}
+
 static __init bool get_mem_config(void)
 {
 	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_MBA];
-- 
2.43.0

