Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1BB3F39C7;
	Thu,  9 Jul 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589489; cv=none; b=SnuYd+NlLUlKF6dTZtQECM1eW4mTC2qIbY9Iqx1/cJoM+C0+fuG5x0TAFvxJov4Lrnx2S8efImT9SrDqLnjvK+Cq16Rm0IAT4s8zkO3ln27DGnd03vOsgETpyhiBdTPJ1gFtdVbYfzr9Srmb6Egkgw8MIW9q3bWeDhFIPCDrImA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589489; c=relaxed/simple;
	bh=cpp/A+DZWQ2h7wV3fHsPCvRwuYk8Gl08eO0UIRdy47Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAYAH3QnR1O8WRrn/NgfaWZTQcKTc5IOD6RQKYidRgOeWSK2N7xLg5lcTc0QzjBBaZV7/yDtbtZz3Ufr7kcanoEmMwu4jA8HWmsnaVWU6xB9NR1dg+5q8iz1EMWs2zcdZ6m1vitCtVIvkzB9jlR6aYqGDUJs+Z1/uYOdsWXTpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hxtoqgcf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hxtoqgcf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD847357C;
	Thu,  9 Jul 2026 02:31:22 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6A63F915;
	Thu,  9 Jul 2026 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589487; bh=cpp/A+DZWQ2h7wV3fHsPCvRwuYk8Gl08eO0UIRdy47Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HxtoqgcfjnoiHTJcU9STSOTUu5d/hcsh4441q8eajVC89Y2DRmSJrXGQCqYrToY2O
	 ATu9lbfpBgIVF04HDx2DHvIYFMGdXdmKHldUNKVgMyIdtX8KZ56SqKMpMVlq8duv2+
	 qve4UEsKBk05NVa5DltD9rrGAIzhwRVwjl9APO8E=
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
Subject: [PATCH v5 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Thu,  9 Jul 2026 10:31:10 +0100
Message-ID: <20260709093111.367851-3-ben.horgan@arm.com>
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

resctrl rounds up the percentage value of the MBA based on the bw_gran. As
MPAM uses a binary fixed point fraction format for MBA rather than a
decimal percentage, this introduces rounding errors.

Without this additional rounding, if the user reads the value in an MB
schema and then writes it back to the schema, the value in hardware won't
change. However, with this additional rounding, this guarantee is broken
for systems with mbw_wd < 7.

resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
to specify the conversion resctrl does to the user-provided bandwidth
value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
conversion.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v3:
Parameter order switch (Reinette)
Add Reinette's R-b

Changes since v4:
Add missing tearoff divider, ---
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..e9dea8c40265 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -167,6 +167,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return val;
+}
+
 /**
  * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
  *
-- 
2.43.0

