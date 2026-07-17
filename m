Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEB93EE1C6;
	Fri, 17 Jul 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285316; cv=none; b=YMBlQuKdH0L2QRMuqdQS0cf0yBicliH1CWWWUByIrcUUzIltIoAhvUqYM7UqNH4F5gsWZmrbyQjC7/RsAemMFWZaom+9rfMQKWE3YV0i4FiOKnIq3+1uvdYmVaxr/zXshvsSqxlKqg1LujuR0lEYm0p+iM4HOlmhCW+El692YSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285316; c=relaxed/simple;
	bh=chWPSehmlJZgltcURJ8jpDXdqkFNEE2jEXjuTj8IlJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfNWx96ewr2G7BQveLwEoV7rt78HqFwd0ou2u4+fCcUiqwg7eY9/6xpuWnFqYPuEQtqk+Ni/j+zyU2jNoZsWi21ozu+OCv9K+BnioZjqm1zFB/JuveNq3t7ysh+BgOesQ0NRw6MezO9dcDmYVmqEEcudaFF6NrtCcJIBSYnhLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tGxXA+uw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tGxXA+uw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A817A1476;
	Fri, 17 Jul 2026 03:48:27 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A223F7D8;
	Fri, 17 Jul 2026 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784285311; bh=chWPSehmlJZgltcURJ8jpDXdqkFNEE2jEXjuTj8IlJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tGxXA+uwTwe+5IAPkv+RgC+rlgm1nBtbXuXBFFCmD9qJF9O7rphbetW8TsZwVMROT
	 LNGYwVotfKxroDH7XHuriM0/UUIF5adE4tH8Tq6oQHVJCrTj5zQn9kpfNFqQSnFHaQ
	 Zo3YmzS2jq5lBf267YwscGarVCu0P8UiQSuvhq24=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v1 6/8] misc/arm-cla: Set up memory translation context
Date: Fri, 17 Jul 2026 11:47:50 +0100
Message-ID: <20260717104759.123203-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717104759.123203-1-ryan.roberts@arm.com>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLA accelerators use a Memory Translation Context to describe the
page-table and memory-system configuration used for DMA through the CPU
MMU. Set up the kernel-owned MTC during CLA bringup so later context
switches only need to replace the user TTBR0 value.

Populate the MTC from the CPU EL1 configuration, including SCTLR, MAIR,
TCR and TCR2 where present. Configure the accelerator to run as EL0, put
the ASID in TTBR0 and disable TTBR1 translations because the driver only
installs user contexts in the TTBR0 range. When running at EL2, also
program the host HCR state.

Add SETCTX and GETCTX launch helpers for MTC register access. Use the
first available accelerator ID for these operations, since the MTC is
shared by the CLA but the operation still requires a valid accelerator
ID.

Clear the MTC on CPU teardown, and add helpers to install and uninstall
a user translation context by updating TTBR0 with the process page
table, ASID and CnP state.

Co-developed-by: Jean-Philippe Brucker <jpb@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 drivers/misc/arm-cla/Makefile   |   1 +
 drivers/misc/arm-cla/arm-cla.h  |   9 +++
 drivers/misc/arm-cla/cla-init.c |  10 ++-
 drivers/misc/arm-cla/cla-mtc.c  | 139 ++++++++++++++++++++++++++++++++
 drivers/misc/arm-cla/cla-ops.c  |  52 ++++++++++++
 5 files changed, 209 insertions(+), 2 deletions(-)
 create mode 100644 drivers/misc/arm-cla/cla-mtc.c

diff --git a/drivers/misc/arm-cla/Makefile b/drivers/misc/arm-cla/Makefile
index c1b14155454d..df3ad7e4a1b4 100644
--- a/drivers/misc/arm-cla/Makefile
+++ b/drivers/misc/arm-cla/Makefile
@@ -2,6 +2,7 @@
 
 arm-cla-y := \
 	cla-init.o \
+	cla-mtc.o \
 	cla-ops.o \
 	cla-regs.o \
 	cla-topology.o
diff --git a/drivers/misc/arm-cla/arm-cla.h b/drivers/misc/arm-cla/arm-cla.h
index f1c6d509c3fe..ffdb82e5e09c 100644
--- a/drivers/misc/arm-cla/arm-cla.h
+++ b/drivers/misc/arm-cla/arm-cla.h
@@ -134,6 +134,10 @@ int cla_op_regread(struct cla_dev *dev, unsigned int accid, unsigned int regidx,
 		   size_t nregs, u64 *regs);
 int cla_op_regwrite(struct cla_dev *dev, unsigned int accid,
 		    unsigned int regidx, size_t nregs, u64 *regs);
+int cla_op_setctx(struct cla_dev *dev, unsigned int regidx, size_t nregs,
+		  u64 *regs);
+int cla_op_getctx(struct cla_dev *dev, unsigned int regidx, size_t nregs,
+		  u64 *regs);
 int cla_op_entersr(struct cla_dev *dev, unsigned int accid, u64 *srstate);
 int cla_op_exitsr(struct cla_dev *dev, unsigned int accid, u64 *srstate);
 
@@ -143,4 +147,9 @@ int cla_regs_switch_in(struct cla_dev *dev, struct cla_regs *regs);
 struct cla_regs **cla_regs_alloc_domain(struct cla_domain *domain);
 void cla_regs_free_domain(struct cla_domain *domain, struct cla_regs **regs);
 
+int cla_mtc_setup(struct cla_dev *dev);
+int cla_mtc_clear(struct cla_dev *dev);
+int cla_mtc_install(struct cla_dev *dev, pgd_t *pgd, unsigned long asid);
+int cla_mtc_uninstall(struct cla_dev *dev);
+
 #endif /* _ARM_CLA_H_ */
diff --git a/drivers/misc/arm-cla/cla-init.c b/drivers/misc/arm-cla/cla-init.c
index 189ab2a139f1..0451d97bc95b 100644
--- a/drivers/misc/arm-cla/cla-init.c
+++ b/drivers/misc/arm-cla/cla-init.c
@@ -155,7 +155,8 @@ static void cla_dev_reinit(struct cla_dev *dev)
 	if (broken)
 		return;
 
-	if (WARN_ON(cla_op_reset_all(dev))) {
+	if (WARN_ON(cla_op_reset_all(dev)) ||
+	    WARN_ON(cla_mtc_clear(dev))) {
 		mutex_lock(&dev->lock);
 		dev->broken = true;
 		mutex_unlock(&dev->lock);
@@ -217,9 +218,14 @@ static int cla_dev_setup(unsigned int cpu)
 
 	cla_reg_write(dev, CLA_REG_PL0CTRL, plxctrl_val);
 
-	if (dev->accelerators)
+	if (dev->accelerators) {
+		ret = cla_mtc_setup(dev);
+		if (ret)
+			goto err;
+
 		cla_info(dev, "available accelerators: 0x%02x\n",
 			 dev->accelerators);
+	}
 
 	return 0;
 err:
diff --git a/drivers/misc/arm-cla/cla-mtc.c b/drivers/misc/arm-cla/cla-mtc.c
new file mode 100644
index 000000000000..0f786d5061da
--- /dev/null
+++ b/drivers/misc/arm-cla/cla-mtc.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Arm CLA driver - memory translation context
+ *
+ * Copyright 2026 Arm Limited.
+ */
+
+#include <asm/kvm_arm.h>
+
+#include "arm-cla.h"
+
+#define cla_kernel_mtc \
+	(cla_kernel_pl == 2 ? CLA_MTC_REGIDX_PL2 : CLA_MTC_REGIDX_PL1)
+
+/**
+ * cla_mtc_setup - initialize the memory translation context
+ * @dev: CLA device
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int cla_mtc_setup(struct cla_dev *dev)
+{
+	int ret;
+	u64 tcr;
+	u64 regs[2 * CLA_MTC_PL_SIZE] = {};
+	u64 *kregs = &regs[cla_kernel_mtc];
+	size_t regs_size = cla_kernel_pl * CLA_MTC_PL_SIZE;
+	u64 reserved_ttbr = phys_to_ttbr(page_to_phys(ZERO_PAGE(0)));
+
+	/* The accelerator always runs as EL0 */
+	kregs[CLA_MTC_PSTATE] = FIELD_PREP(CLA_MTC_PSTATE_EL, 0) |
+				FIELD_PREP(CLA_MTC_PSTATE_PAN,
+					   system_uses_hw_pan());
+	kregs[CLA_MTC_TTBR0] = reserved_ttbr;
+	kregs[CLA_MTC_TTBR1] = reserved_ttbr;
+	kregs[CLA_MTC_SCTLR] = read_sysreg(sctlr_el1);
+	kregs[CLA_MTC_MAIR] = read_sysreg(mair_el1);
+
+	if (cpus_have_final_cap(ARM64_HAS_TCR2))
+		kregs[CLA_MTC_TCR2] = read_sysreg_s(SYS_TCR2_EL1);
+
+	tcr = read_sysreg(tcr_el1);
+	/*
+	 * Put ASID in TTBR0, so that we only have one reg to update when
+	 * switching context.
+	 */
+	FIELD_MODIFY(TCR_EL1_A1, &tcr, 0);
+	/*
+	 * We never map anything in the TTBR1 VA range so explicitly disable
+	 * translations via TTBR1.
+	 */
+	FIELD_MODIFY(TCR_EL1_EPD1_MASK, &tcr, 1);
+	kregs[CLA_MTC_TCR] = tcr;
+
+	if (cla_kernel_pl == 2) {
+		/* E2H and TGE */
+		regs[CLA_MTC_HCR_EL2] = HCR_HOST_VHE_FLAGS;
+	}
+
+	/*
+	 * All accelerators are idle, meaning there can't be any memory
+	 * transactions happening. So it is safe to setup the MTC in any order.
+	 * i.e. there is no issue with setting SCTLR.M=1 before we have
+	 * configured MAIR or TCR2.
+	 */
+	ret = cla_op_setctx(dev, CLA_MTC_REGIDX_PL1, regs_size, regs);
+	if (ret) {
+		WARN_ON(cla_mtc_clear(dev));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * cla_mtc_clear - clear the memory translation context
+ * @dev: CLA device
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int cla_mtc_clear(struct cla_dev *dev)
+{
+	/* Don't set the RES1 bit in VTCR_EL2 because in MTC they are RAZ/WI. */
+	u64 regs[2 * CLA_MTC_PL_SIZE] = {};
+	size_t regs_size = cla_kernel_pl * CLA_MTC_PL_SIZE;
+
+	/* SETCTX fails if there is no ACCID */
+	if (!dev->accelerators)
+		return 0;
+
+	/*
+	 * All accelerators are idle, meaning there can't be any memory
+	 * transactions happening. So it is safe to clear the MTC in any order.
+	 * i.e. there is no issue with clearing TTBRx before setting SCTLR.M=0.
+	 */
+	return cla_op_setctx(dev, CLA_MTC_REGIDX_PL1, regs_size, regs);
+}
+
+/**
+ * cla_mtc_install - enable a user translation context
+ * @dev: CLA device
+ * @pgd: page table to install
+ * @asid: ASID to use with the page table
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int cla_mtc_install(struct cla_dev *dev, pgd_t *pgd, unsigned long asid)
+{
+	u64 ttbr0;
+
+	/* SETCTX fails if there is no ACCID */
+	if (!dev->accelerators)
+		return 0;
+
+	ttbr0 = phys_to_ttbr(virt_to_phys(pgd)) |
+		FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
+
+	if (system_supports_cnp())
+		ttbr0 |= TTBRx_EL1_CnP;
+
+	return cla_op_setctx(dev, cla_kernel_mtc + CLA_MTC_TTBR0, 1, &ttbr0);
+}
+
+/**
+ * cla_mtc_uninstall - disable the user translation context
+ * @dev: CLA device
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int cla_mtc_uninstall(struct cla_dev *dev)
+{
+	u64 ttbr0 = phys_to_ttbr(page_to_phys(ZERO_PAGE(0)));
+
+	/* SETCTX fails if there is no ACCID */
+	if (!dev->accelerators)
+		return 0;
+
+	return cla_op_setctx(dev, cla_kernel_mtc + CLA_MTC_TTBR0, 1, &ttbr0);
+}
diff --git a/drivers/misc/arm-cla/cla-ops.c b/drivers/misc/arm-cla/cla-ops.c
index 7ddb973927e9..4d3f4f453e0b 100644
--- a/drivers/misc/arm-cla/cla-ops.c
+++ b/drivers/misc/arm-cla/cla-ops.c
@@ -180,6 +180,10 @@ static int cla_op_access_reg(struct cla_dev *dev, u8 op,
 	case CLA_LAUNCH_OP_REGWRITE:
 		max_regidx = 0x100000000;
 		break;
+	case CLA_LAUNCH_OP_SETCTX:
+	case CLA_LAUNCH_OP_GETCTX:
+		max_regidx = 0x80;
+		break;
 	default:
 		WARN_ON(1);
 		return -EINVAL;
@@ -246,6 +250,54 @@ int cla_op_regwrite(struct cla_dev *dev, unsigned int accid,
 				 accid, regidx, nregs, regs);
 }
 
+/**
+ * cla_op_setctx - launch SETCTX operation.
+ * @dev: CLA device.
+ * @regidx: first MTC register index.
+ * @nregs: number of registers to set. Can be greater than 8 (accessed with
+ *         multiple SETCTX operations).
+ * @regs: register content, array of length @nregs.
+ *
+ * Return: 0 on success, or an error.
+ */
+int cla_op_setctx(struct cla_dev *dev, unsigned int regidx, size_t nregs,
+		  u64 *regs)
+{
+	/*
+	 * Even though the MTC is shared between all accelerators, accid must be
+	 * valid. If no accelerator is attached, the op fails.
+	 */
+	if (!dev->accelerators)
+		return -ENODEV;
+
+	return cla_op_access_reg(dev, CLA_LAUNCH_OP_SETCTX, CLA_DATA_IN,
+				 __ffs(dev->accelerators), regidx, nregs, regs);
+}
+
+/**
+ * cla_op_getctx - launch GETCTX operation.
+ * @dev: CLA device.
+ * @regidx: first MTC register index.
+ * @nregs: number of registers to set. Can be greater than 8 (accessed with
+ *         multiple GETCTX operations).
+ * @regs: register content, array of length @nregs.
+ *
+ * Return: 0 on success, or an error.
+ */
+int cla_op_getctx(struct cla_dev *dev, unsigned int regidx, size_t nregs,
+		  u64 *regs)
+{
+	/*
+	 * Even though the MTC is shared between all accelerators, accid must be
+	 * valid. If no accelerator is attached, the op fails.
+	 */
+	if (!dev->accelerators)
+		return -ENODEV;
+
+	return cla_op_access_reg(dev, CLA_LAUNCH_OP_GETCTX, CLA_DATA_OUT,
+				 __ffs(dev->accelerators), regidx, nregs, regs);
+}
+
 /**
  * cla_op_entersr - launch ENTERSR operation.
  * @dev: CLA device.
-- 
2.43.0

