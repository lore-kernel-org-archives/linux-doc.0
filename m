Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9085043148F;
	Mon,  6 Jul 2026 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354021; cv=none; b=lGKsrfMO4MCfutiYGyXRh/nTqRxaW3Qc39clLnsjoVKKGks96VPk56apQLBdLAhuX/O5qL5M1hIcfZrjxFgsMV6HbKV2ti61cZqaC15J+MxIuzcmYiELXmr1TVbgl/OFlQpA3vS5Gwl4TRKoVAZ7BAIX7aukiIpRtRU1kW4/KEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354021; c=relaxed/simple;
	bh=4g7Ytd0MPyjsSrvRjEeiYDsb2RtqJyQNg8z8cWlum9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVYF+mko5gpHVDON4PX/LoUmqT3486rcD0OgW//Wu44ZIAyuxSk6HINy3uqMbCA1dwunBYDlOFccb30XJeyKaC/MrC7q2e0SwSbJiLDwwNC5x1K3kZtQI1OL5cK2qgJTh3cwRKzLhKs+21iHcaOU6bKEQjpKViJbfoDH18upQgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bHVBBcng; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bHVBBcng"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B45271B;
	Mon,  6 Jul 2026 09:06:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FFCB3F905;
	Mon,  6 Jul 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783354018; bh=4g7Ytd0MPyjsSrvRjEeiYDsb2RtqJyQNg8z8cWlum9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHVBBcng+I847HGIjWG/fHvewidYFlUo7rtP9RuVVf2lk1z7U1KVOdZ06ifyQIYZa
	 e6X6rBt98Tsja8JZ2ugkqaDpwzHJjxdMjY3gG5QJ5rRmHhY7zBOcul5+27T2XlJ4kU
	 R0/zAlMn6egkmsjXTE1rLITBW3T/QRp+nfAZ1IrE=
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
Subject: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Mon,  6 Jul 2026 17:06:38 +0100
Message-ID: <20260706160639.2136674-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706160639.2136674-1-ben.horgan@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
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

Changes since v3:
Parameter order switch (Reinette)
Add Reinette's R-b
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

