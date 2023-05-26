Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D0BC77B7A
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 23:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237512AbjEZXo5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 19:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237772AbjEZXov (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 19:44:51 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AA5E42
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 16:44:48 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bacfa4eefd3so1681555276.3
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 16:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144687; x=1687736687;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdtrmeQ7r8fSzyqqoeow0Oco6w18CVCYcKcBQXKvLk0=;
        b=A+5tnxly4jAziM7PCgC2JSUrvZIuWUL9UuTqWd7F/s/V7U9ZvBSUtbCMn4PDjXhEkh
         xPkXA8ijRXU8kfBAAJh45kvENT/cQ+0BqqVDKv4CzNn3FeibDZ4esB2AS5+kj2xWW1A/
         5f+rTWaRryOWr0eLpQP68cwlR3USUfp7Ely4h3ulPbhNc/8a6O9EbhRXY0Hc8yu56mx8
         LQMCwDasuefCJVI+rIDEYvr3/19bdInHAEUvVq6phC2Jc21wzdoWQlzM7WDhIq/i18eK
         BEwyErOKi0xkhmnwWH0N/n1UzNpwg5kRKa2pc24aeVs5XXh0p7GOcbD7gzDkKgQaeHXr
         C7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144687; x=1687736687;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdtrmeQ7r8fSzyqqoeow0Oco6w18CVCYcKcBQXKvLk0=;
        b=igMbQXrHkjlOHx8e54M2wls+Ftv2TzveEgyECyOi1wujhT4YhuV2knYZgOSdG2ZkcE
         3Hq0U0FeTqX4X3SaTUoLx8KNpJbRIIfoEVHo6nD/ni4kefdrSDCoh8oIP9IGwne/s+Lj
         891+0sE6sGIdWqBcXsA5KnFdArfL8dDRk72pXxizqKuuk0nyJnB2GTriiHVOyf7wB90x
         VZ8L/pl3C+WPuYgOAM6uEHLgviW6KUKJMO73UVgGfCD5+Mt+I+oIBLVeTnECE4aVh0Bm
         7ZRHpxb/CAJrZkwAn4HHDSPd+FY+J5DhcJiDDz2XnVUixWgzs1sCK3t9UB3lQc9j3SZz
         k0xw==
X-Gm-Message-State: AC+VfDz5hR71t5uZXNtJfH0ORG5rV7HUDfXVdgkfAkm7KiCesZq0cFYy
        /Fi4NGXUQdn/bjNWTByfcemvX7upjMk=
X-Google-Smtp-Source: ACHHUZ75roT4ZouTjM2lH4DZFyTBmS3QLSjPTFGxgUaEGtzpG1LtCtXvcTQXcsV4/+3guLPQ6FLc+WkYaOc=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a25:b28d:0:b0:bad:155a:1004 with SMTP id
 k13-20020a25b28d000000b00bad155a1004mr1830575ybj.2.1685144687512; Fri, 26 May
 2023 16:44:47 -0700 (PDT)
Date:   Fri, 26 May 2023 17:44:30 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-6-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 05/10] kvm/arm64: add kvm_arch_test_clear_young()
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Alistair Popple <apopple@nvidia.com>,
        Anup Patel <anup@brainfault.org>,
        Ben Gardon <bgardon@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Gavin Shan <gshan@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Larabel <michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Paul Mackerras <paulus@ozlabs.org>,
        Peter Xu <peterx@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, x86@kernel.org,
        linux-mm@google.com, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement kvm_arch_test_clear_young() to support the fast path in
mmu_notifier_ops->test_clear_young().

It focuses on a simple case, i.e., hardware sets the accessed bit in
KVM PTEs and VMs are not protected, where it can rely on RCU and
cmpxchg to safely clear the accessed bit without taking
kvm->mmu_lock. Complex cases fall back to the existing slow path
where kvm->mmu_lock is then taken.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  6 ++++++
 arch/arm64/kvm/mmu.c              | 36 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7e7e19ef6993..da32b0890716 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1113,4 +1113,10 @@ static inline void kvm_hyp_reserve(void) { }
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
 
+#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
+static inline bool kvm_arch_has_test_clear_young(void)
+{
+	return cpu_has_hw_af() && !is_protected_kvm_enabled();
+}
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c3b3e2afe26f..26a8d955b49c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1678,6 +1678,42 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 					   range->start << PAGE_SHIFT);
 }
 
+static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx *ctx,
+				   enum kvm_pgtable_walk_flags flags)
+{
+	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
+
+	VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));
+
+	if (!kvm_pte_valid(new))
+		return 0;
+
+	if (new == ctx->old)
+		return 0;
+
+	if (kvm_should_clear_young(ctx->arg, ctx->addr / PAGE_SIZE))
+		stage2_try_set_pte(ctx, new);
+
+	return 0;
+}
+
+bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	u64 start = range->start * PAGE_SIZE;
+	u64 end = range->end * PAGE_SIZE;
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_test_clear_young,
+		.arg	= range,
+		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_SHARED,
+	};
+
+	BUILD_BUG_ON(is_hyp_code());
+
+	kvm_pgtable_walk(kvm->arch.mmu.pgt, start, end - start, &walker);
+
+	return false;
+}
+
 phys_addr_t kvm_mmu_get_httbr(void)
 {
 	return __pa(hyp_pgtable->pgd);
-- 
2.41.0.rc0.172.g3f132b7071-goog

