Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F8057D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 11:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732223AbfAaLvy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 06:51:54 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43320 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbfAaLvy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 06:51:54 -0500
Received: by mail-wr1-f68.google.com with SMTP id r10so2912853wrs.10
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 03:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4/VoXADw9TGpzOH4HUtc8S5BN+42h6eZM7HvNc5Yxz4=;
        b=hkKGJRhUXfkhPW+avct+oPnArS8giyN/dEKIuCONEk4ShmT0Fz21/8a3dWm4ZSPVbA
         EDAYKN2j817R09yoDKUYTusd3oARfQe/6sgpJR6ndle2AS/vudHKrfa79wrg3L57fZTa
         b36KKOLKOOaD6VR+jQMFxUaab/HWTv8vS7/uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4/VoXADw9TGpzOH4HUtc8S5BN+42h6eZM7HvNc5Yxz4=;
        b=pXgfrqkHhGTkifHUpSiW+ODlxfzWzHXM4Iqxvg5Dwyvzz1XfZ9mixDK2o/KisQNmdd
         ZOFuQ2H8c9ThAJN+m5YwPR31xshWExrDnwIaTE4hvOjRdJejyZZP0RKOcSROlam1DDed
         W3VRG26bSrtNdHg46KS8E3iQV84G+ib8BBjD+h/Jx8LnbTJYTTLwGVMF6xu29sjomSYj
         s4FecgoGGp8Jf141BzETmpEeY2YOxwaXHeeB/QHEvjaeKjYpYVKaSCBzDb6lT6x+frRR
         nh516eTTwuHBUQ6MNBTpMFTWw4JJDzBG02cZtJy+4+rRpzb1ufdKUJSpXa+HzwLz8AP2
         xv4Q==
X-Gm-Message-State: AJcUukcyrBBDcZbNuc+BDXsKDq3HFf2VMN6wqByCOsC7FUwNq0LHqYb5
        B1yb/lPmREnsRa/lVeHfuEBEiw==
X-Google-Smtp-Source: ALg8bN4U4ysoREZ4RhZglRbahqWwQUUmrWo4bQRYACvVUV2atEePFKX4tqLT0BqHidPvoHuITIeJBg==
X-Received: by 2002:a5d:530a:: with SMTP id e10mr35201107wrv.151.1548935512133;
        Thu, 31 Jan 2019 03:51:52 -0800 (PST)
Received: from localhost.localdomain (aputeaux-684-1-39-7.w90-86.abo.wanadoo.fr. [90.86.94.7])
        by smtp.gmail.com with ESMTPSA id w10sm5807714wmb.1.2019.01.31.03.51.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 03:51:51 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>, corbet@lwn.net,
        leif.lindholm@linaro.org, graeme.gregory@linaro.org,
        mingo@redhat.com, tglx@linutronix.de, linux-doc@vger.kernel.org,
        agraf@suse.de, pjones@redhat.com
Subject: [PATCH v3 1/2] x86: make ARCH_USE_MEMREMAP_PROT a generic Kconfig symbol
Date:   Thu, 31 Jan 2019 12:51:44 +0100
Message-Id: <20190131115145.4634-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131115145.4634-1-ard.biesheuvel@linaro.org>
References: <20190131115145.4634-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Turn ARCH_USE_MEMREMAP_PROT into a generic Kconfig symbol, and fix the
dependency expression to reflect that AMD_MEM_ENCRYPT depends on it,
instead of the other way around. This will permit ARCH_USE_MEMREMAP_PROT
to be selected by other architectures and other subsystems, such as
earlycon for efifb in a subsequent patch.

Note that this will cause the encryption related early memremap routines
in arch/x86/mm/ioremap.c to be built for 32-bit x86 as well, which triggers
the following warning:

     arch/x86//mm/ioremap.c: In function 'early_memremap_encrypted':
  >> arch/x86/include/asm/pgtable_types.h:193:27: warning: conversion from
                     'long long unsigned int' to 'long unsigned int' changes
                     value from '9223372036854776163' to '355' [-Woverflow]
      #define __PAGE_KERNEL_ENC (__PAGE_KERNEL | _PAGE_ENC)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     arch/x86//mm/ioremap.c:713:46: note: in expansion of macro '__PAGE_KERNEL_ENC'
       return early_memremap_prot(phys_addr, size, __PAGE_KERNEL_ENC);

which essentially means they are 64-bit only anyway. However, we cannot
make them dependent on CONFIG_ARCH_HAS_MEM_ENCRYPT, since that is always
defined, even for i386 (and changing that results in a slew of build errors)

So instead, build those routines only if CONFIG_AMD_MEM_ENCRYPT is
defined.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/Kconfig          | 3 +++
 arch/x86/Kconfig      | 5 +----
 arch/x86/mm/ioremap.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 4cfb6de48f79..9f0213213da8 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -885,6 +885,9 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 	  architectures, and don't require runtime relocation on relocatable
 	  kernels.
 
+config ARCH_USE_MEMREMAP_PROT
+	bool
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15af091611e2..09c2c5600579 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1510,6 +1510,7 @@ config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
 	select DYNAMIC_PHYSICAL_MASK
+	select ARCH_USE_MEMREMAP_PROT
 	---help---
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
@@ -1529,10 +1530,6 @@ config AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT
 	  If set to N, then the encryption of system memory can be
 	  activated with the mem_encrypt=on command line option.
 
-config ARCH_USE_MEMREMAP_PROT
-	def_bool y
-	depends on AMD_MEM_ENCRYPT
-
 # Common NUMA Features
 config NUMA
 	bool "Numa Memory Allocation and Scheduler Support"
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 5378d10f1d31..0029604af8a4 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -705,7 +705,7 @@ bool phys_mem_access_encrypted(unsigned long phys_addr, unsigned long size)
 	return arch_memremap_can_ram_remap(phys_addr, size, 0);
 }
 
-#ifdef CONFIG_ARCH_USE_MEMREMAP_PROT
+#ifdef CONFIG_AMD_MEM_ENCRYPT
 /* Remap memory with encryption */
 void __init *early_memremap_encrypted(resource_size_t phys_addr,
 				      unsigned long size)
@@ -747,7 +747,7 @@ void __init *early_memremap_decrypted_wp(resource_size_t phys_addr,
 
 	return early_memremap_prot(phys_addr, size, __PAGE_KERNEL_NOENC_WP);
 }
-#endif	/* CONFIG_ARCH_USE_MEMREMAP_PROT */
+#endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
 static pte_t bm_pte[PAGE_SIZE/sizeof(pte_t)] __page_aligned_bss;
 
-- 
2.20.1

