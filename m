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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3700C71156
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56FC3221FA
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387950AbgLBSnd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389580AbgLBSnc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:43:32 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1087DC08E864
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:42:00 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id v14so10172450wml.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0j+RCoYcy0kA4Cq9TKjA5cl6J4xllDB/E52Sl/VxFI=;
        b=QcreM1BcCNABhAl7u4JGwSWjJ6gL2zFtNGBBBem5Uz5LSqS20kZNu05BsIN3mdk4kM
         WmwSgASKeZZf1fSScVelU10Ou/l83oRqNvrWHtKxX57HtR13qLL5HHbTF514eIWpCpMw
         P0Gy3N3uhn3dqAOv+u3mta3p6YjahXlzn4T7tVKOibfRXgAJf13M/c2ftXFoqM3j22us
         ffeUS8vBSPDzcOIbAw+5y73xgPZdPgPtA07YEQoX6QjVhtaChsCatVOzVs9MuAzzNIpb
         ta4/8BaelML3og/7agjZt0z5OZIowiI5vG0V76o+ilQp/3DwYOPyCZFg562dd8fO3tG3
         ssSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X0j+RCoYcy0kA4Cq9TKjA5cl6J4xllDB/E52Sl/VxFI=;
        b=L2TCGVVWD7D+Kg6CnkNZS5lJvYp+pQEXgEk9n76b/h8RG6LWndUbRASxjyk6KRijad
         swctY0KOYuXwPgjfRLjcbu00exoaHCFyoKQMj2fnf31vG1bYboxJuBnPNiXv5fl9CzBs
         rjDVC5AxQ5iziyUorCpqag6CGf1OBZYMkdnX4VjbVXyPcga+vYWNJpm4PvN/pslWFaDj
         7oNjmAUJ0aqoQxJWvd5ALAqM10COojO99ckx8p8XwHNy4mie8u1+MIQf5QxCU8dXisvK
         0dJVJa3U6W3I9+ywa6DOz5vQwYMygriaHlnkMlg1LjAoQGeRxFyB62kZfYYkKv1fNYZN
         8vug==
X-Gm-Message-State: AOAM532CF/53Qjln6g53ZVMAN+DK8vVN4OITkDDmsvhdSR2Ef9DuoSty
        shiHZxowupPluA6glavofn7D2w==
X-Google-Smtp-Source: ABdhPJyPFPIxlkDq4z9qel4Mj/fLalo17OXktP8fnmZlxbaiN1V56nYRoNY5X1VLxACl0aApz+oOfw==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr4615447wmk.48.1606934518563;
        Wed, 02 Dec 2020 10:41:58 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id 35sm3086773wro.71.2020.12.02.10.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:57 -0800 (PST)
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
Subject: [PATCH v4 14/26] kvm: arm64: Create nVHE copy of cpu_logical_map
Date:   Wed,  2 Dec 2020 18:41:10 +0000
Message-Id: <20201202184122.26046-15-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
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
index 40857cbed3d1..09bb4098502b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -63,6 +63,8 @@ static bool vgic_present;
 static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
 DEFINE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
+extern u64 kvm_nvhe_sym(__cpu_logical_map)[NR_CPUS];
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
@@ -1584,6 +1586,20 @@ static inline void hyp_cpu_pm_exit(void)
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
@@ -1756,6 +1772,9 @@ static int init_hyp_mode(void)
 		}
 	}
 
+	if (is_protected_kvm_enabled())
+		init_cpu_logical_map();
+
 	return 0;
 
 out_err:
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-smp.c b/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
index 7b0363b4857f..cbab0c6246e2 100644
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

