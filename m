Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A26321771B;
	Fri, 15 May 2026 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853994; cv=none; b=VLFm+wl0ZgpHiUHmThGsud5OC3R+PBgAMgK/wxMF4/AkYp9o9owdnWKtQS4Qog7DMR/VxqTFk/i/zuNH6anRIVfbO1hf0GCg5Ja5xuLhftrpSNAshwJ+6ptu7g4u3kTx7c8jL17v3LFQDsBVA1v+woeRmhrE8bclfNUQyYhMdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853994; c=relaxed/simple;
	bh=e6XqPjBOPomAbfisL/+ctCwr9bdhsFJi1zOUo3qkhng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azJmwRIaZsZ8+Q0QMUDa8krZdUutyIpP+M2MymYjA5rgCQJofOoFrVs+8/7MaFfWNI1fExGjsI6SuS9BNKTw1XIKLg8s2/b3x/i9jeVj0vFNBfB2Ts2syk+NW/Ta0GNvR8EWhCWHFlQYO6o/0+Pg/1Yh9YTSfnVLiK/Gj208eIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OoagTEX+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OoagTEX+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04C80292B;
	Fri, 15 May 2026 07:06:24 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E17113F836;
	Fri, 15 May 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778853989; bh=e6XqPjBOPomAbfisL/+ctCwr9bdhsFJi1zOUo3qkhng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoagTEX+AseQAiSScCHwyUzrsZbGngbYyQF2kgXhHCwLUjtsNk1Xdzxso0oF2jdXB
	 jmNSDzN+JzP911AzTaQHsMDgbPe6jpK5fGjrx/RATZhY6hHF+YTL+o6henpd6lmkqj
	 o5uXuo+OnhUpoW0f+3UvxpaqeTFezRvwADUiPjlI=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v3 1/3] x86/resctrl: Add resctrl_arch_preconvert_bw()
Date: Fri, 15 May 2026 15:06:10 +0100
Message-ID: <20260515140612.1205251-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515140612.1205251-1-ben.horgan@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MPAM systems the rounding behaviour of the MBA control would be improved
if the rounding in the fs/resctrl code is removed but this is not the
case for x86. To allow any rounding or conversion of the bandwidth value
provided by the user to be specified by the arch code a new arch hook is
required.

Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
This is currently unused in resctrl but when plumbed in it will replace the
call to roundup() in bw_validate().

Signed-off-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since Dave's v2:
Split from larger patch and add commit message
Update kernel-doc (Reinette)
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index b20e705606b8..19ae596f6b30 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -16,9 +16,15 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cpu.h>
+#include <linux/math.h>
 
 #include "internal.h"
 
+u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r)
+{
+	return roundup(val, (unsigned long)r->membw.bw_gran);
+}
+
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 006e57fd7ca5..33a6742da4f9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -500,6 +500,25 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
  */
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 
+/**
+ * resctrl_arch_preconvert_bw() - Prepare bandwidth control value for arch use.
+ * @val:	Bandwidth control value written to the schemata file by userspace.
+ * @r:		Resource whose schema was written.
+ *
+ * Convert the user provided bandwidth control value to an appropriate form for
+ * consumption by the hardware driver for resource @r. Converted value is stored
+ * in rdt_ctrl_domain::staged_config[] for later consumption by
+ * resctrl_arch_update_domains(). Is not called when MBA software controller is
+ * enabled.
+ *
+ * Architectures for which this pre-conversion hook is not useful should supply
+ * an implementation of this function that just returns val unmodified.
+ *
+ * Return:
+ * The converted value.
+ */
+u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.43.0

