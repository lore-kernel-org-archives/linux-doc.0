Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686660;
	b=Gr3TDsrN+JRulAyFlR1GnV2Xm1Apw7kPK3pngfxJIiPiH3GyRY0paefBrxPPwgiw56PU
	 ajzWAFrHvHenBktRPZikRan17EOJMM9glFRsGoCTJloIpGZSn4kNsHmTQCT/nRH5vg9XW
	 iqDcYV1W+TjSRPCWqBOk+jnuRL/uzGpBPeVdHTPvJXl/CJ7anYITG6Skm8WDV6EJ/i7ew
	 uLjM+wEaPsiBYGG335r76X6YkLsLUN/dnOtabuhLz1XnQg6kYghe5sQFSjSkWdCOuysNE
	 TTOAMvZ/fSQVUHY9SM+Y3eLlZ1nNn8HH5vePt9o9ooA7u8K/8UrORa2K8mGTHGmvPiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686660;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=4ltqCgZSHpXzUvIStLwV0t1qLBlylPjpARy+TcS97Ro=;
	b=sxFHNueIwVMo9ZJWqbUPEhcps2ap16BI2dLQXvUFoNFy49U1cbgQq3hYdxokkdHzM2eN
	 8Yqh3JQHgFhF0HO9gEo08lfp2BY9RTB+02XEzkSiMyPk1W5GD5sDAxGv4s+lKunOKxVBn
	 JIEqX1A844+aCOxsvAq5IZYtT30A0PahG2DmI7t4jOErIesa8j/Pw/g0e7X2AsE2IQABi
	 EYnpih3IxItRlkmpAezqnV6TvQ90Bx4J2kuBzXR5WQpLWI1mT/Hnv0TfImGEIDc4GBUB4
	 0E1cXgiPkMCkLvoYF2cr91AsPmoC/tn9XPC+ZcPgJRwTcxMdQgRzc7PnbUcbh0nvLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sfcKy9jj;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B7606A32E;
	Thu, 26 Nov 2026 09:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sfcKy9jj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4ltqCgZSHpXzUvIStLwV0t1qLBlylPjpARy+TcS97Ro=;
	b=sfcKy9jjgIy47yKajUxTGidDmSZ+dS6SsrbO682O36gl9vEG3eaWm75OqzaQXJ6RVlbj2lzhN
	9LcDjkWh7usKUiZrVStNA1p0poCF+SiGy57VQyBWQ7LdTjo3ATqD8jCALv0Gx7U+K/WWeKRRYnk
	84ZD58tcpZq7c1d1xvJsv7A=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZsGg6pL5z12LdF;
	Thu, 26 Nov 2026 17:50:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 82A1D20333;
	Thu, 26 Nov 2026 17:50:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 17:50:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <will@kernel.org>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 4/6] fs/resctrl: Stop the limbo handler while resctrl is unmounted
Date: Thu, 26 Nov 2026 17:50:36 +0800
Message-ID: <20261126095038.2276975-5-ruanjinjie@huawei.com>
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
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
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
 fs/resctrl/monitor.c  | 41 +++++++++++++++++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c |  2 ++
 3 files changed, 43 insertions(+), 2 deletions(-)

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
index ae9ddd380515..5f3d39f0d3ed 100644
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
@@ -1033,6 +1040,36 @@ int setup_rmid_lru_list(void)
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
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
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

