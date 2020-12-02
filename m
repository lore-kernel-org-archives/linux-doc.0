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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03151C83013
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4F4C2173E
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389481AbgLBSnX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389542AbgLBSnW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:43:22 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CB3C0613D6
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:42:11 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v14so10174235wml.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6am4hqHGk+Vo0ud1IP29/X2lpqX4cUlMBiGKiun4f8=;
        b=hoQt5BzIWgY7qXX3fYCd3gye89dvXes5OcxZR1oaFHiJQ0uNuctf0EfXcXsXQqJZHi
         lyMsVJArQ0COsJ3V461k6nveoLNzCLiKZbAL5LUSG4DkZ0mZ4TD+7GR+bvNwn6Oztk+b
         junmL8dzKUi31Dphr3YG92zBLKleqoCJLPlvFxbGeHyYhHq5d6poYXr1fCeGHotQtBSR
         HE+mkv/OIjfKLvHevZZVRrqv3+kaP8yMimI6sQpItNZb7BDN+1luqcdtgtiTsgiqIFoE
         bB/s2tgV4B1tzXzOp8LoYqmDeZbINdCG9fd4QhlOCkBE+gk5X9QdHlI8qQkX3t6UKEwH
         0a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6am4hqHGk+Vo0ud1IP29/X2lpqX4cUlMBiGKiun4f8=;
        b=VcP/0ZvFI/vlW+SDVHUWosIDUQvaq9ck0KgXuVLhPRoMqZ1EUQOjYXooL8Y7KJ9UnX
         nLliM1DZEG8kApvTGkC+oRbB9nqBE2zi5/y9Hicin6+y5DwNhBlS5mPQ/tRmSyjt1ZOI
         z0DhjBTQIHCOpAY8fM9XgyBhiC6sJcs0EEVZ2uk9aQsH9FxvLSPh1hPvYDr+0o6OKFZS
         ERJ8HgjttHeC43pIpUt6YLGHED+tgfkCBaMgt0FQ8LGl3i+WTFCB68KcOVadN2cHh3N+
         mNsbRqRove0NFp8IwJagpab2GvnEPElZvn9poRvxB/bVCzXYvNyEOzDXcqzZIeJwStAf
         HQwg==
X-Gm-Message-State: AOAM530kW2A2hyQb2RrddOhwmPsoeJwwjaMH5pBB9khWpYXykigcM9+d
        oVcS5ySfBNChWXV28pbjdUmqTQ==
X-Google-Smtp-Source: ABdhPJzQrJ/LWyt16hrvnyOSjGz1ckoWGV76pEesTOfeJNYR/dIM8PSyGIBinNhf3COj/w3pWBottw==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr4554470wmc.117.1606934530064;
        Wed, 02 Dec 2020 10:42:10 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id y20sm3136706wma.15.2020.12.02.10.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:42:08 -0800 (PST)
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
Subject: [PATCH v4 19/26] kvm: arm64: Extract __do_hyp_init into a helper function
Date:   Wed,  2 Dec 2020 18:41:15 +0000
Message-Id: <20201202184122.26046-20-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for adding a CPU entry point in nVHE hyp code, extract
most of __do_hyp_init hypervisor initialization code into a common
helper function. This will be invoked by the entry point to install KVM
on the newly booted CPU.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 47 ++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 712f57289357..b0856b006bc0 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -68,17 +68,36 @@ __do_hyp_init:
 	mov	x0, #SMCCC_RET_NOT_SUPPORTED
 	eret
 
-1:	ldr	x0, [x1, #NVHE_INIT_TPIDR_EL2]
-	msr	tpidr_el2, x0
+1:	mov	x0, x1
+	mov	x4, lr
+	bl	___kvm_hyp_init
+	mov	lr, x4
 
-	ldr	x0, [x1, #NVHE_INIT_MAIR_EL2]
-	msr	mair_el2, x0
+	/* Hello, World! */
+	mov	x0, #SMCCC_RET_SUCCESS
+	eret
+SYM_CODE_END(__kvm_hyp_init)
+
+/*
+ * Initialize the hypervisor in EL2.
+ *
+ * Only uses x0..x3 so as to not clobber callee-saved SMCCC registers
+ * and leave x4 for the caller.
+ *
+ * x0: struct kvm_nvhe_init_params PA
+ */
+SYM_CODE_START_LOCAL(___kvm_hyp_init)
+	ldr	x1, [x0, #NVHE_INIT_TPIDR_EL2]
+	msr	tpidr_el2, x1
+
+	ldr	x1, [x0, #NVHE_INIT_STACK_HYP_VA]
+	mov	sp, x1
 
-	ldr	x0, [x1, #NVHE_INIT_STACK_HYP_VA]
-	mov	sp, x0
+	ldr	x1, [x0, #NVHE_INIT_MAIR_EL2]
+	msr	mair_el2, x1
 
-	ldr	x0, [x1, #NVHE_INIT_PGD_PA]
-	phys_to_ttbr x2, x0
+	ldr	x1, [x0, #NVHE_INIT_PGD_PA]
+	phys_to_ttbr x2, x1
 alternative_if ARM64_HAS_CNP
 	orr	x2, x2, #TTBR_CNP_BIT
 alternative_else_nop_endif
@@ -87,9 +106,9 @@ alternative_else_nop_endif
 	/*
 	 * Set the PS bits in TCR_EL2.
 	 */
-	ldr	x0, [x1, #NVHE_INIT_TCR_EL2]
-	tcr_compute_pa_size x0, #TCR_EL2_PS_SHIFT, x1, x2
-	msr	tcr_el2, x0
+	ldr	x1, [x0, #NVHE_INIT_TCR_EL2]
+	tcr_compute_pa_size x1, #TCR_EL2_PS_SHIFT, x2, x3
+	msr	tcr_el2, x1
 
 	isb
 
@@ -117,10 +136,8 @@ alternative_else_nop_endif
 	kimg_hyp_va x0, x1
 	msr	vbar_el2, x0
 
-	/* Hello, World! */
-	mov	x0, #SMCCC_RET_SUCCESS
-	eret
-SYM_CODE_END(__kvm_hyp_init)
+	ret
+SYM_CODE_END(___kvm_hyp_init)
 
 SYM_CODE_START(__kvm_handle_stub_hvc)
 	cmp	x0, #HVC_SOFT_RESTART
-- 
2.29.2.454.gaff20da3a2-goog

