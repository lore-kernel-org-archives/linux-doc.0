Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6951CD3B
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783483; cv=none; b=uwvSBIZbqNSSrwrFtIrHddDEnsKZ8SXumz2XpOR/pwHp+JmfdZmir0sqNEAvtR1lB9udwpXc2X4b4wRzKizXjhNyKZJTmxn0p2THgEyxC3L5yJ5IFgYSul6DBGdVA37pLeCoLC+CCM2Z1F57fatbvx+NxAX83vB+hi4GYSIxsc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783483; c=relaxed/simple;
	bh=DccZZo0TDyPH4ENFSscndtleJxN6Z24xvjaSA+R9MWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O0jyTi4rSeYWKnCs9NvWb5WL3UmoTdpQApVrdgtix+CwjIiDj+7h16CnABvtWSyANFJ6QTuAWfjF58eQU9Zr86hiiQhevvpRP4NJQ+UuCzmri3JXZuE+OXSR243x80yDtqH1LVyoOFdCKitKPFz54k1bOS6uM6l2E84W+wQiT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YILXq27C; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YILXq27C"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-650ab31aabdso167189217b3.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783479; x=1722388279; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYFUlEH9+669o/RlL44au3jQWbYqLeFR1nQhpVmQt2k=;
        b=YILXq27Chf9AC/rwI7oxSVb7nHghzFDB5RurqJEV/hR7YbI2VBI3MsoZCOedd2SXzX
         F6iQGrjxtOQc+E8iQAWYscp5PWX9h2DJ6Us54CPFDHaesffzVnF+ysl1O9bkA83lFeif
         JFDXkyRiyqNHlqyNrOhZLFIKaKbticyyG4fm/cSIOwo4sA787I2JgFFAmCIcIfCMhXqS
         o0VriYefUeYpJwu/d/3kyPiFgFGCuYidroCm57tFG+E4POPuBaxk4YPR8IOSHqjIX0B8
         LfJrxolP6T5j4GQVgUoKS6mvkv9yxto3Oe7/u80VH5MYjeCfX4d3KBTu+EF/Mgr8e3yh
         E9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783479; x=1722388279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYFUlEH9+669o/RlL44au3jQWbYqLeFR1nQhpVmQt2k=;
        b=Waovh3sdKpNFEUzBHQhicoPq58CyFS56isUgvGPtHtxAfZaSfYX5Vrm2GJ2j14PhiT
         7SBxUcjMV1CZXQmC6P3YT+1r+ZvcUeYH0SwnTgMm6Kjjr5+MkRInffcpin/PPpBuu3bj
         cEY14UMxUpSPUd3HxzK9F/edKomYP4UzH/48QlZbHgGqgHh7gjX2CErUGH35Noez38xz
         KEXam7s54GeDgYjoQz+ZMUbHWudtF3I3AxUCkLAMU5Qby0O2fwBz2gyFp4gIzs221A+9
         dH1SKwSXDIiNQ6R/MaHjQ0TyH4NpeOD7+538oiGnrR95D1oj1o9AdaijUfP3Z7/EE5F0
         y+NA==
X-Forwarded-Encrypted: i=1; AJvYcCVlruL1sjauQkLRn5UzpEXJAbTy8WdIMFkrhOIJD7CItpw1zFWbYsbFWnuTUx5zQ7ckAzZfaSVKepwQTA64aTCRQIltY6jkvn65
X-Gm-Message-State: AOJu0Yx4ACp0okAZeNBDyR9fSkHPlk5puVvudYMYebV/fSmsBxPJSHjv
	bdtIzl57DLN7f5sRWryQRP9CTUrf6rwJz58N6ozgBqm76dPHzxNiQ53UP/kHhXkUbzLlE4OZGV2
	XKgbJ0QuWJimY2Egbbw==
X-Google-Smtp-Source: AGHT+IEN/Y2KcEHN/92i673drFtDbgqlQb3JUSQlrIWx5MUp4ovVZHssNawTpvQt6yIfvMN/stHEpv668SrbKdDV
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:289:b0:630:28e3:2568 with SMTP
 id 00721157ae682-671f1095e3fmr479257b3.3.1721783479490; Tue, 23 Jul 2024
 18:11:19 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:32 +0000
In-Reply-To: <20240724011037.3671523-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-8-jthoughton@google.com>
Subject: [PATCH v6 07/11] KVM: Pass fast_only to kvm_{test_,}age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Provide the basics for architectures to implement a fast-only version of
kvm_{test_,}age_gfn.

Add CONFIG_HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY that architectures will
set if they non-trivially implement test_young() and clear_young() when
called with fast_only.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/Kconfig         |  4 ++++
 virt/kvm/kvm_main.c      | 37 +++++++++++++++++++++----------------
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8cd80f969cff..944c5fba2344 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -258,6 +258,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 union kvm_mmu_notifier_arg {
 	unsigned long attributes;
+	bool fast_only;
 };
 
 struct kvm_gfn_range {
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 632334861001..cb4d5384c2f2 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -103,6 +103,10 @@ config KVM_GENERIC_MMU_NOTIFIER
 config KVM_MMU_NOTIFIER_YOUNG_LOCKLESS
        bool
 
+config HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY
+       select KVM_GENERIC_MMU_NOTIFIER
+       bool
+
 config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 959b6d5d8ce4..86fb2b560d98 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -697,18 +697,20 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
 							 unsigned long start,
 							 unsigned long end,
-							 gfn_handler_t handler)
+							 gfn_handler_t handler,
+							 bool fast_only)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	const struct kvm_mmu_notifier_range range = {
-		.start		= start,
-		.end		= end,
-		.handler	= handler,
-		.on_lock	= (void *)kvm_null_fn,
-		.flush_on_ret	= false,
-		.may_block	= false,
-		.lockless	=
+		.start			= start,
+		.end			= end,
+		.handler		= handler,
+		.on_lock		= (void *)kvm_null_fn,
+		.flush_on_ret		= false,
+		.may_block		= false,
+		.lockless		=
 			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
+		.arg.fast_only		= fast_only,
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
@@ -900,7 +902,8 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 	 * cadence. If we find this inaccurate, we might come up with a
 	 * more sophisticated heuristic later.
 	 */
-	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
+	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn,
+					     fast_only);
 }
 
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
@@ -911,7 +914,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 	trace_kvm_test_age_hva(address, fast_only);
 
 	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
-					     kvm_test_age_gfn);
+					     kvm_test_age_gfn, fast_only);
 }
 
 static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
@@ -926,17 +929,19 @@ static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
 }
 
 static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
-	.invalidate_range_start	= kvm_mmu_notifier_invalidate_range_start,
-	.invalidate_range_end	= kvm_mmu_notifier_invalidate_range_end,
-	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
-	.clear_young		= kvm_mmu_notifier_clear_young,
-	.test_young		= kvm_mmu_notifier_test_young,
-	.release		= kvm_mmu_notifier_release,
+	.invalidate_range_start		= kvm_mmu_notifier_invalidate_range_start,
+	.invalidate_range_end		= kvm_mmu_notifier_invalidate_range_end,
+	.clear_flush_young		= kvm_mmu_notifier_clear_flush_young,
+	.clear_young			= kvm_mmu_notifier_clear_young,
+	.test_young			= kvm_mmu_notifier_test_young,
+	.release			= kvm_mmu_notifier_release,
 };
 
 static int kvm_init_mmu_notifier(struct kvm *kvm)
 {
 	kvm->mmu_notifier.ops = &kvm_mmu_notifier_ops;
+	kvm->mmu_notifier.has_fast_aging =
+		IS_ENABLED(CONFIG_HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY);
 	return mmu_notifier_register(&kvm->mmu_notifier, current->mm);
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

