Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081756;
	b=2o3+O3DFPIcWX7R1CvqaTEGSkmpSbXJd/wd482CPeUbb8Ep6411c+YBoOqlapbT5B4QN
	 hhOcFYg0XlAOffcE/R2BxFqFrWLfAbmCuZSLIeFMR/dl62auO1UmonMrfG9HjBp1rFpmI
	 YwHvVYKoIcqICjqbV1bK4dDlTymkgpMHvEpuK4OEtDM1LpbBdcUDJ5X6HqaWPSgYc7PCL
	 TGrNDsw+9hvvZDhJO58xfoHOYj00egzRXkDPvClm3wwCTfrFy+9UMcCGIKXp6Vw2ACKI4
	 ly9Y2iW315dwnSHsAfRn6kkM7BT32GnHQgqB5ax7NmIby+pN7B8N7YiQPUjeCOXxmIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081756;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VVVxLPRZUb5X7Rg8EoUmUlHEC6qglKLS58eMHcIV4/0=;
	b=QHHuiwy/9SzgS2wO2EOoxr2Wxpsi6IU0F4Ov0vAmEcZdherq/N/u+VzwpPf8/9YGj4WJ
	 xWEeyvc6MIVdbVnZF1lcgkymfgR3xmUT98C74nCCr9hEb7q8aHM3CAaL7CuZMkbouX815
	 eBtbX5/UOseIoJytNhxOSQRKG4Y8cP8KzAqB16LnHNpQ06WDi57MwoJfTzw8zCxJGu55k
	 19zx2sYHxb307p1w491WI9NlHzFl4Pa5DCXXhlX0nUikw7dSsqvd1umfo82mBfiVDzqal
	 WDKMOB76g3zvtH7eEgp5OMs+1YWe504nCKffQzZcoM9yierKRU3PsdJ8dLJCbKs0dZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KpunWcwd;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CF606A32C;
	Thu, 19 Nov 2026 09:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KpunWcwd
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VVVxLPRZUb5X7Rg8EoUmUlHEC6qglKLS58eMHcIV4/0=;
	b=KpunWcwdord+OtORU4os2vcXWdGrg7RnaCXzBs3gI1juIjNNklws2LG8aCTcoVGO16795F9p1
	tMkfyvglz4u7tDuy+kWK9AQRO9DCS8tT9L9fI+GtWAI7210bsCtS+WtfGUkRgfkF71nr3zfJ4t7
	tveRjKvCwvoJ7Pcf4gE/Qg0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jVYZY2WSRzLlSk;
	Thu, 19 Nov 2026 17:48:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8CEEC40580;
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
Subject: [PATCH v6 5/6] fs/resctrl: Release the limbo RMIDs when the CDP state changes
Date: Thu, 19 Nov 2026 17:48:57 +0800
Message-ID: <20261119094858.813874-6-ruanjinjie@huawei.com>
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

On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
a mount that changes the CDP state is read through the PARTIDs of the
new state, which are not the PARTIDs its cache lines are tagged with.

With 5 PARTIDs:

  mount                  CDP off, CLOSID c -> PARTID c
  mkdir g1..g4           CLOSIDs 1..4
  umount                 RMIDs enter limbo with CLOSIDs 1..4
  mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
  limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
                         MSC error interrupt, mpam_disable()

The other direction is worse because nothing reports it. If resctrl is
mounted with CDP and mounted again without it, CLOSID c is read as
PARTID c, which is in range, so the limbo handler silently tests the
occupancy of the PARTID of a different CLOSID and frees or keeps the
RMIDs based on it.

Where the RMID depends on the CLOSID, as on MPAM, release the RMIDs in
limbo without reading them when a mount changes the CDP state, instead
of restarting the limbo handler. Cache lines that still carry those
RMIDs are accounted to the next user of each RMID. Where the RMID does
not depend on the CLOSID, as on x86, the CDP state does not change how
an RMID is read and the limbo handler is restarted as before.

Compare the CDP state of every resource, not just the L3: on MPAM, CDP
enabled on any resource gives every CLOSID two PARTIDs in all MSCs, so
mounting with -o cdpl2 alone also changes how the L3 monitors read a
CLOSID, and cache levels beyond the L3 would too.

Reproduced on QEMU with the sequence above:

  mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
  mpam:mpam_disable: MPAM disabled due to hardware error interrupt

With the change the sequence completes without an error.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v6:
- Drop resctrl_arch_mon_cdp_enabled() and compare the CDP state of
  every resouce's cdp state, with a comment on why they are
  checked (Reinette, Ben).
- Restrict the release to the systems where the RMID depends on the
  CLOSID, in the changelog and the comments, and keep the hardware IDs
  out of the file system comments (Reinette).
- Reword the limbo_cdp_enabled comment (Reinette).
- Drop the stable version range, the Fixes tag already gives it.
v5:
- Split the change of the limbo handler lifetime into the previous
  patch. The limbo handler now stops while resctrl is unmounted on every
  architecture, and only the release of the RMIDs depends on
  CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Drop the cqm_work_cpu changes. resctrl_limbo_resume() cancels the
  worker before it queues it again or releases the RMIDs.
- Move the rdt_disable_ctx() reordering to a separate patch.
- Add resctrl_arch_mon_cdp_enabled() instead of comparing the CDP state
  of L2 in the file system.
- Rename limbo_cdp to limbo_cdp_enabled and document that it is only set
  with CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Check QOS_L3_OCCUP_EVENT_ID first and drop the rmid_busy_llc check.
- Use lockdep_assert_cpus_held() at the start of resctrl_limbo_resume().
- Describe the reverse sequence, from CDP on to CDP off.
- Link to v4: https://lore.kernel.org/all/20261105070934.2258613-4-ruanjinjie@huawei.com/
v4:
- Use resctrl_mounted instead of a separate limbo_paused flag.
- Record the CDP state once when resctrl is mounted.
- Add resctrl_limbo_resume(), called once resctrl_mounted is set.
- Previous Link: https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/
---
 fs/resctrl/monitor.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ede1708b920e..2c8c60138768 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,13 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_cdp_enabled - True if the RMIDs in limbo were placed there while CDP
+ *     was enabled. Only used when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is
+ *     defined.
+ */
+static bool limbo_cdp_enabled;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -1044,12 +1051,15 @@ int setup_rmid_lru_list(void)
  * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
  *
  * The limbo handler stops while resctrl is unmounted. Restart it on every
- * domain that still has RMIDs in limbo.
+ * domain that still has RMIDs in limbo. Where the RMID depends on the CLOSID
+ * and the mount changed the RMID index a CLOSID is monitored with, the RMIDs
+ * in limbo can no longer be read: release them instead.
  */
 void cqm_resume_limbo_handler(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+	bool release = false;
 
 	lockdep_assert_cpus_held();
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -1057,6 +1067,24 @@ void cqm_resume_limbo_handler(void)
 	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		return;
 
+	/*
+	 * Where the RMID depends on the CLOSID, the RMIDs in limbo can only
+	 * be read with the CDP state they were freed under. Check every
+	 * resource because CDP enabled on any resource changes how every
+	 * CLOSID is monitored, so CDP on another resource alone also changes
+	 * how the L3 monitors are read.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
+		struct rdt_resource *res;
+		bool cdp_enabled = false;
+
+		for_each_rdt_resource(res)
+			cdp_enabled |= resctrl_arch_get_cdp_enabled(res->rid);
+
+		release = cdp_enabled != limbo_cdp_enabled;
+		limbo_cdp_enabled = cdp_enabled;
+	}
+
 	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
 				lockdep_is_cpus_held()) {
 		if (!has_busy_rmid(d))
@@ -1067,7 +1095,10 @@ void cqm_resume_limbo_handler(void)
 		 * it is queued again on a CPU picked now.
 		 */
 		cancel_delayed_work(&d->cqm_limbo);
-		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+		if (release)
+			release_limbo_rmids(d);
+		else
+			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
 	}
 }
 
-- 
2.34.1

