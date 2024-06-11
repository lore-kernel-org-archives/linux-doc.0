Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449E14A8F
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718065327; cv=none; b=Z0PCTT4WGouRGu7GeGTiZuuj9XKXR6Hj5b96EjuI0CU30UB2lDMMs2fh2oqw48rPaiw0wvbstN6JcmaNis1gdIUzSxDKoXvOQ/QPTX7SYyZUvAQSv6zgZ/y2DYNaxDtaKdTmIafm/9NmysaXC6Iv9Dj/1zVek/UdbYpQ4HmeMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718065327; c=relaxed/simple;
	bh=CwLkYcmzZttiwi369ZHLZf654OyS2he0I+I/bemyL94=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EZDx1kPryhI+ci16Y8DPag/FpohpLDtOgF5xd95klee5/f3bOiVlp305N50gfbV5q+ZfAi639nW26ugpAVqg7qZ0gT6+Y5DxICZx29DkG7Q1NtYhhVvioUa2ZjqcgYYn1CUFqho9DDO7WFQYoWqeWhKW72ASk/D3+mE6UHIt6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6A9cfMA; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6A9cfMA"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-629f8a92145so81931737b3.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 17:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718065324; x=1718670124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HV93t1qtvLY2HqXeqD4WwNLQ267HOmhqjDYyVDwgnFc=;
        b=e6A9cfMACQYTv5MYQBEMRwPmkjEqjJdzdWgpxw1ozh+KpskoYaLqygOETxPJBREHWW
         pAKRAbc3+cQqnKz6dGelFnWJymnR6GgEhxAXlqvkif/L2GgpvbOo8Sy/dQ4lQLP53Gn6
         3VJ8uMIMm2P4YQCSfXpnDdSD+NgVbAQDJubLw06VCOxPdcJdoUaTd95pj52vZot2q5Lg
         S+h4Wk7gY89Wad0bhfCwBxWRdq8W6YnQZBiOp8EApfhfs2CpVQxpEp+clXy0uV5I0kcQ
         Y1AqfO4LObmhYZJp7r0p3a29lHj9HqwYqzQ5z5oQ9morwbMBG+cw+GFrR3ZbBHin/eRK
         nw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718065324; x=1718670124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HV93t1qtvLY2HqXeqD4WwNLQ267HOmhqjDYyVDwgnFc=;
        b=Ec2yzRsr+DQjnAM7O/Oajf2cQXlzu5h01F9s+RHePg9WBGhjla8FXgHdo7i9AxTHpm
         Bi2oQ2xlOQjImv5rcdDG5Q3V0BsKefl5dVfWYa8hA1xYLUHXPCDmwg+rZMKNw6tvj3rA
         b6vV5z086SyFQBPDJgxHlcnu1enc4iZLDRsUz/7YTH7ju26nMXH1El2EKVndb/se3ISD
         HgjJnoRijihYpjueiP5OPVkbVeDlBpdXSrHrbRR9DCUn9TysBGejXU1TATQXQmEUthRp
         CG9LEAg1jKN1Qqvwj+GLHwP8R9dtCN3Ss9qvPs/JqqwcGFRebQnVbhk3O22m0VXRSkvY
         pPqg==
X-Forwarded-Encrypted: i=1; AJvYcCVhbmUDOdtpy0eWNBk206s7/5LNr5J2VNaAa/Uhxmn6lywS/QEeT+comrbLrk4DYSCi8frygf/rXAdIuGzVhuT67dNWX7PQ6dkT
X-Gm-Message-State: AOJu0Yy4/8/Co0/qjc8mWRuGr2Ea6tT0yAAUVS8QDkbwaqWMPh20gWL7
	QidzG4diwChtMmbf3/9DAIs0toK+MTPdOA0ZU2dM+omIOE/hrHCClsVKDPdhVcRe3SBNtB4z0iy
	OmUjCOcu5mTuniiSQmQ==
X-Google-Smtp-Source: AGHT+IGdrDSzxMWV88JW0LA6UnAEJXd+QZJzNBe66poa1GZZ236cqaZmaxZKOwtkV9plz4I87xyLdQPCAlnoV8zg
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:38b:b0:627:7563:95b1 with SMTP
 id 00721157ae682-62cd5652459mr33516247b3.5.1718065324168; Mon, 10 Jun 2024
 17:22:04 -0700 (PDT)
Date: Tue, 11 Jun 2024 00:21:42 +0000
In-Reply-To: <20240611002145.2078921-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611002145.2078921-7-jthoughton@google.com>
Subject: [PATCH v5 6/9] KVM: x86: Move tdp_mmu_enabled and shadow_accessed_mask
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

From: Yu Zhao <yuzhao@google.com>

tdp_mmu_enabled and shadow_accessed_mask are needed to implement
kvm_arch_young_notifier_likely_fast().

Signed-off-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/include/asm/kvm_host.h | 6 ++++++
 arch/x86/kvm/mmu.h              | 6 ------
 arch/x86/kvm/mmu/spte.h         | 1 -
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 011c8eb7c8d3..0dc1fa99cdbb 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1855,6 +1855,7 @@ struct kvm_arch_async_pf {
 
 extern u32 __read_mostly kvm_nr_uret_msrs;
 extern u64 __read_mostly host_efer;
+extern u64 __read_mostly shadow_accessed_mask;
 extern bool __read_mostly allow_smaller_maxphyaddr;
 extern bool __read_mostly enable_apicv;
 extern struct kvm_x86_ops kvm_x86_ops;
@@ -1960,6 +1961,11 @@ void kvm_fire_mask_notifiers(struct kvm *kvm, unsigned irqchip, unsigned pin,
 			     bool mask);
 
 extern bool tdp_enabled;
+#ifdef CONFIG_X86_64
+extern bool tdp_mmu_enabled;
+#else
+#define tdp_mmu_enabled false
+#endif
 
 u64 vcpu_tsc_khz(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 2e454316f2a2..267f72b065f5 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -271,12 +271,6 @@ static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
 	return smp_load_acquire(&kvm->arch.shadow_root_allocated);
 }
 
-#ifdef CONFIG_X86_64
-extern bool tdp_mmu_enabled;
-#else
-#define tdp_mmu_enabled false
-#endif
-
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
 	return !tdp_mmu_enabled || kvm_shadow_root_allocated(kvm);
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 52fa004a1fbc..9ca6d80fb86c 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -172,7 +172,6 @@ extern u64 __read_mostly shadow_mmu_writable_mask;
 extern u64 __read_mostly shadow_nx_mask;
 extern u64 __read_mostly shadow_x_mask; /* mutual exclusive with nx_mask */
 extern u64 __read_mostly shadow_user_mask;
-extern u64 __read_mostly shadow_accessed_mask;
 extern u64 __read_mostly shadow_dirty_mask;
 extern u64 __read_mostly shadow_mmio_value;
 extern u64 __read_mostly shadow_mmio_mask;
-- 
2.45.2.505.gda0bf45e8d-goog

