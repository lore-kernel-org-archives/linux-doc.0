Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686661;
	b=s+Be1LI+ldVRGl4a1lC1UV9px8Yfhv6QsfDq9GlQVVUkNnFh+g4Hf+aDKjAABkG47cxv
	 H3KQosyzkqMcyCCVAQu3aPOnDNvjgdOjOui0a3YqcS3yd6QbqVTm50V8W/Qa+IeyS0LFA
	 utIrB0xpzqoGcCqpQT+Vb1SG6SIEtuWB6j0j1iP9zwVY8GMoc/0PGBhuq5CLkPVWOZ8oM
	 yM6kTb7cLzgd2r5ANSlce1LVLQnYFRLL/r5TCtIdVSar5aoGsx/w0M0/Wr9N+HTXtWTeN
	 IRRgvVbjrakbmf5iBV+l+zyADqRZ5MfYgMfxFw7FhPSE1ivi1J1N7nfol//kdnU5BGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686661;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=MK3NV7+T+iSn6nFA6FDsVXaBOobjfAVGPkOE164EgAo=;
	b=d+Kv9yi+L4Q1B3AMbmrShY2pehHyK2MCGlypolrkpU8XPVsVQjlZALWSOzVdWoI4LdmU
	 kUK53upTke8UYJGgniWN9VBi7WKNChjlGaz+CZ2CzGPLQH8nxHJiMAFUOyQnNyxL8V+GJ
	 fs2V25pF8Oj/DxjeTMxUEOjJalABWdiZMA2veKvUjZW3DBOFVYTc/Ys7pUgRe8uvMCGya
	 o3elujLI1Jx3UzheAfROUNuwK5eX3M5V7ZkNPt/Ai7SJYfikWFHdvBnBFSMjjaCfR0wKz
	 e+p3vn2HHHEovMjVENFEYnypfGXnsYRfnCAWWfBCJgocCXCu9A8M+HZm3FtCW6IJsYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X1PSdPOj;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2C606A32C;
	Thu, 26 Nov 2026 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B2C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X1PSdPOj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MK3NV7+T+iSn6nFA6FDsVXaBOobjfAVGPkOE164EgAo=;
	b=X1PSdPOj80Yu2WpyXN2J3qnAZackKclRwi/s6e2J1HWOwDlCBJrf6SlV9hnv8rQrYrNTNRX5A
	OOH3OZ20GDznNoptF+JYYq+UtjGs/hMaC2jP/mzARsTJ0+V3L5coOJNKXPw4UHM6/a7ncoNvgUQ
	HFzgHH2qRj8sd/IipSiZVFg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jZsHD6qZqzKm4k;
	Thu, 26 Nov 2026 17:50:32 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 479044057A;
	Thu, 26 Nov 2026 17:50:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 17:50:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <will@kernel.org>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 5/6] fs/resctrl: Recreate the dirty RMIDs when the CDP state changes
Date: Thu, 26 Nov 2026 17:50:37 +0800
Message-ID: <20261126095038.2276975-6-ruanjinjie@huawei.com>
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

On MPAM an RMID is read through the PARTIDs of its CLOSID: CLOSID c is
PARTID c without CDP, and PARTIDs 2c and 2c+1 with CDP. A mount that
changes the CDP state changes how every RMID is read, but the RMIDs keep
the dirty state they had under the previous CDP state.

With 5 PARTIDs:

  mount                  CDP off, CLOSID c -> PARTID c
  mkdir g1..g4           CLOSIDs 1..4
  umount                 RMIDs enter limbo with CLOSIDs 1..4
  mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
  limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4

  mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
  mpam:mpam_disable: MPAM disabled due to hardware error interrupt

The other direction fails silently, and the free RMIDs are affected too.
With CDP the default group's code accesses tag cache lines with PARTID 1.
Mounted again without CDP, a new group given CLOSID 1 and RMID 0 starts
out counting those lines, although that RMID was never in limbo.

When a mount changes the CDP state, put every RMID that can be allocated
back in limbo, so that each one is checked as it is now read before it
is reused. Until then, creating a group may fail with -EBUSY. The RMIDs
of a CLOSID that is out of range under the new CDP state can neither be
read nor allocated, and stay free. CDP on any resource changes how every
CLOSID is monitored, so the CDP state of every resource is compared.
Where the RMID does not depend on the CLOSID, as on x86, nothing changes.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v7:
- Recreate the dirty RMIDs instead of releasing the ones in limbo: the
  cache lines of every RMID may now be accounted to a different RMID,
  including the RMIDs that were free, so all of them are checked with
  the new mapping before they can be reused (Ben, Reinette).
- Trigger the recreation on the CDP change alone, without testing
  whether a domain has RMIDs in limbo (Reinette).
- Leave the RMIDs of a CLOSID that is out of range under the new CDP
  state on the free list instead of reading them.
- Do not recreate the dirty RMIDs on the first mount, before which only
  the default RMID is used, so that a group can be created right after
  the first mount with CDP.
- Link to v6: https://lore.kernel.org/all/6dd79d09-576b-4086-ba5c-7f8663292a6e@arm.com/
---
 fs/resctrl/monitor.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5f3d39f0d3ed..8d78360efda8 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,13 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_cdp_state - 1 if the RMIDs were last checked with CDP enabled, 0 if
+ *     not, -1 before the first mount, when only the default RMID has been
+ *     used. Only used when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
+ */
+static int limbo_cdp_state = -1;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -1040,11 +1047,42 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/*
+ * A change of the CDP state changes how every RMID is read, so any RMID, free
+ * or in limbo, may now count cache lines left by another. Put every RMID that
+ * can be allocated back in limbo. The others can neither be read nor
+ * allocated until the CDP state changes back.
+ */
+static void recreate_dirty_rmids(struct rdt_resource *r)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rdt_l3_mon_domain *d;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	/* Only the default group exists, so this frees every other RMID. */
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, lockdep_is_cpus_held())
+		release_limbo_rmids(d);
+
+	/* Skip the default RMID, which stays allocated. */
+	for (u32 idx = 1; idx < idx_limit; idx++) {
+		struct rmid_entry *entry = __rmid_entry(idx);
+
+		if (entry->closid >= closids_supported())
+			continue;
+
+		list_del(&entry->list);
+		add_rmid_to_limbo(entry);
+	}
+}
+
 /**
  * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
  *
  * The limbo handler stops while resctrl is unmounted. Restart it on every
- * domain that still has RMIDs in limbo.
+ * domain that still has RMIDs in limbo, after checking every RMID again if
+ * the mount changed how they are read.
  */
 void cqm_resume_limbo_handler(void)
 {
@@ -1057,6 +1095,23 @@ void cqm_resume_limbo_handler(void)
 	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		return;
 
+	/*
+	 * Where the RMID depends on the CLOSID, the CDP state decides how an
+	 * RMID is read. CDP on any resource changes how every CLOSID is
+	 * monitored, including by the L3.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
+		struct rdt_resource *res;
+		bool cdp_enabled = false;
+
+		for_each_rdt_resource(res)
+			cdp_enabled |= resctrl_arch_get_cdp_enabled(res->rid);
+
+		if (limbo_cdp_state >= 0 && cdp_enabled != limbo_cdp_state)
+			recreate_dirty_rmids(r);
+		limbo_cdp_state = cdp_enabled;
+	}
+
 	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
 		if (!has_busy_rmid(d))
 			continue;
-- 
2.34.1

