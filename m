Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6040C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Nov 2022 16:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbiKBQVI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Nov 2022 12:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiKBQUi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Nov 2022 12:20:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B89317D5
        for <linux-doc@vger.kernel.org>; Wed,  2 Nov 2022 09:14:58 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h9so25323724wrt.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Nov 2022 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKetkh4WHRfyiXWR3Ck7PLJHjhMFIGu7qwf9qalJlhM=;
        b=HXMN/eEDtXRg0lyznWzotr3Id2ejKM0OY0ZT7J1wWoBooooL9lw9TUkFXLirKbziOx
         5ZpT0h0dn7/SEniBN03v1j0ElI5smjuDbOper+qxDTEIT7z3yQ0xvSxgu7JtD29haSWd
         6tdgy38Uu6VXqF6Xb55fF0gb6L8X2QfogulXBPzPoMe3u9il7bCA9+XT/bpIVR4myrLy
         mCI91Rsl8oQq43jfRCxk+92/S4hxm0PbFpFBr0AYOtMEmWTwrJJ+za/3GNgEbLbVp0Md
         MEeR+3D3ayYWEoCqG+l+YCvPce/e4gZfKY88Ar6tBBM8P+4Zj4owL4VqQC+PYKeR/oQp
         M6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKetkh4WHRfyiXWR3Ck7PLJHjhMFIGu7qwf9qalJlhM=;
        b=JN7ohrg/EGPVMvZQrkDx6n+jigK4ny5LS2elZk2Qgo26PBV+HkkIQ6+BpjX+wvAw+m
         NENirlbYm2zvVbOLTLHyd2rCJTNheNJmzef8cMxEm5G4qF8CdYK2m6ARTXcHBVOw/aS6
         1oaHdEIiZtYyeDG5T/wry73kzCfM/p9VThWwnYFnt0UKLHzQkPqOBzmkMOKHpFGeQ2or
         l2QvBQid+f2ptYUreVwnMWp/wGbdTOuJs7n5vUEj5LZTCuT9qTXiIvT4rxQF/uus/wYg
         rosGNOhEA+14MrQv2MUHTNbNTvg7tps0yqLsSGZKBmsv3gRwZHNeXHegs+ybRJNLaSx9
         zB2w==
X-Gm-Message-State: ACrzQf1rPpj7Mn/5JI/dUFCojUhB9+tHUDFBHX595tX7KXMp+ArP9Rwy
        mcuSwIx+zMbG/rT45x2O3nfPCA==
X-Google-Smtp-Source: AMsMyM5+Z3lL6R6aAvTLh4btN5LWo2mJaU+uOsrPpgXgkxou+kqC31SRgBvxqKWg39boq3cROn42HA==
X-Received: by 2002:a05:6000:170d:b0:236:6aa1:8a56 with SMTP id n13-20020a056000170d00b002366aa18a56mr15676520wrc.302.1667405663370;
        Wed, 02 Nov 2022 09:14:23 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b4d7:0:6a08:9b26:ab04:7065])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d56d1000000b0022cc6b8df5esm13230923wrw.7.2022.11.02.09.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:14:22 -0700 (PDT)
From:   Usama Arif <usama.arif@bytedance.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com
Cc:     fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: [RFC 5/6] KVM: arm64: Support the VCPU preemption check
Date:   Wed,  2 Nov 2022 16:13:39 +0000
Message-Id: <20221102161340.2982090-6-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102161340.2982090-1-usama.arif@bytedance.com>
References: <20221102161340.2982090-1-usama.arif@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Support the vcpu_is_preempted() functionality under KVM/arm64. This will
enhance lock performance on overcommitted hosts (more runnable VCPUs
than physical CPUs in the system) as doing busy waits for preempted
VCPUs will hurt system performance far worse than early yielding.

Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 arch/arm64/include/asm/paravirt.h |   2 +
 arch/arm64/include/asm/spinlock.h |  16 +++-
 arch/arm64/kernel/paravirt.c      | 126 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c         |   3 +
 include/linux/cpuhotplug.h        |   1 +
 5 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index 9aa193e0e8f2..4ccb4356c56b 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -19,10 +19,12 @@ static inline u64 paravirt_steal_clock(int cpu)
 }
 
 int __init pv_time_init(void);
+int __init pv_lock_init(void);
 
 #else
 
 #define pv_time_init() do {} while (0)
+#define pv_lock_init() do {} while (0)
 
 #endif // CONFIG_PARAVIRT
 
diff --git a/arch/arm64/include/asm/spinlock.h b/arch/arm64/include/asm/spinlock.h
index 0525c0b089ed..7023efa4de96 100644
--- a/arch/arm64/include/asm/spinlock.h
+++ b/arch/arm64/include/asm/spinlock.h
@@ -10,7 +10,20 @@
 
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
+#define vcpu_is_preempted vcpu_is_preempted
+
+#ifdef CONFIG_PARAVIRT
+#include <linux/static_call_types.h>
+
+bool dummy_vcpu_is_preempted(int cpu);
 
+DECLARE_STATIC_CALL(pv_vcpu_is_preempted, dummy_vcpu_is_preempted);
+static inline bool vcpu_is_preempted(int cpu)
+{
+	return static_call(pv_vcpu_is_preempted)(cpu);
+}
+
+#else
 /*
  * Changing this will break osq_lock() thanks to the call inside
  * smp_cond_load_relaxed().
@@ -18,10 +31,11 @@
  * See:
  * https://lore.kernel.org/lkml/20200110100612.GC2827@hirez.programming.kicks-ass.net
  */
-#define vcpu_is_preempted vcpu_is_preempted
 static inline bool vcpu_is_preempted(int cpu)
 {
 	return false;
 }
 
+#endif /* CONFIG_PARAVIRT */
+
 #endif /* __ASM_SPINLOCK_H */
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 57c7c211f8c7..45bcca87bed7 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -22,6 +22,7 @@
 
 #include <asm/paravirt.h>
 #include <asm/pvclock-abi.h>
+#include <asm/pvlock-abi.h>
 #include <asm/smp_plat.h>
 
 struct static_key paravirt_steal_enabled;
@@ -38,7 +39,12 @@ struct pv_time_stolen_time_region {
 	struct pvclock_vcpu_stolen_time __rcu *kaddr;
 };
 
+struct pv_lock_state_region {
+	struct pvlock_vcpu_state __rcu *kaddr;
+};
+
 static DEFINE_PER_CPU(struct pv_time_stolen_time_region, stolen_time_region);
+static DEFINE_PER_CPU(struct pv_lock_state_region, lock_state_region);
 
 static bool steal_acc = true;
 static int __init parse_no_stealacc(char *arg)
@@ -178,3 +184,123 @@ int __init pv_time_init(void)
 
 	return 0;
 }
+
+static bool native_vcpu_is_preempted(int cpu)
+{
+	return false;
+}
+
+DEFINE_STATIC_CALL(pv_vcpu_is_preempted, native_vcpu_is_preempted);
+
+static bool para_vcpu_is_preempted(int cpu)
+{
+	struct pv_lock_state_region *reg;
+	__le64 preempted_le;
+
+	reg = per_cpu_ptr(&lock_state_region, cpu);
+	if (!reg->kaddr) {
+		pr_warn_once("PV lock enabled but not configured for cpu %d\n",
+			     cpu);
+		return false;
+	}
+
+	preempted_le = le64_to_cpu(READ_ONCE(reg->kaddr->preempted));
+
+	return !!(preempted_le);
+}
+
+static int pvlock_vcpu_state_dying_cpu(unsigned int cpu)
+{
+	struct pv_lock_state_region *reg;
+
+	reg = this_cpu_ptr(&lock_state_region);
+	if (!reg->kaddr)
+		return 0;
+
+	memunmap(reg->kaddr);
+	memset(reg, 0, sizeof(*reg));
+
+	return 0;
+}
+
+static int init_pvlock_vcpu_state(unsigned int cpu)
+{
+	struct pv_lock_state_region *reg;
+	struct arm_smccc_res res;
+
+	reg = this_cpu_ptr(&lock_state_region);
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_LOCK_PREEMPTED, &res);
+
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED) {
+		pr_warn("Failed to init PV lock data structure\n");
+		return -EINVAL;
+	}
+
+	reg->kaddr = memremap(res.a0,
+			      sizeof(struct pvlock_vcpu_state),
+			      MEMREMAP_WB);
+
+	if (!reg->kaddr) {
+		pr_warn("Failed to map PV lock data structure\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int kvm_arm_init_pvlock(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ARM_KVM_PVLOCK_STARTING,
+				"hypervisor/arm/pvlock:starting",
+				init_pvlock_vcpu_state,
+				pvlock_vcpu_state_dying_cpu);
+	if (ret < 0) {
+		pr_warn("PV-lock init failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool has_kvm_pvlock(void)
+{
+	struct arm_smccc_res res;
+
+	/* To detect the presence of PV lock support we require SMCCC 1.1+ */
+	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
+		return false;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_HV_PV_LOCK_FEATURES, &res);
+
+	if (res.a0 != SMCCC_RET_SUCCESS)
+		return false;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_HV_PV_LOCK_FEATURES,
+			     ARM_SMCCC_HV_PV_LOCK_PREEMPTED, &res);
+
+	return (res.a0 == SMCCC_RET_SUCCESS);
+}
+
+int __init pv_lock_init(void)
+{
+	int ret;
+
+	if (is_hyp_mode_available())
+		return 0;
+
+	if (!has_kvm_pvlock())
+		return 0;
+
+	ret = kvm_arm_init_pvlock();
+	if (ret)
+		return ret;
+
+	static_call_update(pv_vcpu_is_preempted, para_vcpu_is_preempted);
+	pr_info("using PV-lock preempted\n");
+
+	return 0;
+}
\ No newline at end of file
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index fea3223704b6..05ca07ac5800 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -42,6 +42,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/kasan.h>
 #include <asm/numa.h>
+#include <asm/paravirt.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/smp_plat.h>
@@ -360,6 +361,8 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	smp_init_cpus();
 	smp_build_mpidr_hash();
 
+	pv_lock_init();
+
 	/* Init percpu seeds for random tags after cpus are set up. */
 	kasan_init_sw_tags();
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f61447913db9..c0ee11855c73 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -192,6 +192,7 @@ enum cpuhp_state {
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
+	CPUHP_AP_ARM_KVM_PVLOCK_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
-- 
2.25.1

