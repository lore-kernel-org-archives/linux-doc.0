Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D61107D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 07:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbfAUHW1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 02:22:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40073 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfAUHW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 02:22:27 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so21980214wrt.7
        for <linux-doc@vger.kernel.org>; Sun, 20 Jan 2019 23:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FcIt9r2n/mEgqCNb5UT29WUXJF2aCPaNHWPRCZT6MPQ=;
        b=1c9y8M8u1GlScRssrmufW1/Y7fhxLH4q1jt/CA5XKaXFsNAdtbu0w9xJ2Qx9oc50kG
         jNFY65vUmtflsLNaOdQyDTK3ARCroDpnifxvPaAW79sXXeb4IJqUXimuiBGpaUlYHwq7
         cZu2ZqpZUh9Yg10KJKG9SEzo7YGdtIOzH8maEzfl3X5BYCRRcQpqurbS2ftuZ5VuFZYG
         UacqMhRQougz3i0vLt1pouYosIW92Ax47uLaYXP0teBu7W5AHJ36K+5RXmYlxJBPFWs7
         k9pEtFLWsg+tSppbCbX1eqBgb8Kw/rb1Rb1MaEkCfsEQM56SMpRCHdZIg7MV3aRHZoW5
         FT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FcIt9r2n/mEgqCNb5UT29WUXJF2aCPaNHWPRCZT6MPQ=;
        b=TFy/eveg09Pak6qdfxaOJolV6eSb2TZkJp2U79MnSntWwMg7xMHr96okrqvPhVJ5Dh
         zdSWwlb/2+xGbZTsv19e8ytZSrpNH0p8r0aynOtsQlopXHIlugn37zqgp+VCldMj3gLW
         FjEeq1XR5g2Ep7llP8jsJvQAhizgmZsMPmN7Mf18xKwVcon75scbLaaZ+WFZF2S4rKNN
         w4qbAbZPZorCmQGaOJd45Hc2C03JiTifkCJCPXMeFQxY5L64nD/aqs/08CT/LihblUPF
         A9vWxRlwi0WOPPMV4dQ5KGiNREEumqgy68epJEIv2HUw8Lt2vsw4MWD2mYbL83Fgd72t
         VN7A==
X-Gm-Message-State: AJcUukefEhJATzGsBhV/MrqkWel6GtNt+Fh8bjWvtRv6+xoqBeF/CHQr
        a09JFZexZ9rGsSCoG+UBrX8g3T1HuZw=
X-Google-Smtp-Source: ALg8bN4DTv7SHsMAYfU64me5hoPQjfKcJBRkYkXoG2pmxBtf2ZQEC5d/5sRI+8BCLbZJXWgDqNZGlQ==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr25418979wrq.16.1548027694264;
        Sun, 20 Jan 2019 15:41:34 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:33 -0800 (PST)
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
Subject: [RESEND PATCH V8 09/11] KVM: Add new exit reason For ROE violations
Date:   Mon, 21 Jan 2019 01:39:38 +0200
Message-Id: <20190120233940.15282-10-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The problem is that qemu will not be able to detect ROE violations, so
one option would be create host API to tell if a given page is ROE
protected, or create ROE violation exit reason.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 arch/x86/kvm/x86.c       | 10 +++++++++-
 include/kvm/roe.h        | 12 ++++++++++++
 include/uapi/linux/kvm.h |  2 +-
 virt/kvm/kvm_main.c      |  1 +
 virt/kvm/roe.c           |  2 +-
 virt/kvm/roe_generic.h   |  9 +--------
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 19b0f2307e..368e3d99fd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5409,6 +5409,7 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 			const struct read_write_emulator_ops *ops)
 {
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
+	struct kvm_memory_slot *slot;
 	gpa_t gpa;
 	int rc;
 
@@ -5450,7 +5451,14 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 
 	vcpu->run->mmio.len = min(8u, vcpu->mmio_fragments[0].len);
 	vcpu->run->mmio.is_write = vcpu->mmio_is_write = ops->write;
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
+	slot = kvm_vcpu_gfn_to_memslot(vcpu, gpa >> PAGE_SHIFT);
+	if (slot && ops->write && (kvm_roe_check_range(slot, gpa>>PAGE_SHIFT,
+			gpa - (gpa & PAGE_MASK), bytes) ||
+			gfn_is_full_roe(slot, gpa>>PAGE_SHIFT)))
+		vcpu->run->exit_reason = KVM_EXIT_ROE;
+	else
+		vcpu->run->exit_reason = KVM_EXIT_MMIO;
+
 	vcpu->run->mmio.phys_addr = gpa;
 
 	return ops->read_write_exit_mmio(vcpu, gpa, val, bytes);
diff --git a/include/kvm/roe.h b/include/kvm/roe.h
index 6a86866623..3121a67753 100644
--- a/include/kvm/roe.h
+++ b/include/kvm/roe.h
@@ -13,4 +13,16 @@ void kvm_roe_arch_commit_protection(struct kvm *kvm,
 		struct kvm_memory_slot *slot);
 int kvm_roe(struct kvm_vcpu *vcpu, u64 a0, u64 a1, u64 a2, u64 a3);
 bool kvm_roe_arch_is_userspace(struct kvm_vcpu *vcpu);
+bool kvm_roe_check_range(struct kvm_memory_slot *slot, gfn_t gfn, int offset,
+		int len);
+static inline bool gfn_is_full_roe(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return test_bit(gfn - slot->base_gfn, slot->roe_bitmap);
+
+}
+static inline bool gfn_is_partial_roe(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return test_bit(gfn - slot->base_gfn, slot->partial_roe_bitmap);
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 6d4ea4b6c9..0a386bb5f2 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -235,7 +235,7 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_S390_STSI        25
 #define KVM_EXIT_IOAPIC_EOI       26
 #define KVM_EXIT_HYPERV           27
-
+#define KVM_EXIT_ROE		  28
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
 #define KVM_INTERNAL_ERROR_EMULATION	1
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 819033f475..d92d300539 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -62,6 +62,7 @@
 #include "async_pf.h"
 #include "vfio.h"
 #include "roe_generic.h"
+#include <kvm/roe.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/kvm.h>
diff --git a/virt/kvm/roe.c b/virt/kvm/roe.c
index 4393a6a6a2..9540473f89 100644
--- a/virt/kvm/roe.c
+++ b/virt/kvm/roe.c
@@ -60,7 +60,7 @@ bool kvm_roe_check_range(struct kvm_memory_slot *slot, gfn_t gfn, int offset,
 		return false;
 	return kvm_roe_protected_range(slot, gpa, len);
 }
-
+EXPORT_SYMBOL_GPL(kvm_roe_check_range);
 
 void kvm_roe_free(struct kvm_memory_slot *slot)
 {
diff --git a/virt/kvm/roe_generic.h b/virt/kvm/roe_generic.h
index ad121372f2..f1ce4a8aec 100644
--- a/virt/kvm/roe_generic.h
+++ b/virt/kvm/roe_generic.h
@@ -14,12 +14,5 @@ void kvm_roe_free(struct kvm_memory_slot *slot);
 int kvm_roe_init(struct kvm_memory_slot *slot);
 bool kvm_roe_check_range(struct kvm_memory_slot *slot, gfn_t gfn, int offset,
 		int len);
-static inline bool gfn_is_full_roe(struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	return test_bit(gfn - slot->base_gfn, slot->roe_bitmap);
-}
-static inline bool gfn_is_partial_roe(struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	return test_bit(gfn - slot->base_gfn, slot->partial_roe_bitmap);
-}
+
 #endif
-- 
2.19.2

