Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377216;
	b=FYxF6yIJBotaDGkFOkMPAyUa3x6Xxao+/LzMkB6thpgh5ZjnO04i+r1CqDgjEaUn9rCX
	 +CMJ4Mqc3JoBCMCgHU05jbePuum2fJ852db6o2TnhAbsSMk9K/iV6Fw2Ew0gR+2U/Z0Ae
	 gxB5gA8dg03Oekq93Pj3spokFOx21ZuSt661/AqdoKdVx8imF5/wjZY8pCj9I3qBSapfj
	 dNCUr4z1qVFdbVn5b2CxUa6Yh+8YmeS+oJ9e+8FJWkS+A9Qp4iiFYRdUF02RzxX0Tboug
	 agdLTH6D+OCpPQLo6HHSp6nOh6yyCYIGiQ4w+HResUPEBe1IGGgYWnl64TN7lv3ZQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377216;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
	b=UILJdgQy3pKqFe73GKzTKYUyKWaEemDGp5RulbjNZsQsifGR0u8rU96BfEwLBgLKGHfm
	 2R5HjKYMey3Wilfc0pNyEWLhJpX5jWiZ2f05Mj5FYshUK4Z4UlWZR6mRYWUz6ZeQ4tsP/
	 f8HdU+imm3f1vQNFnxRSn2TSOdmoeNHTWvWKvitlI2Jv6ro8Wi6Lbqb2tKnzgKRXkn6mO
	 ztxtLwiR6yRNPCkN31hq3k4y19oyWNqTyR9ZGUfMD05O5H7Q1D87szYAEtAM62QzKq16/
	 SmATsto9Rx4c0KdSwj/Eqj90RfpY4aZTJRnP7e4HUeOyBXPqobMdO7rM9MZIF3kkrAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Kl5X9nS0;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A8606A330
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 06:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9A8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Kl5X9nS0
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93e55db58cfso248747085a.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377214; x=1794982014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=dE3T2eMDs+BC3MWWrkBv6DoexYmZWCAA17JfNmCD+82IrfHhi6O0Qknok4sRVxXwNY
         hZFkx4arHYrVQjhZphjK83kkLeAvhwXN6PhqoedYK0RlWU54Y0ygFdBEX47L9CUbRAsJ
         5CFOFnNsUl4Ek9ej2LvKYGwBTR3a8343OiwLNgcOq/Su/CDUeSWd6kz/gDN86RNjwNTH
         wophsHSZvVu5BkdF69QSDRkRf37foRmAxO6AvZOPTUML/meTlw2HxDzWkmkapMEkNEjE
         RV9X+Gq2I88TfWD1Mz8nQP+sCxTjEv70TLwgYQKtNBWVZ5y2NQj6r7t4hbiH5Feghl/n
         zfww==
X-Forwarded-Encrypted: i=1; AL+hErEPajKxnwz2f2aD5SItTALq8kIjpWtjX/08aMbBC178Uh9VU7ZJndCbYaUJQUmlMIkEvqLJVNOJ6k8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88aLG4qJKKioPriI6NWC9GpSeQ+5DJxQ+DrlR1HNMgNGJzV0Ll
	oVBGxjO/S5TnOcw+6eKDWcb4YDGOgz08a8e5j0AXGMnqng2Vjk/c2Bg6C7zYNUy2dwuoSs0RRc9
	pnpaLLXN/v67kdf9tiO3DY4t1qikL5aWnbmy5AEvvtw4iu6PAa9vVCPi6N97RYDDzmAi3TPqeI1
	uFZbe6XkGPOCO/vOgClYAX/w+5SHBfGqGvgj0p1CV37FtlpctDIu+Yw6vq5Sc+/ONgxlg8XP3iG
	W8thCC5H3kt
X-Gm-Gg: AYBFou3fxXBUxKNnlEZM94b6UF8FXGdNaowlzx12wrZ1BeeGNn5eEzzNQYlC14EV36A
	ABd/ivsuaLV2Vr7WqIKisxABUmCTfvlJRX1X7hxHV7NBUOlWm78rC95vOC9R71RTNepJmgtHHCw
	asYYa6H/zY6VlmBEmbVRBsG5zgbGYQ6lGoiTg5WKhn9MpZnjQ/XFIS0aLD1bmd9IK4XFmpKj/JK
	yEva17Enz9oVZs+Ov9ofiGJtFxvpVW001NQQX+dukDtY2yvVRnvarGSgWKs27ypwl99PsjI5v50
	N/EWrqngLlbgLlOgKe5ErW24EMlxwfoxMDT2m+yu7HxRJ6Lq8xR6q3WtTx1mpDa9onAM/KlfKFA
	d+LG3xf4BLa1CxyVpke2PLiUVbBTWx+W95PL+j21PzpRJOY2W9W7C76IuSPsc49J0Pkn6MZCWMc
	X670WsFaVqLQHcUaRcVKgoVLHGP2Fl0/WE
X-Received: by 2002:a05:620a:7110:b0:945:c42e:366f with SMTP id af79cd13be357-947afb909bdmr215257285a.1.1794377214249;
        Tue, 10 Nov 2026 22:06:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479efc2b8csm56739685a.11.2026.11.10.22.06.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:06:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c467e19391so4295135b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377212; x=1794982012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=Kl5X9nS09bHY3eLC61tWo/FtVNAsLDDlml+tGYq55CodCNAtJOeg1sVRQHJhxd3xj5
         +aPIcMFjpoPF8iBDupH4aDcm13tY3/LeZaHIouTZ5W2wqaRkROwLHUmvWKNqGJLNCoRL
         cpRrlkx8PLkSQhhVwZYASO0h7t3WB1tibbz48=
X-Forwarded-Encrypted: i=1; AL+hErE+HMdTEfuiivyzrJu5zxo4feFhVAjJF5U07XuGOtlQUfDo+CpNtLkANE66nOWJZ4JWBgvntHr/eqs=@vger.kernel.org
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197203285a.59.1794376819161;
        Tue, 10 Nov 2026 22:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197197385a.59.1794376818670;
        Tue, 10 Nov 2026 22:00:18 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:14 -0800 (PST)
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
Subject: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
Date: Wed, 11 Nov 2026 00:59:53 -0500
Message-ID: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
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

Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
VMware emulation is built.  When it is disabled, vmware.o isn't built,
the VMware predicates are compile-time false, and the
enable_vmware_backdoor module parameter doesn't exist: a
kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
an unknown parameter.

VMware emulation is only useful to VMware-aware guests and to VMMs that
offer VMware compatibility.  Let kernels that don't need it, e.g. to
reduce the attack surface exposed to guests, leave it out, as they can
already do for Hyper-V and Xen emulation.  Default to "y" so that
existing configurations keep the backdoor and its module parameter.

Provide __always_inline stubs for the predicates that gate VMware
behavior, so that callers need no #ifdefs and the compiler drops the
dead branches.  Leave the operations behind the predicates declared but
undefined when the option is disabled: a call that isn't guarded by a
predicate then fails to link instead of silently doing nothing.

Suggested-by: Sean Christopherson <seanjc@google.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redhat.com
Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/Kconfig  | 12 ++++++++++++
 arch/x86/kvm/Makefile |  4 ++--
 arch/x86/kvm/vmware.h | 31 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 1719059570fb..b34d6d0e30c9 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -212,6 +212,18 @@ config KVM_HYPERV
 
 	  If unsure, say "Y".
 
+config KVM_VMWARE
+	bool "VMware guest support"
+	depends on KVM_X86
+	default y
+	help
+	  Provides KVM support for emulating VMware interfaces. VMware-aware
+	  guests use these interfaces to communicate with the hypervisor.
+	  Userspace hypervisors can also use them to provide VMware
+	  compatibility to their guests.
+
+	  If unsure, say "Y".
+
 config KVM_XEN
 	bool "Support for Xen hypercall interface"
 	depends on KVM_X86
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0cb47cfc1162..794c847ccecc 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -6,13 +6,13 @@ ccflags-$(CONFIG_KVM_WERROR) += -Werror
 include $(srctree)/virt/kvm/Makefile.kvm
 
 kvm-y			+= x86.o emulate.o irq.o lapic.o cpuid.o msrs.o pmu.o regs.o \
-			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o \
-			   vmware.o
+			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o
 
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_IOAPIC) += i8259.o i8254.o ioapic.o
 kvm-$(CONFIG_KVM_HYPERV) += hyperv.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
+kvm-$(CONFIG_KVM_VMWARE) += vmware.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
 kvm-intel-y		+= vmx/vmx.o vmx/vmenter.o vmx/pmu_intel.o vmx/vmcs12.o \
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index bf250cc6e232..5951e419e1a7 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -4,10 +4,41 @@
 
 #include <linux/kvm_host.h>
 
+#ifdef CONFIG_KVM_VMWARE
+
 bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu);
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
 bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
 bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+
+#else /* !CONFIG_KVM_VMWARE */
+
+static __always_inline bool
+kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
+{
+	return false;
+}
+
+#endif /* CONFIG_KVM_VMWARE */
+
 int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
 
 #endif /* __KVM_X86_VMWARE_H */
-- 
2.53.0

