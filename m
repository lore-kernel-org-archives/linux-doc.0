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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B674C83014
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 554C421D7E
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mX8bYR+x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403824AbgKZPzH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403782AbgKZPzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:55:07 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A52C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:06 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id i2so2642756wrs.4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTPqxuNIHyHcxIGVDRFuzMb//a26J9RNoM2ThcyKbSM=;
        b=mX8bYR+xBsOyOIWEN8DX7gK/3reSGxDblgkVy4BFuCXdMl/4FvAYp/nmuGo1JoWP9P
         t6aYDDfb/OykyYNtU+YjrQpGHnafiTiCP67R+SMGTyaiF8vjgYt0Fvys9qkoErbLGFR9
         we1WLjGlgUNDIDPEBeUD4Alzz5Om/fnxds/Oxp5CzjqLXbiXrL9tA5FQ1fQEZMm617TK
         IdSpNFJ2H05e+uXFDCHwheCyX3oSyvQ7+b/+18Q/kDteenUlTRRV+WrhBV712PuxD+Kx
         wmzbfiP7gvyDFfsWCOAGPdMnOJDwhL/l00+ToHh9zpX87qwlANYNEterelAS3s8rUwBU
         5CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTPqxuNIHyHcxIGVDRFuzMb//a26J9RNoM2ThcyKbSM=;
        b=BVAghwhlFTFxzvyzuXRrHTr7cSL84HIg9HAXSiZReHlI+n4+6A+tE1qF1QZz4Mq6rI
         VYDAiTI3xIxMM0Z+lMCNNapBrcnVzOGX/6aBmz6zvSLi6QvNajl7kRlGqp3KIWrVccmu
         BPdgcSfX9vHn8PQ0pBkKH/8vC9FBGs7IoShCi+hl/QoianSViBS8O9jQbT98kcd0orqS
         V8viUCjYdYOgp9w4mbWZsRDW6mIy2xQ1f/3QJjQ3SNY/chwmsF6KGVDzv9+vHJxgY8sP
         fwXE1vUBSltB+oV+iCW2PTlZ0ajtBGqPgzjrq2SrPvAkK4HlKFD7SDnWhPdCqkBTOZ7V
         f7Dg==
X-Gm-Message-State: AOAM530Q7pl1nka87oLgV4XAzg150L371yLj4NoeYrSjCtfFMfkz2xOl
        jqXMlmRn51xK19YHKq5NiqEPAA==
X-Google-Smtp-Source: ABdhPJwX4rEG3aPSmYGdOs6RN45Cetge/Lz5Y7cdyVn5fxjNFMXKsImO/VR5cgpiiWFbabfK0CSr1g==
X-Received: by 2002:adf:f888:: with SMTP id u8mr4544222wrp.381.1606406105448;
        Thu, 26 Nov 2020 07:55:05 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id s25sm8628255wmh.16.2020.11.26.07.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:55:04 -0800 (PST)
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
Subject: [PATCH v3 18/23] kvm: arm64: Add function to enter host from KVM nVHE hyp code
Date:   Thu, 26 Nov 2020 15:54:16 +0000
Message-Id: <20201126155421.14901-19-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All nVHE hyp code is currently executed as handlers of host's HVCs. This
will change as nVHE starts intercepting host's PSCI CPU_ON SMCs. The
newly booted CPU will need to initialize EL2 state and then enter the
host. Add __host_enter function that branches into the existing
host state-restoring code after the trap handler would have returned.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/hyp/nvhe/host.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index 2b56f0bdf874..a820dfdc9c25 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -39,6 +39,7 @@ SYM_FUNC_START(__host_exit)
 	bl	handle_trap
 
 	/* Restore host regs x0-x17 */
+__host_enter_restore_full:
 	ldp	x0, x1,   [x29, #CPU_XREG_OFFSET(0)]
 	ldp	x2, x3,   [x29, #CPU_XREG_OFFSET(2)]
 	ldp	x4, x5,   [x29, #CPU_XREG_OFFSET(4)]
@@ -61,6 +62,14 @@ __host_enter_without_restoring:
 	sb
 SYM_FUNC_END(__host_exit)
 
+/*
+ * void __noreturn __host_enter(struct kvm_cpu_context *host_ctxt);
+ */
+SYM_FUNC_START(__host_enter)
+	mov	x29, x0
+	b	__host_enter_restore_full
+SYM_FUNC_END(__host_enter)
+
 /*
  * void __noreturn __hyp_do_panic(bool restore_host, u64 spsr, u64 elr, u64 par);
  */
-- 
2.29.2.454.gaff20da3a2-goog

