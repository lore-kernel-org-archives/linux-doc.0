Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FCD48C3F0;
	Fri, 15 May 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854000; cv=none; b=cklo0M90OCcxFypVdSJ+4gGols/YtQa/5ayOZmxgjFUew/0Ta41Z8pl3WIrUKfLCJQ1HeiU6GFIABk4QC8/szB9ikAEgpvk2+gMeYQwD3qOexs+lS9AMvB7nRQXSU8mDfXhn/da1D0YIyeG8BifYDgQwlfbC2ZtVqhun3ONzcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854000; c=relaxed/simple;
	bh=/X5vvNOKH2UKMw4tT6pijLDefuLZqv7SXoC571MH1NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOfwnFtuPoZR8ek7k4fbcs/k7A1Cg0q6FYSzi/usxyEVlNLCtJDGPRrnT6KmnKVChlP9g7ZguK1Lz2yWuAhmD1Bk3MCAnpArk5Swn48MUyBJWBdRxPGp10ge8v6799zVkmE7eDMhXK35xo0TxivnuajwMJ/08LZJUQym0b1QrhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fcjXZtSZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fcjXZtSZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5EC35A6;
	Fri, 15 May 2026 07:06:31 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51B793F836;
	Fri, 15 May 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778853997; bh=/X5vvNOKH2UKMw4tT6pijLDefuLZqv7SXoC571MH1NI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcjXZtSZl2ZNrGbX6+vWkP9u57+qjXoxb6pY1g1Os5S26m6y5WFJX35ZMh+e3QsT6
	 DvQImAJ+dn92pHdHv32vcq/1VtsSovXI1bemv6yNfKjeW9ii1j0yrtr3ktbKCJI3e7
	 Y1lrLT2iHh+AE7jLrjcl77GgBqKk6LLw+u2jMYPE=
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
	dave.martin@arm.com,
	Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <Ben.Horgan@arm.com>
Subject: [PATCH v3 3/3] fs/resctrl: Factor MBA parse-time conversion to be per-arch
Date: Fri, 15 May 2026 15:06:12 +0100
Message-ID: <20260515140612.1205251-4-ben.horgan@arm.com>
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

From: Dave Martin <Dave.Martin@arm.com>

The control value parser for the MB resource currently coerces the
memory bandwidth percentage value from userspace to be an exact
multiple of the rdt_resource::resctrl_membw::bw_gran parameter.

On MPAM systems, this results in somewhat worse-than-worst-case
rounding, since the bandwidth granularity advertised to resctrl by the
MPAM driver is in general only an approximation to the actual hardware
granularity on these systems, and the hardware bandwidth allocation
control value is not natively a percentage -- necessitating a further
conversion in the resctrl_arch_update_domains() path, regardless of the
conversion done at parse time.

For MPAM and x86 use their custom pre-prepared parse-time conversion,
resctrl_arch_preconvert_bw(). This will avoid accumulated error
from rounding the value twice on MPAM systems. For x86 systems there
is no functional change.

Clarify the documentation, but avoid overly exact promises.

Clamping to bw_min and bw_max still feels generic: leave it in the core
code, for now.

[ BH: Split out x86 specific changes ]
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 Documentation/filesystems/resctrl.rst | 17 +++++++++--------
 fs/resctrl/ctrlmondata.c              |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b003bed339fd..4322d8025453 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -236,12 +236,11 @@ with respect to allocation:
 		user can request.
 
 "bandwidth_gran":
-		The granularity in which the memory bandwidth
-		percentage is allocated. The allocated
-		b/w percentage is rounded off to the next
-		control step available on the hardware. The
-		available bandwidth control steps are:
-		min_bandwidth + N * bandwidth_gran.
+		The approximate granularity in which the memory bandwidth
+		percentage is allocated. The allocated bandwidth percentage
+		is rounded up to the next control step available on the
+		hardware. The available hardware steps are no larger than
+		this value.
 
 "delay_linear":
 		Indicates if the delay scale is linear or
@@ -871,8 +870,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
 and can be looked up through "info/MB/min_bandwidth". The bandwidth
 granularity that is allocated is also dependent on the cpu model and can
 be looked up at "info/MB/bandwidth_gran". The available bandwidth
-control steps are: min_bw + N * bw_gran. Intermediate values are rounded
-to the next control step available on the hardware.
+control steps are, approximately, min_bw + N * bw_gran.  The steps may
+appear irregular due to rounding to an exact percentage: bw_gran is the
+maximum interval between the percentage values corresponding to any two
+adjacent steps in the hardware.
 
 The bandwidth throttling is a core specific mechanism on some of Intel
 SKUs. Using a high bandwidth and a low bandwidth setting on two threads
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 9a7dfc48cb2e..934e12f5d145 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -37,8 +37,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
 /*
  * Check whether MBA bandwidth percentage value is correct. The value is
  * checked against the minimum and max bandwidth values specified by the
- * hardware. The allocated bandwidth percentage is rounded to the next
- * control step available on the hardware.
+ * hardware. The allocated bandwidth percentage is converted as
+ * appropriate for consumption by the specific hardware driver.
  */
 static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
@@ -71,7 +71,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 		return false;
 	}
 
-	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
+	*data = resctrl_arch_preconvert_bw(bw, r);
 	return true;
 }
 
-- 
2.43.0

