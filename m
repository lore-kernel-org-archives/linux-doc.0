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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F1BC83011
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD5AF21D46
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G+ViC3wP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403787AbgKZPzB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403781AbgKZPzA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:55:00 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216A2C0613D4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:00 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r3so2657990wrt.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=irDOCaoxBC7rYFpDng3539rKfl5EDMRei9R6iacpt5Q=;
        b=G+ViC3wP1aisQEqSrtFyh4agtf+XRj/S5yCOQSPP+B9cEpF3CEG6DUz/bfIazuPr44
         ziINsQardil0WvZ7VvAzP+ViHc8X/aDnyhZgkBWKaSicVgTkjL4koXMMvnWUKwj6Tubf
         yy+Yx/hK3LwwE2ezmO7wOtcTtG/OXrSJrdAmCkUrUTDGlG25Xz7C8mTrmfItIjst/2Po
         ItFdY9jyph4RS42NCu18FEzXe2QYDp7fg8a3lGHm5/Bq0J2aPx0WhjJGBCWrdIlkvbXW
         PRBJQEM/Aw0vr3SF+JCrYwHFypXblFfnJAf0xiWqOkWB+uG+6muEhHq41S+AwQVN50o4
         /3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=irDOCaoxBC7rYFpDng3539rKfl5EDMRei9R6iacpt5Q=;
        b=QzgpsRR3yK2F9PQO9pQRyH1ei1ouCJd7jh/o+Q5Y+eF0/IUw6z2/8aRpO3wqUznm+H
         u7KGI7fCjKupkBqgJL068Yxlb0ltxh1TTktGO1tcgo9VVPl0F2Y30UBGcYejatzpaO/M
         CntlJtbjVkNhP0W0v4f5Op+SnX3R8QPF0/P6AKEI+tVa5EPSbhvJyOAX667Ku4/9RFd0
         tGEQzcl93t5Wul6PI1Vab4pJ2zozujjnjBTikJAg0qm7g8wXkfZxxjbTzUJarUfFEpf3
         TSTFyZL8t67je6GBghhQYwmBeEB2gfgS6TyfLHSDjv/Im7UKKw/nfaOihKG3G/0C4jo7
         0cvg==
X-Gm-Message-State: AOAM531TTXCnbgy3oCv1xFMLoS6sQoJoM47oP7a5FpEgRSCA6frc75Z5
        jMlNbTMx7bQkmUdw2VIEoQobrA==
X-Google-Smtp-Source: ABdhPJy4MBFMpR4y7kRf/sEF0i4eAr3+bsyd1csD1SmT3e7E9ub9c+2WpUvSX9zSC44QRHTnVEfgpQ==
X-Received: by 2002:adf:f102:: with SMTP id r2mr4652297wro.315.1606406098667;
        Thu, 26 Nov 2020 07:54:58 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id 35sm9328533wro.71.2020.11.26.07.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:57 -0800 (PST)
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
Subject: [PATCH v3 15/23] kvm: arm64: Add offset for hyp VA <-> PA conversion
Date:   Thu, 26 Nov 2020 15:54:13 +0000
Message-Id: <20201126155421.14901-16-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a host-initialized constant to KVM nVHE hyp code for converting
between EL2 linear map virtual addresses and physical addresses.
Also add `__hyp_pa` macro that performs the conversion.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
 arch/arm64/kvm/va_layout.c           | 30 +++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index 44a9fb462d24..e7091d89f0fc 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -18,6 +18,9 @@
 /* Config options set by the host. */
 u32 __ro_after_init kvm_host_psci_version;
 u32 __ro_after_init kvm_host_psci_function_id[PSCI_FN_MAX];
+s64 __ro_after_init hyp_physvirt_offset;
+
+#define __hyp_pa(x) ((phys_addr_t)((x)) + hyp_physvirt_offset)
 
 static u64 get_psci_func_id(struct kvm_cpu_context *host_ctxt)
 {
diff --git a/arch/arm64/kvm/va_layout.c b/arch/arm64/kvm/va_layout.c
index 4130b72e6891..d8cc51bd60bf 100644
--- a/arch/arm64/kvm/va_layout.c
+++ b/arch/arm64/kvm/va_layout.c
@@ -23,6 +23,30 @@ static u8 tag_lsb;
 static u64 tag_val;
 static u64 va_mask;
 
+/*
+ * Compute HYP VA by using the same computation as kern_hyp_va().
+ */
+static u64 __early_kern_hyp_va(u64 addr)
+{
+	addr &= va_mask;
+	addr |= tag_val << tag_lsb;
+	return addr;
+}
+
+/*
+ * Store a hyp VA <-> PA offset into a hyp-owned variable.
+ */
+static void init_hyp_physvirt_offset(void)
+{
+	extern s64 kvm_nvhe_sym(hyp_physvirt_offset);
+	u64 kern_va, hyp_va;
+
+	/* Compute the offset from the hyp VA and PA of a random symbol. */
+	kern_va = (u64)kvm_ksym_ref(__hyp_text_start);
+	hyp_va = __early_kern_hyp_va(kern_va);
+	CHOOSE_NVHE_SYM(hyp_physvirt_offset) = (s64)__pa(kern_va) - (s64)hyp_va;
+}
+
 /*
  * We want to generate a hyp VA with the following format (with V ==
  * vabits_actual):
@@ -54,6 +78,8 @@ __init void kvm_compute_layout(void)
 		tag_val |= get_random_long() & GENMASK_ULL(vabits_actual - 2, tag_lsb);
 	}
 	tag_val >>= tag_lsb;
+
+	init_hyp_physvirt_offset();
 }
 
 static u32 compute_instruction(int n, u32 rd, u32 rn)
@@ -146,9 +172,7 @@ void kvm_patch_vector_branch(struct alt_instr *alt,
 	/*
 	 * Compute HYP VA by using the same computation as kern_hyp_va()
 	 */
-	addr = (uintptr_t)kvm_ksym_ref(__kvm_hyp_vector);
-	addr &= va_mask;
-	addr |= tag_val << tag_lsb;
+	addr = __early_kern_hyp_va((u64)kvm_ksym_ref(__kvm_hyp_vector));
 
 	/* Use PC[10:7] to branch to the same vector in KVM */
 	addr |= ((u64)origptr & GENMASK_ULL(10, 7));
-- 
2.29.2.454.gaff20da3a2-goog

