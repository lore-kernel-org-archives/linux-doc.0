Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55DBC7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbeLGMtP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:49:15 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51004 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeLGMtP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:49:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id n190so4314875wmd.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Dec 2018 04:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7p38KIh/qjIHeJWDZN0vtJf8Y3XSR7ZTvxKgeKrLtnw=;
        b=kS6DsnVPjuKMQ8GO7qFfE4Ju7bkjEDdN1VeaPUPwGP/qmoi5VKUJKcGP8T3U7QwLNN
         vw0+lu9n3Bw3YEaqSwlhljHLCcAlWqb42WZR+Oywq8/r3VWrqs8p2oUPr2fYjKi4spzf
         RocvhubAf6yOhAaEO73s0diJDHHmFiygLXCdYw4OP4iLUZODuhGKwFy7OvpPe1bzPPMO
         inrDL2/lZXPr/ABPJdbc/xIrrPwHCu6A3C37t7lEZurKPVKHxjmrIY1oXLWqhb2YROvZ
         TC5PL9mqLFe7OZ4npitIwasP/rUJHpfg/gtQ9vcBDGp1VoAMJ3cB3lTTc8cr7PEbTWpn
         eCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7p38KIh/qjIHeJWDZN0vtJf8Y3XSR7ZTvxKgeKrLtnw=;
        b=TTb3gnT7x3s1lDjC0bO7ax7i+j7qfNqwGgdCfxrndHYDQUbUZC1DRNuTDdw40Eoj7y
         rYTCPeUJ6tqK3DrNlnt9e5JxMgGyvFKy+FinCVF1Cp9ezPiojOwG58+oBevrAVe2x0xP
         +ouAmNz5uLY653LYFyN9Z4QCre/AwUsNRWCMq+pTtt0q4qDH8KoDd2qDkX8zmdOQw5aQ
         bWy2foiYNTFNSS11H843jiek1MMHPZABxUB8ZBkJ5R+f7nk6R6AZVnK/ZFrnbPQhVqHs
         G5J2nFpKcdhLDCTO6wjTyKDVpMk3ANvL3cslueJgXoNq/Fjf0zRGNzfzxidMuA/rnmPz
         1aHg==
X-Gm-Message-State: AA+aEWZCHHL9jwg42s0c+5wxyTeobxM25khY/23GFHFykSQbtOGMxxR6
        93Bi/B1d5YBSeehLY12NKiwQPw==
X-Google-Smtp-Source: AFSGD/VEgH5HrwPVtCGC2szkCjG1ZZ7dIDPKBxU+Ft/7m/oqqtd3fEqQihnHOPFuRlwj/M5NxgCBzQ==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr2080452wmi.37.1544186951999;
        Fri, 07 Dec 2018 04:49:11 -0800 (PST)
Received: from localhost.localdomain ([156.213.98.90])
        by smtp.gmail.com with ESMTPSA id i192sm4362949wmg.7.2018.12.07.04.49.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Dec 2018 04:49:11 -0800 (PST)
From:   Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
To:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Igor Stoppa <igor.stoppa@gmail.com>
Cc:     Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
Subject: [PATCH 05/10] KVM: Create architecture independent ROE skeleton
Date:   Fri,  7 Dec 2018 14:47:58 +0200
Message-Id: <20181207124803.10828-6-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
References: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch introduces a hypercall that can assist against subset of kernel
rootkits, it works by place readonly protection in shadow PTE. The end
result protection is also kept in a bitmap for each kvm_memory_slot and is
used as reference when updating SPTEs. The whole goal is to protect the
guest kernel static data from modification if attacker is running from
guest ring 0, for this reason there is no hypercall to revert effect of
Memory ROE hypercall. This patch doesn't implement integrity check on guest
TLB so obvious attack on the current implementation will involve guest
virtual address -> guest physical address remapping, but there are plans to
fix that. For this patch to work on a given arch/ one would need to
implement 2 function that are architecture specific:
kvm_roe_arch_commit_protection() and kvm_roe_arch_is_userspace(). Also it
would need to have kvm_roe invoked using the appropriate hypercall
mechanism.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 include/kvm/roe.h             |  16 ++++
 include/linux/kvm_host.h      |   1 +
 include/uapi/linux/kvm_para.h |   4 +
 virt/kvm/kvm_main.c           |  19 +++--
 virt/kvm/roe.c                | 136 ++++++++++++++++++++++++++++++++++
 virt/kvm/roe_generic.h        |  19 +++++
 6 files changed, 190 insertions(+), 5 deletions(-)
 create mode 100644 include/kvm/roe.h
 create mode 100644 virt/kvm/roe.c
 create mode 100644 virt/kvm/roe_generic.h

diff --git a/include/kvm/roe.h b/include/kvm/roe.h
new file mode 100644
index 0000000000..6a86866623
--- /dev/null
+++ b/include/kvm/roe.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __KVM_ROE_H__
+#define __KVM_ROE_H__
+/*
+ * KVM Read Only Enforcement
+ * Copyright (c) 2018 Ahmed Abd El Mawgood
+ *
+ * Author Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
+ *
+ */
+void kvm_roe_arch_commit_protection(struct kvm *kvm,
+		struct kvm_memory_slot *slot);
+int kvm_roe(struct kvm_vcpu *vcpu, u64 a0, u64 a1, u64 a2, u64 a3);
+bool kvm_roe_arch_is_userspace(struct kvm_vcpu *vcpu);
+#endif
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c926698040..0baea5afcd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -297,6 +297,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 struct kvm_memory_slot {
 	gfn_t base_gfn;
 	unsigned long npages;
+	unsigned long *roe_bitmap;
 	unsigned long *dirty_bitmap;
 	struct kvm_arch_memory_slot arch;
 	unsigned long userspace_addr;
diff --git a/include/uapi/linux/kvm_para.h b/include/uapi/linux/kvm_para.h
index 6c0ce49931..e6004e0750 100644
--- a/include/uapi/linux/kvm_para.h
+++ b/include/uapi/linux/kvm_para.h
@@ -28,7 +28,11 @@
 #define KVM_HC_MIPS_CONSOLE_OUTPUT	8
 #define KVM_HC_CLOCK_PAIRING		9
 #define KVM_HC_SEND_IPI		10
+#define KVM_HC_ROE			11
 
+/* ROE Functionality parameters */
+#define ROE_VERSION			0
+#define ROE_MPROTECT			1
 /*
  * hypercalls use architecture specific
  */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 039c1ef9a7..814ee0fd35 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -61,6 +61,7 @@
 #include "coalesced_mmio.h"
 #include "async_pf.h"
 #include "vfio.h"
+#include "roe_generic.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/kvm.h>
@@ -552,9 +553,10 @@ static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free,
 			      struct kvm_memory_slot *dont,
 			      enum kvm_mr_change change)
 {
-	if (change == KVM_MR_DELETE)
+	if (change == KVM_MR_DELETE) {
+		kvm_roe_free(free);
 		kvm_destroy_dirty_bitmap(free);
-
+	}
 	kvm_arch_free_memslot(kvm, free, dont);
 
 	free->npages = 0;
@@ -1020,6 +1022,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if (kvm_create_dirty_bitmap(&new) < 0)
 			goto out_free;
 	}
+	if (kvm_roe_init(&new) < 0)
+		goto out_free;
 
 	slots = kvzalloc(sizeof(struct kvm_memslots), GFP_KERNEL);
 	if (!slots)
@@ -1273,13 +1277,18 @@ static bool memslot_is_readonly(struct kvm_memory_slot *slot)
 	return slot->flags & KVM_MEM_READONLY;
 }
 
+static bool gfn_is_readonly(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return gfn_is_full_roe(slot, gfn) || memslot_is_readonly(slot);
+}
+
 static unsigned long __gfn_to_hva_many(struct kvm_memory_slot *slot, gfn_t gfn,
 				       gfn_t *nr_pages, bool write)
 {
 	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
 		return KVM_HVA_ERR_BAD;
 
-	if (memslot_is_readonly(slot) && write)
+	if (gfn_is_readonly(slot, gfn) && write)
 		return KVM_HVA_ERR_RO_BAD;
 
 	if (nr_pages)
@@ -1327,7 +1336,7 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot,
 	unsigned long hva = __gfn_to_hva_many(slot, gfn, NULL, false);
 
 	if (!kvm_is_error_hva(hva) && writable)
-		*writable = !memslot_is_readonly(slot);
+		*writable = !gfn_is_readonly(slot, gfn);
 
 	return hva;
 }
@@ -1565,7 +1574,7 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 	}
 
 	/* Do not map writable pfn in the readonly memslot. */
-	if (writable && memslot_is_readonly(slot)) {
+	if (writable && gfn_is_readonly(slot, gfn)) {
 		*writable = false;
 		writable = NULL;
 	}
diff --git a/virt/kvm/roe.c b/virt/kvm/roe.c
new file mode 100644
index 0000000000..3f6eb6ede2
--- /dev/null
+++ b/virt/kvm/roe.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * KVM Read Only Enforcement
+ * Copyright (c) 2018 Ahmed Abd El Mawgood
+ *
+ * Author: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
+ *
+ */
+#include <linux/kvm_host.h>
+#include <linux/kvm.h>
+#include <linux/kvm_para.h>
+#include <kvm/roe.h>
+
+int kvm_roe_init(struct kvm_memory_slot *slot)
+{
+	slot->roe_bitmap = kvzalloc(BITS_TO_LONGS(slot->npages) *
+			sizeof(unsigned long), GFP_KERNEL);
+	if (!slot->roe_bitmap)
+		return -ENOMEM;
+	return 0;
+
+}
+
+void kvm_roe_free(struct kvm_memory_slot *slot)
+{
+	kvfree(slot->roe_bitmap);
+}
+
+static void kvm_roe_protect_slot(struct kvm *kvm, struct kvm_memory_slot *slot,
+		gfn_t gfn, u64 npages)
+{
+	int i;
+
+	for (i = gfn - slot->base_gfn; i < gfn + npages - slot->base_gfn; i++)
+		set_bit(i, slot->roe_bitmap);
+	kvm_roe_arch_commit_protection(kvm, slot);
+}
+
+
+static int __kvm_roe_protect_range(struct kvm *kvm, gpa_t gpa, u64 npages)
+{
+	struct kvm_memory_slot *slot;
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int count = 0;
+
+	while (npages != 0) {
+		slot = gfn_to_memslot(kvm, gfn);
+		if (!slot) {
+			gfn += 1;
+			npages -= 1;
+			continue;
+		}
+		if (gfn + npages > slot->base_gfn + slot->npages) {
+			u64 _npages = slot->base_gfn + slot->npages - gfn;
+
+			kvm_roe_protect_slot(kvm, slot, gfn, _npages);
+			gfn += _npages;
+			count += _npages;
+			npages -= _npages;
+		} else {
+			kvm_roe_protect_slot(kvm, slot, gfn, npages);
+			count += npages;
+			npages = 0;
+		}
+	}
+	if (count == 0)
+		return -EINVAL;
+	return count;
+}
+
+static int kvm_roe_protect_range(struct kvm *kvm, gpa_t gpa, u64 npages)
+{
+	int r;
+
+	mutex_lock(&kvm->slots_lock);
+	r = __kvm_roe_protect_range(kvm, gpa, npages);
+	mutex_unlock(&kvm->slots_lock);
+	return r;
+}
+
+
+static int kvm_roe_full_protect_range(struct kvm_vcpu *vcpu, u64 gva,
+		u64 npages)
+{
+	struct kvm *kvm = vcpu->kvm;
+	gpa_t gpa;
+	u64 hva;
+	u64 count = 0;
+	int i;
+	int status;
+
+	if (gva & ~PAGE_MASK)
+		return -EINVAL;
+	// We need to make sure that there will be no overflow
+	if ((npages << PAGE_SHIFT) >> PAGE_SHIFT != npages || npages == 0)
+		return -EINVAL;
+	for (i = 0; i < npages; i++) {
+		gpa = kvm_mmu_gva_to_gpa_system(vcpu, gva + (i << PAGE_SHIFT),
+				NULL);
+		hva = gfn_to_hva(kvm, gpa >> PAGE_SHIFT);
+		if (kvm_is_error_hva(hva))
+			continue;
+		if (!access_ok(VERIFY_WRITE, hva, 1 << PAGE_SHIFT))
+			continue;
+		status =  kvm_roe_protect_range(vcpu->kvm, gpa, 1);
+		if (status > 0)
+			count += status;
+	}
+	if (count == 0)
+		return -EINVAL;
+	return count;
+}
+
+int kvm_roe(struct kvm_vcpu *vcpu, u64 a0, u64 a1, u64 a2, u64 a3)
+{
+	int ret;
+	/*
+	 * First we need to make sure that we are running from something that
+	 * isn't usermode
+	 */
+	if (kvm_roe_arch_is_userspace(vcpu))
+		return -KVM_ENOSYS;
+	switch (a0) {
+	case ROE_VERSION:
+		ret = 1; //current version
+		break;
+	case ROE_MPROTECT:
+		ret = kvm_roe_full_protect_range(vcpu, a1, a2);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kvm_roe);
diff --git a/virt/kvm/roe_generic.h b/virt/kvm/roe_generic.h
new file mode 100644
index 0000000000..36e5b52c5b
--- /dev/null
+++ b/virt/kvm/roe_generic.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __KVM_ROE_GENERIC_H__
+#define __KVM_ROE_GENERIC_H__
+/*
+ * KVM Read Only Enforcement
+ * Copyright (c) 2018 Ahmed Abd El Mawgood
+ *
+ * Author Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
+ *
+ */
+
+void kvm_roe_free(struct kvm_memory_slot *slot);
+int kvm_roe_init(struct kvm_memory_slot *slot);
+static inline bool gfn_is_full_roe(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return test_bit(gfn - slot->base_gfn, slot->roe_bitmap);
+}
+#endif
-- 
2.19.2

