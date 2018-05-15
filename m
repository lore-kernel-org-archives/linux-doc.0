Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B50A7D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 12:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752232AbeEOMww (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 08:52:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7255 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752072AbeEOMwv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 May 2018 08:52:51 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3EDDDDB64E1AB;
        Tue, 15 May 2018 20:52:35 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.382.0; Tue, 15 May 2018 20:52:29 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <rkrcmar@redhat.com>, <corbet@lwn.net>, <christoffer.dall@arm.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
        <rjw@rjwysocki.net>, <bp@alien8.de>, <lenb@kernel.org>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-acpi@vger.kernel.org>,
        <devel@acpica.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengxiang9@huawei.com>
Subject: [PATCH v12 4/4] arm64: handle NOTIFY_SEI notification by the APEI driver
Date:   Wed, 16 May 2018 04:58:07 +0800
Message-ID: <1526417887-25843-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526417887-25843-1-git-send-email-gengdongjiu@huawei.com>
References: <1526417887-25843-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a helper to handle the NOTIFY_SEI notification, when kernel
gets the NOTIFY_SEI notification, call this helper and let APEI
driver to handle this notification.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 arch/arm64/include/asm/system_misc.h |  1 +
 arch/arm64/kernel/traps.c            |  4 ++++
 arch/arm64/mm/fault.c                | 10 ++++++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
index 07aa8e3..9ee13ad 100644
--- a/arch/arm64/include/asm/system_misc.h
+++ b/arch/arm64/include/asm/system_misc.h
@@ -57,6 +57,7 @@ void hook_debug_fault_code(int nr, int (*fn)(unsigned long, unsigned int,
 })
 
 int handle_guest_sea(phys_addr_t addr, unsigned int esr);
+int handle_guest_sei(void);
 
 #endif	/* __ASSEMBLY__ */
 
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index bbb0fde..d888eb2 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -681,6 +681,10 @@ bool arm64_is_fatal_ras_serror(struct pt_regs *regs, unsigned int esr)
 {
 	u32 aet = arm64_ras_serror_get_severity(esr);
 
+	/* The APEI driver may handle this RAS error. */
+	if (!handle_guest_sei())
+		return false;
+
 	switch (aet) {
 	case ESR_ELx_AET_CE:	/* corrected error */
 	case ESR_ELx_AET_UEO:	/* restartable, not yet consumed */
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index f76bb2c..8f29bd8 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -683,6 +683,16 @@ int handle_guest_sea(phys_addr_t addr, unsigned int esr)
 	return ret;
 }
 
+int handle_guest_sei(void)
+{
+	int ret = -ENOENT;
+
+	if (IS_ENABLED(CONFIG_ACPI_APEI_SEI))
+		ret = ghes_notify_sei();
+
+	return ret;
+}
+
 asmlinkage void __exception do_mem_abort(unsigned long addr, unsigned int esr,
 					 struct pt_regs *regs)
 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
