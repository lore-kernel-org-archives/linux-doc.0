Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD765013AD
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024446; cv=none; b=CVXH46tTvcUVi9tKULmaPgNQf+rpe0PuicZfN0uq/SU04kWjgzvQGtt5iqm22mMEZ4X9oboRv3jj3zsm6tIjvrRfdbWefIJk+B2TX1qCfGiCK/6crPy4ZFbn6wuVzyYUTG+ac3C7JZ8rvckhCjzy8Rsr9fbfLABZtzkKBHjsmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024446; c=relaxed/simple;
	bh=jNIfPpRT/i6OQboSDr2k2xQIDCBYNf9ia74ZJdEkxT0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ai8nhIhxW3xsKJc4v/osKPDuWw8X49yv91vEESLd97C/W4fFbGbBXhlmeSreUrALQUHTiBiP5HIaXDwwXI6qipiSJifscauKKa2p2NE9IIDutYjI01hlqNphrOcyivBc0p3RhpgMJ0fdPdQEmXHB89wES0dxk9Pz+wSQIvkp4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kfLBWeo1; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kfLBWeo1"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so46114787b3.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 14:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1790024443; x=1790629243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LyT1gPJmowaA4BnBpSt/USFny02ugqagur5yRQ9/hu4=;
        b=kfLBWeo1Scq9Oll4170ybgCcld0Nntf4pPKHQsG4wo1bLf78eDhyEoYksRV5vHOzhI
         p/PmLJgMzwU+YLodtuXJR35EpEH/BTYPRpXROunLzTYf0NR/TPjF6OsKbGss2lG4q7TE
         injrjsC9tmKHnIRlsddMy2IcIRs25BJFvqzV6Yk9+pSthtMFldbLo48SRGQbzenrCrVC
         vxvWhgxWk7r4uLZeSU3n0gPZz9WEtc8AGcllkenTI4mkq4P3/9LudcHZM+OcOwpgDjvl
         3i64Qjjb+iQ7jqP9Vpi1S1Xb2d2lxl4k1FqhXIUiWbsvaGld22LdnexI45W57JwR4+w0
         kpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024443; x=1790629243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LyT1gPJmowaA4BnBpSt/USFny02ugqagur5yRQ9/hu4=;
        b=jQ4QeaJzepF6Gad6bz0iywEdTdjpSh0T5SYoV0vUkMlfcYzYM5aaMpHZw2/8tv9bMn
         7fQBGxKiWzvWd5tvrBhFFAjpR3FoMAVKgEWnvlK0OmY5hot4B5owjgTMwHP6xfw4uDeu
         OKc9tjWVNZ4A0DiDeZtj753XTv8CzDA+4kl8xOjIRV+SCqRmEh81EMBb3LVRU23tpuA8
         IR+4921sUYvvKP8LSuWHose7NmvMTuxiWuYAZX2AHC5m2JzAMUmcrjtdMgYn38XvNpNx
         L3PGBqyNjDg9S+ftIHekEuvaD8sr5I6FcL0KkFhHDCjCg7h69rm8mvtRwZYCyqpij8ni
         a9KQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5XDEn6ObbGSYEd8T75o3JUmce3ZFIP+ZQ1oMVmivtxiLcRUSiObUEm4dr8JDPch7lfuVNH6VEJOM=@vger.kernel.org
X-Gm-Message-State: AFuF++m7UWsVj/ye9o0+LxGEUeqUjZMtHxrNS4httrn8WRfKH/9IReX1
	eknGp65ihaRV12CmsQulo3dWsN1T14jAMJmNf7j3ROc6aSQuosHh+XYJA9ksuOpOBB0=
X-Gm-Gg: AYBFou09FSmbdOfeqKPRdXKXPOpaa8ZE6n9SVnwHmo3/TENfV+o0RGeQBQfuiNDV6MB
	QL69D8jWxYdvMrki4eHyai2ZWQbyCRkcAseJ1KCsZz3FUdevv2JjOdAMXCLCDrh316A4JRTk4PW
	DJRxb1baf/8BsdahDpABU8C6jDurxWFryvYAFg087H8sc4U3fm2X10Om3UZe/v1wQukJHYa3CFu
	efgBqr/xwBls8LajVtSmt2DlbOWmbDknqpnAZhwWvGp4qwtEq+Qu8M0+n4q3UrIz2paDekaeGdx
	3Cks75hLVsGQgtHf+3y/DXZt+phSCZuPnhFl4JCmRx340OyjSAl4l/pmhedHmvSW0DDIXFrzlPy
	Nwg/iNLGX6H7I9evVyhwR6zrLX0FACs69MAcjKmbKA8haq6ymscS0y0vk1E47nIL/MT/s/posUT
	WlyAjGMNTULwrq/Gv5OQ7whrSTjow5fOfkNS8KGRFuNQt6posqNYpScSEfOkAGSd7DBuOFL3L6m
	3HxSG9BPA2v/DO9s/8sYMyOkDIcWdKIGHlRQdqEGCMB9lUw5n4wKZUwF3PZ6iQSVGCbpTpu3fEP
	BwbBJ9v82iZ3rrA84f0=
X-Received: by 2002:a05:690c:6606:b0:85b:f1ba:b111 with SMTP id 00721157ae682-89735d833a0mr60441177b3.26.1790024441836;
        Mon, 21 Sep 2026 14:00:41 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a23c738bdfsm1445297b3.11.2026.09.21.14.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:00:41 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 40/46] KVM: SVM: Add Caretaker SVM assembly guest entry/exit routine
Date: Mon, 21 Sep 2026 17:00:28 -0400
Message-ID: <20260921210034.180424-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260921210034.180424-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
 <20260921210034.180424-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add arch/x86/kvm/svm/caretaker_vmenter.S and caretaker.h for standalone
AMD SVM VMRUN world switch on preserved physical cores.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kvm/svm/caretaker.h         | 63 +++++++++++++++++++
 arch/x86/kvm/svm/caretaker_vmenter.S | 91 ++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 arch/x86/kvm/svm/caretaker.h
 create mode 100644 arch/x86/kvm/svm/caretaker_vmenter.S

diff --git a/arch/x86/kvm/svm/caretaker.h b/arch/x86/kvm/svm/caretaker.h
new file mode 100644
index 000000000000..54a0673cb1ea
--- /dev/null
+++ b/arch/x86/kvm/svm/caretaker.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#ifndef __SVM_CARETAKER_H
+#define __SVM_CARETAKER_H
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+#include <linux/kvm_host.h>
+#include <linux/oncore.h>
+#include "svm.h"
+#endif
+
+#include "../caretaker.h"
+
+#define CSP_VMCB_OFFSET		0x1000
+#define CSP_HSAVE_PA_OFFSET	0x3000
+#define CSP_VMCB_PA_OFFSET	0x3010
+#define VMCB_RAX_OFFSET		0x5f8
+
+#ifndef __ASSEMBLY__
+
+struct caretaker_svm_page {
+	struct caretaker_x86_page common;
+
+	/* Page 1 (4KB): Preserved VMCB */
+	struct vmcb vmcb __aligned(PAGE_SIZE);
+
+	/* Page 2 (4KB): Preserved HSAVE area */
+	u8 hsave_area[PAGE_SIZE] __aligned(PAGE_SIZE);
+	u64 hsave_pa;
+	u64 orig_hsave_pa;
+	u64 vmcb_pa;
+	u64 orig_efer;
+
+	/* Preserved MSR and I/O permission bitmaps referenced by VMCB */
+	u8 msrpm[MSRPM_SIZE] __aligned(PAGE_SIZE);
+	u8 iopm[IOPM_SIZE] __aligned(PAGE_SIZE);
+} __aligned(PAGE_SIZE);
+
+static_assert(offsetof(struct caretaker_svm_page, vmcb) == CSP_VMCB_OFFSET);
+static_assert(offsetof(struct caretaker_svm_page, hsave_pa) == CSP_HSAVE_PA_OFFSET);
+static_assert(offsetof(struct caretaker_svm_page, vmcb_pa) == CSP_VMCB_PA_OFFSET);
+
+void svm_recalc_intercepts(struct kvm_vcpu *vcpu);
+
+#ifdef CONFIG_KVM_CARETAKER
+int svm_caretaker_enter(void *page);
+void svm_caretaker_decode_exit(void *page, struct kvm_caretaker_exit *exit);
+void svm_caretaker_register(void);
+void svm_caretaker_unregister(void);
+void svm_caretaker_init(struct kvm_vcpu *vcpu);
+#else
+static inline void svm_caretaker_register(void) {}
+static inline void svm_caretaker_unregister(void) {}
+static inline void svm_caretaker_init(struct kvm_vcpu *vcpu) {}
+#endif
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __SVM_CARETAKER_H */
diff --git a/arch/x86/kvm/svm/caretaker_vmenter.S b/arch/x86/kvm/svm/caretaker_vmenter.S
new file mode 100644
index 000000000000..e0276a34403e
--- /dev/null
+++ b/arch/x86/kvm/svm/caretaker_vmenter.S
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#include <linux/linkage.h>
+#include <linux/cfi_types.h>
+#include <asm/asm.h>
+#include <asm/bitsperlong.h>
+#include <asm/nospec-branch.h>
+#include "caretaker.h"
+#include "../caretaker_asm.h"
+
+.section .text.cpu_preserved, "ax"
+
+/**
+ * svm_caretaker_enter - Low-level transition to SVM guest mode and back
+ * @csp: Pointer to struct caretaker_svm_page (%rdi)
+ */
+SYM_TYPED_FUNC_START(svm_caretaker_enter)
+	ENDBR
+	CARETAKER_PUSH_HOST_REGS
+	movq %cr3, %rax
+	pushq %rax                  /* saved_cr3 */
+
+	clgi
+	sti
+
+	/* 0. Save host VMCB state (FS, GS, TR, LDTR) to host save area */
+	movq CXP_HSAVE_PA(%rdi), %rax
+	testq %rax, %rax
+	jz 10f
+	vmsave %rax
+10:
+
+	/* 1. Sync guest RAX to VMCB and load guest state (FS, GS, TR, LDTR) */
+	leaq CSP_VMCB_OFFSET(%rdi), %rax
+	movq CXP_REG_RAX(%rdi), %rbx
+	movq %rbx, VMCB_RAX_OFFSET(%rax)
+	movq CSP_VMCB_PA_OFFSET(%rdi), %rax
+	vmload %rax
+
+	/* 2. Restore guest GPRs */
+	CARETAKER_RESTORE_GPRS_NO_RAX %rdi
+
+	/* 3. Run guest */
+	pushq %rdi
+	movq CXP_REG_RDI(%rdi), %rdi
+	movq (%rsp), %rax
+	movq CSP_VMCB_PA_OFFSET(%rax), %rax
+	CARETAKER_CLEAR_CPU_BUFFERS
+	vmrun %rax
+	cli
+
+	/* 4. Guest exited: Save guest GPRs */
+	xchgq %rdi, (%rsp)          /* rdi = csp, stack = guest rdi */
+	popq CXP_REG_RDI(%rdi)
+
+	CARETAKER_SAVE_GPRS_NO_RAX %rdi
+
+	/* Stuff Return Stack Buffer to prevent guest RSB poisoning */
+	CARETAKER_FILL_RETURN_BUFFER %rax
+
+	/* 5. Save guest state to VMCB */
+	movq CSP_VMCB_PA_OFFSET(%rdi), %rax
+	vmsave %rax
+	leaq CSP_VMCB_OFFSET(%rdi), %rax
+	movq VMCB_RAX_OFFSET(%rax), %rbx      /* save.rax */
+	movq %rbx, CXP_REG_RAX(%rdi)
+
+	/* 5a. Restore host VMCB state (FS, GS, TR, LDTR) from HSAVE */
+	movq CXP_HSAVE_PA(%rdi), %rax
+	testq %rax, %rax
+	jz 40f
+	vmload %rax
+40:
+
+	/* 5b. Restore host CR3 if clobbered */
+	popq %rbx                   /* saved_cr3 */
+	movq %cr3, %rcx
+	cmpq %rbx, %rcx
+	je 50f
+	movq %rbx, %cr3
+50:
+	stgi
+
+	/* 6. Restore host callee-saved registers & return to C */
+	CARETAKER_POP_HOST_REGS
+	xorq %rax, %rax
+	ret
+SYM_FUNC_END(svm_caretaker_enter)
-- 
2.55.0.1082.g2b9226bbc0-goog

