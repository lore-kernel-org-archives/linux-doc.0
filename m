Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9A4C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 19:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfAaT3U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 14:29:20 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44215 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729439AbfAaT3U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 14:29:20 -0500
Received: by mail-pl1-f196.google.com with SMTP id e11so1912186plt.11
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 11:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MFJ2wRRAA6IcXGO+/YjG1KwDtDZI3ZJyGSkT8C93+ng=;
        b=bummAweVarfI8k6oygDBubQOq0LmgOcN0J+QZblexpy8/IhsmXIWhZQep1j4JxBHCi
         9M3wp41b1RA0JpXrPwzKUXMe2wlknzlm38/yVJxZ2VisEsShjKcd37T3/XgmFxqWOxEH
         mrkHCwpMgxQiKPgnIa990XbwbI1+A6HThvwIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MFJ2wRRAA6IcXGO+/YjG1KwDtDZI3ZJyGSkT8C93+ng=;
        b=g0N7huFhEavsXVOCBvqq3D4VGHTPz5nym/lmo8qS/8JJZDVzcseFaBDi8IDcgvUEgJ
         x6UHJ3VQGtlTJ/gHe5ezBxyWo5vl6DQqVEU1PuYYXmKpNmQpduJcC7n4TvzsZJylJkkG
         h7JOzoManee9ru4xZ9D8Mm//nxd6ptlJDKljidTicDY5DoDBfLt+FruQpQITMOZwlNUC
         W0Ne9asoMsF1jlji1ku2guoPhDoks/bMYhAKzUVLrNiG7zx+8r7eI0EAbrazC+w8Gr/a
         RgQOoibmNL36+uHSKGG4OmMhsVIQe5+n1IFsTI1jpEFjuUwHPAQS71Ps6w6aiaDfwUbA
         JqAg==
X-Gm-Message-State: AJcUukeE6wF0OLPdGLWOhYN1GUyxeJK4wlV8WiwD2vT0+vnglu+tphmr
        /xr/NMHlJ2dnoAJxXpchw5TsXA==
X-Google-Smtp-Source: ALg8bN620UGZSWSXLJlom6YH/iGy7rMQgOcXdIpYO/yDV0hBkdq6i4rBx/QaIGQWhCFld0FOFHOD0w==
X-Received: by 2002:a17:902:704b:: with SMTP id h11mr36294891plt.157.1548962959435;
        Thu, 31 Jan 2019 11:29:19 -0800 (PST)
Received: from skynet.sea.corp.google.com ([2620:15c:17:4:29de:3bb1:1270:e679])
        by smtp.gmail.com with ESMTPSA id s130sm11164399pgc.60.2019.01.31.11.29.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 11:29:18 -0800 (PST)
From:   Thomas Garnier <thgarnie@chromium.org>
To:     kernel-hardening@lists.openwall.com
Cc:     kristen@linux.intel.com, Thomas Garnier <thgarnie@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Baoquan He <bhe@redhat.com>,
        Thomas Garnier <thgarnie@google.com>,
        Alexander Popov <alex.popov@linux.com>,
        Joerg Roedel <jroedel@suse.de>,
        Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v6 22/27] x86/modules: Add option to start module section after kernel
Date:   Thu, 31 Jan 2019 11:24:29 -0800
Message-Id: <20190131192533.34130-23-thgarnie@chromium.org>
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
In-Reply-To: <20190131192533.34130-1-thgarnie@chromium.org>
References: <20190131192533.34130-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an option so the module section is just after the mapped kernel. It
will ensure position independent modules are always at the right
distance from the kernel and do not require mcmodule=large. It also
optimize the available size for modules by getting rid of the empty
space on kernel randomization range.

Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
---
 Documentation/x86/x86_64/mm.txt         | 3 +++
 arch/x86/Kconfig                        | 4 ++++
 arch/x86/include/asm/pgtable_64_types.h | 6 ++++++
 arch/x86/kernel/head64.c                | 5 ++++-
 arch/x86/mm/dump_pagetables.c           | 3 ++-
 5 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/x86/x86_64/mm.txt b/Documentation/x86/x86_64/mm.txt
index 804f9426ed17..35b845d695d5 100644
--- a/Documentation/x86/x86_64/mm.txt
+++ b/Documentation/x86/x86_64/mm.txt
@@ -151,3 +151,6 @@ correct as KASAN disables KASLR.
 
 For both 4- and 5-level layouts, the STACKLEAK_POISON value in the last 2MB
 hole: ffffffffffff4111
+
+If CONFIG_DYNAMIC_MODULE_BASE is enabled, the module section follows the end of
+the mapped kernel.
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 263d81c570b2..c3ad1b0ae1a1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2221,6 +2221,10 @@ config RANDOMIZE_MEMORY_PHYSICAL_PADDING
 
 	   If unsure, leave at the default value.
 
+# Module section starts just after the end of the kernel module
+config DYNAMIC_MODULE_BASE
+	bool
+
 config X86_GLOBAL_STACKPROTECTOR
 	bool "Stack cookie using a global variable"
 	depends on CC_STACKPROTECTOR_AUTO
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 88bca456da99..d1bb676ec376 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -7,6 +7,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <asm/kaslr.h>
+#include <asm/sections.h>
 
 /*
  * These are used to make use of C type-checking..
@@ -141,7 +142,12 @@ extern unsigned int ptrs_per_p4d;
 
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
index 22e81275495b..ca2f6ff431af 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -411,12 +411,15 @@ asmlinkage __visible void __init x86_64_start_kernel(char * real_mode_data)
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
index e3cdc85ce5b6..3172bd968215 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -104,7 +104,7 @@ static struct addr_marker address_markers[] = {
 	[EFI_END_NR]		= { EFI_VA_END,		"EFI Runtime Services" },
 #endif
 	[HIGH_KERNEL_NR]	= { __START_KERNEL_map,	"High Kernel Mapping" },
-	[MODULES_VADDR_NR]	= { MODULES_VADDR,	"Modules" },
+	[MODULES_VADDR_NR]	= { 0/*MODULES_VADDR*/,	"Modules" },
 	[MODULES_END_NR]	= { MODULES_END,	"End Modules" },
 	[FIXADDR_START_NR]	= { FIXADDR_START,	"Fixmap Area" },
 	[END_OF_SPACE_NR]	= { -1,			NULL }
@@ -623,6 +623,7 @@ static int __init pt_dump_init(void)
 	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
 	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
 #endif
+	address_markers[MODULES_VADDR_NR].start_address = MODULES_VADDR;
 #endif
 #ifdef CONFIG_X86_32
 	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
-- 
2.20.1.495.gaa96b0ce6b-goog

