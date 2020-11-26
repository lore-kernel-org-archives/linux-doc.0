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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E856FC64E7B
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6C2921D46
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="srDcQuvU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403891AbgKZPzU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403865AbgKZPzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:55:15 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DE1C0613D4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:15 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id i2so2643278wrs.4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oyYLFWQZMneEnEj2VSn1LS09AGJVymYOLIqAbKZwt6U=;
        b=srDcQuvUhOpoS6XSk1yX5MJj4AVevyOIrmgCRMvuzNjXQLIIJpow8ZYVJGXOAFPuPp
         dWq6VKySkD2XWUUzXzIG2ru6B6Wv878jxXMs1gdAr3aqnnFjRuIcKatC3IvG5dnwH/Kd
         z4/S4ecfHLSdmxRm8YG5vzFFd23znMIXdf4yzi6tTZ9Ya3b7nLFTAFa+7ZDf7W6r4CWi
         EyPt3TlxjLEbVff+OZ+dGgaF0hP77PcnEgxL3ms/56P/1sF0YnhJdeaCxrk4u5MuDO/D
         tgXZVYJceqIWsNdo+g2jjh64bWPyb1+awZyn/9jfD5UZgLu8SmAj1gfMPiywgQmUfb17
         iqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyYLFWQZMneEnEj2VSn1LS09AGJVymYOLIqAbKZwt6U=;
        b=P1uIaiVfRN18O/Pd+oK2FBSLzx6dRTD1bHAcXH7/I1NsZ784bEOjjQFgkuwAtllViP
         mg0CW1ojGBO6LSVU3BmAQHGJVYG2aIgcHZWJDI0sgi//0uy8UIyhlQrCWrXw10vTFyuZ
         i/2aq9PngjiWfXcsPEhE2nDpQxF5nkAAGECfJUjy1k8gy0wdu3uVj+dDywkCRYCCdieB
         DTbEQSg5CC+OWnFxqqyP8vpppQ8zbhgAhZMBOjZ7Bcg8ZoN2Jb0LPxkHDD/NUzWUuYvG
         aiOsu4fYeFBGfxHW77BEx5iVXDhXekIZKyZ43lh1IwMmYzWeoDSHOjP6xgM1YFiywnXV
         bTpg==
X-Gm-Message-State: AOAM531Q0m4DcfjirhFjRGMu5917SU4QPcpsoZhmTUHAQNrAIdzwer1W
        YQ368pR1cyzWEyWRKruQ3bcz1g==
X-Google-Smtp-Source: ABdhPJyXJxAcdnGaEOLfWk+JL7WUP6NfvyxPJK4EaBXXt8h/6IhmFqWc5LMhe1Lrb0MJFulrnvz4kg==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr4819602wrs.170.1606406114096;
        Thu, 26 Nov 2020 07:55:14 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id b4sm10161280wmc.1.2020.11.26.07.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:55:13 -0800 (PST)
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
Subject: [PATCH v3 22/23] kvm: arm64: Trap host SMCs in protected mode
Date:   Thu, 26 Nov 2020 15:54:20 +0000
Message-Id: <20201126155421.14901-23-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While protected nVHE KVM is installed, start trapping all host SMCs.
By default, these are simply forwarded to EL3, but PSCI SMCs are
validated first.

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
index fbb195851fb9..7af18fa1983d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -88,6 +88,11 @@ SYM_CODE_END(__kvm_hyp_init)
  * x0: struct kvm_nvhe_init_params PA
  */
 SYM_CODE_START(___kvm_hyp_init)
+alternative_if ARM64_PROTECTED_KVM
+	mov_q	x1, HCR_HOST_NVHE_PROTECTED_FLAGS
+	msr	hcr_el2, x1
+alternative_else_nop_endif
+
 	ldr	x1, [x0, #NVHE_INIT_TPIDR_EL2]
 	msr	tpidr_el2, x1
 
@@ -233,6 +238,11 @@ reset:
 	msr	sctlr_el2, x5
 	isb
 
+alternative_if ARM64_PROTECTED_KVM
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

