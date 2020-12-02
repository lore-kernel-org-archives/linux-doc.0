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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61722C8301F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D64F221FA
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389617AbgLBSnm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389615AbgLBSnk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:43:40 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B0DC094254
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:42:25 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id g185so11116436wmf.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=24QBqzGkP70q8LvHdgbjJ+f63rQSkKFebn+QrdGKy8o=;
        b=KZbI8e+wbELCtP1nDqFe7mgn9KY48UKckwNmSnl0PwytWNjDtRLIBMhva1x+dBTE2F
         ncky8aqIUtGjpPLllziKYq/cqu2thcX5CDDVtfGHw8sjqNahjU7LtE0i0TmlN4uCbAaE
         bPT2DRil1LdObVMx3sZ5MnpPztiPO2tEQLZ8Fb8ep9bbC0hQ+1TygpBboVZkBTOZI8QH
         1Zy4uREQPBIU+ri3BBw5xw9uLFgQxJu9+o11KqWj/GF9lCN/OW9EoB+Mvw5CsgHNvLfX
         gVkMnKuo44a4NiHNcTRZdIn868LOOGz2mS9lvmqJo/e6AT8gr/G9c5htB+JaZ0MtIOAW
         rp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=24QBqzGkP70q8LvHdgbjJ+f63rQSkKFebn+QrdGKy8o=;
        b=GoFY8HfiTZ2Vrl1iX58YA9HJIma/zOjZyU9Wb9IYWQjfbpYPYlIBrAr8+0Z82QXQjH
         pP+1YCkbmMwX9gd4TbFhQ0H1f1aBLtcRs5yYsxHr/o1+M+JbF8labJmjtJ1XAhIaXqUP
         y885E/jDZBtYY/lBV41MRXtrvlPO/B4dVy/yhDWEYf3qlO34QuzZA40mXDn7MNT09sbH
         SXc3hIUoC+pglMIbsUgDDoKjHlA1WHvxxyfy4BaZYwsjhXHfVrcfThe3fA45MiBpYm5l
         7ecEsUlkpE6ndAkf6Tx3IlrIhZXbMbkLzRXbVbC2VUvnkNhkbuubuV7+ULKVWaX5mPTF
         EByA==
X-Gm-Message-State: AOAM530TRgUCOepxD/vfcSrrFDzEeeCWp65URnSJZyMJbZ20NNV1Qf/v
        z6vWyx9A2wl6hzN6yKdT1gS5dw==
X-Google-Smtp-Source: ABdhPJwIWj1lrrodmGW3N9pVgmHulb+Cio519dRAnYX137VaTJJ4G1ZrC9l3HnzANF4KiUfFUxqSzg==
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr4383651wmj.127.1606934544393;
        Wed, 02 Dec 2020 10:42:24 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id z22sm2940715wml.1.2020.12.02.10.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:42:22 -0800 (PST)
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
Subject: [PATCH v4 25/26] kvm: arm64: Trap host SMCs in protected mode
Date:   Wed,  2 Dec 2020 18:41:21 +0000
Message-Id: <20201202184122.26046-26-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While protected KVM is installed, start trapping all host SMCs.
For now these are simply forwarded to EL3, except PSCI
CPU_ON/CPU_SUSPEND/SYSTEM_SUSPEND which are intercepted and the
hypervisor installed on newly booted cores.

Create new constant HCR_HOST_NVHE_PROTECTED_FLAGS with the new set of HCR
flags to use while the nVHE vector is installed when the kernel was
booted with the protected flag enabled. Switch back to the default HCR
flags when switching back to the stub vector.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/include/asm/kvm_arm.h   |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 10 ++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c   |  5 ++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 64ce29378467..4e90c2debf70 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -80,6 +80,7 @@
 			 HCR_FMO | HCR_IMO | HCR_PTW )
 #define HCR_VIRT_EXCP_MASK (HCR_VSE | HCR_VI | HCR_VF)
 #define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK | HCR_ATA)
+#define HCR_HOST_NVHE_PROTECTED_FLAGS (HCR_HOST_NVHE_FLAGS | HCR_TSC)
 #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
 
 /* TCR_EL2 Registers bits */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index a2e251547625..31b060a44045 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -88,6 +88,11 @@ SYM_CODE_END(__kvm_hyp_init)
  * x0: struct kvm_nvhe_init_params PA
  */
 SYM_CODE_START_LOCAL(___kvm_hyp_init)
+alternative_if ARM64_KVM_PROTECTED_MODE
+	mov_q	x1, HCR_HOST_NVHE_PROTECTED_FLAGS
+	msr	hcr_el2, x1
+alternative_else_nop_endif
+
 	ldr	x1, [x0, #NVHE_INIT_TPIDR_EL2]
 	msr	tpidr_el2, x1
 
@@ -230,6 +235,11 @@ reset:
 	msr	sctlr_el2, x5
 	isb
 
+alternative_if ARM64_KVM_PROTECTED_MODE
+	mov_q	x5, HCR_HOST_NVHE_FLAGS
+	msr	hcr_el2, x5
+alternative_else_nop_endif
+
 	/* Install stub vectors */
 	adr_l	x5, __hyp_stub_vectors
 	msr	vbar_el2, x5
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 3e50ff35aa4f..f3d0e9eca56c 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -97,7 +97,10 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	mdcr_el2 |= MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT;
 
 	write_sysreg(mdcr_el2, mdcr_el2);
-	write_sysreg(HCR_HOST_NVHE_FLAGS, hcr_el2);
+	if (is_protected_kvm_enabled())
+		write_sysreg(HCR_HOST_NVHE_PROTECTED_FLAGS, hcr_el2);
+	else
+		write_sysreg(HCR_HOST_NVHE_FLAGS, hcr_el2);
 	write_sysreg(CPTR_EL2_DEFAULT, cptr_el2);
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
 }
-- 
2.29.2.454.gaff20da3a2-goog

