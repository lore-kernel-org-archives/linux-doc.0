Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686656;
	b=zr6Chnbz3GV41wo5ZW3cQFNF7Qe0KRU9KVFfpdwn4YKHE/q1cnNgSztzHuMVceTJo/Gs
	 5DZnOee4sBfDjZdUIF4zej3wf3xYFAnqMMHwWJE6W0ylZ+EXCrqUsgoePH2yrWZyJ6K+c
	 ENlgl2cwE2K8tluDuJorkSE/DYN3zzj/AoD3D8kFKcBjL2TMh/PJjKnza4hd38AjDnwyA
	 vCODvWg4NooLYSn77VUyztVA/vu2Rke8hmv0G1KSA1dOwvUo0IxXbEMkK7Ua4FVythLKG
	 D4gJDSpQHah1r1+xzG6xm54xn2jUrZ3Wno/dmDsf3DJ0O5wtMcDgduul0z3FaJ8ebDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686656;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zSBnRfstLFOLJk+BY0dtRWMawegjn8REAGRmsm4ud7c=;
	b=h6FcyscDv7qBnAYwg9LvP3dn9NSH1aofoi/zxOh+il/WabCIpQxCLNpdhgYkYf91e0dc
	 rGJH6wh4QuvNlClG0oaVOpck9sE4GJUbG6N+hgT9Sx4mtjBu8TmCevsQQb7cF8xC9/XiL
	 7JCTC/6OQWWDvCfpoBTvYGSpq9kRPdQXKst8YV8bNQ47hGs2SnB7LmSZxres10DTTlHRc
	 Y2QVoHIEvGSdRr0wfcUYdPdFQx2C0WghAK5Oo5LgJBOf9KiGoCBlU33PRKTuJTHmXlVsJ
	 AB/yH+4XPyBiqWHiKq3E6gdjmh5wCvihhMcWv3wjasqmzJifpV6bt1XSYH07AmGiiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBCYnugU;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F9606A323;
	Thu, 26 Nov 2026 09:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBCYnugU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zSBnRfstLFOLJk+BY0dtRWMawegjn8REAGRmsm4ud7c=;
	b=UBCYnugURFX2k+6sGCKv3+d1buWao2ZJIOw6lCh4G0PlmvVPfGr8eS0EK4Vs3n5zLI8fgincE
	TyAxs1KYK+Eo4djWGTuh0nlj1qDMg0RrbSwP5VS6oRaNiYCWdWC+GWIdh3FIfc7X/CDuas7Tyi4
	qHqf1YDaWGm3WQIZkdNgR08=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jZsGK0jQ2zpSy5;
	Thu, 26 Nov 2026 17:49:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4330340537;
	Thu, 26 Nov 2026 17:50:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 17:50:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <will@kernel.org>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 1/6] fs/resctrl: Report a temporary RMID shortage per CLOSID
Date: Thu, 26 Nov 2026 17:50:33 +0800
Message-ID: <20261126095038.2276975-2-ruanjinjie@huawei.com>
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

An RMID that is freed is held in limbo until its cache occupancy drops
below the threshold, after which it returns to the free list. A request
that fails because of limbo is thus temporary and worth retrying, which
resctrl reports to userspace as -EBUSY. A request that fails because
every RMID is in use is permanent and reported as -ENOSPC.

Where an RMID is only meaningful together with a CLOSID, a request can
only be satisfied by an RMID belonging to the requested CLOSID, so the
distinction has to be drawn per CLOSID. Instead it is drawn system wide.
-ENOSPC is reported when the free list holds no RMID for the requested
CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
when the free list is empty and another CLOSID has an RMID in limbo,
even when the requested CLOSID has none. Userspace is thus told to give
up on a shortage that may clear on its own, and to retry one that cannot
clear until it removes a group itself.

Architectures where the RMID is independent of the CLOSID always match
the first entry on the free list, so neither case arises there and only
MPAM systems are affected.

Draw the distinction from the number of RMIDs the requested CLOSID has
in limbo where the RMID depends on the CLOSID, and from the system wide
count otherwise. Drop the separate test for an empty free list, which
the search handles on its own.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/monitor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..b8f4e1ff4083 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 	struct rmid_entry *itr;
 	u32 itr_idx, cmp_idx;
 
-	if (list_empty(&rmid_free_lru))
-		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
-
 	list_for_each_entry(itr, &rmid_free_lru, list) {
 		/*
 		 * Get the index of this free RMID, and the index it would need
@@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
-	return ERR_PTR(-ENOSPC);
+	/*
+	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
+	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
+	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
+	 * delays the allocation.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
+						       ERR_PTR(-ENOSPC);
+
+	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
 }
 
 /**
-- 
2.34.1

