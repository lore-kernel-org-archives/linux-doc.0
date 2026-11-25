Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594103;
	b=Hct7wcW1MeH58grzArr0cedkQj6alLRE/nB7dpJwOmVaeSqow76EroLPGd6QUHQFpLCh
	 nLd51mOT5DrIBk3QGPA9kTNej2JIFY5jzlVYNLfPyngre+pxpQwKVRsC0oi1/JCxdF8L2
	 mJrPe3Y+SteqEuNEf9G1OXyaNrl75Et4uGhjC5fSa7XPQQWdjtzv5LZ4lPnONK52Uw/VK
	 +c1cwjjCkznQiiTQoBvtlS7QWP8RjdamIy/cq//C4F/Z5q6FmEUs7xfLHwcYKVVFzGwQF
	 b6FPHpkkx23DwMcbKenhz2uL2coxNKxHGwPbHMKiRw2yNwrsOuhVM+CUFI3QKzfZ2BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594103;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wrzhx5t/iGLS3qmtq75RdlxMdlTkWisQNBBhZbaEnus=;
	b=wNN6e5QTwDpYbfWfYTDdMtmFgEPUTr68gkiN/cH0IHutd81SoEOkL15DVxtV370+tqXd
	 U5pcw2/9OtJnoTNEjEMIYcz+tLc7CQhvS3UXQwFAcTDXZiGJKjmaxtouqxCzC40lcOTyw
	 9FJxtzafhQ8qqtGbdseiAQBBGd7a5GdLeeXbTKl2rBLaIgJbPElEhjXKIBTu/WppcS5Cd
	 iVk9TeK9oH7gEzCK7zHccZlGXcBnOZDIMSX3fRBla5nmNLgejGPlnYF6Na94vQly8o7dr
	 cSjHtBpdXalkih3P8PEcyJHH/wN18XzAqeNBYY4tYTafhV/pPJDYyXVBgB06pYjxXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tqS4Klv7;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49736606A31E;
	Wed, 25 Nov 2026 08:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49736606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tqS4Klv7
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wrzhx5t/iGLS3qmtq75RdlxMdlTkWisQNBBhZbaEnus=;
	b=tqS4Klv7lZR7U71zCQvspliNcOl7SRTvkKu0Ui1p+Y5PdwRVxMjBpxFRaIeVw15g3YNxVh010
	/Yvombh6gXV1DJUdZn2eayPuW8xt9UXo1p91PW0pyQiQjInUMQm7Xv0PQpfwe2KOPh+1iu0Dswd
	VhL+XpECdeYyxpIcX2aKZHk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZC3M1GPQz1prQf;
	Wed, 25 Nov 2026 16:07:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 308F74057F;
	Wed, 25 Nov 2026 16:08:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:08:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <suzuki.poulose@arm.com>,
	<will@kernel.org>, <tzungbi@kernel.org>, <kas@kernel.org>,
	<wenst@chromium.org>, <steven.price@arm.com>, <tzimmermann@suse.de>,
	<ruanjinjie@huawei.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
Subject: [PATCH v2] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI path reachable
Date: Wed, 25 Nov 2026 16:08:12 +0800
Message-ID: <20261125080812.1225194-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

While the SDEI cross-CPU NMI provider is active it claims every
cross-CPU backtrace, so on a platform whose firmware exposes SDEI
event 0 the irqchip NMI path can never be used.  There is no way to
opt out.

Add a boot parameter "sdei_nmi.disabled".

With sdei_nmi.disabled=1, the SDEI NMI will not be registered, so
sdei_nmi_available stays false and the hooks decline on their own, which
lets arch_trigger_cpumask_backtrace() fall through to its IPI path.

Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Alphabetical order.
- Simplify the code by return before registering event 0.
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 drivers/firmware/Kconfig                        |  4 ++++
 drivers/firmware/arm_sdei_nmi.c                 | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..4f07c771b46b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6934,6 +6934,14 @@ Kernel parameters
 			non-zero "wait" parameter.  See weight_single
 			and weight_many.
 
+	sdei_nmi.disabled= [ARM64,EARLY]
+			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
+			path in place. Requires the kernel to be built with
+			CONFIG_ARM_SDEI_NMI.
+			Format: { "0" | "1" }
+			0 -- enable (default).
+			1 -- disable.
+
 	sdw_mclk_divider=[SDW]
 			Specify the MCLK divider for Intel SoundWire buses in
 			case the BIOS does not provide the clock rate properly.
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
index 038eb79e28ac..0e146e603354 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -62,6 +62,18 @@
 
 static bool sdei_nmi_available;
 
+/*
+ * Mirrors irqchip.gicv3_pseudo_nmi=: the architected NMI path
+ * is preferred when asked for, and SDEI stays out of the way.
+ */
+static bool sdei_nmi_disabled __initdata;
+
+static int __init sdei_nmi_disable_setup(char *str)
+{
+	return kstrtobool(str, &sdei_nmi_disabled);
+}
+early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
+
 #define SDEI_NMI_EVENT			0
 
 /*
@@ -222,6 +234,11 @@ static int __init sdei_nmi_init(void)
 	if (!sdei_is_present())
 		return 0;
 
+	if (sdei_nmi_disabled) {
+		pr_info("SDEI cross-CPU NMI disabled by sdei_nmi.disabled.\n");
+		return 0;
+	}
+
 	err = sdei_event_register(SDEI_NMI_EVENT, sdei_nmi_handler, NULL);
 	if (err) {
 		pr_err("sdei_event_register(%u) failed: %d\n",
-- 
2.34.1

