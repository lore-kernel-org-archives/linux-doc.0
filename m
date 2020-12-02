Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF69C83026
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A7C521D7F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389593AbgLBSn6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgLBSn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:43:29 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F530C061A56
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:41:51 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id e7so5159477wrv.6
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2XR1ngTwyxpwjENRmmRKJhts/5F/OilmxQWITQoZvQ=;
        b=JzFgXAhlIEgLNkP4PvPB0wdamug+KFMjHLhHpHzd5kVnUCr3t8QDs9NimLkHc7C2o1
         NHgnIE3t1mWj8BqptP+PMm6hDZaxCYbA61W91okeustzdOUbrpBE3haZ3EpLu+b4Um9B
         C6HdAF8lpWpxP6zdmtUviuKmhFUj6Ywy3uhuUFdMiFzvCrXNeTUowX1pkb/61/PpdGYi
         mi5ulgnhbOZUrzv04KMRwsqsomq3Hq2X00uDYDjoGUXUbr1uO87CLOBRPYMu5eGe3evA
         0h9k5iIdnG+5R9qdoaXDx7ucCbBGaDZXX6pISlsr23VUmTinP+qIJEQmBhPC2xjZCh3e
         gBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2XR1ngTwyxpwjENRmmRKJhts/5F/OilmxQWITQoZvQ=;
        b=nLDYa0bljRMWuMfR04IMRmHC8na718e2JLNh8dF7Fhoq0NcXSX7haSAjmiXJtmwjVM
         xMSVIjevQaIGtvwUGiY/6JJLgJjpaCtv67iCw9CMDJNPgZNZoly8cE7/xTbtp3oYtZ6z
         kBgI+TSnYedknGWMNr9+yr2ghOAJWxQ+W49rVZ9T5H1On2g4v8bhOfYadgTZKtDiNI04
         0LaN75ewh2T++1ZHVIedG/MpIB2mn1lqCzmB4Jiqle1Pp13q7zyHwubd4gQdAKnMPzdF
         4gmz/MGQY7ThU0gxt5TCY7UAn1laMNG9loxxrs/Mcpt5WMjPCAL3g/Rz/DhsREyImuQF
         lfcw==
X-Gm-Message-State: AOAM532xZnsp1ss+NmaYW59nTkcx+fA41cieX15lqZ184Q09vZ3mHzLk
        YWUOo3DhowYJ22RuGATa56vGDg==
X-Google-Smtp-Source: ABdhPJxmCviRUJKT+618pJo3OH+62/YOXf5UY9+1uIzxjn3ExQTbBk2XRMQ55+E62EXgsGkfOiqfVw==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr5064164wrr.117.1606934509539;
        Wed, 02 Dec 2020 10:41:49 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id 90sm3102130wra.95.2020.12.02.10.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:48 -0800 (PST)
From:   David Brazdil <dbrazdil@google.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, David Brazdil <dbrazdil@google.com>
Subject: [PATCH v4 10/26] kvm: arm64: Move hyp-init params to a per-CPU struct
Date:   Wed,  2 Dec 2020 18:41:06 +0000
Message-Id: <20201202184122.26046-11-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Once we start initializing KVM on newly booted cores before the rest of
the kernel, parameters to __do_hyp_init will need to be provided by EL2
rather than EL1. At that point it will not be possible to pass its three
arguments directly because PSCI_CPU_ON only supports one context
argument.

Refactor __do_hyp_init to accept its parameters in a struct. This
prepares the code for KVM booting cores as well as removes any limits on
the number of __do_hyp_init arguments.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  6 ++++++
 arch/arm64/include/asm/kvm_hyp.h   |  2 +-
 arch/arm64/kernel/asm-offsets.c    |  3 +++
 arch/arm64/kvm/arm.c               | 23 +++++++++++++----------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++---------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 ++
 6 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 531f9d04eefd..1a7b91534a16 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -148,6 +148,12 @@ extern void *__vhe_undefined_symbol;
 
 #endif
 
+struct kvm_nvhe_init_params {
+	unsigned long tpidr_el2;
+	unsigned long stack_hyp_va;
+	phys_addr_t pgd_pa;
+};
+
 /* Translate a kernel address @ptr into its equivalent linear mapping */
 #define kvm_ksym_ref(ptr)						\
 	({								\
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 6b664de5ec1f..cb25c15e3d8d 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -14,6 +14,7 @@
 
 DECLARE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DECLARE_PER_CPU(unsigned long, kvm_hyp_vector);
+DECLARE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
 #define read_sysreg_elx(r,nvh,vh)					\
 	({								\
@@ -98,4 +99,3 @@ void __noreturn __hyp_do_panic(bool restore_host, u64 spsr, u64 elr, u64 par);
 #endif
 
 #endif /* __ARM64_KVM_HYP_H__ */
-
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 7d32fc959b1a..8d6272a01a00 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -110,6 +110,9 @@ int main(void)
   DEFINE(CPU_APGAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APGAKEYLO_EL1]));
   DEFINE(HOST_CONTEXT_VCPU,	offsetof(struct kvm_cpu_context, __hyp_running_vcpu));
   DEFINE(HOST_DATA_CONTEXT,	offsetof(struct kvm_host_data, host_ctxt));
+  DEFINE(NVHE_INIT_TPIDR_EL2,	offsetof(struct kvm_nvhe_init_params, tpidr_el2));
+  DEFINE(NVHE_INIT_STACK_HYP_VA,	offsetof(struct kvm_nvhe_init_params, stack_hyp_va));
+  DEFINE(NVHE_INIT_PGD_PA,	offsetof(struct kvm_nvhe_init_params, pgd_pa));
 #endif
 #ifdef CONFIG_CPU_PM
   DEFINE(CPU_CTX_SP,		offsetof(struct cpu_suspend_ctx, sp));
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9e5d0ea84822..93a408c00249 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -51,6 +51,7 @@ DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
 
 static DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
 unsigned long kvm_arm_hyp_percpu_base[NR_CPUS];
+DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
 /* The VMID used in the VTTBR */
 static atomic64_t kvm_vmid_gen = ATOMIC64_INIT(1);
@@ -1384,9 +1385,7 @@ static int kvm_init_vector_slots(void)
 
 static void cpu_init_hyp_mode(void)
 {
-	phys_addr_t pgd_ptr;
-	unsigned long hyp_stack_ptr;
-	unsigned long tpidr_el2;
+	struct kvm_nvhe_init_params *params = this_cpu_ptr_nvhe_sym(kvm_init_params);
 	struct arm_smccc_res res;
 
 	/* Switch from the HYP stub to our own HYP init vector */
@@ -1397,12 +1396,17 @@ static void cpu_init_hyp_mode(void)
 	 * kernel's mapping to the linear mapping, and store it in tpidr_el2
 	 * so that we can use adr_l to access per-cpu variables in EL2.
 	 */
-	tpidr_el2 = (unsigned long)this_cpu_ptr_nvhe_sym(__per_cpu_start) -
-		    (unsigned long)kvm_ksym_ref(CHOOSE_NVHE_SYM(__per_cpu_start));
+	params->tpidr_el2 = (unsigned long)this_cpu_ptr_nvhe_sym(__per_cpu_start) -
+			    (unsigned long)kvm_ksym_ref(CHOOSE_NVHE_SYM(__per_cpu_start));
 
-	pgd_ptr = kvm_mmu_get_httbr();
-	hyp_stack_ptr = __this_cpu_read(kvm_arm_hyp_stack_page) + PAGE_SIZE;
-	hyp_stack_ptr = kern_hyp_va(hyp_stack_ptr);
+	params->stack_hyp_va = kern_hyp_va(__this_cpu_read(kvm_arm_hyp_stack_page) + PAGE_SIZE);
+	params->pgd_pa = kvm_mmu_get_httbr();
+
+	/*
+	 * Flush the init params from the data cache because the struct will
+	 * be read while the MMU is off.
+	 */
+	kvm_flush_dcache_to_poc(params, sizeof(*params));
 
 	/*
 	 * Call initialization code, and switch to the full blown HYP code.
@@ -1411,8 +1415,7 @@ static void cpu_init_hyp_mode(void)
 	 * cpus_have_const_cap() wrapper.
 	 */
 	BUG_ON(!system_capabilities_finalized());
-	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__kvm_hyp_init),
-			  pgd_ptr, tpidr_el2, hyp_stack_ptr, &res);
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__kvm_hyp_init), virt_to_phys(params), &res);
 	WARN_ON(res.a0 != SMCCC_RET_SUCCESS);
 
 	/*
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 931a8c38f085..e712e317337c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -47,9 +47,7 @@ __invalid:
 
 	/*
 	 * x0: SMCCC function ID
-	 * x1: HYP pgd
-	 * x2: per-CPU offset
-	 * x3: HYP stack
+	 * x1: struct kvm_nvhe_init_params PA
 	 */
 __do_hyp_init:
 	/* Check for a stub HVC call */
@@ -70,10 +68,13 @@ __do_hyp_init:
 	mov	x0, #SMCCC_RET_NOT_SUPPORTED
 	eret
 
-1:
-	/* Set tpidr_el2 for use by HYP to free a register */
-	msr	tpidr_el2, x2
+1:	ldr	x0, [x1, #NVHE_INIT_TPIDR_EL2]
+	msr	tpidr_el2, x0
 
+	ldr	x0, [x1, #NVHE_INIT_STACK_HYP_VA]
+	mov	sp, x0
+
+	ldr	x1, [x1, #NVHE_INIT_PGD_PA]
 	phys_to_ttbr x0, x1
 alternative_if ARM64_HAS_CNP
 	orr	x0, x0, #TTBR_CNP_BIT
@@ -133,9 +134,6 @@ alternative_else_nop_endif
 	msr	sctlr_el2, x0
 	isb
 
-	/* Set the stack */
-	mov	sp, x3
-
 	/* Set the host vector */
 	ldr	x0, =__kvm_hyp_host_vector
 	kimg_hyp_va x0, x1
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 82df7fc24760..a4f1cac714d7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -16,6 +16,8 @@
 #define DECLARE_REG(type, name, ctxt, reg)	\
 				type name = (type)cpu_reg(ctxt, (reg))
 
+DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
+
 static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
-- 
2.29.2.454.gaff20da3a2-goog

