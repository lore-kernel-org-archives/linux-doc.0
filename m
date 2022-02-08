Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC899C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 08:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349080AbiBHITf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349047AbiBHITc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:19:32 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A40C03FEC1
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:19:31 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id r4-20020a6b4404000000b00614d5a865f7so10875081ioa.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=nZedsI14s3V7shToTSZ5wS90MR6Uq3bP9RK0VBc9pM0=;
        b=qzt/m74UvXlhewwQ7oRVgOmqsV4cMauzgDfQ8398zF9KHGUlIv/NuygfZIwvKq65iv
         0gECfRaEVcw3lDIiDL3/C11Go+smIYjMHolSaqgGUjPeP3G7f/n/Uwu4/Q/9bFXLLat6
         Jr0q5+0MRtymhqjcNoGpUlBCM+imvqxsoJ1XtyRKmsep+53FA8z7JVDE2h4yDPWYaxvR
         u82iDbzM5ipH74BY4UmGissTkWpnp0Y6xN/XQ1UoZjRbF5JLecGSaGTtIhVohWmpEZZD
         oFz/kVVIh9xn5d91OMHqwDNU1eZiWP39QRxVpj2zagJOnDGB8n19XCaLfaUz9/qo21L+
         TIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=nZedsI14s3V7shToTSZ5wS90MR6Uq3bP9RK0VBc9pM0=;
        b=xnFGpav40tVrfxbutd7HG58maXIcewi+QWKBZHKMJ1Dc/O7WyJn3QvJOsB8tkgBEPr
         DTZGDUr34mY5a149FSpU5zivPY+HZNIYUa5VeNBleZeEkvQ+6FD7sgbJn6MpDgqRoc2H
         JuLPtui2cbIbSTPRWBIPtUG3juWUsBJT0nKY1wcES5CFOM3iq3iHJAP4yJttlsnL1xJS
         GRuJ6rRyau84hzZUY1piA3/6xzJ4yTFVXthE+Kfzluv6AiegROG930kyOVIMwjBIXW+A
         0CiD0NyOLYNwXY+igAhipAR6vcdJzpYW3iIOIJPLDY9YetjoVz6cltyeS6W4ghSLCcg5
         3hGw==
X-Gm-Message-State: AOAM531JPM2E9t2xY3XqKDh6TvhzUhtlI8KDtHx7lUAx4t51/mQHqIJU
        d7oikQ01pdMXBLe6QXhJVKUEOajDCfk=
X-Google-Smtp-Source: ABdhPJwzviVvsPV6/r3chYPkbDbXAI7qPreQ0Vfx54wnECEkxXyGos5wsROVRSZRvcnIKgMRSVW9hg1dbJQ=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
 (user=yuzhao job=sendgmr) by 2002:a92:1a49:: with SMTP id z9mr1768424ill.292.1644308371158;
 Tue, 08 Feb 2022 00:19:31 -0800 (PST)
Date:   Tue,  8 Feb 2022 01:18:53 -0700
In-Reply-To: <20220208081902.3550911-1-yuzhao@google.com>
Message-Id: <20220208081902.3550911-4-yuzhao@google.com>
Mime-Version: 1.0
References: <20220208081902.3550911-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v7 03/12] mm/vmscan.c: refactor shrink_node()
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch refactors shrink_node() to improve readability for the
upcoming changes to mm/vmscan.c.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
---
 mm/vmscan.c | 198 +++++++++++++++++++++++++++-------------------------
 1 file changed, 104 insertions(+), 94 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 090bfb605ecf..b7228b73e1b3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2716,6 +2716,109 @@ enum scan_balance {
 	SCAN_FILE,
 };
=20
+static void prepare_scan_count(pg_data_t *pgdat, struct scan_control *sc)
+{
+	unsigned long file;
+	struct lruvec *target_lruvec;
+
+	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
+
+	/*
+	 * Flush the memory cgroup stats, so that we read accurate per-memcg
+	 * lruvec stats for heuristics.
+	 */
+	mem_cgroup_flush_stats();
+
+	/*
+	 * Determine the scan balance between anon and file LRUs.
+	 */
+	spin_lock_irq(&target_lruvec->lru_lock);
+	sc->anon_cost =3D target_lruvec->anon_cost;
+	sc->file_cost =3D target_lruvec->file_cost;
+	spin_unlock_irq(&target_lruvec->lru_lock);
+
+	/*
+	 * Target desirable inactive:active list ratios for the anon
+	 * and file LRU lists.
+	 */
+	if (!sc->force_deactivate) {
+		unsigned long refaults;
+
+		refaults =3D lruvec_page_state(target_lruvec,
+				WORKINGSET_ACTIVATE_ANON);
+		if (refaults !=3D target_lruvec->refaults[0] ||
+			inactive_is_low(target_lruvec, LRU_INACTIVE_ANON))
+			sc->may_deactivate |=3D DEACTIVATE_ANON;
+		else
+			sc->may_deactivate &=3D ~DEACTIVATE_ANON;
+
+		/*
+		 * When refaults are being observed, it means a new
+		 * workingset is being established. Deactivate to get
+		 * rid of any stale active pages quickly.
+		 */
+		refaults =3D lruvec_page_state(target_lruvec,
+				WORKINGSET_ACTIVATE_FILE);
+		if (refaults !=3D target_lruvec->refaults[1] ||
+		    inactive_is_low(target_lruvec, LRU_INACTIVE_FILE))
+			sc->may_deactivate |=3D DEACTIVATE_FILE;
+		else
+			sc->may_deactivate &=3D ~DEACTIVATE_FILE;
+	} else
+		sc->may_deactivate =3D DEACTIVATE_ANON | DEACTIVATE_FILE;
+
+	/*
+	 * If we have plenty of inactive file pages that aren't
+	 * thrashing, try to reclaim those first before touching
+	 * anonymous pages.
+	 */
+	file =3D lruvec_page_state(target_lruvec, NR_INACTIVE_FILE);
+	if (file >> sc->priority && !(sc->may_deactivate & DEACTIVATE_FILE))
+		sc->cache_trim_mode =3D 1;
+	else
+		sc->cache_trim_mode =3D 0;
+
+	/*
+	 * Prevent the reclaimer from falling into the cache trap: as
+	 * cache pages start out inactive, every cache fault will tip
+	 * the scan balance towards the file LRU.  And as the file LRU
+	 * shrinks, so does the window for rotation from references.
+	 * This means we have a runaway feedback loop where a tiny
+	 * thrashing file LRU becomes infinitely more attractive than
+	 * anon pages.  Try to detect this based on file LRU size.
+	 */
+	if (!cgroup_reclaim(sc)) {
+		unsigned long total_high_wmark =3D 0;
+		unsigned long free, anon;
+		int z;
+
+		free =3D sum_zone_node_page_state(pgdat->node_id, NR_FREE_PAGES);
+		file =3D node_page_state(pgdat, NR_ACTIVE_FILE) +
+			   node_page_state(pgdat, NR_INACTIVE_FILE);
+
+		for (z =3D 0; z < MAX_NR_ZONES; z++) {
+			struct zone *zone =3D &pgdat->node_zones[z];
+
+			if (!managed_zone(zone))
+				continue;
+
+			total_high_wmark +=3D high_wmark_pages(zone);
+		}
+
+		/*
+		 * Consider anon: if that's low too, this isn't a
+		 * runaway file reclaim problem, but rather just
+		 * extreme pressure. Reclaim as per usual then.
+		 */
+		anon =3D node_page_state(pgdat, NR_INACTIVE_ANON);
+
+		sc->file_is_tiny =3D
+			file + free <=3D total_high_wmark &&
+			!(sc->may_deactivate & DEACTIVATE_ANON) &&
+			anon >> sc->priority;
+	}
+}
+
 /*
  * Determine how aggressively the anon and file LRU lists should be
  * scanned.  The relative value of each set of LRU lists is determined
@@ -3186,109 +3289,16 @@ static void shrink_node(pg_data_t *pgdat, struct s=
can_control *sc)
 	unsigned long nr_reclaimed, nr_scanned;
 	struct lruvec *target_lruvec;
 	bool reclaimable =3D false;
-	unsigned long file;
=20
 	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
=20
 again:
-	/*
-	 * Flush the memory cgroup stats, so that we read accurate per-memcg
-	 * lruvec stats for heuristics.
-	 */
-	mem_cgroup_flush_stats();
-
 	memset(&sc->nr, 0, sizeof(sc->nr));
=20
 	nr_reclaimed =3D sc->nr_reclaimed;
 	nr_scanned =3D sc->nr_scanned;
=20
-	/*
-	 * Determine the scan balance between anon and file LRUs.
-	 */
-	spin_lock_irq(&target_lruvec->lru_lock);
-	sc->anon_cost =3D target_lruvec->anon_cost;
-	sc->file_cost =3D target_lruvec->file_cost;
-	spin_unlock_irq(&target_lruvec->lru_lock);
-
-	/*
-	 * Target desirable inactive:active list ratios for the anon
-	 * and file LRU lists.
-	 */
-	if (!sc->force_deactivate) {
-		unsigned long refaults;
-
-		refaults =3D lruvec_page_state(target_lruvec,
-				WORKINGSET_ACTIVATE_ANON);
-		if (refaults !=3D target_lruvec->refaults[0] ||
-			inactive_is_low(target_lruvec, LRU_INACTIVE_ANON))
-			sc->may_deactivate |=3D DEACTIVATE_ANON;
-		else
-			sc->may_deactivate &=3D ~DEACTIVATE_ANON;
-
-		/*
-		 * When refaults are being observed, it means a new
-		 * workingset is being established. Deactivate to get
-		 * rid of any stale active pages quickly.
-		 */
-		refaults =3D lruvec_page_state(target_lruvec,
-				WORKINGSET_ACTIVATE_FILE);
-		if (refaults !=3D target_lruvec->refaults[1] ||
-		    inactive_is_low(target_lruvec, LRU_INACTIVE_FILE))
-			sc->may_deactivate |=3D DEACTIVATE_FILE;
-		else
-			sc->may_deactivate &=3D ~DEACTIVATE_FILE;
-	} else
-		sc->may_deactivate =3D DEACTIVATE_ANON | DEACTIVATE_FILE;
-
-	/*
-	 * If we have plenty of inactive file pages that aren't
-	 * thrashing, try to reclaim those first before touching
-	 * anonymous pages.
-	 */
-	file =3D lruvec_page_state(target_lruvec, NR_INACTIVE_FILE);
-	if (file >> sc->priority && !(sc->may_deactivate & DEACTIVATE_FILE))
-		sc->cache_trim_mode =3D 1;
-	else
-		sc->cache_trim_mode =3D 0;
-
-	/*
-	 * Prevent the reclaimer from falling into the cache trap: as
-	 * cache pages start out inactive, every cache fault will tip
-	 * the scan balance towards the file LRU.  And as the file LRU
-	 * shrinks, so does the window for rotation from references.
-	 * This means we have a runaway feedback loop where a tiny
-	 * thrashing file LRU becomes infinitely more attractive than
-	 * anon pages.  Try to detect this based on file LRU size.
-	 */
-	if (!cgroup_reclaim(sc)) {
-		unsigned long total_high_wmark =3D 0;
-		unsigned long free, anon;
-		int z;
-
-		free =3D sum_zone_node_page_state(pgdat->node_id, NR_FREE_PAGES);
-		file =3D node_page_state(pgdat, NR_ACTIVE_FILE) +
-			   node_page_state(pgdat, NR_INACTIVE_FILE);
-
-		for (z =3D 0; z < MAX_NR_ZONES; z++) {
-			struct zone *zone =3D &pgdat->node_zones[z];
-			if (!managed_zone(zone))
-				continue;
-
-			total_high_wmark +=3D high_wmark_pages(zone);
-		}
-
-		/*
-		 * Consider anon: if that's low too, this isn't a
-		 * runaway file reclaim problem, but rather just
-		 * extreme pressure. Reclaim as per usual then.
-		 */
-		anon =3D node_page_state(pgdat, NR_INACTIVE_ANON);
-
-		sc->file_is_tiny =3D
-			file + free <=3D total_high_wmark &&
-			!(sc->may_deactivate & DEACTIVATE_ANON) &&
-			anon >> sc->priority;
-	}
+	prepare_scan_count(pgdat, sc);
=20
 	shrink_node_memcgs(pgdat, sc);
=20
--=20
2.35.0.263.gb82422642f-goog

