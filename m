Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C16C83F01
	for <linux-doc@archiver.kernel.org>; Thu, 31 Aug 2023 13:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244296AbjHaNCC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Aug 2023 09:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjHaNCC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Aug 2023 09:02:02 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3005BCFF
        for <linux-doc@vger.kernel.org>; Thu, 31 Aug 2023 06:01:59 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Rc1V86mHXz1L9BN;
        Thu, 31 Aug 2023 21:00:16 +0800 (CST)
Received: from huawei.com (10.67.174.58) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 31 Aug
 2023 21:01:56 +0800
From:   Chen Jiahao <chenjiahao16@huawei.com>
To:     <corbet@lwn.net>, <linux@armlinux.org.uk>, <paulmck@kernel.org>,
        <rdunlap@infradead.org>, <catalin.marinas@arm.com>,
        <mpe@ellerman.id.au>, <rostedt@goodmis.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     <chenjiahao16@huawei.com>
Subject: [PATCH -next] ARM: spectre-bhb: expand boot cmdline param to turn off mitigation on ARM32
Date:   Thu, 31 Aug 2023 21:01:40 +0800
Message-ID: <20230831130140.291250-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

spectre-bhb mitigation is enabled by default on ARM32, which may
cause performance regression. To offer an option to turn off the
mitigation, here expand an existing cmdline parameter 'nospectre_bhb'
to ARM32, which sets up a switch to skip the mitigation code entry
and bhb workarounds in mitigation method handler.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm/mm/proc-v7-bugs.c                      | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0a1731a0f0ef..856edb4403fb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3902,7 +3902,7 @@
 	nospec_store_bypass_disable
 			[HW] Disable all mitigations for the Speculative Store Bypass vulnerability
 
-	nospectre_bhb	[ARM64] Disable all mitigations for Spectre-BHB (branch
+	nospectre_bhb	[ARM,ARM64] Disable all mitigations for Spectre-BHB (branch
 			history injection) vulnerability. System may allow data leaks
 			with this option.
 
diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
index 8bc7a2d6d6c7..dd2ddece714f 100644
--- a/arch/arm/mm/proc-v7-bugs.c
+++ b/arch/arm/mm/proc-v7-bugs.c
@@ -9,6 +9,15 @@
 #include <asm/spectre.h>
 #include <asm/system_misc.h>
 
+static int nospectre_bhb __read_mostly;
+
+static int __init nospectre_bhb_setup(char *str)
+{
+	nospectre_bhb = 1;
+	return 0;
+}
+early_param("nospectre_bhb", nospectre_bhb_setup);
+
 #ifdef CONFIG_ARM_PSCI
 static int __maybe_unused spectre_v2_get_cpu_fw_mitigation_state(void)
 {
@@ -226,6 +235,11 @@ static void cpu_v7_spectre_bhb_init(void)
 {
 	unsigned int state, method = 0;
 
+	if (nospectre_bhb) {
+		pr_info_once("Spectre bhb: hardening is disabled\n");
+		return;
+	}
+
 	switch (read_cpuid_part()) {
 	case ARM_CPU_PART_CORTEX_A15:
 	case ARM_CPU_PART_BRAHMA_B15:
-- 
2.34.1

