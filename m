Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109EF7C0BE
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721761; cv=none; b=i8agLGp60/q4UY6X6ZAHUpE5AZS2xgZ/3G+yqRwUkqtv+GNTA4vtvxMWHwTnJVtP3sP90fLb8ndGqOn4KjaDRSYKTFyVw+Ohl+Eu0TqZrmVi7bNiZ65oo0OxRFk94xNJrXGXYqHKaoaBQh+S7WiKkKOxgBURqFhCpNGU4uhZTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721761; c=relaxed/simple;
	bh=RKfETeJ5M6wul7ruC9euhfuUUfanF67mO987XR1Xo/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z3jolilvAs0KJZWXo0V5/Fr+DSylnimbaUuUQghN6vJQdPzcL7pDZeen49aioHpSPg4OqqNTzmZVpTGIRQsBCn95tTRMiGU1jV/U7bkKMC1rvlaYSpBOmnXL5Hl2cD+C97TON56SDivwANdaUhBUqNgPcuJV/WsFtu7svIFS5T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xhqmj1RD8z2Fb4P;
	Mon,  4 Nov 2024 20:00:53 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id BF0DB1A0188;
	Mon,  4 Nov 2024 20:02:31 +0800 (CST)
Received: from huawei.com (10.145.6.51) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 4 Nov
 2024 20:02:30 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>, Zhou
 Wang <wangzhou1@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
Subject: [PATCH] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
Date: Mon, 4 Nov 2024 20:11:43 +0800
Message-ID: <20241104121143.2169264-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200012.china.huawei.com (7.221.188.145)

When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
during unmapping operation, which will cause some vSGIs interrupts lost.

To fix the issue, it needs to send vinvall command after vmovp.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 10 ++++++
 drivers/irqchip/irq-gic-v3-its.c            | 36 ++++++++++++++++-----
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b1861..77db10e944f0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -258,6 +258,8 @@ stable kernels.
 | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
 |                | ,11} SMMU PMCG  |                 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..27082e075d1a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1232,6 +1232,16 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100801
+	bool "Hip09 162100801 erratum support"
+	default y
+	help
+	  When enabled GICv4.1 in hip09, VMAPP will fail to clear some caches
+	  during unmapping operation, which will cause some vSGIs interrupts
+	  lost. So fix it by sending vinvall commands after vmovp.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 52f625e07658..69b09072d24d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
+#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
 #define RD_LOCAL_LPI_ENABLED                    BIT(0)
 #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
@@ -1314,6 +1315,14 @@ static void its_send_vmapp(struct its_node *its,
 	its_send_single_vcommand(its, its_build_vmapp_cmd, &desc);
 }
 
+static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
+{
+	struct its_cmd_desc desc;
+
+	desc.its_vinvall_cmd.vpe = vpe;
+	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
+}
+
 static void its_send_vmovp(struct its_vpe *vpe)
 {
 	struct its_cmd_desc desc = {};
@@ -1351,17 +1360,12 @@ static void its_send_vmovp(struct its_vpe *vpe)
 
 		desc.its_vmovp_cmd.col = &its->collections[col_id];
 		its_send_single_vcommand(its, its_build_vmovp_cmd, &desc);
+		if (is_v4_1(its) && (its->flags &
+			    ITS_FLAGS_WORKAROUND_HISILICON_162100801))
+			its_send_vinvall(its, vpe);
 	}
 }
 
-static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
-{
-	struct its_cmd_desc desc;
-
-	desc.its_vinvall_cmd.vpe = vpe;
-	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
-}
-
 static void its_send_vinv(struct its_device *dev, u32 event_id)
 {
 	struct its_cmd_desc desc;
@@ -4781,6 +4785,14 @@ static bool its_set_non_coherent(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_162100801;
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4827,6 +4839,14 @@ static const struct gic_quirk its_quirks[] = {
 		.init	= its_enable_quirk_hip07_161600802,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100801
+	{
+		.desc	= "ITS: Hip09 erratum 162100801",
+		.iidr	= 0x00051736,
+		.mask	= 0xffffffff,
+		.init	= its_enable_quirk_hip09_162100801,
+	},
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
 	{
 		.desc   = "ITS: Rockchip erratum RK3588001",
-- 
2.34.1

