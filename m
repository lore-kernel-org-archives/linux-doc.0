Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625B03F39DF;
	Thu,  9 Jul 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589492; cv=none; b=M3BE0QeoMH2X8b4o0DKKuJZWBiJuT/siXMKRNtxGYNTHbPg1g+up51e3jnVz89f6xys3bN2EOmwVkKlnGT9y3AAUkgx4lUJOemexf58ZNVeTuoMcZ5jS8s3t3i0GWpUxtv/KZ6YTMfQv/nxmZKus65gub07lOw0Npim/mL4Hc5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589492; c=relaxed/simple;
	bh=t5sgyOS/YMPlSIGlIhTDAXNQwL+40MNkrGLuFRaobww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7SmzRfOSGOKU8JZjI6KlPXMFiwf9WOmoCK7BDwrbrVaCfzKNlourHZjHXUEqQQ9ThEj8Mvu5SNW1S0kDUsZstU92vJ9mP3OzfAXvsSNPjcxM9+67KJn86/aQC46GcCAeDbWfxVEGw2sxC6h++lmYVyO8ocf9IasIe/3HdJyYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=siCOPqfq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="siCOPqfq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76C1B357B;
	Thu,  9 Jul 2026 02:31:25 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62C1D3F66F;
	Thu,  9 Jul 2026 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589489; bh=t5sgyOS/YMPlSIGlIhTDAXNQwL+40MNkrGLuFRaobww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=siCOPqfqR9IziKWBfmYeyUA+/SEsDILD/Z4jLSope+1LLCZPrSkoEK6th0TPqnipJ
	 CkFuclhzb0pVXHvtVkKd2xP6bC3Uty48y2lbqFaOrJoIpLW+Qw6mQEolUHbUZeo6fd
	 RW0JmOEjThSMKFv+hezh4Ag2JDhwGl1DxozgJ/zI=
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
Subject: [PATCH v5 3/3] fs/resctrl: Factor MBA parse-time conversion to be per-arch
Date: Thu,  9 Jul 2026 10:31:11 +0100
Message-ID: <20260709093111.367851-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709093111.367851-1-ben.horgan@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Martin <dave.martin@arm.com>

The control value parser for the MB resource currently coerces the memory
bandwidth percentage value from userspace to be an exact multiple of the
rdt_resource::resctrl_membw::bw_gran parameter.

On MPAM systems, this results in somewhat worse-than-worst-case rounding, since
the bandwidth granularity advertised to resctrl by the MPAM driver is in general
only an approximation to the actual hardware granularity on these systems, and
the hardware bandwidth allocation control value is not natively a percentage --
necessitating a further conversion in the resctrl_arch_update_domains() path,
regardless of the conversion done at parse time.

For MPAM and x86 use their custom pre-prepared parse-time conversion,
resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
the value twice on MPAM systems. For x86 systems there is no functional change.

Clarify the documentation, but avoid overly exact promises.

Clamping to bw_min and bw_max still feels generic: leave it in the core code,
for now.

[ BH: Split out x86 specific changes ]
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v3:
Parameter order swap (Reinette)
Reflow commit message to use 80 characters (Reinette)
Adjust comment line length (Reinette)
Add Reinette's R-b

Changes since v4:
Make Dave the author as he wrote the patch
---
 Documentation/filesystems/resctrl.rst | 17 +++++++++--------
 fs/resctrl/ctrlmondata.c              |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..e4448c20c72e 100644
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
@@ -881,8 +880,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
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
index 9a7dfc48cb2e..62c9c6b24d54 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -37,8 +37,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
 /*
  * Check whether MBA bandwidth percentage value is correct. The value is
  * checked against the minimum and max bandwidth values specified by the
- * hardware. The allocated bandwidth percentage is rounded to the next
- * control step available on the hardware.
+ * hardware. The allocated bandwidth percentage is converted as appropriate
+ * for consumption by the specific hardware driver.
  */
 static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
@@ -71,7 +71,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 		return false;
 	}
 
-	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
+	*data = resctrl_arch_preconvert_bw(r, bw);
 	return true;
 }
 
-- 
2.43.0

