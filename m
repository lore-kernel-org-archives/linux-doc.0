Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3E337DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 09:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752267AbeC0JJx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 05:09:53 -0400
Received: from mail-qt0-f193.google.com ([209.85.216.193]:43795 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751205AbeC0JJt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 05:09:49 -0400
Received: by mail-qt0-f193.google.com with SMTP id s48so22957312qtb.10;
        Tue, 27 Mar 2018 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lSzDUHNNLasWU37pZINGQ+GwumTv6j48e7e9QFEH4f0=;
        b=eE+pTq7cldBLZOqGrX4CJxAcXqF7Q0vHM2W1uj3Pu9q8b+hkQO2CtLlgCH+x3CDSlo
         c/2C8v7iaD+QqOo7b0LFLcgIVYMAg9OCJoJ+BzBsmCIdSyueqbZOH0wzLfX61d9kbTFE
         b6Hk0DycLlB423Kmu51VRPh5bftRI/6+cIc79tkq538XPy48XP2cfsnyMuAfg9Ubo2kp
         aa6kI5dmzUcOVTtM/CfgaEzx/u3AkHYhZajGV5uPY+CFhWgxBj0YiMPOJJMW70/ikfQw
         7TcGxPZv+5XlyGJegfd6y92U0iN9ItWkacc44OShJB/PxWvqXEOlT6PQj72BUrVSp6eM
         ei/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=lSzDUHNNLasWU37pZINGQ+GwumTv6j48e7e9QFEH4f0=;
        b=iB4/g1cZs0NGob1WESv+PMpzVt0QEeiDE+y3otpcSgECBRxgGXVDXxgj5c6zhZqmE2
         901WkmgB+DG4JxSEbRJOwbvokLwoAdgkgBJDhJS+zn22aHVyBqvqOKshnUSoSBSwl5qa
         0TuBgH10VFEhBSCS7Z0Q+aSrYAzd0uXL/5V5JCLUzs4Qr2RIv3tYc5O8NAPq3+SX1WjY
         Kxf3H2hhGd/RHQoedDao67k+XdQ6eoHKGH8XOX+KQrQZiBrTzLBdtQ4V0dQRF2t30v43
         pMJgdvx/3vI5H5nH4klsyuoRz0BR35gH3xpVy8OkDUdJx5i83mNOf/5lV7ja08rqj811
         XP1g==
X-Gm-Message-State: AElRT7H9/hXSU8hopU7TrsWwGUjNnRIK4WVRZZOZZMc67u49pBcxKfIL
        xo+7rePu1YmifN5RChjR9vA=
X-Google-Smtp-Source: AG47ELtneK+K6hBQqJWWw2yG5YBhZV3D4doz2xsoxACmQjOng75K7vZRGHOAIZsRunpo1K2TVtEN0A==
X-Received: by 10.200.34.59 with SMTP id o56mr63269441qto.103.1522141784110;
        Tue, 27 Mar 2018 02:09:44 -0700 (PDT)
Received: from localhost.localdomain (50-39-100-161.bvtn.or.frontiernet.net. [50.39.100.161])
        by smtp.gmail.com with ESMTPSA id r51sm557475qtr.23.2018.03.27.02.09.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 02:09:43 -0700 (PDT)
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
Subject: [PATCH v13 1/3] mm, powerpc, x86: define VM_PKEY_BITx bits if CONFIG_ARCH_HAS_PKEYS is enabled
Date:   Tue, 27 Mar 2018 02:09:26 -0700
Message-Id: <1522141768-25485-2-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
References: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VM_PKEY_BITx are defined only if CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
is enabled. Powerpc also needs these bits. Hence lets define the
VM_PKEY_BITx bits for any architecture that enables
CONFIG_ARCH_HAS_PKEYS.

cc: Michael Ellermen <mpe@ellerman.id.au>
cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Reviewed-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h |    2 ++
 fs/proc/task_mmu.c               |    4 ++--
 include/linux/mm.h               |    9 +++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 0d3c630..99344d7 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -26,6 +26,8 @@
 # define VM_PKEY_BIT2	VM_HIGH_ARCH_2
 # define VM_PKEY_BIT3	VM_HIGH_ARCH_3
 # define VM_PKEY_BIT4	VM_HIGH_ARCH_4
+#elif !defined(VM_PKEY_BIT4)
+# define VM_PKEY_BIT4	VM_HIGH_ARCH_4
 #endif
 
 #define ARCH_VM_PKEY_FLAGS (VM_PKEY_BIT0 | VM_PKEY_BIT1 | VM_PKEY_BIT2 | \
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index ec6d298..6b996d0 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -679,13 +679,13 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 		[ilog2(VM_MERGEABLE)]	= "mg",
 		[ilog2(VM_UFFD_MISSING)]= "um",
 		[ilog2(VM_UFFD_WP)]	= "uw",
-#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
+#ifdef CONFIG_ARCH_HAS_PKEYS
 		/* These come out via ProtectionKey: */
 		[ilog2(VM_PKEY_BIT0)]	= "",
 		[ilog2(VM_PKEY_BIT1)]	= "",
 		[ilog2(VM_PKEY_BIT2)]	= "",
 		[ilog2(VM_PKEY_BIT3)]	= "",
-#endif
+#endif /* CONFIG_ARCH_HAS_PKEYS */
 	};
 	size_t i;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ad06d42..ad207ad 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -228,15 +228,16 @@ extern int overcommit_kbytes_handler(struct ctl_table *, int, void __user *,
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 
-#if defined(CONFIG_X86)
-# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#if defined (CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)
+#ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
 # define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
 # define VM_PKEY_BIT1	VM_HIGH_ARCH_1
 # define VM_PKEY_BIT2	VM_HIGH_ARCH_2
 # define VM_PKEY_BIT3	VM_HIGH_ARCH_3
-#endif
+#endif /* CONFIG_ARCH_HAS_PKEYS */
+
+#if defined(CONFIG_X86)
+# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
 #elif defined(CONFIG_PPC)
 # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
