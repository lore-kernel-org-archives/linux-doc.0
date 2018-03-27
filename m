Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 862D17DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 09:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752331AbeC0JKS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 05:10:18 -0400
Received: from mail-qt0-f193.google.com ([209.85.216.193]:43808 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751205AbeC0JJz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 05:09:55 -0400
Received: by mail-qt0-f193.google.com with SMTP id s48so22957729qtb.10;
        Tue, 27 Mar 2018 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3Ol0KXySuS8B67zfSDDU9xuo4wjSsjHw8eQxbIAIi0s=;
        b=hMpTISIS21qZfE5sxJKO3pMrIFiUpHJeiqoATd0cxp9Ihjq2j6HARZXqjeQWIbKNMB
         L/6SGsmhWj91T0Zic1RBgkWm0N5LIA1iSW3QPZYH3BUdcXZavYMnsr9xVcWfsipcJ16b
         OU66oxc31v8ivY5wz948v/mw1zXj7575jrv8l+x4p5W6BbIYoXPTpBAgmstVRetmi9r5
         +SxKkiRnpJDkoti0LK3X715sJMGZF4raeWL9cKYCI2VraSkunmhEMhp1RSQFsKbG7mUs
         RkIjcq1MtySYZ3MnBUmaRv7fMZ8I3fMoX1EcGIMh7CBGDUhki2yufKR4H5RYo/HOyl/7
         lxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3Ol0KXySuS8B67zfSDDU9xuo4wjSsjHw8eQxbIAIi0s=;
        b=IjnnHxVrfE5IeCD/PK7D3ZraPGl9oQ3Y60inURIrTjcRU4h+sZNrCbHimgAj0cMbyp
         gJhhNB1lyUYgQ/xx+EBSf3izKFpTyhwYorHF6Mmq/zfpsrqZsmU0KqTu7/kswxrqvst3
         FgCokM1+fbi5yM2Rr5Cx29SwyXcJYX5n5Xvd4gkvcUAXyuwUsv8KE7YY7txTo6ztZyc/
         2t5fO5+w2ZNdPorG+ChqMKU1L49L3I6N8N/mQ3DsX7TEnBQQIXV8OD1LXtJfAXrRSU/4
         73GdDg+Sc0qb9PWDtrHGEPSCglB8kdsAKsZ0Cd0Pw00erIVzrj6l2ME/wuuMxLOUG1mx
         kX2g==
X-Gm-Message-State: AElRT7F6Vfi9s6+hUpOBUmWEiHX33YGk8lM01BBNvNKSJa/zDzbAz6uk
        GVCBS+GlwCZ3Hq7CPTD1zs4=
X-Google-Smtp-Source: AG47ELvsNo9Putt6Udh73gJ9sqJMuyJZe7ifDEfBRyAaAGHfCIViS6FIk1a4jM20WIghUiwxCwJCng==
X-Received: by 10.237.44.100 with SMTP id f91mr63580095qtd.80.1522141794233;
        Tue, 27 Mar 2018 02:09:54 -0700 (PDT)
Received: from localhost.localdomain (50-39-100-161.bvtn.or.frontiernet.net. [50.39.100.161])
        by smtp.gmail.com with ESMTPSA id r51sm557475qtr.23.2018.03.27.02.09.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 02:09:53 -0700 (PDT)
From:   Ram Pai <linuxram@us.ibm.com>
To:     mpe@ellerman.id.au, mingo@redhat.com, akpm@linux-foundation.org
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        dave.hansen@intel.com, benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com,
        linuxram@us.ibm.com, corbet@lwn.net, arnd@arndb.de
Subject: [PATCH v13 3/3] mm, x86, powerpc: display pkey in smaps only if arch supports pkeys
Date:   Tue, 27 Mar 2018 02:09:28 -0700
Message-Id: <1522141768-25485-4-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
References: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently the  architecture  specific code is expected to
display  the  protection  keys  in  smap  for a given vma.
This can lead to redundant code and possibly to divergent
formats in which the key gets displayed.

This  patch  changes  the implementation. It displays the
pkey only if the architecture support pkeys, i.e
arch_pkeys_enabled() returns true.  This patch
provides x86 implementation for arch_pkeys_enabled().

x86 arch_show_smap() function is not needed anymore.
Deleting it.

cc: Michael Ellermen <mpe@ellerman.id.au>
cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
(fixed compilation errors for x86 configs)
Acked-by: Michal Hocko <mhocko@suse.com>
Reviewed-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/include/asm/mmu_context.h |    5 -----
 arch/x86/include/asm/mmu_context.h     |    5 -----
 arch/x86/include/asm/pkeys.h           |    1 +
 arch/x86/kernel/fpu/xstate.c           |    5 +++++
 arch/x86/kernel/setup.c                |    8 --------
 fs/proc/task_mmu.c                     |   10 +++++-----
 include/linux/pkeys.h                  |    7 ++++++-
 7 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 051b3d6..566b3c2 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -203,11 +203,6 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 #define thread_pkey_regs_restore(new_thread, old_thread)
 #define thread_pkey_regs_init(thread)
 
-static inline int vma_pkey(struct vm_area_struct *vma)
-{
-	return 0;
-}
-
 static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
 {
 	return 0x0UL;
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 1de72ce..e597d09 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -295,11 +295,6 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 
 	return (vma->vm_flags & vma_pkey_mask) >> VM_PKEY_SHIFT;
 }
-#else
-static inline int vma_pkey(struct vm_area_struct *vma)
-{
-	return 0;
-}
 #endif
 
 /*
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index a0ba1ff..f6c287b 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -6,6 +6,7 @@
 
 extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 		unsigned long init_val);
+extern bool arch_pkeys_enabled(void);
 
 /*
  * Try to dedicate one of the protection keys to be used as an
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 87a57b7..4f566e9 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -945,6 +945,11 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 
 	return 0;
 }
+
+bool arch_pkeys_enabled(void)
+{
+	return boot_cpu_has(X86_FEATURE_OSPKE);
+}
 #endif /* ! CONFIG_ARCH_HAS_PKEYS */
 
 /*
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 4c616be..117ed01 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1307,11 +1307,3 @@ static int __init register_kernel_offset_dumper(void)
 	return 0;
 }
 __initcall(register_kernel_offset_dumper);
-
-void arch_show_smap(struct seq_file *m, struct vm_area_struct *vma)
-{
-	if (!boot_cpu_has(X86_FEATURE_OSPKE))
-		return;
-
-	seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
-}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 6d83bb7..70aa912 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -18,10 +18,12 @@
 #include <linux/page_idle.h>
 #include <linux/shmem_fs.h>
 #include <linux/uaccess.h>
+#include <linux/pkeys.h>
 
 #include <asm/elf.h>
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
+#include <asm/mmu_context.h>
 #include "internal.h"
 
 void task_mem(struct seq_file *m, struct mm_struct *mm)
@@ -733,10 +735,6 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 }
 #endif /* HUGETLB_PAGE */
 
-void __weak arch_show_smap(struct seq_file *m, struct vm_area_struct *vma)
-{
-}
-
 static int show_smap(struct seq_file *m, void *v, int is_pid)
 {
 	struct proc_maps_private *priv = m->private;
@@ -856,9 +854,11 @@ static int show_smap(struct seq_file *m, void *v, int is_pid)
 			   (unsigned long)(mss->pss >> (10 + PSS_SHIFT)));
 
 	if (!rollup_mode) {
-		arch_show_smap(m, vma);
+		if (arch_pkeys_enabled())
+			seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
 		show_smap_vma_flags(m, vma);
 	}
+
 	m_cache_vma(m, vma);
 	return ret;
 }
diff --git a/include/linux/pkeys.h b/include/linux/pkeys.h
index 0794ca7..49dff15 100644
--- a/include/linux/pkeys.h
+++ b/include/linux/pkeys.h
@@ -3,7 +3,6 @@
 #define _LINUX_PKEYS_H
 
 #include <linux/mm_types.h>
-#include <asm/mmu_context.h>
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
 #include <asm/pkeys.h>
@@ -13,6 +12,7 @@
 #define arch_override_mprotect_pkey(vma, prot, pkey) (0)
 #define PKEY_DEDICATED_EXECUTE_ONLY 0
 #define ARCH_VM_PKEY_FLAGS 0
+#define vma_pkey(vma) 0
 
 static inline bool mm_pkey_is_allocated(struct mm_struct *mm, int pkey)
 {
@@ -35,6 +35,11 @@ static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	return 0;
 }
 
+static inline bool arch_pkeys_enabled(void)
+{
+	return false;
+}
+
 static inline void copy_init_pkru_to_fpregs(void)
 {
 }
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
