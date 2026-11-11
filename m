Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377215;
	b=cuFU86tidQ8FECxbJnd9Nqlk9z7aCybYDCfsJV5b71lsZ7wE+Wxa1gI6r02Uo6aikTOe
	 mQcDrZDFQV97ZhS2inOmJPgSIt3ZDCThuxC6j120EuuxiCvB/UxglaJYQcCYe5Gaf5anW
	 UZWLBQyoKnt7d61fPMHSNrtlMW/1uXErmQp5PP4lUaqHd7nEwek0QYGYELUQnofvI4SvZ
	 BQtaUwpIc9ulwVvzxdn/m/hprtj4bWEXjsMB9YpzJaTtx3c1y7kw1bTH1IInJkS7nh9ju
	 /QPxOWZcto7H91VfIXravyat7AWZnaPg07jgSQ/ey6lkcYEW7meow6tsQD7r5EAzcPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377215;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
	b=mFZUIx5LO6csDbJCNvP4QtNcnB6k+B0tULuZzGN8BRJbU2TYwDXrxnj4NdooAXmBnHMy
	 igOs6FR8r/QEtMVHVaqK4r/SIqUDlvHYhXs8k+4NHbgOgZ8mGm5JPR+ZPXmR/6Fo2edeo
	 6gBv4NE0iaUTOcrP9gWXlHeOlNjlxAOPrOX4Y4Qfvj7MY1m3FOPZMf0Af2d62+f7czhBw
	 Zv1X29fiGzBzw3bk9NXEEzgQ9xY59ZaPONBUZ1afGetFmfqznlQuOTqsZmjZ8O72sh7yj
	 E1ImLk6LILArTtpN/uLzQPtYlHVy8c1J8ADxDUZ2ODt+uVU5ttFffXlpwjcWG5lWtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="afl0W/rz";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFB606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 06:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=afl0W/rz
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1679694a91.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377214; x=1794982014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
        b=QBRUGtUSTt69TGq/tnyfGJJBz52gJRGvwECzBRIss+oiB/sX5xLP/cQGXAjeeT9L3O
         ouGXxsKnSj/iOnpfK+aAff52xPs1ga6YbhY3ZiQBY0ekrgAILPWEkCk8LG6Hma/DpckF
         OqQ1KCh8fETZKVE0XFjEJ78wKsMZ+wDyL7bbhiSeopNkXXfTeNJKHIdBr7tLVluileFe
         GDVIF6Ll36nF3Oo/RWNxbZMuu0E6tgsqBl47EDqiUE8x97o4flhkXkd3GRWbEtA5TNHI
         k+jRLEilHnzveuHq1Z7S3CRTK6/4ZWDiI+ja2gY+Ew3pFLYvXu4OoiJtNqV+i5FsI/cA
         u8cg==
X-Forwarded-Encrypted: i=1; AL+hErEFLl4cuRiEqFJaGm25axmTPBVUTsF4z+wx00Odv9JeDIe/S0UqM2rZBfo8K5We1XlR5/D9RfbHHwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fc5elXY8WOuRNMK8JqwgPgHC03iHMsnNCzDV4aFbZb8pyov6K
	l4y3/S4U54SaQcR55wp1tyRErAsj8lbeDhjQVN/aFvLzFtCnQxQLYKkp1CRmyG0WCEzb69Ko/Z4
	OtzpNgHwepZsl1zXQoBS9/B8gOYzLHkQOstLnZUHw9Lm3Id3fGSQDxIUN2Cp0MSNA2N7IPkhjh1
	0e+0X4bKwX9gzDahLNwajYdOhItv6M7Aj35PU6vdQ/QRG/MTofKinUfDAUQhtL2nai9+rUUe+Qf
	K5ItQFYlx5/
X-Gm-Gg: AYBFou3hK8AtsiJK0uDNAo1WEPUOvvvVevbYCq+iBkJgBh/NqalkSOs32KhhXylS6SP
	wTAakOaC18nzIItGT1P2ZAzJdNebv2rphnmM4WeEJIukfkESZfxMH1mnQVY9IYraKliBG74cala
	zdwT1uSKCmO4zKxxMLHA6UrICOkAMuOQ/L6YCfy+GuMDOtzaINuD0tszeW78EKcQO9UuAtO2fmk
	GtgKlhQ3KozAzlUqJ1T4Dl3fZjblFb2PnpKfljQs0FnNcngi8PtWiQdAJ5kx3d+nV82CGzBwdk6
	GUDqiALa2DN/9LbusWFwQFcg88juN2qb0Nvsd0mxw4B3fqUEproiRuLsj1aa+zAT/RpA79BraEn
	rg1f/okyzP61CxbjDTLq/xhLmzUiVnZadEdBexuhIlLgpSrTqTycSyIlsgagDpWthYUffoefSP3
	WrNZGIyRk2ZUqzfcH0SGocOxA9Artd+mWi
X-Received: by 2002:a17:90b:1d0c:b0:3b0:d77f:9e7 with SMTP id 98e67ed59e1d1-3b182e6f80fmr1374365a91.18.1794377214226;
        Tue, 10 Nov 2026 22:06:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db8f408sm1291183a91.8.2026.11.10.22.06.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:06:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c8a517107so79970276d6.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377213; x=1794982013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
        b=afl0W/rzjWlz+c2xgA9hRbkVoqcBLOAmdHIvxc2/D/DvKLgw532K3uTnddu27YGZ+8
         Ph6EYQiExyvr5L4w+6I6/qxgG6hHQzQhG0f4ZzY04QFHtv5aH/dQXEZ1HoshJX5ctzkX
         uT1YNDi1MZxpPJy6/ab0yCj0dtBhMYRxRPDV0=
X-Forwarded-Encrypted: i=1; AL+hErFL2TRz05kX3UsYGqTnqPVerZf2WsI7e03x1xLEOpu4dHHOhYnoib01qFvqVBVFFsjspIhmhvCLFXg=@vger.kernel.org
X-Received: by 2002:a05:620a:1a1f:b0:947:a095:8ddc with SMTP id af79cd13be357-947affd48f1mr206174085a.39.1794376814057;
        Tue, 10 Nov 2026 22:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:947:a095:8ddc with SMTP id af79cd13be357-947affd48f1mr206165485a.39.1794376813367;
        Tue, 10 Nov 2026 22:00:13 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
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
Subject: [PATCH v3 03/12] KVM: x86: Encapsulate VMware backdoor checks
Date: Wed, 11 Nov 2026 00:59:52 -0500
Message-ID: <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
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

Add kvm_is_vmware_backdoor_enabled(), kvm_is_vmware_io_port(),
kvm_is_vmware_backdoor_pmc() and kvm_is_vmware_backdoor_opcode(), and
use them instead of checking enable_vmware_backdoor and the VMware port
and pseudo-PMC numbers directly.  Make the module parameter and the
pseudo-PMC numbers private to vmware.c, and take the backdoor port
numbers from <asm/vmware.h> instead of keeping a second copy.

The next patches make the backdoor a per-VM setting.  With every caller
asking whether a vCPU accepts a VMware interface, instead of reading a
global, that change stays inside vmware.c.

Check the enabled state inside the port and pseudo-PMC predicates, so
that no caller can treat a port or PMC index as VMware's for a VM that
hasn't enabled the backdoor.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/emulate.c |  5 +--
 arch/x86/kvm/pmu.c     |  6 +--
 arch/x86/kvm/svm/svm.c |  6 +--
 arch/x86/kvm/vmware.c  | 92 +++++++++++++++++++++++++-----------------
 arch/x86/kvm/vmware.h  | 19 +++------
 arch/x86/kvm/vmx/vmx.c |  4 +-
 arch/x86/kvm/x86.c     |  2 +-
 7 files changed, 72 insertions(+), 62 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index a7bcde6f0359..da626bed93c5 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -2539,8 +2539,7 @@ static bool emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
 	 * VMware allows access to these ports even if denied
 	 * by TSS I/O permission bitmap. Mimic behavior.
 	 */
-	if (enable_vmware_backdoor &&
-	    ((port == VMWARE_PORT_VMPORT) || (port == VMWARE_PORT_VMRPC)))
+	if (kvm_is_vmware_io_port(ctxt->vcpu, port))
 		return true;
 
 	ops->get_segment(ctxt, &tr, &tr_seg, &base3, VCPU_SREG_TR);
@@ -3908,7 +3907,7 @@ static int check_rdpmc(struct x86_emulate_ctxt *ctxt)
 	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
 	 * in Ring3 when CR4.PCE=0.
 	 */
-	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(rcx))
+	if (kvm_is_vmware_backdoor_pmc(ctxt->vcpu, rcx))
 		return X86EMUL_CONTINUE;
 
 	/*
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index ae7000c44677..dacd40ca8620 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -726,8 +726,8 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	if (!pmu->version)
 		return 1;
 
-	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(idx))
-		return kvm_pmu_rdpmc_vmware(vcpu, idx, data);
+	if (kvm_is_vmware_backdoor_pmc(vcpu, idx))
+		return kvm_vmware_pmu_rdpmc(vcpu, idx, data);
 
 	pmc = kvm_pmu_call(rdpmc_ecx_to_pmc)(vcpu, idx, &mask);
 	if (!pmc)
@@ -773,7 +773,7 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
 	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
 	 * in Ring3 when CR4.PCE=0.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		return true;
 
 	return kvm_need_any_pmc_intercept(vcpu) ||
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 980841d153f3..a2196d8f60aa 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -237,7 +237,7 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 
 			svm_leave_nested(vcpu);
 			/* #GP intercept is still needed for vmware backdoor */
-			if (!enable_vmware_backdoor)
+			if (!kvm_is_vmware_backdoor_enabled(vcpu))
 				clr_exception_intercept(svm, GP_VECTOR);
 
 			/*
@@ -1159,7 +1159,7 @@ static void init_vmcb(struct kvm_vcpu *vcpu, bool init_event)
 	 * We intercept those #GP and allow access to them anyway
 	 * as VMware does.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		set_exception_intercept(svm, GP_VECTOR);
 
 	svm_set_intercept(svm, INTERCEPT_INTR);
@@ -2410,7 +2410,7 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 	 * VMware backdoor emulation on #GP interception only handles
 	 * IN{S}, OUT{S}, and RDPMC, and only for L1.
 	 */
-	if (!enable_vmware_backdoor || is_guest_mode(vcpu))
+	if (!kvm_is_vmware_backdoor_enabled(vcpu) || is_guest_mode(vcpu))
 		goto reinject;
 
 	return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
diff --git a/arch/x86/kvm/vmware.c b/arch/x86/kvm/vmware.c
index 772f295f8ff5..e1062144b750 100644
--- a/arch/x86/kvm/vmware.c
+++ b/arch/x86/kvm/vmware.c
@@ -8,15 +8,35 @@
 
 #include <linux/moduleparam.h>
 
-#include "kvm_emulate.h"
+#include <asm/vmware.h>
+
 #include "vmware.h"
 
-bool __read_mostly enable_vmware_backdoor;
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_vmware_backdoor);
+static bool __read_mostly enable_vmware_backdoor;
 module_param(enable_vmware_backdoor, bool, 0444);
 
-bool is_vmware_backdoor_pmc(u32 pmc_idx)
+#define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
+#define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
+#define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
+
+bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
 {
+	return enable_vmware_backdoor;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_is_vmware_backdoor_enabled);
+
+bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
+{
+	return kvm_is_vmware_backdoor_enabled(vcpu) &&
+	       (port == VMWARE_HYPERVISOR_PORT ||
+		port == VMWARE_HYPERVISOR_PORT_HB);
+}
+
+bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx)
+{
+	if (!kvm_is_vmware_backdoor_enabled(vcpu))
+		return false;
+
 	switch (pmc_idx) {
 	case VMWARE_BACKDOOR_PMC_HOST_TSC:
 	case VMWARE_BACKDOOR_PMC_REAL_TIME:
@@ -26,7 +46,38 @@ bool is_vmware_backdoor_pmc(u32 pmc_idx)
 	return false;
 }
 
-int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
+bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
+{
+	switch (opcode_len) {
+	case 1:
+		switch (opcode) {
+		case 0xe4:	/* IN */
+		case 0xe5:
+		case 0xec:
+		case 0xed:
+		case 0xe6:	/* OUT */
+		case 0xe7:
+		case 0xee:
+		case 0xef:
+		case 0x6c:	/* INS */
+		case 0x6d:
+		case 0x6e:	/* OUTS */
+		case 0x6f:
+			return true;
+		}
+		break;
+	case 2:
+		switch (opcode) {
+		case 0x33:	/* RDPMC */
+			return true;
+		}
+		break;
+	}
+
+	return false;
+}
+
+int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
 {
 	u64 ctr_val;
 
@@ -48,34 +99,3 @@ int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
 	*data = ctr_val;
 	return 0;
 }
-
-bool is_vmware_backdoor_opcode(struct x86_emulate_ctxt *ctxt)
-{
-	switch (ctxt->opcode_len) {
-	case 1:
-		switch (ctxt->b) {
-		case 0xe4:	/* IN */
-		case 0xe5:
-		case 0xec:
-		case 0xed:
-		case 0xe6:	/* OUT */
-		case 0xe7:
-		case 0xee:
-		case 0xef:
-		case 0x6c:	/* INS */
-		case 0x6d:
-		case 0x6e:	/* OUTS */
-		case 0x6f:
-			return true;
-		}
-		break;
-	case 2:
-		switch (ctxt->b) {
-		case 0x33:	/* RDPMC */
-			return true;
-		}
-		break;
-	}
-
-	return false;
-}
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index debabaff9654..bf250cc6e232 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -4,19 +4,10 @@
 
 #include <linux/kvm_host.h>
 
-struct x86_emulate_ctxt;
-
-#define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
-#define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
-#define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
-
-#define VMWARE_PORT_VMPORT	(0x5658)
-#define VMWARE_PORT_VMRPC	(0x5659)
-
-extern bool enable_vmware_backdoor;
-
-bool is_vmware_backdoor_pmc(u32 pmc_idx);
-int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
-bool is_vmware_backdoor_opcode(struct x86_emulate_ctxt *ctxt);
+bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu);
+bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
+bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
+bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
 
 #endif /* __KVM_X86_VMWARE_H */
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d407eecf1034..edcc5714cb6f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -918,7 +918,7 @@ void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu)
 	 * We intercept those #GP and allow access to them anyway
 	 * as VMware does.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		eb |= (1u << GP_VECTOR);
 	if ((vcpu->guest_debug &
 	     (KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP)) ==
@@ -5483,7 +5483,7 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 		error_code = vmcs_read32(VM_EXIT_INTR_ERROR_CODE);
 
 	if (!vmx->rmode.vm86_active && is_gp_fault(intr_info)) {
-		WARN_ON_ONCE(!enable_vmware_backdoor);
+		WARN_ON_ONCE(!kvm_is_vmware_backdoor_enabled(vcpu));
 
 		/*
 		 * VMware backdoor emulation on #GP interception only handles
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 389ae6213c85..0548e34bf634 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6402,7 +6402,7 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	}
 
 	if ((emulation_type & EMULTYPE_VMWARE_GP) &&
-	    !is_vmware_backdoor_opcode(ctxt)) {
+	    !kvm_is_vmware_backdoor_opcode(ctxt->opcode_len, ctxt->b)) {
 		kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
 		return 1;
 	}
-- 
2.53.0

