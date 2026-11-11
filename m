Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376837;
	b=WuWg0Sypcm8PUWP3YSoLn1inKBuH6aQXk57scHDa/I4VDHbqUf7LUCoV9RfXgVDu+0Yt
	 aEYHBxIczRz+UMhXJkjIV3OfgiUIQx8xhcuJk90ae4hlNQ/8szH4DDQ0xAM4M9IZWbCor
	 Ti4ivZvgpQE1H3KYAjvssvxuDWHU/Zttcdh3ieSZyGjoof47YSZUijDeJihOEqMoep7Pa
	 Iu89nLLSrE7+9Quf+NduqoTinbvfwVC2zFjewmUXA+n8CV/jUM+JTV2cykOopvQjAS1P3
	 j+e+W0fhBFuSpLTXmQBy6EwxXt/1d/NiviXWeZ4BpriTiVKCSWD+S3Tq+AuOI8v5l5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
	b=0rjVnCk2kn0dNcu67UfHS9P0W/qmRx36qP4lQM40oDoc2zpR7605aZVwCbVnJ5Njowjq
	 hyXHf/Nx0zzXIQCH7DKHC8IZqeI3sx014DH00ox16ffjkhrzfzFvlh7oHPDvzWVNJPAws
	 EvbsgvjE68gQwBo7j++5GVkLVlaOi2MF4yxcWMatY9l+I37GIfDOKzO7X/xk2z1DMxuj2
	 sLosAjFYksX/8O15214dazqauy/nb3AswzbbPS7dZUhsIgJcrJf2kk3TokTssbZ+ODpN9
	 j8YQZdKJS0Q7AexKDs8kS+cy4upKPPsaVlVsZXg2gaxQ4hxGuQHWBHzWI1Ie2pThyMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gmVHjHON;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7C60A261D
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 06:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A7C60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gmVHjHON
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1541593a91.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376837; x=1794981637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
        b=oA6CDBJPSkHMyd1lDBkrseTErxOJ7apAVfUiY521iZlnVXQjvd79FHqVnqpJPSkbA8
         blxl0rsVukBKZ7bSjd980susxAztgd0lEL3kdsEQkkZYi8hRLpgRtQ97r1Msqt3/VFSb
         Q4EMMzQh7Fau5Ymg9vwQgiTiuCmJ7l7REr9cUhhpvqhKuQRCrKgCuZOSWkRjDrjn6a/q
         y6wCRpZAMFRmI3o4zeXwHS92zRuYfw9RVXw3mN07aCPKFWdtVJeWnK/eX7uoccCC1QSu
         wk5PD4NLq9VXXObxfgYLqBODERTs705WvG4fp5/w1iAS2RYEI3MoSOT4E7q7xaryXqAg
         T3cw==
X-Forwarded-Encrypted: i=1; AL+hErFBP0o3FQ5/Lt+KjYnJwWDAqM79Mg+640k/+4DRxF+U0jq8YYvh+zpor/VQmfGIGCFyAYMOnOBTOHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aKku1rfJJmxlJ7dm8EcX43cVzwx5u7F8TIs7pobTNKbPxh6u1
	hjJNXslw2ApVkjFNTCgXgGlwwhOnYO3jVc8d1d0JGQiPX4W74GYDMMgsq3lee6H3pjvrLarjLfv
	0WS0I45RPlxpK6ke4axh/9vPol/+j5QngWrTC4HtG+a+dlNlPXpOXt/ZOf2B4xEpSztlAO/38rn
	ZVen0CaX/JlRMeGD7oVTjSLwLPP/PjvVWOx1zVPHApQMJKKjsoBovkVl2alDju135hAm94v91uZ
	4zbeDxJ5u+q
X-Gm-Gg: AYBFou1fkpVJpOZSwA0rJvINVA4gJAf7nOMZh8JPwx9087E9us2zV+qSRHGT47joKu+
	DHy5mlHsZEUomtd93u6RuRAd1ZfkfYMSuxD45nOjldJSVSY+lBBjXQnXlVdoYeZKx1COlFady2v
	+iczTjDDQww+7gaiDt1lYeLUVteuncJJjPMluV2LYn8LLL0scbzr+XrfHNt8kGQZ9iuR4lgH+80
	ZHBEVXZfC17tj42Ib/PeuVPlKotbE+Lvoa3TgJcJnkxQqO2jPkGdJ3/28C6ez73WZg8IjTTJiZF
	CMejoDy5W+HVt0Y3KOE6j75DNKXyWQcODdfjVfRfpuni0qeqRp37HgHAqIr5LVEH5xyzb7Zz1Po
	CcDUmyMqng4Cz3avMhadI52o0T54DKFzltW+gcD/JpzXF/qTLwIKm4+yRHder4p7VCsnQtdXm9r
	g/DJ+dyR5S3OmTRLwWgSW/i6r1Y5GCx345
X-Received: by 2002:a17:90b:3883:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b182f91b64mr1047906a91.36.1794376836237;
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db37301sm1375318a91.0.2026.11.10.22.00.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so593508085a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376830; x=1794981630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
        b=gmVHjHONyEb5fGzmOIdMVKpY4a3FMaL/Hnnz22bNQFRaawB3kLJRpEfnfpAAD1kdzq
         jcZGzn8cFB4L7Leh53hSQGhgdlT2MhQmfLSOl85IOyzJogNJguMiGRmKvly3G8J03al3
         rZ75HCn+PlN61hrLFiDE3jVK2Sa2am6wR6hrQ=
X-Forwarded-Encrypted: i=1; AL+hErGdAJdkd5ChZtKJMRGS6jZkEQjzMNBcmwkSgC5rDxBBrWoi4MhCnqUxplCMyRT6pYrZ3SXhfJBazT8=@vger.kernel.org
X-Received: by 2002:a05:620a:1723:b0:93f:3193:ac09 with SMTP id af79cd13be357-947ae82011emr309712185a.15.1794376830310;
        Tue, 10 Nov 2026 22:00:30 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:93f:3193:ac09 with SMTP id af79cd13be357-947ae82011emr309704885a.15.1794376829606;
        Tue, 10 Nov 2026 22:00:29 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:28 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 07/12] KVM: x86: Route nested VMware backdoors to KVM
Date: Wed, 11 Nov 2026 00:59:56 -0500
Message-ID: <e03558351edde6ccd508fb38d9c2fd63e85370db.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add KVM_VMWARE_ENABLE_NESTED_BACKDOOR.  When it and the backdoor flag
are both enabled, handle the #GP from a CPL3 VMware backdoor I/O access
in L2 in KVM, as for L1, even if L1 intercepts #GP.  Treat an access as
a backdoor access only if EAX holds VMware's magic value and DX selects
one of the two backdoor ports; L1 keeps receiving every other #GP.

VMware Tools use the I/O-port backdoor from user mode and rely on the
hypervisor ignoring the I/O permission checks for the backdoor ports.
When Hyper-V runs in the guest, e.g. for Windows virtualization-based
security (VBS), Windows and the Tools run as L2.  The access then
raises #GP and normal nested routing delivers it to Hyper-V, which
doesn't implement the backdoor.

Make the routing opt-in, because a nested hypervisor that implements
the backdoor itself, such as ESXi, has to keep receiving its guests'
accesses.  Cover only the I/O-port backdoor; L2 VMCALL and VMMCALL
handling doesn't change.

On VMX, claim the exit in nested_vmx_l0_wants_exit().  On SVM, a #GP
that L0 intercepts always reaches gp_interception() first, which
reinjects any #GP that KVM doesn't handle so that it reaches L1 if L1
intercepts #GP; check the filter there.

Link: https://lore.kernel.org/r/CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com
Link: https://lore.kernel.org/r/CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com
Link: https://lore.kernel.org/r/aAjrOgsooR4RYIJr@google.com
Link: https://lore.kernel.org/r/aIEnm7Y1VN-PCfF8@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 Documentation/virt/kvm/api.rst  |  9 +++++++++
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/svm.c          |  7 +++++--
 arch/x86/kvm/vmware.c           |  8 ++++++++
 arch/x86/kvm/vmware.h           | 22 ++++++++++++++++++++++
 arch/x86/kvm/vmx/nested.c       |  5 +++++
 arch/x86/kvm/x86.c              |  3 ++-
 7 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e2f0e329f748..14ce68600551 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9293,6 +9293,15 @@ exception by setting ``vmware.hcall.exception.inject`` and filling in the
 validated vector, error code, and address fields.  When an exception is
 requested, KVM does not advance past the hypercall instruction.
 
+``KVM_VMWARE_ENABLE_NESTED_BACKDOOR`` makes KVM handle VMware backdoor I/O
+from a nested guest itself, even when the nested hypervisor intercepts #GP.
+KVM claims only a #GP raised at CPL3 while EAX holds VMware's magic value and
+DX holds one of the two backdoor ports; the nested hypervisor still receives
+every other #GP, and VMCALL/VMMCALL from the nested guest are not affected.
+This is needed, for example, for a Windows guest with Hyper-V VBS enabled:
+Hyper-V does not implement the VMware backdoor used by VMware Tools.  This
+flag has an effect only when ``KVM_VMWARE_ENABLE_BACKDOOR`` is also enabled.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 3b9f53bce2d9..18c2d908eaa2 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -968,6 +968,7 @@ struct kvm_hyperv_eventfd {
 
 #define KVM_VMWARE_ENABLE_BACKDOOR	_BITULL(0)
 #define KVM_VMWARE_ENABLE_HYPERCALL	_BITULL(1)
+#define KVM_VMWARE_ENABLE_NESTED_BACKDOOR _BITULL(2)
 
 struct kvm_vmware_exit {
 #define KVM_EXIT_VMWARE_HCALL	1
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a2196d8f60aa..bae7065fb360 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2408,9 +2408,12 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 
 	/*
 	 * VMware backdoor emulation on #GP interception only handles
-	 * IN{S}, OUT{S}, and RDPMC, and only for L1.
+	 * IN{S}, OUT{S}, and RDPMC.  Handle L2 accesses only when userspace
+	 * explicitly requests that L0 own the nested VMware backdoor.
 	 */
-	if (!kvm_is_vmware_backdoor_enabled(vcpu) || is_guest_mode(vcpu))
+	if (!kvm_is_vmware_backdoor_enabled(vcpu) ||
+	    (is_guest_mode(vcpu) &&
+	     !kvm_is_vmware_nested_backdoor(vcpu, svm_get_cpl(vcpu))))
 		goto reinject;
 
 	return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
diff --git a/arch/x86/kvm/vmware.c b/arch/x86/kvm/vmware.c
index 8407dccf81fd..066f033e7ea3 100644
--- a/arch/x86/kvm/vmware.c
+++ b/arch/x86/kvm/vmware.c
@@ -117,6 +117,14 @@ int kvm_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+bool kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return kvm_is_vmware_nested_backdoor_enabled(vcpu->kvm) && cpl == 3 &&
+	       lower_32_bits(kvm_rax_read_raw(vcpu)) == VMWARE_HYPERVISOR_MAGIC &&
+	       kvm_is_vmware_io_port(vcpu, kvm_rdx_read_raw(vcpu));
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_is_vmware_nested_backdoor);
+
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
 {
 	return kvm_is_vmware_backdoor_enabled(vcpu) &&
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index de1dc8971ec6..e2ba0b8b4400 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -24,9 +24,19 @@ kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
 }
 
 bool kvm_is_vmware_hypercall(struct kvm_vcpu *vcpu);
+
+static __always_inline bool
+kvm_is_vmware_nested_backdoor_enabled(struct kvm *kvm)
+{
+	return kvm_is_vmware_cap_enabled(kvm, KVM_VMWARE_ENABLE_BACKDOOR) &&
+	       kvm_is_vmware_cap_enabled(kvm,
+					 KVM_VMWARE_ENABLE_NESTED_BACKDOOR);
+}
+
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
 bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
 bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+bool kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl);
 
 #else /* !CONFIG_KVM_VMWARE */
 
@@ -52,6 +62,12 @@ static __always_inline bool kvm_is_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+static __always_inline bool
+kvm_is_vmware_nested_backdoor_enabled(struct kvm *kvm)
+{
+	return false;
+}
+
 static __always_inline bool
 kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
 {
@@ -70,6 +86,12 @@ kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
 	return false;
 }
 
+static __always_inline bool
+kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return false;
+}
+
 #endif /* CONFIG_KVM_VMWARE */
 
 void kvm_vmware_init_vm(struct kvm *kvm);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 1a98f28651f7..2d1297036564 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -18,6 +18,7 @@
 #include "posted_intr.h"
 #include "sgx.h"
 #include "trace.h"
+#include "vmware.h"
 #include "vmx.h"
 #include "smm.h"
 #include "x86_ops.h"
@@ -6490,6 +6491,10 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
 			return true;
 		else if (is_ve_fault(intr_info))
 			return true;
+		else if (is_gp_fault(intr_info) &&
+			 kvm_is_vmware_nested_backdoor(vcpu,
+						       vmx_get_cpl(vcpu)))
+			return true;
 		return false;
 	case EXIT_REASON_EXTERNAL_INTERRUPT:
 		return true;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bd4142763f10..6b6ed02d6063 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -119,7 +119,8 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_host);
 #define KVM_CAP_PMU_VALID_MASK KVM_PMU_CAP_DISABLE
 
 #define KVM_CAP_VMWARE_VALID_MASK (KVM_VMWARE_ENABLE_BACKDOOR | \
-				   KVM_VMWARE_ENABLE_HYPERCALL)
+				   KVM_VMWARE_ENABLE_HYPERCALL | \
+				   KVM_VMWARE_ENABLE_NESTED_BACKDOOR)
 
 #define KVM_GUESTDBG_VALID_MASK \
 	(KVM_GUESTDBG_ENABLE | \
-- 
2.53.0

