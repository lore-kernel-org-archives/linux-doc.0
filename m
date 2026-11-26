Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686660;
	b=B3C++zICPY0L5adFzWJEPkJj+CZuiiDSMpy7a4Uk5JT5IT1byDg2puyu+T5hePFfNv8z
	 7L6O5fcEIbx1Jw5HqFUeEl5Ze+rrFP5XXkjwAgCJfj7gNpIUwH2dv+DoqkIQO2hmjwqjB
	 /4wrImuJCyHBs2AO5SdGYjSqnhUAduL25GD6MrNC8b+krlXSibWpMIcMDmSJLESoDaDJB
	 0+UZmSkTaLarO/zgvVGX0OiYMnUYi9jJ4qeXrkikHmwL+sv1MPYjDTpK2gjUIPFrgIG8Q
	 cQDam3M4JqpyWnmhjJAR/i7ubOWkov3JbuFFBBM6q0dExhRo3AD/cGuU1bEZsteBWnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686660;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=OfGIMFPbEIOhVlzsEKFMd8J0jazEV4moYLOclBRofyw=;
	b=LywN5pRbFUqKMa0lQkz9pd8vqMEMkGFICMNwe/kbDTpn4vkqcXKGZgSO9CxCC1X6va1u
	 tbJGpf0SJ/BsxwnvlOzri6y8UeB2umR5UGFr/DFTIt5rfeAQlGjy4bBlkKJNkIYI8xwid
	 HTofMUijJNPxhffJ+BQwGVcpHuuZ55HpT16nGGZx162MADFIKZVhWzg4KVjIgtnQdbmO6
	 PvpxIVrhgz2Br4IGs2q88hhgL6mWkz9E28RnfOEmOASwci2rYOHiLvdvd4WDXwiXjQvqm
	 nwr3MHIJ5FlIaWESj/ExZrX9whfsXTGQq0ia/dxJs3hiIfelgP6zmdQKaztbkEFEdZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=NQi+ZE2l;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42FE606A32D;
	Thu, 26 Nov 2026 09:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42FE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=NQi+ZE2l
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OfGIMFPbEIOhVlzsEKFMd8J0jazEV4moYLOclBRofyw=;
	b=NQi+ZE2l4Gd6z18gmGrojnC4e22teB9oqorOQmVp3cPgf/99GcaszrkRvWQOWIUSBqBrXB1rx
	bIRC+ksOYN/5I7QOFkSv27RbbqDM+lFmppV9YQILmY8YcF8ygE8aIN95QEk/ocmSl5mKA/YXchR
	z5qKYEweCmEO+6b7RVG7xlw=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jZsHD13Bhz1K9W8;
	Thu, 26 Nov 2026 17:50:32 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B7AF04056C;
	Thu, 26 Nov 2026 17:50:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 17:50:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <will@kernel.org>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 3/6] fs/resctrl: Clear the CDP state after the cleanup
Date: Thu, 26 Nov 2026 17:50:35 +0800
Message-ID: <20261126095038.2276975-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126095038.2276975-1-ruanjinjie@huawei.com>
References: <20261126095038.2276975-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

To support CDP, resctrl halves the number of CLOSIDs available to
resource groups and gives each remaining CLOSID two hardware
configurations instead of one, distinguished by index: 2 * CLOSID for
data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
configuration, at index CLOSID. Every architecture computes these
indices the same way.

Unmounting clears the CDP state before it undoes what the groups were
given, so the cleanup computes index CLOSID where the group was set up
with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
left in place and index CLOSID is cleared instead, which with CDP
enabled is a configuration of a different CLOSID.

Only MPAM can reach this today. Of everything the cleanup has to undo,
MPAM addresses only the MBM counter assignment by the translated CLOSID,
and it only began doing so when it implemented assignable counters. x86
addresses its counters by RMID alone.

Nothing visible goes wrong. resctrl keeps its own record of the counter
assignments, discards it on unmount and only reads a counter it has
assigned, and each new assignment overwrites the architecture's mapping.
The architecture is still left holding assignments that resctrl no
longer knows about.

Clear the CDP state after the cleanup, so that the cleanup runs with the
CDP state the groups were set up under.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v7:
- State that the stale assignments have no visible effect (Ben).
- Drop the stable tag, as nothing visible goes wrong.
v6:
- Describe the CDP indices as resctrl filesystem behavior that applies
  to every architecture, and the flow instead of the code (Reinette).
- Drop the stable version range, the Fixes tag already gives it.
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.34.1

