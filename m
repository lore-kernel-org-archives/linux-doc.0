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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C2FC63798
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1C1C21D7E
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZzoISy5I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391424AbgKZPyp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391416AbgKZPyl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:41 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F13C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:40 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id t4so2613978wrr.12
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txa3gmLNZHrKqQEh2rRK806HAOB8/IMPENffeRn2Pp8=;
        b=ZzoISy5IBgKnYUDSKLr4ou3Hmpa7vhh20W36eivbCgG7/560M52OOFTXLUxAKoFV8a
         PBuwaGiqAm+4JH02iFzu3eb36E9VnlcDWPyev/kMaU5ucflRuB6CSahFxT5c2fcKIrXo
         OasaMJbdGe1vTJKcamZK55+4r8AGeP5kGb53s8a2v6LsQRwdh+hYYLMCS482yRa43LoZ
         vUsT+QqEFp0529JcVHSKd6+YmEnRYQD3E41jTl1KFycA4JB/gtHY4NXsHBziHtiOiOaO
         2EuNnguAmi6l+obHw6xfXSKVBefA7yCJdjiN+URyOPsHKM0XDVNPWJACJNsnervf0jqO
         gtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txa3gmLNZHrKqQEh2rRK806HAOB8/IMPENffeRn2Pp8=;
        b=Sgu2qLB7qbRlgeEzgchP9YJfAZNGJQ2euR8SYlj1uAWx2s5gX+SE8grjPDgmM6Vw9i
         ENR9PvC9Juv9EdL8EvV17bIoCcvVn6eptFe+mjwTfZQ8F+maRjfdABQ0YJZCUcDOLv3W
         i4cHzbllKRUx7V5QVgLA/ozYU4BmD1PbatVDkJv9KSsrwlDau/Mzgmnb+hel5ttyvQYG
         DCpszBo5ULe5yq8xzbZBjErdkiTFGf3B0QWX2fUZKFhbejITTZ8xSnXDhYJjW736Wtqi
         2yx2+FCHGtYR2lkOiNbn+vqGixLt1SVUTwRLpFE+SrJhAwOrC93WL35y9YNK0z05RNAx
         PTvQ==
X-Gm-Message-State: AOAM530o7Z4sGFZeE/n/yEmJiVMDcDZ36i8Sdz5QAQ4PxVvl6zX/WpHn
        rckFcqpNkSyi6hpjhAhWZ/ySRA==
X-Google-Smtp-Source: ABdhPJwmwAB0qeB/yoQ0FYSa/sH0XxV6RjnpiuboG/gAt0L9d0uMTFj254pYIT1Ecf1dLKgj9sUIfQ==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr4618637wrw.365.1606406079235;
        Thu, 26 Nov 2020 07:54:39 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id o4sm8750577wmh.33.2020.11.26.07.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:38 -0800 (PST)
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
Subject: [PATCH v3 06/23] kvm: arm64: Add kvm-arm.protected early kernel parameter
Date:   Thu, 26 Nov 2020 15:54:04 +0000
Message-Id: <20201126155421.14901-7-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an early parameter that allows users to opt into protected KVM mode
when using the nVHE hypervisor. In this mode, guest state will be kept
private from the host. This will primarily involve enabling stage-2
address translation for the host, restricting DMA to host memory, and
filtering host SMCs.

Capability ARM64_PROTECTED_KVM is set if the param is passed, CONFIG_KVM
is enabled and the kernel was not booted with VHE.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 arch/arm64/include/asm/cpucaps.h              |  3 +-
 arch/arm64/include/asm/virt.h                 |  8 +++++
 arch/arm64/kernel/cpufeature.c                | 29 +++++++++++++++++++
 arch/arm64/kvm/arm.c                          |  4 ++-
 5 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 526d65d8573a..06c89975c29c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2259,6 +2259,11 @@
 			for all guests.
 			Default is 1 (enabled) if in 64-bit or 32-bit PAE mode.
 
+	kvm-arm.protected=
+			[KVM,ARM] Allow spawning protected guests whose state
+			is kept private from the host. Only valid for non-VHE.
+			Default is 0 (disabled).
+
 	kvm-arm.vgic_v3_group0_trap=
 			[KVM,ARM] Trap guest accesses to GICv3 group-0
 			system registers
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 162539d4c8cd..9fab6cbffce2 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,7 +66,8 @@
 #define ARM64_HAS_TLB_RANGE			56
 #define ARM64_MTE				57
 #define ARM64_WORKAROUND_1508412		58
+#define ARM64_PROTECTED_KVM			59
 
-#define ARM64_NCAPS				59
+#define ARM64_NCAPS				60
 
 #endif /* __ASM_CPUCAPS_H */
diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index 6069be50baf9..2fde1186b962 100644
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
+		return cpus_have_final_cap(ARM64_PROTECTED_KVM);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ! __ASM__VIRT_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6f36c4f62f69..dd5bc0f0cf0d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1709,6 +1709,29 @@ static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 }
 #endif /* CONFIG_ARM64_MTE */
 
+#ifdef CONFIG_KVM
+static bool enable_protected_kvm;
+
+static bool has_protected_kvm(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	if (!enable_protected_kvm)
+		return false;
+
+	if (is_kernel_in_hyp_mode()) {
+		pr_warn("Protected KVM not available with VHE\n");
+		return false;
+	}
+
+	return true;
+}
+
+static int __init early_protected_kvm_cfg(char *buf)
+{
+	return strtobool(buf, &enable_protected_kvm);
+}
+early_param("kvm-arm.protected", early_protected_kvm_cfg);
+#endif /* CONFIG_KVM */
+
 /* Internal helper functions to match cpu capability type */
 static bool
 cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
@@ -1822,6 +1845,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.field_pos = ID_AA64PFR0_EL1_SHIFT,
 		.min_field_value = ID_AA64PFR0_EL1_32BIT_64BIT,
 	},
+	{
+		.desc = "Protected KVM",
+		.capability = ARM64_PROTECTED_KVM,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_protected_kvm,
+	},
 #endif
 	{
 		.desc = "Kernel page table isolation (KPTI)",
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2d0a37c75cda..b25035dc0478 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1818,7 +1818,9 @@ int kvm_arch_init(void *opaque)
 	if (err)
 		goto out_hyp;
 
-	if (in_hyp_mode)
+	if (is_protected_kvm_enabled())
+		kvm_info("Protected nVHE mode initialized successfully\n");
+	else if (in_hyp_mode)
 		kvm_info("VHE mode initialized successfully\n");
 	else
 		kvm_info("Hyp mode initialized successfully\n");
-- 
2.29.2.454.gaff20da3a2-goog

