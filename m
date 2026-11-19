Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081756;
	b=E1KqSriFHC04pQcTCGrnkYHcL0jwBeq7C4HQLgK4HhEEjmQ70OdX9HQV4wzCKzVBp/1y
	 uTo2vDEanhq1S2btIEIyOVEs1ZH7W29WX5wh9B4sZOufuC1Vgnwp3EX0ZhnT+wDpewRKS
	 KY0trI9Jm0QmUYEcLmeOSzMVNKGPlnJdXU9MwsdRyqOAP3oUqyyNSll6dk6HrP4e6cAGf
	 SGjyzLXbHoMxmq7+zF8UYyTaGNNStWXdfbiuH/VVaHEMeW7N9aN9JEs2TIz4Fw0wGQ2s/
	 9ILajAuOd+9HWP6P7b33Wmm1Do+g9XBu9eBv/5+XO9OZZlFYSbT6L8EFc3tWNCLU2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081756;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=F3w6a8qH/vlD5yf51YYGcA5bapYl0I+Worxupn7IWtI=;
	b=5b46zk3oImogbHT9i+eXBfW7AQM0PggxiyQ+0ftwVQSIdDKAw2sfAI8LTYztGhWqZxt0
	 woU0c0Y9SEczGqwarJaFCFpMilDU8RYs5HdAwD8qRDHOZ6npKD2HickeTP9BU2cfk3X3D
	 X6cp+Xe3x21ZlW6Wyn98ELvYOee02mUj0fHiUAMm5ocQt0vhLQYNv7xuaKsH4Tma9pVW9
	 2kIJUdoDQB5trhcCWYvZzQ2mcpi0811PQ+Cz99i4wQznWXiItjZnfmeFIwcYIom0OUhN9
	 EHQEy/BjIdVA5N1MUXkGTraur3qd4XzqjRx+vFk79T3okOIirqi36mMwwzvixyxkb/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="nd/Zpj9s";
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78373606A330;
	Thu, 19 Nov 2026 09:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78373606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nd/Zpj9s
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F3w6a8qH/vlD5yf51YYGcA5bapYl0I+Worxupn7IWtI=;
	b=nd/Zpj9sZJQe58GD8LAwOvkER4Oz9ruYX8u7kp+DN6BJmvJKjuF2lIiOQedScNAhClla98f+R
	OXq0ZClpuKh18+5q3F2rfof2d121TyQK1eWiyVttvIdClyBvusxMieVbaR39IjYvSEPRxTrvaLK
	CjPlq3zo5Qi+C1d7EzvBcyw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jVYYx2wQCz12LdS;
	Thu, 19 Nov 2026 17:48:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 09AFC40575;
	Thu, 19 Nov 2026 17:49:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 17:49:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <gshan@redhat.com>, <ben.horgan@arm.com>,
	<jic23@kernel.org>, <fenghuay@nvidia.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 4/6] fs/resctrl: Stop the limbo handler while resctrl is unmounted
Date: Thu, 19 Nov 2026 17:48:56 +0800
Message-ID: <20261119094858.813874-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119094858.813874-1-ruanjinjie@huawei.com>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A monitoring group's RMID is not returned to the free list when the
group is removed. It stays in limbo until the cache occupancy still
counted against it has dropped low enough for the RMID to be reused,
which the limbo handler checks once a second.

The limbo handler keeps running after resctrl is unmounted, where there
is nothing for it to achieve. An RMID is only allocated when a group is
created, which needs resctrl to be mounted, so no RMID the limbo handler
returns to the free list can be used before the next mount, and that
mount can check them itself. The MBM overflow handler already stops for
this reason once resctrl_mounted is cleared.

Reading the RMIDs in limbo while resctrl is unmounted is not safe on
every architecture. On MPAM the counter of an RMID is selected by the
CLOSID that owns it, and the CLOSID depends on the CDP state. Unmount
clears the CDP state, so the limbo handler that keeps running reads the
RMIDs freed under CDP through the CLOSIDs of the cleared state.

Stop the limbo handler while resctrl is unmounted, as the overflow
handler does, and restart it after a mount on every domain that still
has RMIDs in limbo. The worker can stay queued across the unmount, so
cancel it before queuing it again.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v6:
- Explain first why stopping the limbo handler is fine on every
  architecture, and describe MPAM by CLOSID only (Reinette).
- Rename resctrl_limbo_resume() to cqm_resume_limbo_handler() and declare
  it with the other limbo handler helpers (Reinette).
- Return early when the L3 resource is not mon_capable (Reinette).
- Drop the stable version range, the Fixes tag already gives it.
---
 fs/resctrl/internal.h |  2 ++
 fs/resctrl/monitor.c  | 42 ++++++++++++++++++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..f52e0937702a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -401,6 +401,8 @@ bool is_mba_sc(struct rdt_resource *r);
 void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_ms,
 			     int exclude_cpu);
 
+void cqm_resume_limbo_handler(void);
+
 void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae9ddd380515..ede1708b920e 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/*
+	 * If the filesystem has been unmounted this work no longer needs to
+	 * run. cqm_resume_limbo_handler() restarts it on the next mount.
+	 */
+	if (!resctrl_mounted)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
 	/*
 	 * Called on every mount, but the number of RMIDs cannot change
 	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
+	 * across an unmount and are checked again after the next mount.
 	 */
 	if (rmid_ptrs)
 		return 0;
@@ -1033,6 +1040,37 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/**
+ * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
+ *
+ * The limbo handler stops while resctrl is unmounted. Restart it on every
+ * domain that still has RMIDs in limbo.
+ */
+void cqm_resume_limbo_handler(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_l3_mon_domain *d;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+				lockdep_is_cpus_held()) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		/*
+		 * The unmount may have left the worker queued. Cancel it so
+		 * it is queued again on a CPU picked now.
+		 */
+		cancel_delayed_work(&d->cqm_limbo);
+		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+	}
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3312637fb514..c7c4f618208d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
 						   RESCTRL_PICK_ANY_CPU);
 	}
 
+	cqm_resume_limbo_handler();
+
 	/*
 	 * Ensure root remains accessible after mutex is unlocked so that
 	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
-- 
2.34.1

