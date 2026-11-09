Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230816;
	b=OMqHEOEQd+tK0oZh6h7pTpq5dH3+hphfZnSzxIupYwyjBqSUQ4Cbw0wygHg2q1l5Cxcp
	 8K9MaG2O5UdqHN3WrQNTrt60CEF52H9AVa2A4m5OutB4SG1GheFE4ijkOMHt/KtfwUeES
	 xN5CEVeUBS4bL8Uz5XhqZICWRxitECwFnY7jcCKPPYwgV01HjSf1R7YeaJYae49kSJURm
	 n9nwcVwTHgd+jQGsERYDTu/vQLt3MCep/V53cEj7nzO1g9Wc9O5/eMykJF38TdDY8UKDw
	 G+dh64W4lAC91ZEOZmH1mel7on7j+PHwheg5Ep3UZhfTJoDCF7NiiKBFmZLjRjGlacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=;
	b=Mbc/Ly1uCRM4ZoB0LMXSY00ZCT8R1eTBLuNjCH9ZigLSny6fs25vUzLM5oVOa2J8nuD9
	 ep7llhHl8+3/ApP4Tg6V8jZ6sZclfC4SZEuMEo+OVnTeU0bDGo8/NP/VbEF7Ea+poCzXR
	 aTFJ37ypW5K1xMWZlNcd4xbEZRpxBw35fLW2lQXBxJnkyuWe3jBF/Sp1+rIwpsK/ak302
	 JBnPICVk4TjQlpV/OZaKuTy8t8+Ucz7ioKNLQaRWlYzVj8j087zFYIZ1JU65tHF0IrZPY
	 2eI42bPzGUYv+qpI6/MK78ZOaHuk+GD+WATiwtERZMLw3ryfKer2zqzWmdGxxij60AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RstEgx6q;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B010606A33B
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B010606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RstEgx6q
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso644211a91.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230816; x=1794835616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=;
        b=RstEgx6qdWTcZADbc0D9wZt6E2CZgIumj0iLEDwl14/hTgaRFKJ3PnRQ9wxcPxFwgt
         h/HwqwZSNjb2cDPFn7yamlkgL28HQWMokPUwkefoaEFcYny019p0JhYBvJvCRGuxC7WT
         S65+srFGtDObPpBOalVaTjSdIHYhisvsIAe/DIUuisiJVYGHqrrQ59Zjd2ZN5WWXcUfR
         4mn5K5NSA77OKq4/iuVnncRSaGXUOyMV+Bw5tzMghDpg5WWQAoKm2TbkRalgFhuKj+IM
         ivPuejWJYbOmPhFmqVXbXwd4os5H2VzOWhQoyuh1JcP1tyL0tsbzBYIs55LR5q+azzVz
         wYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230816; x=1794835616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=;
        b=k7/iRrhVo8hsc9aTT6dyRdzJNrQJXbxawCg7rrFi1aCmXxluVDforv/NYSCYAmrIMH
         7HI6Fl0jqcIFpLHGmY4IVTiA7DwetdkIyxbNZaveJJXxFtoydLyFbZfzyX73J1Nrya4y
         D+hn10DI6s9k2rf2/NkS2TZTZdDZ+/iKFZxZNK3Y3u5XyBjmpeokxK8cTB9izyqtH72q
         p5nDPIXMIePeTfS2XAtWoaUBtMlHkNJr7dNQBUWJ3lfMwitlBcbzJ6LE3kvPZ2QZnRBo
         HaZBXnmojcenl+aHBoFpajDYmbBtBVK/4wjriLmTiJZAS05j85T7mvT9bDHQIXqmjIsH
         ut8w==
X-Forwarded-Encrypted: i=1; AL+hErGZRRQFSLpMZf9R0BE3EkHBVPewnhw2cNyY9d7VytFH8Xac58Vq5x5l8Y+lXckmgqWNQtEqEUeNF78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wd09sEMGzog28lCSIMtqh82XifCWNla1/mnOba9/HkMb0dRf8
	x/wjocZKlEUCGI/ZBfq07J8CRekKw4xs/ENjAqbumGqXdRNqduMIXF7G
X-Gm-Gg: AYBFou3OIxLkA8b2u3AjESS8FNfHQakathp6DGlPnymLMmfvzpatoKezOC2tXYowvTj
	+i7UpNn3/GWQtpSDHW+qkTAV1DMudwc72xoymwB+JUvePsHwRI+aRyIlc78PafdN0w3l7npLjFN
	yhAfEV53L/okIspGunAT82Aey9FhAyCLCM7Os+g6goOoErMIV+mJpZNJf1FF7Naq9MtsKGrfCIz
	qZVFdyWXEa+rm5rBCAGbPF3O7PKAG2h0sMFJrrl4X7+H9pKnREa/PLvMKRAMs/uyG2ybEP7SEXg
	ZcQxwdewVXv+I//d2olmC5A9sknNJapRrD+Z1ArN/bcc1e7lBclO3GAPzq7JUqWYxIMjeQWJV7z
	Rd+29OU3GFWZKZyQ8cf9nQ07MpvPGVZRQzdLdaxi3SKcZ5Z1bYpIRBmxiUN1nVv6strDRabJMOW
	/y1gl1JN2T/QIWljcuifqhODvufYf+9cjqZ4Q6Cgu9RLM2w8KWDPDBMpKkIJ9d3euzY/1Pvxg6H
	5wYw96eTPyqykrEliVM9twVxmKLqH0CSi7TcMU3J2lujFaID/d3rwcRBOpkDGrJ9wpzT+qeVh4Z
	ZqqaNZlRUZsZDahbxQzYxPGp2ps8QXoafVlJH7qNfdb54bDBs9eh7kSJxQfrEcW9QU21iBpqhdZ
	g0xwO/sRq
X-Received: by 2002:a17:90b:2ec7:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b12d46479fmr3367677a91.26.1794230815591;
        Mon, 09 Nov 2026 05:26:55 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:55 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 4/6] fs/resctrl: Allow mba_MBps with assignable MBM counters
Date: Mon,  9 Nov 2026 21:26:19 +0800
Message-ID: <20261109132621.3862497-5-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

The MBA software controller adjusts the hardware bandwidth control from
MBM counters to meet the value written to the schemata file. It needs
a counter for the event selected by mba_MBps_event in every monitoring
group, so mba_MBps is refused when the MBM counters are assignable. On
MPAM every group has its own PARTID and PMG and the bandwidth monitors
are assigned from a fixed pool, so users can only pick a percentage of
a maximum that firmware does not report.

Allow the controller when the architecture has a fixed assignment mode
and assigns counters when a group is created. Enable
mbm_assign_on_mkdir while the controller is in use, restore its
previous value when the controller is disabled, and refuse to unassign
the controller's counter meanwhile. Every group created while the
controller is enabled then has a counter in every domain where the
shared pool still has one. A group whose counter could not be assigned
contributes no bandwidth, so the controller measures less than the
groups use and can raise the control above the user's target; warn
when that happens.

Only MPAM has a fixed assignment mode; systems where the counters are
not assignable, or the mode is not fixed, keep the previous behavior.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst |  7 +++--
 fs/resctrl/monitor.c                  | 43 ++++++++++++++++++++++++---
 fs/resctrl/rdtgroup.c                 | 35 ++++++++++++++++++----
 3 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..d70aec6f7096 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -471,7 +471,8 @@ with the following files:
 	Determines if a counter will automatically be assigned to an RMID, MBM event
 	pair when its associated monitor group is created via mkdir. Enabled by default
 	on boot, also when switched from "default" mode to "mbm_event" counter assignment
-	mode. Users can disable this capability by writing to the interface.
+	mode. Users can disable this capability by writing to the interface. While the
+	MBA software controller is enabled, auto assignment cannot be disabled.
 
 	"0":
 		Auto assignment is disabled.
@@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
 	   mbm_total_bytes:0=e;1=e
 	   mbm_local_bytes:0=e;1=e
 
-	Assignments can be modified by writing to the interface.
+	Assignments can be modified by writing to the interface. While the
+	MBA software controller is enabled, the counter of the event the
+	controller uses cannot be unassigned.
 
 	Examples:
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 76990bb80ee9..72917cf4a8e7 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1197,6 +1197,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
 		goto out_unlock;
 	}
 
+	if (!value && is_mba_sc(NULL)) {
+		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	r->mon.mbm_assign_on_mkdir = value;
 
 out_unlock:
@@ -1329,18 +1335,28 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	int ret = 0;
 
 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
 	    !r->mon.mbm_assign_on_mkdir)
 		return;
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		ret |= rdtgroup_assign_cntr_event(NULL, rdtgrp,
+						  &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		ret |= rdtgroup_assign_cntr_event(NULL, rdtgrp,
+						  &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+
+	/*
+	 * The software controller measures a group through these counters.
+	 * A group whose counter could not be assigned contributes no
+	 * bandwidth, and the controller can then raise the control above
+	 * the user's target.
+	 */
+	if (ret && is_mba_sc(NULL))
+		pr_warn_ratelimited("Failed to assign MBM counters to a group; its bandwidth is not measured by the MBA software controller\n");
 }
 
 /*
@@ -1763,6 +1779,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
 	return NULL;
 }
 
+/*
+ * Return the event the MBA software controller uses as its input for @rdtgrp.
+ * A monitor group has no event of its own: its bandwidth is summed into the
+ * parent control group, which is the group with the mba_MBps_event setting.
+ */
+static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
+{
+	if (rdtgrp->type == RDTMON_GROUP)
+		return rdtgrp->mon.parent->mba_mbps_event;
+
+	return rdtgrp->mba_mbps_event;
+}
+
 static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
 					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
 {
@@ -1776,6 +1805,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
 		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
 		break;
 	case '_':
+		if (is_mba_sc(NULL) &&
+		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
+			rdt_last_cmd_puts("Counter is in use by the software controller\n");
+			ret = -EBUSY;
+			break;
+		}
 		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
 		break;
 	default:
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b32831871f70..957a3df7af83 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2610,10 +2610,10 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * The MBA software controller is supported only if MBM is supported and MBA is
  * in linear scale, and the MBM monitor scope is the same as MBA control scope.
  *
- * The software controller cannot be supported when the MBM counters are
- * assignable.  There is no guarantee that MBM counters are assigned to the
- * event backing the software controller in all monitoring domains of all
- * monitoring groups.
+ * The controller needs a counter for its event in every monitoring group.
+ * With assignable counters that is only guaranteed when the architecture
+ * uses a fixed assignment mode and assigns counters automatically; keep
+ * that assignment enabled while the controller is in use.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2623,9 +2623,16 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
-		!rmbm->mon.mbm_cntr_assignable);
+		(!rmbm->mon.mbm_cntr_assignable ||
+		 rmbm->mon.mbm_cntr_assign_fixed));
 }
 
+/*
+ * The value mbm_assign_on_mkdir had before the software controller forced
+ * it on, restored when the controller is disabled.
+ */
+static bool mba_sc_saved_assign_on_mkdir;
+
 /*
  * Enable or disable the MBA software controller
  * which helps user specify bandwidth in MBps.
@@ -2633,6 +2640,7 @@ static bool supports_mba_mbps(void)
 static int set_mba_sc(bool mba_sc)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 num_closid = resctrl_arch_get_num_closid(r);
 	struct rdt_ctrl_domain *d;
 	unsigned long fflags;
@@ -2643,6 +2651,21 @@ static int set_mba_sc(bool mba_sc)
 
 	r->membw.mba_sc = mba_sc;
 
+	/*
+	 * The software controller needs a counter for its event in every
+	 * monitoring group. Keep the automatic assignment enabled while the
+	 * controller is in use and restore the previous value afterwards,
+	 * as the user can change it while the controller is not in use.
+	 */
+	if (rmbm->mon.mbm_cntr_assignable) {
+		if (mba_sc) {
+			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
+			rmbm->mon.mbm_assign_on_mkdir = true;
+		} else {
+			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
+		}
+	}
+
 	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
 
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
@@ -3352,7 +3375,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
-- 
2.43.0

