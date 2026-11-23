Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404757;
	b=LA0wMTPjiIE8WA6oWW7kk5ZAerhbeqmGpdE1kY4K9R4GB2LizzYKWq+UKdwjZLmTx+vB
	 C4EQi1EsCzzqh8riK3W9XxBsF7iiUyTveDXS4tAvC8MHD4hgiL8E63/4E+qrj1SJExCbd
	 AFuEwanuysSKkjk/QSDt3syEvMSzmJLnete5w0Hi3A+lnOEXOil/sv1igw03u513lmNby
	 s/5NWbfIR+TnjMg3yEjFUH0tc5kalc+bj0JrMRJIzF8/qbDsb6KHV6+jx1OGRlieuVB/Y
	 3IA3U19Pc8M3LPxqXj3PhXw+crW/vVm46k3gwtXuwP9avj9g//ZvA0wDnXepi4gdDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404757;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=HTuc4PPVjvPSPrnzlo65kpf6x+DRB3BoRJK0cybPyUc=;
	b=rmiTNNWaWHVC+Rsz4YAnMctQQ8ZtAITN+ToWTOqaQaihhSPAePrFNOXzfePzNu8hbtkm
	 hjEOUn4aaGKaqhxr3HJhyTfjnFMIoCAp+FybF/WDp/6th+LVSWIiroEyTh53dik6yklup
	 JrQsbgJ38OcBbKyWBiasWxH5qMM6D6r+FHQLucN/UqbJ4dYviT1RzvZ0lhdp+9kG6wUf2
	 N0G8i/dbaVMN7hDDr0/xSWor60rRo/e8HwQaD2sPSvVc8sRdx3sBp70vnUs6O7EAfbaVO
	 MCwG8XTcVq08eh6gxsUtSwL/m8pcjYjxbN1Rj19REX8tkhugXnlmJVC/LjpFzl73IRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ypsah1jH;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA65606A31A;
	Mon, 23 Nov 2026 03:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ypsah1jH
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HTuc4PPVjvPSPrnzlo65kpf6x+DRB3BoRJK0cybPyUc=;
	b=Ypsah1jHxA0fC+6TtqOU7fe6cKNpFUlt2u9yxuH8l/CyfzcHuYy+3kksNxTlrniD4ZRy69ugW
	CLd3rgkeYxYRqJxMaxf/n1boqVwv8sqQ27E9BvaCyx2NfG4PUynq0wjsHpP0nhbEBDKWIDqIAO+
	GBdTWGgyWG5LIomVqswrGcI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jXs193VM5zcbS2;
	Mon, 23 Nov 2026 11:31:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C45C340537;
	Mon, 23 Nov 2026 11:32:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 11:32:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <will@kernel.org>,
	<jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>, <kas@kernel.org>,
	<steven.price@arm.com>, <chenhuacai@kernel.org>, <tzimmermann@suse.de>,
	<wenst@chromium.org>, <ruanjinjie@huawei.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
Subject: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI path reachable
Date: Mon, 23 Nov 2026 11:32:22 +0800
Message-ID: <20261123033222.1067923-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

While the SDEI cross-CPU NMI is active it claims every cross-CPU
backtrace, so on a platform whose firmware exposes SDEI event 0
the irqchip NMI path can never be used.  There is no way to opt out.

Add a boot parameter "sdei_nmi.disabled".

With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
declines every request, so arch_trigger_cpumask_backtrace() falls
through to its IPI path and smp_send_stop() skips its SDEI rung.

Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++++
 drivers/firmware/Kconfig                      |  4 ++++
 drivers/firmware/arm_sdei_nmi.c               | 23 +++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..9a3ce8ed18f4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6958,6 +6958,14 @@ Kernel parameters
 			1 -- enable.
 			Default value is 1.
 
+	sdei_nmi.disabled= [ARM64,EARLY]
+			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
+			path in place. Requires the kernel to be built with
+			CONFIG_ARM_SDEI_NMI.
+			Format: { "0" | "1" }
+			0 -- enable (default).
+			1 -- disable.
+
 	serialnumber	[BUGS=X86-32]
 
 	sev=option[,option...] [X86-64]
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 43e2e2a64594..4c8b917867dd 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -58,6 +58,10 @@ config ARM_SDEI_NMI
 	  regardless of the target's PSTATE.DAIF -- forced delivery into a
 	  CPU wedged with interrupts locally masked.
 
+	  This provider takes over every cross-CPU backtrace; set the
+	  kernel parameter "sdei_nmi.disabled" to 1 to use the irqchip
+	  NMI path instead.
+
 	  If unsure, say N.
 
 config EDD
diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
index 038eb79e28ac..baf89f88c4f1 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -62,6 +62,18 @@
 
 static bool sdei_nmi_available;
 
+/*
+ * Mirrors irqchip.gicv3_pseudo_nmi=: the architected NMI path
+ * is preferred when asked for, and SDEI stays out of the way.
+ */
+static bool sdei_nmi_disabled __ro_after_init;
+
+static int __init sdei_nmi_disable_setup(char *str)
+{
+	return kstrtobool(str, &sdei_nmi_disabled);
+}
+early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
+
 #define SDEI_NMI_EVENT			0
 
 /*
@@ -168,7 +180,7 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
  */
 bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
-	if (!sdei_nmi_available)
+	if (!sdei_nmi_available || sdei_nmi_disabled)
 		return false;
 
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
@@ -178,7 +190,7 @@ bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 
 bool sdei_nmi_active(void)
 {
-	return sdei_nmi_available;
+	return sdei_nmi_available && !sdei_nmi_disabled;
 }
 
 /*
@@ -194,6 +206,9 @@ void sdei_nmi_stop_cpus(const cpumask_t *mask)
 {
 	unsigned int cpu;
 
+	if (sdei_nmi_disabled)
+		return;
+
 	WRITE_ONCE(sdei_nmi_stopping, true);
 
 	/*
@@ -238,6 +253,10 @@ static int __init sdei_nmi_init(void)
 	}
 
 	sdei_nmi_available = true;
+	if (sdei_nmi_disabled) {
+		pr_info("SDEI cross-CPU NMI disabled by sdei_nmi.disabled.\n");
+		return 0;
+	}
 	pr_info("using SDEI cross-CPU NMI (SDEI_EVENT_SIGNAL, event %u)\n",
 		SDEI_NMI_EVENT);
 
-- 
2.34.1

