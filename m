Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0BC378806;
	Tue,  3 Feb 2026 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155107; cv=none; b=AJkhVZAls97vindi/71CqysF7mQw3aTE/5ReXAZthz2YGGqBRinbPUu5/19bKRZ6LevKjGeL58JeKNBI/UKR+g+itJAIUouP8bUbHCCOaDb8sm/3MjeagoZ1StLECLnFm9GqnC8xfBZC7X33Jl2sWTBgJsyqcsiU4bFpzETMBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155107; c=relaxed/simple;
	bh=b6PYHQCNRLmQH1dWFd6u7mRrMrUAw/+nBEGDG7ovdIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlXs0UQccFaxuP0Z3OaMyEw7m/dLkiZR+Pnyq3OQGhdaiubATYZ9Shd3uwsYqxoj4fVrvlnZEYvB1MDhM5iYAOH1LaOjbjeYXs8PaYd2GjSKIRXURmQcb34Qdsib5YyGwNgxqLtfUvaN1yo3P5KHwC3ctxZaLzuvD5oFuLzHEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D69339;
	Tue,  3 Feb 2026 13:44:57 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB23E3F778;
	Tue,  3 Feb 2026 13:44:58 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v4 11/41] KVM: arm64: Force guest EL1 to use user-space's partid configuration
Date: Tue,  3 Feb 2026 21:43:12 +0000
Message-ID: <20260203214342.584712-12-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James Morse <james.morse@arm.com>

While we trap the guest's attempts to read/write the MPAM control
registers, the hardware continues to use them. Guest-EL0 uses KVM's
user-space's configuration, as the value is left in the register, and
guest-EL1 uses either the host kernel's configuration, or in the case of
VHE, the UNKNOWN reset value of MPAM1_EL1.

We want to force the guest-EL1 to use KVM's user-space's MPAM
configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
programmed the same and on VHE copy MPAM0_EL1 into the guest's
MPAM1_EL1. There is no need to restore as this is out of context once TGE
is set.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
Defer EL2 handling until next patch

Changes since v2:
Use mask (Oliver)
---
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index f28c6cf4fe1b..9fb8e6628611 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -183,6 +183,18 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
 }
 NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
 
+/*
+ * The _EL0 value was written by the host's context switch and belongs to the
+ * VMM. Copy this into the guest's _EL1 register.
+ */
+static inline void __mpam_guest_load(void)
+{
+	u64 mask = MPAM0_EL1_PARTID_D | MPAM0_EL1_PARTID_I | MPAM0_EL1_PMG_D | MPAM0_EL1_PMG_I;
+
+	if (system_supports_mpam())
+		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1) & mask, SYS_MPAM1);
+}
+
 /**
  * __vcpu_load_switch_sysregs - Load guest system registers to the physical CPU
  *
@@ -222,6 +234,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	 */
 	__sysreg32_restore_state(vcpu);
 	__sysreg_restore_user_state(guest_ctxt);
+	__mpam_guest_load();
 
 	if (unlikely(is_hyp_ctxt(vcpu))) {
 		__sysreg_restore_vel2_state(vcpu);
-- 
2.43.0

