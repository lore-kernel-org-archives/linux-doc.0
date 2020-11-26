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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21468C71155
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB6D21D40
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jqLq4mvu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391426AbgKZPy5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391473AbgKZPyz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:55 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B66C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:53 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so2622795wrw.10
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=abHZKvAnOIOh0cfJUm3aASRkjBMLNkdSVRPPeTy9mxo=;
        b=jqLq4mvuFUHRNYTuDA8X4VqzR999IfDP4q84W39BYEKyBQxNgrPCGYrczkPYGhK3xu
         rAyOQQer3BhE9duh1aWdFCeG+6knjdw5TuROmYdg4HhznGrigbB06JqMnjAT7xfK+est
         C3hOyQ9Hz6DwLFMNdCGX7L+t1pUqK9ugYB0c9EsrTz5zLyPmstSDlVJslLskorCLfkLJ
         xnDwNLr1x8JteRXu7nG+IZYBSzTE8FzQbQlInhi+UOtUpSqxM/09so4wFxOqzOzG7W3k
         fMq1ulRSMT+FhtRSYbgZxKC8qiIf4rnRr+xoJ9PrqtwZUt/DvnRvDjiCJXDqxMKOdZfk
         IUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=abHZKvAnOIOh0cfJUm3aASRkjBMLNkdSVRPPeTy9mxo=;
        b=KJqBTx1ZVkykPkdehvxJstrNK2hJ3B5fuJj5lyWbcL7yC+DrCI4T1Vmom0ss9IGs6y
         +DHaQlZjc96yimXrieUeTuta4WEUMLGdycYI4QoXb7Ctk5M8CjucySqvfAyDr2Y89XoR
         BhX2gP07ULPf5Y4DSjEkW1D+wIHOVELcWhs1JlmJd7PjwnIMsc92VXASo7F9hpq/akry
         DLmVbP03ZN3FQa3st0+TrRTGmF+1rshx+7LLc01qKMrxtEd85Lxb7U0a8vj//0DAy/tD
         iz65+YqBgZqIb5341CVVrs2iROAY1rTLhDtSJ0Vs2HS8AbXFCpRnejU5IYE508i5Gjmx
         EfNw==
X-Gm-Message-State: AOAM532CZu+dZIYhU5cMOekfAunBRaNEyxb5Y+sJGHXpKT1ymbnHagbq
        3VrXRVBlWJUDZbZTpf+G9AG/wg==
X-Google-Smtp-Source: ABdhPJzBk1cgJvigLTBpzrkzyw93ozQjhaI8GSxKK42oABc32zYGurmL/AUO7+tHdNOzK5VOfFnjDw==
X-Received: by 2002:adf:dc83:: with SMTP id r3mr4498991wrj.223.1606406092266;
        Thu, 26 Nov 2020 07:54:52 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id r13sm4193297wrm.25.2020.11.26.07.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:51 -0800 (PST)
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
Subject: [PATCH v3 12/23] kvm: arm64: Create nVHE copy of cpu_logical_map
Date:   Thu, 26 Nov 2020 15:54:10 +0000
Message-Id: <20201126155421.14901-13-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When KVM starts validating host's PSCI requests, it will need to map
MPIDR back to the CPU ID. To this end, copy cpu_logical_map into nVHE
hyp memory when KVM is initialized.

Only copy the information for CPUs that are online at the point of KVM
initialization so that KVM rejects CPUs whose features were not checked
against the finalized capabilities.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/arm.c              | 19 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-smp.c | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index bb07f0401c68..bb3c541d3ddb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -61,6 +61,8 @@ static bool vgic_present;
 static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
 DEFINE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
+extern u64 kvm_nvhe_sym(__cpu_logical_map)[NR_CPUS];
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
@@ -1531,6 +1533,20 @@ static inline void hyp_cpu_pm_exit(void)
 }
 #endif
 
+static void init_cpu_logical_map(void)
+{
+	unsigned int cpu;
+
+	/*
+	 * Copy the MPIDR <-> logical CPU ID mapping to hyp.
+	 * Only copy the set of online CPUs whose features have been chacked
+	 * against the finalized system capabilities. The hypervisor will not
+	 * allow any other CPUs from the `possible` set to boot.
+	 */
+	for_each_online_cpu(cpu)
+		kvm_nvhe_sym(__cpu_logical_map)[cpu] = cpu_logical_map(cpu);
+}
+
 static int init_common_resources(void)
 {
 	return kvm_set_ipa_limit();
@@ -1703,6 +1719,9 @@ static int init_hyp_mode(void)
 		}
 	}
 
+	if (is_protected_kvm_enabled())
+		init_cpu_logical_map();
+
 	return 0;
 
 out_err:
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-smp.c b/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
index c168d86f885a..ceb427aabb91 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
@@ -8,6 +8,22 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+/*
+ * nVHE copy of data structures tracking available CPU cores.
+ * Only entries for CPUs that were online at KVM init are populated.
+ * Other CPUs should not be allowed to boot because their features were
+ * not checked against the finalized system capabilities.
+ */
+u64 __ro_after_init __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
+
+u64 cpu_logical_map(unsigned int cpu)
+{
+	if (cpu >= ARRAY_SIZE(__cpu_logical_map))
+		hyp_panic();
+
+	return __cpu_logical_map[cpu];
+}
+
 unsigned long __hyp_per_cpu_offset(unsigned int cpu)
 {
 	unsigned long *cpu_base_array;
-- 
2.29.2.454.gaff20da3a2-goog

