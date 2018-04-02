Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F6F57E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 12:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751265AbeDBMZb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 08:25:31 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57450 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751315AbeDBMZG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Apr 2018 08:25:06 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 33F342E70BD80;
        Mon,  2 Apr 2018 20:24:59 +0800 (CST)
Received: from linux.site (10.67.187.223) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.361.1; Mon, 2 Apr 2018
 20:24:53 +0800
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
Subject: [PATCH v3 6/6] Enable KASan for arm
Date:   Mon, 2 Apr 2018 20:04:40 +0800
Message-ID: <20180402120440.31900-7-liuwenliang@huawei.com>
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

This patch enable kernel address sanitizer for arm.

Cc: Andrey Ryabinin <a.ryabinin@samsung.com>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Abbott Liu <liuwenliang@huawei.com>
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 Documentation/dev-tools/kasan.rst | 2 +-
 arch/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index f7a18f2..d92120d 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -12,7 +12,7 @@ KASAN uses compile-time instrumentation for checking every memory access,
 therefore you will need a GCC version 4.9.2 or later. GCC 5.0 or later is
 required for detection of out-of-bounds accesses to stack or global variables.
 
-Currently KASAN is supported only for the x86_64 and arm64 architectures.
+Currently KASAN is supported only for the x86_64, arm64 and arm architectures.
 
 Usage
 -----
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7e3d535..ac2287b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -49,6 +49,7 @@ config ARM
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
+	select HAVE_ARCH_KASAN if MMU
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER if (AEABI && !OABI_COMPAT)
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
