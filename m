Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C169D7DF8F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 22:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932279AbeFYWmg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 18:42:36 -0400
Received: from mail-qk0-f202.google.com ([209.85.220.202]:39713 "EHLO
        mail-qk0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755728AbeFYWmd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 18:42:33 -0400
Received: by mail-qk0-f202.google.com with SMTP id v137-v6so2820466qka.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 15:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=tANS2lc9/Sh68sJhsCX5qG1RCeLj+qbifMvYUS14SXw=;
        b=MIKPBeNyAUivtuOBErWOT6xMIpCguOjiOwVYN4gEjsxPFnPuaeavwLyyK/Re7lrB6+
         5hK+yO6gpML8zEC4llnS/H/oJo57vjUg7dWTsN3gV7hsjx0HHkZpXyB1o/+l3iUPk5CR
         8x4G7ep+t30PwUvZ4EwoMh1gKMAt09aMIx/s2ekUAe2KbUnpX+oxIrNsSZiNgK8K0EFv
         s/W9mEOHMAxSdj/juei66DO2pnR2wjAzIkiyIqzHcl2xx/PVPbduQ15lAEPIWuSa19s7
         ZvbsTr2La/cUCVzn8GzwiE86yx7UWCF8idK3MsIL5NDwr4Tk9GdSWX6eFVaZcswxnPzD
         ktmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=tANS2lc9/Sh68sJhsCX5qG1RCeLj+qbifMvYUS14SXw=;
        b=IOD/BzN5QX3gdZVC0cDNTd6gomuP0JquR4kJJSi9TD6nnSwYUcfkp7GQk6D8wITz49
         j7+skErd9XeQg2dCWi2+ef+ukWeQP7smBo+yKYJrHpJ695S3KfEj8Qa1GtZwv/T5iQkn
         dXD0wiqO8+EzfY8D1NxWC4Gj+bw0KmrhxI7n1vHF62etJAHIvqUIgGBXImefGu3KBb6c
         UfOH4ZqZkiPNi4iRaNYMrTL5VViEZdZgIS3bMqZpc4+1BiByD0vWdvTEidbzDFXOL3Kb
         5+t1giDLb8Qa/doMCMf98B18aHT6JZGlqJkQ8rFcXJqEBYLclBVhyesbb+CZ24UqGd0y
         XuCg==
X-Gm-Message-State: APt69E3VtCHZppVpenI2oYkOzJpme6xEFgtjHDGYwDsu8rHbgAY7JLTy
        qD5/eHDuHaXSQWLM53osjdS7I/BU27JeGA==
X-Google-Smtp-Source: ADUXVKLOUL2lonFJULrlVFwRLr1xvIP2xywc4GJ+6dsQSMBMsoAwis+Su78h+obQ5704IyyLbYgT0KPBvLLjhA==
MIME-Version: 1.0
X-Received: by 2002:ac8:28dd:: with SMTP id j29-v6mr8141842qtj.31.1529966552405;
 Mon, 25 Jun 2018 15:42:32 -0700 (PDT)
Date:   Mon, 25 Jun 2018 15:39:10 -0700
In-Reply-To: <20180625224014.134829-1-thgarnie@google.com>
Message-Id: <20180625224014.134829-23-thgarnie@google.com>
References: <20180625224014.134829-1-thgarnie@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Subject: [PATCH v5 22/27] x86/modules: Add option to start module section
 after kernel
From:   Thomas Garnier <thgarnie@google.com>
To:     kernel-hardening@lists.openwall.com
Cc:     Thomas Garnier <thgarnie@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Lutomirski <luto@kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
index f49725df7109..f98a47662023 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2212,6 +2212,10 @@ config RANDOMIZE_MEMORY_PHYSICAL_PADDING
 
 	   If unsure, leave at the default value.
 
+# Module section starts just after the end of the kernel module
+config DYNAMIC_MODULE_BASE
+	bool
+
 config X86_GLOBAL_STACKPROTECTOR
 	bool "Stack cookie using a global variable"
 	depends on CC_STACKPROTECTOR_AUTO
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 054765ab2da2..faaab159ed54 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -7,6 +7,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <asm/kaslr.h>
+#include <asm/sections.h>
 
 /*
  * These are used to make use of C type-checking..
@@ -137,7 +138,12 @@ extern unsigned int ptrs_per_p4d;
 
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
index 49df0386098c..14bbbe592772 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -393,12 +393,15 @@ asmlinkage __visible void __init x86_64_start_kernel(char * real_mode_data)
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
index 2f3c9196b834..537884e5d092 100644
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
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
