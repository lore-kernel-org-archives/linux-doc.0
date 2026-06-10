Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE74385D85;
	Wed, 10 Jun 2026 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077948; cv=none; b=nWLsUQs4oeMy6m9NPEtknqvuBPP6u1KHcu9NSlS3z66hop54shqWrcFueobKTJMcySm1wV0wZ/6pGtKcXCUkurzMjlqunPVDMt6hDaPH+BpByL9ThN2NmDUejFNfKPz0wzL+r3F8iyU7eJE6NeA9/+9bQpIB+nudotG8oyounb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077948; c=relaxed/simple;
	bh=theACnp7YRT1PazD6ob1nnXrzWhdZUA6D1SeJLCJY8k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FYuPH8oWmphYTPP9N/fIUAnNcPge3PWQ843pBKZgEhXVLBIst3sOte7volPt9RJdyMVDvxHHcR0nueyG/huKAU8jsQYJ13AxMlU1k3rDRtEOgDYmbDGAghrhwfQCIPTDmOnWd2vjZ3fX/qhuYuCDprrogc2TIWxyUDbdmFfc0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ukJNKBbD; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ukJNKBbD"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yVn4qwgMjrPkAleC73oRCX8Q22/zQZPdCGnjlPSiigU=;
	b=ukJNKBbDTadA46loMmO9Y/SM25+i1LZZ193Hb9zzEn7QoZoVRWrJv89YoA2pnK+++ZRydEKW/
	Uy9BpycOIoIfmSfnSAMT/2e+AkQcdw0ZpNhwBAEee7sYgZxSPUEQZDEwpGAuolP946gerUoaMKa
	NpjIq3bnVCHFLXLLANCeElA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gZyTj3Mj1z12LCq;
	Wed, 10 Jun 2026 15:44:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 367B8203B1;
	Wed, 10 Jun 2026 15:52:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Jun
 2026 15:52:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<ruanjinjie@huawei.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <arnd@arndb.de>, <gshan@redhat.com>,
	<jic23@kernel.org>, <dietmar.eggemann@arm.com>, <sudeep.holla@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] arm64: acpi: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Wed, 10 Jun 2026 15:52:00 +0800
Message-ID: <20260610075202.3597031-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Fix NULL kobject warning in cpuhp_smt_enable().

Change in v4:
- Fix hot-unplug tearing as Sashiko AI code review pointed out
  by forcing unregistration.
- Update the arm64 hotplug doc.
- Update the commit message.

Jinjie Ruan (2):
  arm64: smp: Fix hot-unplug tearing by forcing unregistration
  cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()

 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++++++----------
 arch/arm64/kernel/acpi.c                 |  2 ++
 arch/arm64/kernel/smp.c                  | 28 ++++++++++++------------
 3 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.34.1

