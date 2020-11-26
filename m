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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E164C8301E
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3508121D40
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pbb/yCmE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403811AbgKZPzF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403809AbgKZPzF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:55:05 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB63C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:04 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id t4so2615235wrr.12
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pb+ABw8dDs4PbD0OqVCMWkPKj8CiLKPB9XpZniqrrrk=;
        b=pbb/yCmE0LnjVE/ExQ/pJl7w83OT3LzqwQppQ3HqidXv2SfAJ9Nb1cPbq9a8ZZI4YA
         X5M/PUSmd0+3fpTDL/InmQ2mCDNpr9piPAuo7p6crV0IeKBHx/ZTIZOgH/esG4VTPy2J
         vlfVzxrBEn8n6D2S5rPjeXvv6YodXNpHneVC8Nwje61zvBtJxL9jKl+VgVh2Lahc+ksZ
         iHqtiBbtPHB1T5RFyjVg6EG7jdM6DUm23grUSANYdwjKev67RJFOYVUfOzyGvHvg8snO
         dasZpwdSKPiXhpsLurhfNgNIsnFGj3Bo6vrCCFJGRdAo6Tb+BYMNEOrvmCeSdXjXLlsU
         jk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pb+ABw8dDs4PbD0OqVCMWkPKj8CiLKPB9XpZniqrrrk=;
        b=gZyS7MQHf/wkRg2OaTlsiDLJqihDhWiMVc3YYFvDkPB7mV7rRYm4JDTP7TVWdukV5c
         6jqUSBWqkpICz7zooK+nIStcES73fMZwhWhvk7sz70/axiPIAMLVGWwkVioZN8LmhwmE
         Z5UJMyaWJLYWsYrek5moSvIjZfwKIG+8B2hZgjozXAZFCZKESlK5NShVdtSWmf/J31/l
         b/aw7sauOf3WN7AQEouIBZPt8JADqCfWou6rHrZxs378SNEM8xXgTPAZUaZBPc/5mRJK
         TVSRCyjh/mXwXB304Z257Z5Z3CsrnWouzspTU4oYe90ehD+2SQ8K+8pbxmGqKSQoQeb0
         NAWw==
X-Gm-Message-State: AOAM531gnyMqLpPZGcdYOBdY4COD6EuQkDlPUkhbjKDBzDp1t8tquJ7I
        ssGqGAdSh5DTXUMBRVZOh2AOHA==
X-Google-Smtp-Source: ABdhPJwxY6DWeyXDaTKzR9vlEHnJK1db+CbK/rNz4u0C73SsrWbM3UVGNV4lTxhZ1MSN5bqYaJbUug==
X-Received: by 2002:adf:eb4d:: with SMTP id u13mr4757138wrn.146.1606406103382;
        Thu, 26 Nov 2020 07:55:03 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id g25sm8706624wmk.5.2020.11.26.07.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:55:02 -0800 (PST)
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
Subject: [PATCH v3 17/23] kvm: arm64: Extract __do_hyp_init into a helper function
Date:   Thu, 26 Nov 2020 15:54:15 +0000
Message-Id: <20201126155421.14901-18-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
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
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 35 ++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 77c983aa90fa..98ce40e17b42 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -68,13 +68,32 @@ __do_hyp_init:
 	mov	x0, #SMCCC_RET_NOT_SUPPORTED
 	eret
 
-1:	ldr	x0, [x1, #NVHE_INIT_TPIDR_EL2]
-	msr	tpidr_el2, x0
+1:	mov	x0, x1
+	mov	x4, lr
+	bl	___kvm_hyp_init
+	mov	lr, x4
 
-	ldr	x0, [x1, #NVHE_INIT_STACK_HYP_VA]
-	mov	sp, x0
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
+SYM_CODE_START(___kvm_hyp_init)
+	ldr	x1, [x0, #NVHE_INIT_TPIDR_EL2]
+	msr	tpidr_el2, x1
+
+	ldr	x1, [x0, #NVHE_INIT_STACK_HYP_VA]
+	mov	sp, x1
 
-	ldr	x1, [x1, #NVHE_INIT_PGD_PA]
+	ldr	x1, [x0, #NVHE_INIT_PGD_PA]
 	phys_to_ttbr x0, x1
 alternative_if ARM64_HAS_CNP
 	orr	x0, x0, #TTBR_CNP_BIT
@@ -139,10 +158,8 @@ alternative_else_nop_endif
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

