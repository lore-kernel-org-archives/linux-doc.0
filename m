Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651BBA34
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478774; cv=none; b=Olho/eNXgKAEvKhcCbpRle9QYtIUkTR9qwfiIm56c5Q4lHzalAPw6WRkgioNOWHudTf1i4h31kk7cEUXE/a9gWYm2QohfYxIKfw9VAe5B9CKhtgNkWTf/LkHiDoxGE8e2781L92pgNMkN51fUIq1nGPqbb5FvONv96p/LeaOFsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478774; c=relaxed/simple;
	bh=jYYrHs2/EWTSDL/8+mxZLxnpVnujhXbA7ZOz56tBxHc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c6S3XjgIPLHPNsAMGJ2tarf3J80SnodM44+FiNn+jrt520k0U0O1GQ/qsDBJqkYH40wcBH2uP4bOMXKbqBnaM9+1B4YAiaJ6KoiBFquE8eTvRotUf9i392QwgTHJMyCdnOcFnhaSOBXllJuGkvUCxdrtfEVNfqbZniqRGzlDSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XpCjL50MvzDqk2;
	Wed, 13 Nov 2024 14:16:38 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id B3DB3180115;
	Wed, 13 Nov 2024 14:19:18 +0800 (CST)
Received: from huawei.com (10.145.6.51) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 13 Nov
 2024 14:19:16 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<wangwudi@hisilicon.com>, <prime.zeng@hisilicon.com>, Zhou Wang
	<wangzhou1@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
Subject: [PATCH v3] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
Date: Wed, 13 Nov 2024 14:27:59 +0800
Message-ID: <20241113062759.1042187-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200012.china.huawei.com (7.221.188.145)

When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
during unmapping operation, which will cause some vSGIs lost.

To fix the issue, invalidate related vPE cache through GICR_INVALLR
after VMOVP.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 11 ++++
 drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++++++----
 3 files changed, 58 insertions(+), 11 deletions(-)

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
index 70d7f4f20225..0ea9c599681d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1232,6 +1232,17 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100801
+	bool "Hip09 162100801 erratum support"
+	default y
+	help
+	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
+	  during unmapping operation, which will cause some vSGIs lost.
+	  To fix the issue, invalidate related vPE cache through GICR_INVALLR
+	  after VMOVP.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 52f625e07658..2cd1826b4bbd 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
+#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
 #define RD_LOCAL_LPI_ENABLED                    BIT(0)
 #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
@@ -61,6 +62,7 @@ static u32 lpi_id_bits;
 #define LPI_PENDBASE_SZ		ALIGN(BIT(LPI_NRBITS) / 8, SZ_64K)
 
 static u8 __ro_after_init lpi_prop_prio;
+static struct its_node *find_4_1_its(void);
 
 /*
  * Collection structure - just an ID, and a redistributor address to
@@ -3797,6 +3799,22 @@ static void its_vpe_db_proxy_move(struct its_vpe *vpe, int from, int to)
 	raw_spin_unlock_irqrestore(&vpe_proxy.lock, flags);
 }
 
+static void its_vpe_4_1_invall_locked(int cpu, struct its_vpe *vpe)
+{
+	void __iomem *rdbase;
+	u64 val;
+
+	val  = GICR_INVALLR_V;
+	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
+
+	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
+	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
+	gic_write_lpir(val, rdbase + GICR_INVALLR);
+
+	wait_for_syncr(rdbase);
+	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
+}
+
 static int its_vpe_set_affinity(struct irq_data *d,
 				const struct cpumask *mask_val,
 				bool force)
@@ -3866,6 +3884,16 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	vpe->col_idx = cpu;
 
 	its_send_vmovp(vpe);
+
+	/*
+	 * Version of ITS is same in one system. As there is no cache in ITS,
+	 * and only cache in related GICR should be clean, directly use
+	 * GICR_INVALLR to clean cache, which will get a better performance
+	 * here.
+	 */
+	if (find_4_1_its()->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801)
+		its_vpe_4_1_invall_locked(cpu, vpe);
+
 	its_vpe_db_proxy_move(vpe, from, cpu);
 
 out:
@@ -4173,22 +4201,12 @@ static void its_vpe_4_1_deschedule(struct its_vpe *vpe,
 
 static void its_vpe_4_1_invall(struct its_vpe *vpe)
 {
-	void __iomem *rdbase;
 	unsigned long flags;
-	u64 val;
 	int cpu;
 
-	val  = GICR_INVALLR_V;
-	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
-
 	/* Target the redistributor this vPE is currently known on */
 	cpu = vpe_to_cpuid_lock(vpe, &flags);
-	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
-	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
-	gic_write_lpir(val, rdbase + GICR_INVALLR);
-
-	wait_for_syncr(rdbase);
-	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
+	its_vpe_4_1_invall_locked(cpu, vpe);
 	vpe_to_cpuid_unlock(vpe, flags);
 }
 
@@ -4781,6 +4799,14 @@ static bool its_set_non_coherent(void *data)
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
@@ -4827,6 +4853,14 @@ static const struct gic_quirk its_quirks[] = {
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

