Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88261411FA6
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811663; cv=none; b=OPX/fjSCo20j5853thvACpc4ANimEWQ4X15E+PeIZdfhaKnrE7G3g5+uGIUu3nepzCbkuav2A2RdDYC9sOlhsnFxNbBZ4DQSHba2MA1aoioTrEsVzNvkt6xudlA3jqNm+yQGaF3LgD/thTR5KHXHTCNDPPEyLgjeyghur+VnZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811663; c=relaxed/simple;
	bh=QkLpYv8KH0MOp6Q77EfpRY1TXzOuzuXrpiC5qfZcK2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KzeTNsVHHm/Xrj8eRpy2XlgB6PIE+kN+OQI4/Ero+W6KJdkDD/n37riKxuuVuSPiL8pZvSsNghlX2fuGZuCzeuIER3DqM2xUCDC5Ilt44Zc1v9TQlMDoApq9ZduqCCEtbHRwOkh/y1dUEvD3DLAy4g5bgQc10tcDrZm4R7ukqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW61HPaT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW61HPaT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso4211936b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811661; x=1786416461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4kZP+sF/QMfPPiLTmI8ScpIheCw+l8Hd9ySn9On/vg=;
        b=eW61HPaTyURwXaDjC6fGbgrP8Zjuu/5acZgJiqzpbeTyy0dSamJ3e14AEPDpFzINa5
         K6AIA34NrbzHbzgn+7nHd49aclJFrK7nXDAx+TYj28aWJa+jwXM9EznjQ/kLxDdjWpuX
         OgPcsTTDJAE8JlwYVIsM8m9v0pyx9Gvhv2ibWlLgdZ6ObyFLXoPjQ16qQ9nxzPAvavdj
         s3w/wpAA0cbVEiRUWHWjS4ayeLZ+lB3NfNzXE0xefELZJNDf8HI43pM+UfzJ5hJ1pSy8
         grXhKHsIsVVn4oVu3N/Hm+mNUU43zM1q0TniBOf4/WmuTRXJupXqKIElh5h86/n9S+oI
         p5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811661; x=1786416461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4kZP+sF/QMfPPiLTmI8ScpIheCw+l8Hd9ySn9On/vg=;
        b=OrZA58TDZiWFSb97ccPSFkcPfw65Z5n8PrIO1kQPoqHxL/cbN7La2fz33vLE82u6dc
         Ye4ccobLCNGpjJ69wQPVm2N2CaPnjYQ42UV1wsSDJvj3M4uoLU1L9uD6jbDzTnrA9S9k
         3WsdU0kUViy8EP8yK1jboHCkUdimeItwVeJpznqxDBUqfdu2oUncnj5WBYP0mge9iVIc
         5n6+u1eigHFYMHb8ByrIPli49mdEKTTbqlf2sFgnD4w8hlC+2VcQSEIg37ClLPAzmR5R
         AAd0ZzNu5d2rV+GZAosAAp/w19+W8JRpSXGX2une3XBt8VrhH3mDC17LPdLZxEQAUwAs
         y3cQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRUoJnjriGl77hu5Fh94FazEvVlyA0RpAzNlzc5s+nJEHHsk4XDcKX1aBAWq+aL5ynz1a2cF7hQtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDnDnGZgnxc3mo9X+6sjCfaPRhtYZAtygUorawYwotaFCZ22M
	iKPUhPaNwaLFo4xZhct5X+vUyayOd6VYs1mKpfEVuwmgq83wEk7rCHlr
X-Gm-Gg: AR+sD12aPyu8RicYbKX1lrM3pfMvqG311S2ATQe2ctWm8DMY7Yc5aOeohygO+LmuOlv
	0rMF5BtGq1JV3r1tYhz89vULs6gpijE6RKUNfsLOoG2OfBck6NoQueIRdexFRJDY6acUCJ/Xbcp
	aPogAXQqYBmc1+C8Urpdi14mvs1/HDv8WJuLxkuA/fHETB0EOWAhFJ6qaCAZSMvxp9TITJLHeFX
	RCKWIZS+bc3SFrMpNqhLYsSPlAsyFlqBKV6qd0qYAUnGvdPOHUFx0ticik7zoWfoFyhBq0KkOZn
	nH74nT3gNYJ36D0EQly7Khjuv86A7QsIDkaDVjp6O09vfiOX1CY3CA2jKW5CzaZfHmV98YJFMqi
	Vuu9ONifIR5j0AGXgRxIpWXEC9RDjHqvMgoKa2CSu+b/VCwA6xkjHYuO5/8pWAJUIgYKVkbBxSh
	w7nFNFP95Lp5RsD+WM9RWnc6wMN8MSgJzoBfxI0jErLnzaaKYFsUyhZOzYYkm9oTk5OrhtBguF8
	REMfyg=
X-Received: by 2002:a05:6a00:330a:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84ee47c1e51mr11869884b3a.16.1785811660618;
        Mon, 03 Aug 2026 19:47:40 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84eecf81b08sm3240286b3a.22.2026.08.03.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:47:40 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Tue,  4 Aug 2026 10:47:07 +0800
Message-Id: <20260804024707.2400404-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kernel command-line option, kvm-riscv.wfi_trap_policy=trap|auto,
that controls whether a WFI executed by a VS-mode guest traps into KVM
(HS-mode) or executes natively.

HSTATUS.VTW governs VS-mode WFI: when set, the WFI traps into KVM, which
blocks the vCPU through kvm_vcpu_halt() and releases the CPU to other
runnable tasks; when clear, the guest runs WFI natively. Because RISC-V
WFI is only a hint (it may be a no-op on some implementations), the
policy is re-evaluated each time a vCPU is loaded rather than fixed once
at reset.

  trap  : always trap VS-mode WFI into KVM (HSTATUS.VTW=1). This is the
          default and preserves the previous unconditional behavior.

  auto  : clear HSTATUS.VTW so the guest runs WFI natively only when the
          vCPU is the sole runnable task on the current CPU; otherwise
          keep trapping. When the vCPU is alone, skipping the
          virtual-instruction exit cannot starve another task, and on
          hardware that honors WFI the hart blocks until a VS-mode
          interrupt. As soon as another task becomes runnable, the
          policy traps again so that KVM blocks the vCPU and yields the
          CPU to it. The vCPU therefore never monopolizes the CPU the
          way an unconditional native WFI would: it either blocks
          through kvm_vcpu_halt(), or runs WFI natively only when no
          other task needs the CPU.

Measured on QEMU TCG (-smp 1, -cpu max): wfi_exit_stat delta and guest
wake count over a 3 s window. "busy" adds a CPU-bound competitor that
shares the vCPU's CPU so that single_task_running() reports false:

  policy  busy  exits  wakes   cpu%  note
  ------  ----  -----  -----   ----  ------------------------
  trap    off    286    285    6.5   default; no regression
  trap    on     291    290  101.0   trap is unconditional
  auto    off      4    287    5.0   sole task: native WFI
  auto    on     285    284  101.5   competitor -> traps

With "auto", WFI exits drop to ~0 when the vCPU is the only runnable
task, and rise back to the trap level as soon as a competitor appears,
which is the desired dynamic behavior. Host CPU stays low in the
sole-task case; the ~101% in the busy cases is the forked competitor,
not the vCPU.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.Chen <yhchen312@gmail.com>

---
Changes in v2:

- Drop the "notrap" mode, which cleared HSTATUS.VTW unconditionally and
  so never trapped: the vCPU never reached kvm_vcpu_halt() and could
  stay busy even while idle.
- Add the "auto" mode, which clears HSTATUS.VTW only when the vCPU is
  the sole runnable task (single_task_running()) and otherwise traps.
  The policy is applied dynamically from kvm_arch_vcpu_load() instead of
  once at reset, so a vCPU that stops being the sole runnable task
  switches back to trapping.
- Update the kernel-parameters.txt entry for trap/auto.

v1: https://lore.kernel.org/all/20260709115610.287420-1-yhchen312@gmail.com/
---
 .../admin-guide/kernel-parameters.txt         | 16 +++++
 arch/riscv/kvm/vcpu.c                         | 59 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..29fc824b5ce2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3254,6 +3254,22 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-riscv.wfi_trap_policy=
+			[KVM,RISCV] Control when to set the WFI instruction
+			trap (HSTATUS.VTW) for KVM VMs. The policy is
+			re-evaluated each time a vCPU is loaded, not only at
+			reset, since RISC-V WFI is only a hint.
+
+			trap: always trap VS-mode WFI into KVM (HSTATUS.VTW=1)
+
+			auto: trap unless the vCPU is the only runnable task on
+				the current CPU, in which case clear the trap
+				(HSTATUS.VTW=0) and let the guest execute WFI
+				natively
+
+			Defaults to trap, preserving the previous unconditional
+			behavior.
+
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..e9251f81a4f8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -12,8 +12,10 @@
 #include <linux/kdebug.h>
 #include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/stat.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
@@ -26,6 +28,59 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+/*
+ * WFI trap policy for VS-mode guests, controllable through the
+ * kvm-riscv.wfi_trap_policy= kernel command-line option.
+ */
+enum kvm_riscv_wfi_trap_policy {
+	KVM_RISCV_WFI_TRAP,	/* Always trap VS-mode WFI into KVM */
+	KVM_RISCV_WFI_AUTO,	/* Trap unless the vCPU is the only runnable task */
+};
+
+static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_mostly =
+	KVM_RISCV_WFI_TRAP;
+
+static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "trap") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_TRAP;
+		return 0;
+	}
+
+	if (strcmp(arg, "auto") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_AUTO;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
+
+static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
+{
+	switch (kvm_riscv_wfi_trap_policy) {
+	case KVM_RISCV_WFI_AUTO:
+		/* Native WFI only when the vCPU is the sole runnable task. */
+		return !single_task_running();
+	case KVM_RISCV_WFI_TRAP:
+	default:
+		return true;
+	}
+}
+
+static void kvm_riscv_vcpu_update_wfi_trap(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
+		cntx->hstatus |= HSTATUS_VTW;
+	else
+		cntx->hstatus &= ~HSTATUS_VTW;
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -73,6 +128,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
 	cntx->sstatus = SR_SPP | SR_SPIE;
 
+	/* Trap VS-mode WFI by default; kvm_arch_vcpu_load() reapplies the policy. */
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
@@ -609,6 +665,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
+	/* Re-evaluate the WFI trap policy for this vCPU. */
+	kvm_riscv_vcpu_update_wfi_trap(vcpu);
+
 	vcpu->cpu = cpu;
 }
 
-- 
2.34.1

