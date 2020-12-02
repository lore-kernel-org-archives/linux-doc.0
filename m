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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E8AC83014
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661A2206D5
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbgLBSmz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731006AbgLBSmy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:42:54 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEF4C061A04
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:41:33 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 64so5115874wra.11
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g69TmuIpp+vIm9gRxx12Sh909+m1H1PrZL1qc3JkdQk=;
        b=WYFmGcSaH/wz/SlleIW3Mcu5nmwmv1kNPSQebgDZz+0eL3IjEcwWqvN80s834KuWzR
         RT3hly6g09zu5fWXVEkuV1YdbuzgldYW+V/8twi8l0yx8axbff8Ape8T/NR3v99S/UFx
         UBu7/c8XKsJf4vxFX3puM6VjMfdo+TmAE6IxE4Ang8fcy12BxnfTtg1FdTdeE6rwEhoS
         YanICjQ8vrCn3rOi1TLnMIhFRy3x7EV/7Dv4MoeSNLxZ2KVazRSH0LJ7mbdhEaezvCt5
         1ytVx/ay9QHVAw3P76uQzTzAv86K6uXZ8g0VqxbV1fUq1XJEGMtJpcjaVOearI/QMSyk
         P8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g69TmuIpp+vIm9gRxx12Sh909+m1H1PrZL1qc3JkdQk=;
        b=oWWolQmA/FFtSVIto/Uvog5i8XwloE4xt90kY6R2YYzbJkH7x4+np5GXAiKK1odf3t
         eQARg0Cy3CxxU31ApviPqF5fyDNvsKzuqyNNmayUEfpNE9oAObL7r+tQ0eKlZsuv68mX
         MB7Corci4hwy3k5vEzfKI+IKPHlcz3WpxT8q6v3LtsOZZCq516KdhyP+IYIG45LyU3wm
         ubTzJjtxr9XS/D7KphPAW2dQWNLitogYEqeRBwjAwPhoOkjJ5AB0xpDtWyCNw15EY01h
         Rn/afUafTPVyyjP2je/IcFRxszOKoXdlIvUkKMSpVdVmYHZtbPaFKZdAdiQNNUCQQr+Q
         iFHA==
X-Gm-Message-State: AOAM5324ZhdV0+8wCSX/PIRq1/81p1216g3QicWXL1Zaa+1fPCNzrOwz
        8BBRQNV8RcAJF2d6+ffoeXV+Mg==
X-Google-Smtp-Source: ABdhPJxLt3JxRj6qOSsRATpU04zggeVJmgFS/y1Rt/TDhlt67MX8xTg5Vhhj21UyUIwOKHqvCPeRjQ==
X-Received: by 2002:adf:dec1:: with SMTP id i1mr4974199wrn.129.1606934491590;
        Wed, 02 Dec 2020 10:41:31 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id k205sm3004907wmk.4.2020.12.02.10.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:30 -0800 (PST)
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
Subject: [PATCH v4 02/26] kvm: arm64: Add ARM64_KVM_PROTECTED_MODE CPU capability
Date:   Wed,  2 Dec 2020 18:40:58 +0000
Message-Id: <20201202184122.26046-3-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Expose the boolean value whether the system is running with KVM in
protected mode (nVHE + kernel param). CPU capability was selected over
a global variable to allow use in alternatives.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/include/asm/cpucaps.h  |  3 ++-
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/virt.h     |  8 ++++++++
 arch/arm64/kernel/cpufeature.c    | 22 ++++++++++++++++++++++
 arch/arm64/kvm/arm.c              |  9 ++++++++-
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 162539d4c8cd..42f850718d4b 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,7 +66,8 @@
 #define ARM64_HAS_TLB_RANGE			56
 #define ARM64_MTE				57
 #define ARM64_WORKAROUND_1508412		58
+#define ARM64_KVM_PROTECTED_MODE		59
 
-#define ARM64_NCAPS				59
+#define ARM64_NCAPS				60
 
 #endif /* __ASM_CPUCAPS_H */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bca38ccade58..11beda85ee7e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -58,6 +58,7 @@ enum kvm_mode {
 	KVM_MODE_DEFAULT,
 	KVM_MODE_PROTECTED,
 };
+enum kvm_mode kvm_get_mode(void);
 
 DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index 6069be50baf9..eb81dcc220b6 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -97,6 +97,14 @@ static __always_inline bool has_vhe(void)
 		return cpus_have_final_cap(ARM64_HAS_VIRT_HOST_EXTN);
 }
 
+static __always_inline bool is_protected_kvm_enabled(void)
+{
+	if (is_vhe_hyp_code())
+		return false;
+	else
+		return cpus_have_final_cap(ARM64_KVM_PROTECTED_MODE);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ! __ASM__VIRT_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 280b10762f6b..5f9e557fa1f7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -74,6 +74,7 @@
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/fpsimd.h>
+#include <asm/kvm_host.h>
 #include <asm/mmu_context.h>
 #include <asm/mte.h>
 #include <asm/processor.h>
@@ -1709,6 +1710,21 @@ static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 }
 #endif /* CONFIG_ARM64_MTE */
 
+#ifdef CONFIG_KVM
+static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	if (kvm_get_mode() != KVM_MODE_PROTECTED)
+		return false;
+
+	if (is_kernel_in_hyp_mode()) {
+		pr_warn("Protected KVM not available with VHE\n");
+		return false;
+	}
+
+	return true;
+}
+#endif /* CONFIG_KVM */
+
 /* Internal helper functions to match cpu capability type */
 static bool
 cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
@@ -1822,6 +1838,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.field_pos = ID_AA64PFR0_EL1_SHIFT,
 		.min_field_value = ID_AA64PFR0_EL1_32BIT_64BIT,
 	},
+	{
+		.desc = "Protected KVM",
+		.capability = ARM64_KVM_PROTECTED_MODE,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = is_kvm_protected_mode,
+	},
 #endif
 	{
 		.desc = "Kernel page table isolation (KPTI)",
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 01cf6ac5b2cb..d9e8d7dc7e11 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1849,7 +1849,9 @@ int kvm_arch_init(void *opaque)
 	if (err)
 		goto out_hyp;
 
-	if (in_hyp_mode)
+	if (is_protected_kvm_enabled())
+		kvm_info("Protected nVHE mode initialized successfully\n");
+	else if (in_hyp_mode)
 		kvm_info("VHE mode initialized successfully\n");
 	else
 		kvm_info("Hyp mode initialized successfully\n");
@@ -1884,6 +1886,11 @@ static int __init early_kvm_mode_cfg(char *arg)
 }
 early_param("kvm-arm.mode", early_kvm_mode_cfg);
 
+enum kvm_mode kvm_get_mode(void)
+{
+	return kvm_mode;
+}
+
 static int arm_init(void)
 {
 	int rc = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-- 
2.29.2.454.gaff20da3a2-goog

