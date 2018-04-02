Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B2D47E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 12:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752230AbeDBMZf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 08:25:35 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57514 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751298AbeDBMZG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Apr 2018 08:25:06 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8BA34169DDB84;
        Mon,  2 Apr 2018 20:24:59 +0800 (CST)
Received: from linux.site (10.67.187.223) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.361.1; Mon, 2 Apr 2018
 20:24:52 +0800
From:   Abbott Liu <liuwenliang@huawei.com>
To:     <aryabinin@virtuozzo.com>, <dvyukov@google.com>, <corbet@lwn.net>,
        <linux@armlinux.org.uk>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kstewart@linuxfoundation.org>,
        <gregkh@linuxfoundation.org>, <f.fainelli@gmail.com>,
        <liuwenliang@huawei.com>, <akpm@linux-foundation.org>,
        <linux@rasmusvillemoes.dk>, <mawilcox@microsoft.com>,
        <pombredanne@nexb.com>, <ard.biesheuvel@linaro.org>,
        <vladimir.murzin@arm.com>, <alexander.levin@verizon.com>,
        <nicolas.pitre@linaro.org>, <tglx@linutronix.de>,
        <thgarnie@google.com>, <dhowells@redhat.com>,
        <keescook@chromium.org>, <arnd@arndb.de>, <geert@linux-m68k.org>,
        <tixy@linaro.org>, <julien.thierry@arm.com>,
        <mark.rutland@arm.com>, <james.morse@arm.com>,
        <zhichao.huang@linaro.org>, <jinb.park7@gmail.com>,
        <labbott@redhat.com>, <philip@cog.systems>,
        <grygorii.strashko@linaro.org>, <catalin.marinas@arm.com>,
        <opendmb@gmail.com>, <kirill.shutemov@linux.intel.com>,
        <kasan-dev@googlegroups.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-mm@kvack.org>
Subject: [PATCH v3 2/6] Disable instrumentation for some code
Date:   Mon, 2 Apr 2018 20:04:36 +0800
Message-ID: <20180402120440.31900-3-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20180402120440.31900-1-liuwenliang@huawei.com>
References: <20180402120440.31900-1-liuwenliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.223]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Andrey Ryabinin <a.ryabinin@samsung.com>

Disable instrumentation for arch/arm/boot/compressed/*
,arch/arm/kvm/hyp/* and arch/arm/vdso/* because those
code won't linkd with kernel image.

Disable kasan check in the function unwind_pop_register
because it doesn't matter that kasan checks failed when
unwind_pop_register read stack memory of task.

Reviewed-by: Russell King - ARM Linux <linux@armlinux.org.uk>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Abbott Liu <liuwenliang@huawei.com>
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 arch/arm/boot/compressed/Makefile | 1 +
 arch/arm/kernel/unwind.c          | 3 ++-
 arch/arm/kvm/hyp/Makefile         | 4 ++++
 arch/arm/vdso/Makefile            | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 45a6b9b..966103e 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -24,6 +24,7 @@ OBJS		+= hyp-stub.o
 endif
 
 GCOV_PROFILE		:= n
+KASAN_SANITIZE		:= n
 
 #
 # Architecture dependencies
diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index 0bee233..2e55c7d 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -249,7 +249,8 @@ static int unwind_pop_register(struct unwind_ctrl_block *ctrl,
 		if (*vsp >= (unsigned long *)ctrl->sp_high)
 			return -URC_FAILURE;
 
-	ctrl->vrs[reg] = *(*vsp)++;
+	ctrl->vrs[reg] = READ_ONCE_NOCHECK(*(*vsp));
+	(*vsp)++;
 	return URC_OK;
 }
 
diff --git a/arch/arm/kvm/hyp/Makefile b/arch/arm/kvm/hyp/Makefile
index 63d6b40..0a8b500 100644
--- a/arch/arm/kvm/hyp/Makefile
+++ b/arch/arm/kvm/hyp/Makefile
@@ -24,3 +24,7 @@ obj-$(CONFIG_KVM_ARM_HOST) += hyp-entry.o
 obj-$(CONFIG_KVM_ARM_HOST) += switch.o
 CFLAGS_switch.o		   += $(CFLAGS_ARMV7VE)
 obj-$(CONFIG_KVM_ARM_HOST) += s2-setup.o
+
+GCOV_PROFILE	:= n
+KASAN_SANITIZE	:= n
+UBSAN_SANITIZE	:= n
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index bb411821..87abbb7 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -30,6 +30,8 @@ CFLAGS_vgettimeofday.o = -O2
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
 
+KASAN_SANITIZE := n
+
 # Force dependency
 $(obj)/vdso.o : $(obj)/vdso.so
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
