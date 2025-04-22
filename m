Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390BB290BB7
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338409; cv=none; b=gREZVo6Ueo5x7TISRMW49BLqCBv6Z3V5yCd2iJ7i0QkeblVttUFUcj0iQqJVEs+jLwetnjAlPmS3031Ncb/Fb1UHByQW77b3DI9sYDP/0+zuJ1P1rnNkjCosWiupJkyNLOV5Z11w8i/7PsUgbQSV9S6VAgdZwft6Re2Do/h/3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338409; c=relaxed/simple;
	bh=wZyGnaU9VKPQKehMP8wf4K5Z9nGpXchW01UtloVdEQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHZcCqOZ2pX1FD4mPzTsYWvYcf1kZsi8tHmrF42F2qtXd9vsUD53rZ2MnMSUoh9AIC5zcR2ygq5Hv/0WH4vRdAzMteZEyFIKyj8/ok4Jg4eyJwfERrfQqtyZMTcf9JbL2CHfteMIP8+rvJvPhIFbigSktka2SepZHewaISggCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=geI162k1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="geI162k1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd89d036so66292125ad.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745338406; x=1745943206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYxBieSKIgS6H6yAXjPCIOcA2I5tG+O4lrtR0vcRYlI=;
        b=geI162k1MVLjh4QDInpGc1f8lQNB+NV/zNJg1HuthT2kp2Cv81LI5eXo9+QdWg7kWD
         cQymVafcb35itvBk7RCkOOQTCSqL65OYaHBPFea4YB1OQgPBoElIkXw8YTLOiM+qc4rp
         C894dQFYjWVLvn2KOELaLPlcQ9UFfzgEIxPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338406; x=1745943206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYxBieSKIgS6H6yAXjPCIOcA2I5tG+O4lrtR0vcRYlI=;
        b=Q7+ws59tkX9rEQSzgdyqSW0AsieOgO9kUW8+3SsjWYVShXpi+Vd85XY/6rp8xSMbbV
         zjBESTEesNfvHEFaZTHetyudSOp0PVEeyKWNuTEMZPm8L/xKN61mmV0GWOeuN3wrxo8I
         1zW9kWWP6vIiimafM4vTld0tsoy3cx0LGtMdo3UEUR3quMPCUGzcO5lE+vMAEfMC9p9y
         ZY+LQn/SpXrx/y1ei0kfZ1tkpbqqExu2fPr6R2cL+oOgr5Fzuo8fyXIs9RJtKvfGGXub
         to31kmGACegb6R264LxYQ1MnG9NJta2y6NiOzzTTuTz0Mn1+COhNH+seaxe5UCAfC7Jn
         vGww==
X-Forwarded-Encrypted: i=1; AJvYcCVQybIYVPdnNy2SLeIckbCU1F4X6eJhEQYfBrayGEqJFn602jychIkhnliYkC5l3d4jDWCC5eTFQKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTw0/o4B4MsbngfHo8fI+o6lP0ZGMZYCaaDRjHQutG48fokR1/
	zKiUxMe4yrN/UhFetY7azii3OIJUk+ON1jvIxnsU7We4+ojTdSQWLDK3x5P74Q==
X-Gm-Gg: ASbGncuUYTdX9tQkdqMz+siK+IwLcifAOO63Ui+Sa8HZ6JAsSskub6xl7U7Qo0ndHuF
	kSO7gnAEiLk7P4q1/PveAahzlnxrUpmunK4W4e+n4YO8ZmDuvjbME4dQCqkZoLixuC1+Qm0fAwA
	usPKuyVCFrpPvN3mPK8UEkaBcW/nstMqIdomwcrPpPKdr2jJNbWdynqv4ST8oCG2wBe99Ti9e9J
	SU3z04uu2/MZX0dCIc4hRfrvbD8oHqCQZ3mX1oylGCZkz7uVZXhgwkEDcGGr7kmnppwFv6awnaY
	A0g9PngLjuoqJTLH0hGwXMBSiTeSFEph3qDTF6I9nzQJ5CfGgDlqbeQgUAvIHwLtDivNyrYnwnt
	ucRjWQX4ZoWxvhQcwUheAdIgGO/CoyxZG
X-Google-Smtp-Source: AGHT+IFUvWhafII9vCi70h93pyV2tLtAs4kKP+wr0pbhir/6F18FqckDEpBNWILkVgMQ+IyZlIqSWg==
X-Received: by 2002:a17:902:ce8c:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c53607c5bmr246637305ad.36.1745338406314;
        Tue, 22 Apr 2025 09:13:26 -0700 (PDT)
Received: from localhost.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb03d2sm87462375ad.142.2025.04.22.09.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:13:26 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Zack Rusin <zack.rusin@broadcom.com>,
	Doug Covelli <doug.covelli@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: x86: Add support for legacy VMware backdoors in nested setups
Date: Tue, 22 Apr 2025 12:12:23 -0400
Message-ID: <20250422161304.579394-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422161304.579394-1-zack.rusin@broadcom.com>
References: <20250422161304.579394-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow handling VMware backdoors by the L0 monitor. This is required on
setups running Windows VBS, where the L1 will be running Hyper-V which
can't handle VMware backdoors. Thus on Windows VBS legacy VMware backdoor
calls issued by the userspace will end up in Hyper-V (L1) and endup
throwing an error.
Add a KVM cap that, in nested setups, allows the legacy VMware backdoor
to be handled by the L0 monitor. Thanks to this we can make sure that
VMware backdoor is always handled by the correct monitor.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Doug Covelli <doug.covelli@broadcom.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: kvm@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/virt/kvm/api.rst  | 14 +++++++++++
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/Kconfig            |  1 +
 arch/x86/kvm/kvm_vmware.h       | 42 +++++++++++++++++++++++++++++++++
 arch/x86/kvm/svm/nested.c       |  6 +++++
 arch/x86/kvm/svm/svm.c          |  3 ++-
 arch/x86/kvm/vmx/nested.c       |  6 +++++
 arch/x86/kvm/x86.c              |  8 +++++++
 include/uapi/linux/kvm.h        |  1 +
 9 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 6d3d2a509848..55bd464ebf95 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8322,6 +8322,20 @@ userspace handling of hypercalls is discouraged. To implement
 such functionality, use KVM_EXIT_IO (x86) or KVM_EXIT_MMIO
 (all except s390).
 
+7.39 KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0
+------------------------------------------
+
+:Architectures: x86
+:Parameters: args[0] whether the feature should be enabled or not
+:Returns: 0 on success.
+
+Capability allows VMware backdoors to be handled by L0 when running
+on nested configurations. This is required when, for example
+running Windows guest with Hyper-V VBS enabled - in that configuration
+the VMware backdoor calls issued by VMware tools would endup in Hyper-V
+(L1) which doesn't handle VMware backdoor. Enable this option to have
+VMware backdoor sent to L0 monitor.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 86bacda2802e..2a806aa93a9e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1197,6 +1197,7 @@ struct kvm_xen {
 struct kvm_vmware {
 	bool backdoor_enabled;
 	bool hypercall_enabled;
+	bool nested_backdoor_l0_enabled;
 };
 #endif
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index f817601924bd..8fefde6f2e78 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -190,6 +190,7 @@ config KVM_VMWARE
 	  formatted IN, OUT and RDPMC instructions which need to be
 	  intercepted.
 	  - VMware hypercall interface: VMware hypercalls exit to userspace
+	  - VMware legacy backdoor handling in L0
 
 	  If unsure, say "Y".
 
diff --git a/arch/x86/kvm/kvm_vmware.h b/arch/x86/kvm/kvm_vmware.h
index 846b90091a2a..d90bcf73bae4 100644
--- a/arch/x86/kvm/kvm_vmware.h
+++ b/arch/x86/kvm/kvm_vmware.h
@@ -9,6 +9,9 @@
 
 #include <linux/kvm_host.h>
 
+#include "asm/vmware.h"
+#include "x86.h"
+
 #ifdef CONFIG_KVM_VMWARE
 
 #define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
@@ -98,6 +101,35 @@ static inline bool kvm_vmware_hypercall_enabled(struct kvm *kvm)
 	return kvm->arch.vmware.hypercall_enabled;
 }
 
+static inline bool kvm_vmware_nested_backdoor_l0_enabled(struct kvm *kvm)
+{
+	return kvm->arch.vmware.backdoor_enabled &&
+		kvm->arch.vmware.nested_backdoor_l0_enabled;
+}
+
+static inline bool kvm_vmware_wants_backdoor_to_l0(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	/* We only care about the lower 32 bits */
+	const unsigned long mask = 0xffffffff;
+	const unsigned long port_mask = 0xffff;
+	unsigned long rax, rdx;
+
+	if (!kvm_vmware_nested_backdoor_l0_enabled(vcpu->kvm))
+		return false;
+
+	if (cpl != 3)
+		return false;
+
+	rax = kvm_rax_read(vcpu) & mask;
+	if (rax == VMWARE_HYPERVISOR_MAGIC) {
+		rdx = kvm_rdx_read(vcpu) & port_mask;
+		return (rdx == VMWARE_HYPERVISOR_PORT ||
+			rdx == VMWARE_HYPERVISOR_PORT_HB);
+	}
+
+	return false;
+}
+
 void kvm_vmware_init_vm(struct kvm *kvm);
 int kvm_vmware_hypercall(struct kvm_vcpu *vcpu);
 
@@ -142,6 +174,16 @@ static inline int kvm_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static inline bool kvm_vmware_nested_backdoor_l0_enabled(struct kvm *kvm)
+{
+	return false;
+}
+
+static inline bool kvm_vmware_wants_backdoor_to_l0(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return false;
+}
+
 #endif /* CONFIG_KVM_VMWARE */
 
 #endif /* __ARCH_X86_KVM_VMWARE_H__ */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 04c375bf1ac2..74c472e51479 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -22,6 +22,7 @@
 #include <asm/debugreg.h>
 
 #include "kvm_emulate.h"
+#include "kvm_vmware.h"
 #include "trace.h"
 #include "mmu.h"
 #include "x86.h"
@@ -1517,6 +1518,11 @@ int nested_svm_exit_special(struct vcpu_svm *svm)
 			 svm->vcpu.arch.apf.host_apf_flags)
 			/* Trap async PF even if not shadowing */
 			return NESTED_EXIT_HOST;
+#ifdef CONFIG_KVM_VMWARE
+		else if ((exit_code == (SVM_EXIT_EXCP_BASE + GP_VECTOR)) &&
+			 kvm_vmware_wants_backdoor_to_l0(vcpu, to_svm(vcpu)->vmcb->save.cpl))
+			return NESTED_EXIT_HOST;
+#endif
 		break;
 	}
 	case SVM_EXIT_VMMCALL:
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index be106bd60553..96996e7f9de4 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2407,7 +2407,8 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 		 * VMware backdoor emulation on #GP interception only handles
 		 * IN{S}, OUT{S}, and RDPMC.
 		 */
-		if (!is_guest_mode(vcpu))
+		if (!is_guest_mode(vcpu)  ||
+		    kvm_vmware_wants_backdoor_to_l0(vcpu, svm_get_cpl(vcpu)))
 			return kvm_emulate_instruction(vcpu,
 				EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
 	} else {
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index ed8a3cb53961..ff8a1dbbba01 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -10,6 +10,7 @@
 #include "x86.h"
 #include "cpuid.h"
 #include "hyperv.h"
+#include "kvm_vmware.h"
 #include "mmu.h"
 #include "nested.h"
 #include "pmu.h"
@@ -6386,6 +6387,11 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
 			return true;
 		else if (is_ve_fault(intr_info))
 			return true;
+#ifdef CONFIG_KVM_VMWARE
+		else if (is_gp_fault(intr_info) &&
+			 kvm_vmware_wants_backdoor_to_l0(vcpu, vmx_get_cpl(vcpu)))
+			return true;
+#endif
 		return false;
 	case EXIT_REASON_EXTERNAL_INTERRUPT:
 		return true;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 300cef9a37e2..5dc57bc57851 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4653,6 +4653,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #ifdef CONFIG_KVM_VMWARE
 	case KVM_CAP_X86_VMWARE_BACKDOOR:
 	case KVM_CAP_X86_VMWARE_HYPERCALL:
+	case KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0:
 #endif
 		r = 1;
 		break;
@@ -6754,6 +6755,13 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		kvm->arch.vmware.hypercall_enabled = cap->args[0];
 		r = 0;
 		break;
+	case KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0:
+		r = -EINVAL;
+		if (cap->args[0] & ~1)
+			break;
+		kvm->arch.vmware.nested_backdoor_l0_enabled = cap->args[0];
+		r = 0;
+		break;
 #endif
 	default:
 		r = -EINVAL;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index adf1a1449c06..f5d63c0c79f5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -955,6 +955,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_X86_VMWARE_BACKDOOR 239
 #define KVM_CAP_X86_VMWARE_HYPERCALL 240
+#define KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0 241
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.48.1

