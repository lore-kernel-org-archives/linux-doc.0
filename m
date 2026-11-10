Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322860;
	b=Vzfg+udBeo2gdHiFM5p2rMV4VSDn03PoGS7/mrzfKay35lBPEY/CnLjr4Os+hYLjHCFw
	 p3cSmI3r5ykBOXEU4Y7/raa7fvRLHAXg938byU8c/95tFER7Vjkf/P2s79gARciVY4ml0
	 piBw4a3rdtljh45SFQx9fX5lVtPEbWBp4w8fTLLSddcPyuheyE7Mg+/CXc6bI1adDiToK
	 qpOv0r/OaLjxqtM9NgS1aGOAWwSqUxYxgP56oAw6U7XLwGjWRVwouvWHPQx0IQSAErY6Y
	 iXwBawdQoJTFpPXQsF7L/4j9mzTkMLT0UNlH8DqkR2yBnwe0nC3bb2FDhuzC4qMQleg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
	b=h7lb4Rn2OtzgpKbg3H2YwvXguBU/8SVms9WLcIW7YTGkaSxif3X6y793Mxk+Lr/4lGdg
	 j72sqArhsp96gYXcZunfOVE83ft7LsA+V5J4iBJQZVXLNIQZnF2qhi5Xfe2zkAFiSn8zo
	 sHjObKFrTRblVMFevqDeMBBnKK6Ftha5aU7/Dh4lWRsHw6IK0adAJypft8cT2wVNAwkDf
	 nvUtetcnd4f7eXI47K0w6tiewqXMhTBJu2fQs1Y1Q7BaE1mtyzDBrgOuCMMJLeQINAMmS
	 6KRF1moBKiqin+uyQo5jx5VLU/HulnfwZ03kJNXzN8nGBVHXrZy4IR0fSLwLViieaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LObETGRv;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528560A2626
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1528560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LObETGRv
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-534b7b19206so20050921cf.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322859; x=1794927659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=LObETGRvkOTzbPVo6xs4B2jXCfIQ4+O9RPa79ZNNZyjh6OFPLV1p2dWoNW0ObOi7Qa
         jbY8t9if1yRPz0S+1wOcmtlKb2Wf9moTf5OC/pWoLEQ8hdJO5C76U8wkSPaJEDB7NKvd
         pFc8S/IXXNkE3lBrezXxIt77YsVoaV6rLK+4+0uKUzMTfs07JeSmKcD0qAbU1Ce6Sm3W
         ohHfoE5kWoSfUgxX9UmrxPTZEor2Ci3l3gK77hBp5GrRn3zGBvNx1vMEr/MF2Q1RqaZE
         M940spvwibNXTea2hIZ8QhkMlEbdXCfCAwvgyJgUP34pr3HB5pXBW313Rim69e1Y8Nwa
         iISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322859; x=1794927659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=Jb4BRtUTCOm1bI9P7EF/Sf0oAFnqP9OUecsUu0pdIIMFfe6izB9ZmxBWleV2KdTKvJ
         Yj17qEjNbx3avWv+3d4BBN2X7/GflMZIonksO3hT3C0katdmrESzNrDtceExUhaSVddB
         /OsW7HGpmV86dmXa2Pdi6AHWkkjTHhzleu22t/Rrnjb6SeKBNlnaAkCsostmnHFJ0Ivc
         wRIoiATR82IufWRWDYssCi44KKSo45CIpXngbWxu0k3Iqof/LtFJAs3mjvvEdirX6UQe
         UID2XP+ojx8dTkFJxg5SGuKuSIACkrsXKsprG7LKdHo1fpVGtQEAL75BCet22KtGkRWR
         RKOw==
X-Forwarded-Encrypted: i=1; AL+hErF9rreJblyGRj0MwG0LOes4vb1jekQiiUnPpXkmJM3eT/pV1H5a5YUxYw97JAtqv3qO1dVwvL5A6lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fBer9yq7kIifaayEg7VBbLwkDXCBzjBNe8jEo0E5H68IvgUdd
	yAU0SuY9uuj77voQ0fYhzYDZ8wX7X7FFjPvgAsBlvMOpxkeZYA8oa3viaTBzD2N0
X-Gm-Gg: AYBFou3B3UFT8iRzn2qPf1NOSpdW3Rkv4DgdTHsVejHAdexQ0TRnKNn4uYSZSaN9XtS
	IPugpTErv2j8XoaO/S12xu0DqhS2DGP9w8Hf3dci/zYUPxZpD73F/9A3YOFLJWN/ufKgNk3sFpO
	Xwl+08axH/rW3+OndxHlYgkVF6m1rBn9CGxAteEywYgz29L/u9Np5HxkjrCJ9v+wt/9kd0pZDlz
	CtfsCWNdNAhgrmsP2QUzIB6PDnXNa7spK33mXCGXjAVE8meMbb2NE03WG/m/88x4aJ+JaeYKyhy
	FOzVVxv5W+2UiXz0qxMIQwSnSKb3lypP83v/0aQlb0RGHk9opqcgNtsYJzZ8ihOqBeR2bWy8/vR
	7XrF8VfpU+pqi+vvdO5Ycd07UjaF8+6Dw0ndaL8AF2zFWWEM2rPEfkn1frpaJSvGcpK75czQpNZ
	HyIC0YqCSwcIEyKPLnCjrxU7C3OVWkKwf+5iRH1Hir8Yzq6tTyc8gRdaERx1SIOMOwyGJgiMnOP
	M3T0KelinDLOO++zhCznszCXl7v4eTUW7ZxxhvR/0GubTI0AaXwyTfKFgL3C2DylmMrvrA/wmR9
	r3I2v6an98vXwDa9fSe4ms7ybRxgbuOx26Pq0M6OewDC4DD+w5hdcKTg+JqJfzE=
X-Received: by 2002:a17:902:e751:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2edb9260ab0mr26092925ad.32.1794316893463;
        Tue, 10 Nov 2026 05:21:33 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:32 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 2/7] fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs
Date: Tue, 10 Nov 2026 21:20:49 +0800
Message-ID: <20261110132054.3702-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

Busy RMIDs of a monitor domain are normally released by the limbo
handler once their cache occupancy drops below the threshold. When a
domain goes offline, its busy RMIDs are released without checking
occupancy, since the domain is going away and the RMIDs would otherwise
never return to the free list.

On the monitor domain offline path, __check_limbo() allocates the
monitor context that an occupancy check needs before it scans the busy
RMIDs, but without using it, and returns early when that allocation
fails. Then the caller destroys the domain's monitoring state, including
the bitmap that records which RMIDs are busy, so nothing can clear those
bits afterwards and the busy counts never reach zero. Those RMIDs never
return to the free list and, where the RMID depends on the CLOSID, the
dirty count of their CLOSID never decreases. The allocation can also
wait for a monitor to become free, which stalls the CPU offline path on
a context that is not going to be used.

Only MPAM systems are affected. An architecture that can always read an
RMID allocates nothing for the monitor context, so the allocation can
neither fail nor wait there.

Move the release of busy RMIDs into a separate function that does not
take a monitor context and leave the occupancy check to __check_limbo().

Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/internal.h |  2 +-
 fs/resctrl/monitor.c  | 72 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..1c85e06f09bf 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -405,7 +405,7 @@ void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
 
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
+void release_limbo_rmids(struct rdt_l3_mon_domain *d);
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b8f4e1ff4083..ae9ddd380515 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -124,21 +124,45 @@ static void limbo_release_entry(struct rmid_entry *entry)
 		closid_num_dirty_rmid[entry->closid]--;
 }
 
+/*
+ * Release the RMIDs that are marked as busy for this domain without
+ * checking their LLC occupancy. Cache lines may still be tagged with
+ * these RMIDs and will be accounted to the next user of each RMID.
+ */
+void release_limbo_rmids(struct rdt_l3_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rmid_entry *entry;
+	u32 idx, cur_idx = 1;
+
+	for (;;) {
+		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
+		if (idx >= idx_limit)
+			break;
+
+		entry = __rmid_entry(idx);
+		clear_bit(idx, d->rmid_busy_llc);
+		if (!--entry->busy)
+			limbo_release_entry(entry);
+		cur_idx = idx + 1;
+	}
+}
+
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
  * reported LLC occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
+static void __check_limbo(struct rdt_l3_mon_domain *d)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
-	bool rmid_dirty = true;
 	u32 idx, cur_idx = 1;
 	void *arch_mon_ctx;
 	void *arch_priv;
+	bool rmid_dirty;
 	u64 val = 0;
 
 	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
@@ -161,30 +185,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (!force_free) {
-			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
-						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
-						   arch_priv, &val, arch_mon_ctx)) {
-				rmid_dirty = true;
-			} else {
-				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
-
-				/*
-				 * x86's CLOSID and RMID are independent numbers,
-				 * so the entry's CLOSID is an empty CLOSID
-				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
-				 * (PMG) extends the CLOSID (PARTID) space with
-				 * bits that aren't used to select the configuration.
-				 * It is thus necessary to track both CLOSID and
-				 * RMID because there may be dependencies between
-				 * them on some architectures.
-				 */
-				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
-							      d->hdr.id, val);
-			}
+		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
+					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
+					   arch_priv, &val, arch_mon_ctx)) {
+			rmid_dirty = true;
+		} else {
+			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers,
+			 * so the entry's CLOSID is an empty CLOSID
+			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
+			 * (PMG) extends the CLOSID (PARTID) space with
+			 * bits that aren't used to select the configuration.
+			 * It is thus necessary to track both CLOSID and
+			 * RMID because there may be dependencies between
+			 * them on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
+						      d->hdr.id, val);
 		}
 
-		if (force_free || !rmid_dirty) {
+		if (!rmid_dirty) {
 			clear_bit(idx, d->rmid_busy_llc);
 			if (!--entry->busy)
 				limbo_release_entry(entry);
@@ -843,7 +865,7 @@ void cqm_handle_limbo(struct work_struct *work)
 	if (cpumask_empty(&d->hdr.cpu_mask))
 		goto out_unlock;
 
-	__check_limbo(d, false);
+	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
 		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..5d0351453c2f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		 * the RMID as busy creates RMID leaks if the
 		 * package never comes back.
 		 */
-		__check_limbo(d, true);
+		release_limbo_rmids(d);
 	}
 
 	domain_destroy_l3_mon_state(d);
-- 
2.43.0

