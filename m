Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5D49218C
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995580; cv=none; b=l5Xa+L1T5+bvgRl5yD2SyjdSFDlKvldC84egx1+7yKanaGmQ4WD38XCkgoXbO8XOU4LA4RMeKkuHu20sG6r1QF/u8LR9urFibVpK/+4zoHPkTZhbBijG9jbClxYJXZEQQXkJBpn1885iYTQhukHiRz3rs3ptFWVfHOp3HTQQDwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995580; c=relaxed/simple;
	bh=MJBaUT6A2RIYR2qoIw8yHbgHu52UsZByzeusjHfprfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMiCtSOE0qSF+ksmm0eHyokDniVA8ygp9wrO+G2RUtwOG8DtjZgUfwhi5AiuI7gpgYZATUcODO/f4grvIbNnmvh4E/mYOArU+DXdG6sIKHQlH/ZzKOop+s9z00OHk0NqL5Ah1a2ys6NBV734f38HUqMOIeKFXgopOl0KHxgDQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRUalMev; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRUalMev"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-404254ffe8aso7573fac.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777995575; x=1778600375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIXfyZUJZPSdof5KqpSbjmh+gBcKfo2nAX8OXquADG0=;
        b=PRUalMevVH9h+z3l+p5EldFm6KECfI6+N/2xxVk3UNUFVgHTvK7z0USxRpV7ZyqZUS
         ZJeMkqh88+XhcQ2m6KndcaxxheTYbiiT6dmq9w/XvopCLdjtUIBpk4Dj2q0XuR7ZCa4P
         YkLWHB3BMtDzD/lAwSlyz784cVIeAkysq5vJQ4c7U7F0+gbrVKm9OM6WeWZTjFuRPB8/
         VGJSxmOu3oOgNk4317Y5RVoZptEmF9eC9gbtQ6JhwlPHRQqWp4N/06yovgAasjZUk1OL
         dL7G6GbXTUaE6bCvfKRp/t+d2xVbAqJqqpbIyCbMuIl+fRAe46qRb+tgHNqjylBWbrXR
         1jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995575; x=1778600375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIXfyZUJZPSdof5KqpSbjmh+gBcKfo2nAX8OXquADG0=;
        b=i5btn825pPqi+xBE8J5SREbGVlMouHoTtt5oDvwfwcg6Amh8PW3Fg8IU4fVeUE3iH2
         0Z46iPhXDG3Tb9QQAA55SHInWRbpZyXiMiJ/elrGfr8TdCMId8Ynn5yabUM5I66i1M85
         9mJGIFxRpmbYwOUsxbgFu0Nly1lzRTQ5LXdUKC13KDAk9edSL6ViS0ppVO5vgY2YpLgp
         /npMsQtKWbdnpyQodSExb37FaAaVkciYqczGtxKmaubL2qVbJ5upN4E1qvG6szOdciQw
         05vWVv6NA/qmDU1jxwoIQoZIgO1rnEMES+XZSkqU5/kdE4fcgueJHq2vGS89guMzmOqA
         kgcA==
X-Forwarded-Encrypted: i=1; AFNElJ90BYw9Tggm7ilux0nFVKItRcqV/KvLd60LhmMBVll0b+ahbN27o8IhznNbTlG198ygAyIJII9+g7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPxbo5F44rsYVqPH48mcRdlu/tMqtNyFySUf5O4Lw6N4PbYhe
	RMiIPlDFUn/VZ2iySN2PKV+qn6D3ReYLW2p5m3MKH2rw2lbFNdGG44Vy
X-Gm-Gg: AeBDieu0UwOFaK4YMWcPGn7LsQKR14XG36iUyOpK+riXf1XHHboF4RuPWi8n5FFfjaU
	5F99I9ZRnDanl3S+WhefLkIFwCqXuA5Y7ysJBLH0iFu80mwttK5i2Pme9YjyXN96LgSwDmARvnB
	/OmohwWAx5wb3EQwpyrpLTWnCfHPltpGP57SKAYD0fI6GyV6+OrXZNI/gSpg1yyuZIBNrO0hfOI
	vhMZts2fwl3a1LNESizKsJosjA6fgHbt+6kRPAvfLJkVfD8pfM396DiBvfDHOS3SmbZEXdM2Gyx
	cFUGeRwEtBxY/mIRVWrY4bPSLXQR51Ej73Zm0wB4wTffIbJt+bAvpFCjtfFhnO0Mfs3PlcR/YGo
	olkoHfbb+t3zCeiWaRNqEFzSJEtMPRVktpOmu8A1NNlsaOQwJQpqdM303o2ETpDdGFdg2fn0fan
	8vFIjJd5AoELj7s5HC5BvCfZKQ3jGvkZCizZxpliE3g5fukcQqLNoGC1U=
X-Received: by 2002:a05:6870:c188:b0:42d:8229:ba3d with SMTP id 586e51a60fabf-434d0d61313mr2042459fac.11.1777995574917;
        Tue, 05 May 2026 08:39:34 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434549540b2sm14234808fac.6.2026.05.05.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:39:34 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com,
	haowenchao22@gmail.com
Subject: [PATCH v6 17/22] swapfile: remove zeromap bitmap
Date: Tue,  5 May 2026 08:38:46 -0700
Message-ID: <20260505153854.1612033-18-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260505153854.1612033-1-nphamcs@gmail.com>
References: <20260505153854.1612033-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero swap entries are now treated as a separate, decoupled backend in
the virtual swap layer. The zeromap bitmap of physical swapfile is no
longer used - remove it. This does not have any behavioral change, and
save 1 bit per swap page in terms of memory overhead.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 30 +++++-------------------------
 2 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 12dd9621b637..4d152fa811f2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -260,7 +260,6 @@ struct swap_info_struct {
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* extent of the swap_map */
 	unsigned char *swap_map;	/* vmalloc'ed array of usage counts */
-	unsigned long *zeromap;		/* kvmalloc'ed bitmap to track zero pages */
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index c6a91c657877..ce1254733e96 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2276,8 +2276,7 @@ static int setup_swap_extents(struct swap_info_struct *sis, sector_t *span)
 
 static void setup_swap_info(struct swap_info_struct *si, int prio,
 			    unsigned char *swap_map,
-			    struct swap_cluster_info *cluster_info,
-			    unsigned long *zeromap)
+			    struct swap_cluster_info *cluster_info)
 {
 	si->prio = prio;
 	/*
@@ -2288,7 +2287,6 @@ static void setup_swap_info(struct swap_info_struct *si, int prio,
 	si->avail_list.prio = -si->prio;
 	si->swap_map = swap_map;
 	si->cluster_info = cluster_info;
-	si->zeromap = zeromap;
 }
 
 static void _enable_swap_info(struct swap_info_struct *si)
@@ -2306,12 +2304,11 @@ static void _enable_swap_info(struct swap_info_struct *si)
 
 static void enable_swap_info(struct swap_info_struct *si, int prio,
 				unsigned char *swap_map,
-				struct swap_cluster_info *cluster_info,
-				unsigned long *zeromap)
+				struct swap_cluster_info *cluster_info)
 {
 	spin_lock(&swap_lock);
 	spin_lock(&si->lock);
-	setup_swap_info(si, prio, swap_map, cluster_info, zeromap);
+	setup_swap_info(si, prio, swap_map, cluster_info);
 	spin_unlock(&si->lock);
 	spin_unlock(&swap_lock);
 	/*
@@ -2329,7 +2326,7 @@ static void reinsert_swap_info(struct swap_info_struct *si)
 {
 	spin_lock(&swap_lock);
 	spin_lock(&si->lock);
-	setup_swap_info(si, si->prio, si->swap_map, si->cluster_info, si->zeromap);
+	setup_swap_info(si, si->prio, si->swap_map, si->cluster_info);
 	_enable_swap_info(si);
 	spin_unlock(&si->lock);
 	spin_unlock(&swap_lock);
@@ -2400,7 +2397,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
 	unsigned char *swap_map;
-	unsigned long *zeromap;
 	struct swap_cluster_info *cluster_info;
 	struct file *swap_file, *victim;
 	struct address_space *mapping;
@@ -2495,8 +2491,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	p->swap_file = NULL;
 	swap_map = p->swap_map;
 	p->swap_map = NULL;
-	zeromap = p->zeromap;
-	p->zeromap = NULL;
 	maxpages = p->max;
 	cluster_info = p->cluster_info;
 	p->max = 0;
@@ -2508,7 +2502,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	vfree(swap_map);
-	kvfree(zeromap);
 	free_cluster_info(cluster_info, maxpages);
 
 	inode = mapping->host;
@@ -2972,7 +2965,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	sector_t span;
 	unsigned long maxpages;
 	unsigned char *swap_map = NULL;
-	unsigned long *zeromap = NULL;
 	struct swap_cluster_info *cluster_info = NULL;
 	struct folio *folio = NULL;
 	struct inode *inode = NULL;
@@ -3078,17 +3070,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (error)
 		goto bad_swap_unlock_inode;
 
-	/*
-	 * Use kvmalloc_array instead of bitmap_zalloc as the allocation order might
-	 * be above MAX_PAGE_ORDER incase of a large swap file.
-	 */
-	zeromap = kvmalloc_array(BITS_TO_LONGS(maxpages), sizeof(long),
-				    GFP_KERNEL | __GFP_ZERO);
-	if (!zeromap) {
-		error = -ENOMEM;
-		goto bad_swap_unlock_inode;
-	}
-
 	if (si->bdev && bdev_stable_writes(si->bdev))
 		si->flags |= SWP_STABLE_WRITES;
 
@@ -3155,7 +3136,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	prio = DEF_SWAP_PRIO;
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
-	enable_swap_info(si, prio, swap_map, cluster_info, zeromap);
+	enable_swap_info(si, prio, swap_map, cluster_info);
 
 	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
@@ -3183,7 +3164,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->flags = 0;
 	spin_unlock(&swap_lock);
 	vfree(swap_map);
-	kvfree(zeromap);
 	if (cluster_info)
 		free_cluster_info(cluster_info, maxpages);
 	if (inced_nr_rotate_swap)
-- 
2.52.0

