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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA073C64E8A
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE81C21D46
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZUzcyIm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391478AbgKZPy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391426AbgKZPy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:56 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02541C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:56 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id k14so2663276wrn.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oagbJM5Ax/HFickgEo8A1TkVP1JuhAjLvznvg3GZEXE=;
        b=qZUzcyImvGBn0yrIjOeE6dvV8TTcOgLZ9npbYQvvt7NZJZCYO36QukjaKQ65C91yOa
         s6tgkRFbVNUlbAQyM/7pZ4EJB2V1rzieMnwHNy9Z3C8bHxhWy5lulXiAWX4nIFRcgwnZ
         8JDUw1NkODEBzf/2+Sl5ZC+NtbVdmIe1Xa1R1EWCiKT9iNFd+bW9iMhp7tUNrPDdcfEm
         IcFm9PjetQN+jfEzQ/p6X99K1DbXM6md/Mno9gTBZRSKaaY4v5CUq9wI3TH+kvyuGbDF
         NQq4JQ7SE57CJdE5n7JT8TupuWKDm/pQEnVdnWQ7o+BP0HzGpEcUNS9YN0Si+lO2uRD8
         Xhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oagbJM5Ax/HFickgEo8A1TkVP1JuhAjLvznvg3GZEXE=;
        b=FU5Szx/Ew4Hij/QNpgvAAsjcCJI6GOrhtSfKY7DQccuQy3SjH4AVV5jvvJpUTuy7xt
         u5Izf/6qu9rY5v7HADr/iX4eF0icYkq2UwMCKp8ZbEqz8prt5Z8LKVyZAuOa7djMWvA/
         nNdLDgrVRFzo3M3S2pUVFPAULo7PrBbmxoWl6NVzT3+m1egW1MP8VgXvQaaywwC518My
         ymyc5Mp0Mb4SZwMCF9mLKej5f1OlN2RXCP/ukHOBEfb35IofbJQozpXm7TpF6div+8vw
         3Gwvvci8+E6QbRuOBOG8Hm9mqDqJ9Zf3aZ+J39plXchMrTK4k7aUMBraY9Y6gcmR15Y0
         fbdA==
X-Gm-Message-State: AOAM533nv+zNeZ2RuaR7gQrLnyLGbgGTvbau4fO9VlGhKIu2/A5iaygx
        AaQag5of9duUilI4XFJucTGh/g==
X-Google-Smtp-Source: ABdhPJzN6596YemtZxOQnXDEasriPsfnG62j/YEP9/S71/zP7vvdUkweGbmtUDi3GsZaFW91d4W0tQ==
X-Received: by 2002:adf:f882:: with SMTP id u2mr4653371wrp.271.1606406094562;
        Thu, 26 Nov 2020 07:54:54 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id o203sm2654638wmb.0.2020.11.26.07.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:53 -0800 (PST)
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
Subject: [PATCH v3 13/23] kvm: arm64: Add SMC handler in nVHE EL2
Date:   Thu, 26 Nov 2020 15:54:11 +0000
Message-Id: <20201126155421.14901-14-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add handler of host SMCs in KVM nVHE trap handler. Forward all SMCs to
EL3 and propagate the result back to EL1. This is done in preparation
for validating host SMCs in KVM nVHE protected mode.

The implementation assumes that firmware uses SMCCC v1.2 or older. That
means x0-x17 can be used both for arguments and results, other GPRs are
preserved.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/hyp/nvhe/host.S     | 38 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 35 ++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index fe2740b224cf..2b56f0bdf874 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -180,3 +180,41 @@ SYM_CODE_START(__kvm_hyp_host_vector)
 	invalid_host_el1_vect			// FIQ 32-bit EL1
 	invalid_host_el1_vect			// Error 32-bit EL1
 SYM_CODE_END(__kvm_hyp_host_vector)
+
+/*
+ * Forward SMC with arguments in struct kvm_cpu_context, and
+ * store the result into the same struct. Assumes SMCCC 1.2 or older.
+ *
+ * x0: struct kvm_cpu_context*
+ */
+SYM_CODE_START(__kvm_hyp_host_forward_smc)
+	/*
+	 * Use x18 to keep the pointer to the host context because
+	 * x18 is callee-saved in SMCCC but not in AAPCS64.
+	 */
+	mov	x18, x0
+
+	ldp	x0, x1,   [x18, #CPU_XREG_OFFSET(0)]
+	ldp	x2, x3,   [x18, #CPU_XREG_OFFSET(2)]
+	ldp	x4, x5,   [x18, #CPU_XREG_OFFSET(4)]
+	ldp	x6, x7,   [x18, #CPU_XREG_OFFSET(6)]
+	ldp	x8, x9,   [x18, #CPU_XREG_OFFSET(8)]
+	ldp	x10, x11, [x18, #CPU_XREG_OFFSET(10)]
+	ldp	x12, x13, [x18, #CPU_XREG_OFFSET(12)]
+	ldp	x14, x15, [x18, #CPU_XREG_OFFSET(14)]
+	ldp	x16, x17, [x18, #CPU_XREG_OFFSET(16)]
+
+	smc	#0
+
+	stp	x0, x1,   [x18, #CPU_XREG_OFFSET(0)]
+	stp	x2, x3,   [x18, #CPU_XREG_OFFSET(2)]
+	stp	x4, x5,   [x18, #CPU_XREG_OFFSET(4)]
+	stp	x6, x7,   [x18, #CPU_XREG_OFFSET(6)]
+	stp	x8, x9,   [x18, #CPU_XREG_OFFSET(8)]
+	stp	x10, x11, [x18, #CPU_XREG_OFFSET(10)]
+	stp	x12, x13, [x18, #CPU_XREG_OFFSET(12)]
+	stp	x14, x15, [x18, #CPU_XREG_OFFSET(14)]
+	stp	x16, x17, [x18, #CPU_XREG_OFFSET(16)]
+
+	ret
+SYM_CODE_END(__kvm_hyp_host_forward_smc)
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a4f1cac714d7..f25680ede080 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -18,6 +18,8 @@
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
+void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
+
 static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -152,12 +154,39 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
 }
 
+static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
+{
+	__kvm_hyp_host_forward_smc(host_ctxt);
+}
+
+static void skip_host_instruction(void)
+{
+	write_sysreg_el2(read_sysreg_el2(SYS_ELR) + 4, SYS_ELR);
+}
+
+static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
+{
+	default_host_smc_handler(host_ctxt);
+
+	/*
+	 * Unlike HVC, the return address of an SMC is the instruction's PC.
+	 * Move the return address past the instruction.
+	 */
+	skip_host_instruction();
+}
+
 void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
-	if (unlikely(ESR_ELx_EC(esr) != ESR_ELx_EC_HVC64))
+	switch (ESR_ELx_EC(esr)) {
+	case ESR_ELx_EC_HVC64:
+		handle_host_hcall(host_ctxt);
+		break;
+	case ESR_ELx_EC_SMC64:
+		handle_host_smc(host_ctxt);
+		break;
+	default:
 		hyp_panic();
-
-	handle_host_hcall(host_ctxt);
+	}
 }
-- 
2.29.2.454.gaff20da3a2-goog

