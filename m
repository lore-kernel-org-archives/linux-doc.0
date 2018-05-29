Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C38937D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 22:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967901AbeE2WUP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 18:20:15 -0400
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34390 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968082AbeE2WSF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 18:18:05 -0400
Received: by mail-pg0-f65.google.com with SMTP id k2-v6so7187788pgc.1
        for <linux-doc@vger.kernel.org>; Tue, 29 May 2018 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YZmTmGlg3/PZk5RSFp6s5chU4tg97qADA9B9tEJSw5Y=;
        b=Z7zD0AVNDoKS21v2avLayFe/nzX0/rPHWPcxmS1NLM7QPgiYOlzP2HW3huc++rPeDu
         MFb3J6T25WpXdrDTNwWtS3O/XGyuyJlQNITjtynrJOmSG+NxhL6H5X561lo4yuYvgrA3
         qLMltJBAL0CDOuI0GDhFx7+jqtSHGLxMQ1Ak9R9+VcrSLWH/xZG2Ao04ApPxJRJ+w+k1
         ldG+nwkLWdHnLuNRD+feLU2aT1adv2le8R1Zods++mHxv89mPb8ave0T1wj9Ilu9fkWi
         sFIi3tlY/jVe7riIAD+vqRDm61IT6d9IFwq9LmDqjDKfq3M0eYLW22fRHPBx2n3XDHjt
         dVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YZmTmGlg3/PZk5RSFp6s5chU4tg97qADA9B9tEJSw5Y=;
        b=SAHrL8m/kUbILQQ7hN5dEXwQ/nXBx9n74hmi6/yWGXesvcz4YiO4Wpg/1kEHgAOL6f
         7+SCrq6pShNAcJuHf5oyyOxHd/2mYo+EoKNLcKzlxdFJiIAeHa6dc/fVmX7Q2Y1hSHeq
         Dcoz4jzjHRbIwkuBM3URVVYj+M6swL+X9244H8ehfM/cmrzxdaeP7Xp1DpCGz6fIwONZ
         +PTONwNGKhkr/NpSk3QT5n91JaK4t51nSMgrvTVhttCk6TlRmLAzabLpIFSoAn9UDVZg
         TnSiK+cALJHeorjWmNWmyanqsFyUGw7vCaXPlI/+iz03M2BiTDWy/X4iJWTkQu45wlHP
         hWfQ==
X-Gm-Message-State: ALKqPweKKVygxYkBx3Nb21aA5H4lBec4GCPSVT9Wq06c9OpKXsIKWXc9
        lEvRlzZ58sQzHy2D6RdpsuQ7DA==
X-Google-Smtp-Source: ADUXVKIx5mr4EO21WkH61Q6JFUXsoYULRKA5Hb216ELaIQGthD4jzkKdy/lEzSTY2QVXrY00kAXH7Q==
X-Received: by 2002:a62:8345:: with SMTP id h66-v6mr234120pfe.0.1527632284381;
        Tue, 29 May 2018 15:18:04 -0700 (PDT)
Received: from skynet.sea.corp.google.com ([2620:15c:17:4:29de:3bb1:1270:e679])
        by smtp.gmail.com with ESMTPSA id o84-v6sm78767935pfi.27.2018.05.29.15.18.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 May 2018 15:18:03 -0700 (PDT)
From:   Thomas Garnier <thgarnie@google.com>
To:     kernel-hardening@lists.openwall.com
Cc:     Thomas Garnier <thgarnie@google.com>,
        Skip Peter Zijlstra <peterz@infradead.org>,
        Skip Philippe Ombredanne <pombredanne@nexb.com>,
        Skip Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Skip Jiri Kosina <jkosina@suse.cz>,
        Skip Alexander Potapenko <glider@google.com>,
        Skip Joerg Roedel <jroedel@suse.de>,
        Skip Jan Beulich <JBeulich@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Lutomirski <luto@kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v4 22/27] x86/modules: Add option to start module section after kernel
Date:   Tue, 29 May 2018 15:15:23 -0700
Message-Id: <20180529221625.33541-23-thgarnie@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <20180529221625.33541-1-thgarnie@google.com>
References: <20180529221625.33541-1-thgarnie@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an option so the module section is just after the mapped kernel. It
will ensure position independent modules are always at the right
distance from the kernel and do not require mcmodule=large. It also
optimize the available size for modules by getting rid of the empty
space on kernel randomization range.

Signed-off-by: Thomas Garnier <thgarnie@google.com>
---
 Documentation/x86/x86_64/mm.txt         | 3 +++
 arch/x86/Kconfig                        | 4 ++++
 arch/x86/include/asm/pgtable_64_types.h | 6 ++++++
 arch/x86/kernel/head64.c                | 5 ++++-
 arch/x86/mm/dump_pagetables.c           | 3 ++-
 5 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/x86/x86_64/mm.txt b/Documentation/x86/x86_64/mm.txt
index 5432a96d31ff..334ab458c82d 100644
--- a/Documentation/x86/x86_64/mm.txt
+++ b/Documentation/x86/x86_64/mm.txt
@@ -77,3 +77,6 @@ Their order is preserved but their base will be offset early at boot time.
 Be very careful vs. KASLR when changing anything here. The KASLR address
 range must not overlap with anything except the KASAN shadow area, which is
 correct as KASAN disables KASLR.
+
+If CONFIG_DYNAMIC_MODULE_BASE is enabled, the module section follows the end of
+the mapped kernel.
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 177e712201d1..94a00d81ec18 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2198,6 +2198,10 @@ config RANDOMIZE_MEMORY_PHYSICAL_PADDING
 
 	   If unsure, leave at the default value.
 
+# Module section starts just after the end of the kernel module
+config DYNAMIC_MODULE_BASE
+	bool
+
 config X86_GLOBAL_STACKPROTECTOR
 	bool "Stack cookie using a global variable"
 	depends on CC_STACKPROTECTOR_AUTO
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index adb47552e6bb..3ab25b908879 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -7,6 +7,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <asm/kaslr.h>
+#include <asm/sections.h>
 
 /*
  * These are used to make use of C type-checking..
@@ -126,7 +127,12 @@ extern unsigned int ptrs_per_p4d;
 
 #define VMALLOC_END		(VMALLOC_START + (VMALLOC_SIZE_TB << 40) - 1)
 
+#ifdef CONFIG_DYNAMIC_MODULE_BASE
+#define MODULES_VADDR		ALIGN(((unsigned long)_end + PAGE_SIZE), PMD_SIZE)
+#else
 #define MODULES_VADDR		(__START_KERNEL_map + KERNEL_IMAGE_SIZE)
+#endif
+
 /* The module sections ends with the start of the fixmap */
 #define MODULES_END		_AC(0xffffffffff000000, UL)
 #define MODULES_LEN		(MODULES_END - MODULES_VADDR)
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index fa661fb97127..3a1ce822e1c0 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -394,12 +394,15 @@ asmlinkage __visible void __init x86_64_start_kernel(char * real_mode_data)
 	 * Build-time sanity checks on the kernel image and module
 	 * area mappings. (these are purely build-time and produce no code)
 	 */
+#ifndef CONFIG_DYNAMIC_MODULE_BASE
 	BUILD_BUG_ON(MODULES_VADDR < __START_KERNEL_map);
 	BUILD_BUG_ON(MODULES_VADDR - __START_KERNEL_map < KERNEL_IMAGE_SIZE);
-	BUILD_BUG_ON(MODULES_LEN + KERNEL_IMAGE_SIZE > 2*PUD_SIZE);
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_RANDOMIZE_BASE_LARGE) &&
+		     MODULES_LEN + KERNEL_IMAGE_SIZE > 2*PUD_SIZE);
 	BUILD_BUG_ON((__START_KERNEL_map & ~PMD_MASK) != 0);
 	BUILD_BUG_ON((MODULES_VADDR & ~PMD_MASK) != 0);
 	BUILD_BUG_ON(!(MODULES_VADDR > __START_KERNEL));
+#endif
 	MAYBE_BUILD_BUG_ON(!(((MODULES_END - 1) & PGDIR_MASK) ==
 				(__START_KERNEL & PGDIR_MASK)));
 	BUILD_BUG_ON(__fix_to_virt(__end_of_fixed_addresses) <= MODULES_END);
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index cc7ff5957194..dca4098ce4fd 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -105,7 +105,7 @@ static struct addr_marker address_markers[] = {
 	[EFI_END_NR]		= { EFI_VA_END,		"EFI Runtime Services" },
 #endif
 	[HIGH_KERNEL_NR]	= { __START_KERNEL_map,	"High Kernel Mapping" },
-	[MODULES_VADDR_NR]	= { MODULES_VADDR,	"Modules" },
+	[MODULES_VADDR_NR]	= { 0/*MODULES_VADDR*/,	"Modules" },
 	[MODULES_END_NR]	= { MODULES_END,	"End Modules" },
 	[FIXADDR_START_NR]	= { FIXADDR_START,	"Fixmap Area" },
 	[END_OF_SPACE_NR]	= { -1,			NULL }
@@ -600,6 +600,7 @@ static int __init pt_dump_init(void)
 	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
 	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
 #endif
+	address_markers[MODULES_VADDR_NR].start_address = MODULES_VADDR;
 #endif
 #ifdef CONFIG_X86_32
 	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
-- 
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
