Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640210;
	b=LGkZZQHesuBkfYkQlR5ZwQXGjCId5gqFzTdZITgJja7Lnk338s9E05SfLyeKQC7C/s/D
	 P7xcY+hCaDi1v5cwQ2V7mgtf2jM/OjPjTCTzj65iAsCll5dMRxFkzdkMujp229AP1WElq
	 PWPE/P/2RDvD/SUHEnVdwLbBLLIAO8K52eqG5+0uw6ReobxKxvkPtQNFow9hHdttD+qiu
	 i7fbH1bNCoSMERHCApuVbB0kwVhxUMQZPjuMABS29K2ujiCWA1xzMgX7Y2wdfb0VPuPPJ
	 8GhGWQLvTvmp6n/HMzf5IpeyHNlGEhtOY9+LlDjBVwYUqZ3fyL79mYOmumAe9uCksEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
	b=WfjLVSQmjp/WQ2uRKY6gMwc3wpHobJUpPhEe+K6+7NFt4ntvRtPsVd0G1KqLcJYiBsXv
	 VmlEwfF1Z2Sqsp5cO9nSmNOy96n5FJe6GpLTWjGk0lDduZy5dLmgSk4l5j+sMC1QG6V3a
	 LUGlrFKO4owyLY6nMNZnrbbKRmUwDfDoX0ohD1CeXPuvqf+RCG73UjcPoDOuIQ4jw1NR2
	 IUQ9M3p3yuCe61yWn7UMFzuMDgyc4q2QEC2v68GbOruEJIhvsZRymrcWUk+cU9hy7VIaI
	 Tn943akvxkehNdxXtt9gr6c9JMLdZBtZwBmskb42P6I/uZaYs+a6PHxsey899Uph+zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=aVufzMF1;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CE606A8A7
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626CE606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=aVufzMF1
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ea5600c9cso37046556d6.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640209; x=1795245009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
        b=aVufzMF1ziuixYF2LwjyH7kreUYrlXQnpmHijWkoeW/lvqdaKolzkN+GuWEZ9Elxku
         RmQM/Qd0JknXCOcyFCsoSHle6c93jvb8DGPwDV82hDd+ity5CVzxo6dZ0JwnEVxsoijw
         l73/guNH+o32V7hOir1Y3NVrZQ9xH7aaOudDuml/feYSeQtX1VB/TBSXbWwRm1zVJ4eC
         4SRSkSm9RnIZsT0C3vyFyDFMvaxtRaYsG/xYd/+qSUNiNbPqs9XXNoyYeqSgIdZ/Bx/E
         u2s5+Pw6kq0V8ZrSXVzNReSYfzUzMeJUxU5+RedW1C1ra4crn5FfH525mKnVav04kDdc
         OjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640209; x=1795245009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
        b=hTtvG5Z/+nT0fNtMh5uiCaxaNxb3qPcPHje/wTZoa3ZYwYo5LZnz5fLRcZFkvHEtsr
         JVLzK8HWgEb+icUNCJgczrXEy3c7pAGrpsoadjw9W5Qi43TxpbBV+H7vwix0WgltJHwR
         cAwG+KlDkPma1Crrh/LCATBrLMsVmfOVL75LPcqYUgBbcF5Ju9AcQ5Li5sVtU9KbxPOn
         tQeFcnf05sUBtBbQ+Nx5xOQjFma+LbUD8MD1EMu5Im+8NCsrPlwQd0iXhMZ3XclALqQb
         JBZZBqgVrqz3f6qJjj+nMaQMcU+KyjqaleW5Kaw2Cnp5JTHjdln6EGFqcLRPXVcyy+Zm
         ElTw==
X-Forwarded-Encrypted: i=1; AL+hErFU/J9UhyOoMoGN9apAr9X3vxFrY+B1TjSThjqpsktf/gtyIECuONP1pCbqQ6+Zo8lnTmb9VsNpuFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dzHbbEnFPbaJEoFiNP+VsCN1y+I6LIrFe8gjDPsCz2Uc4Natf
	MLLEo6LRurhLuP0xDz0mHSOBRZ3HyZjARPfBg8nWu2MW7uYHXzrZPqwlmxQMmdRVTZY=
X-Gm-Gg: AYBFou3Yp5EkiSYXVG3Nn9q+VQXxd4ayeHAuXRKdQ2NlzO2hHGUfIxsmQvNUrACarpi
	sxzBTPUm3G6JbGPPoS8IoC/zHQKk63IVZOShw8QpAK5hIq3Z97IYbIC0xsRf+5APbAE7NBoDdzp
	KVmCm7WJbytWOeB2zK83Sh4fRmgoA4f+p7aXwjQyKbKFefXHhR9nPJY5sn6VfEUpn1CNNZrIOCU
	M9hq3+I+o6CSHVxjYTulak5yeBDhIBrb66RHcwPeg3AOS/bClrJ5wal0KyWeJFYyg34warrQMkU
	UY79z+wIVAn33GhEMvtxQs4Ya6iuHnggJL9Hdxxtst6UdhZOWtu5qeLfDxgDleBU6Za2K3Ox9KE
	1NrxCvJ9eUS9k4gmL2DbZyFkmNElT81OJcCFeVU9N3/PZZQvOYmDhHrwvzG9TkmqqUBpKYEi6aa
	SyBLY1q3nLIBF2dqn5d2METx3yohZzskjDXS33Je8JExQh6pL5LiWK/9lBmpR3iMa3R+e03dPHi
	lOctWZD6o4sYOQdYjQt0vKuAyfL6h37BoP7SwmY4rLb6BrzZNmehoqmHgl5Kj/i+QHpvb4jhiSM
	D5tG6JsF8pFwa0APb9p2h4OoQlULzYkWj9F1JSxla8u6DC6n0h4cr5kmnGE6YwgRCzyfDIfzbrO
	E9Atl1iePyKFAYX/X7U2bo3EvkmdA3gEFquCe
X-Received: by 2002:a05:6214:18f1:b0:91f:1a70:4b0c with SMTP id 6a1803df08f44-91f1a70a6famr79219716d6.4.1794640209017;
        Fri, 13 Nov 2026 23:10:09 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:08 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 02/22] mm: publish and clear node memory states via helpers
Date: Sat, 14 Nov 2026 02:09:39 -0500
Message-ID: <20261114070959.3490008-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

N_MEMORY, N_NORMAL_MEMORY and N_HIGH_MEMORY are set separately in
free_area_init(), check_for_memory() and online_pages(), and cleared
in offline_pages().

Centralize those updates in node_set/clear_memory_state().

Behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/internal.h       |  3 +++
 mm/memory_hotplug.c | 11 ++++-------
 mm/mm_init.c        | 14 ++++++--------
 mm/page_alloc.c     | 15 +++++++++++++++
 4 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0a..608a83c34c224 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -62,6 +62,9 @@ void lru_add_drain_cpu_zone(struct zone *zone);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
 
+void node_set_memory_state(int nid, bool high, bool normal);
+void node_clear_memory_state(int nid);
+
 /* mm/vmscan.c */
 unsigned long zone_reclaimable_pages(struct zone *zone);
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f04a248d8adaf..490f400498f14 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1184,14 +1184,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	online_pages_range(pfn, nr_pages);
 	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
 
-	if (node_arg.nid >= 0)
-		node_set_state(nid, N_MEMORY);
 	/*
-	 * Check whether we are adding normal memory to the node for the first
-	 * time.
+	 * Publish this node's memory states, including any newly-normal zone.
+	 * Hotplug never adds highmem.
 	 */
-	if (!node_state(nid, N_NORMAL_MEMORY) && zone_idx(zone) <= ZONE_NORMAL)
-		node_set_state(nid, N_NORMAL_MEMORY);
+	node_set_memory_state(nid, false, zone_idx(zone) <= ZONE_NORMAL);
 
 	if (need_zonelists_rebuild)
 		build_all_zonelists(NULL);
@@ -2146,7 +2143,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	 * list. Otherwise this node would still appear in the fallback lists.
 	 */
 	if (node_arg.nid >= 0)
-		node_clear_state(node, N_MEMORY);
+		node_clear_memory_state(node);
 	if (!populated_zone(zone)) {
 		zone_pcp_reset(zone);
 		build_all_zonelists(NULL);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index a9d848c92678b..b4c4dba93652d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1763,21 +1763,21 @@ static void __init free_area_init_node(int nid)
 	lru_gen_init_pgdat(pgdat);
 }
 
-/* Any regular or high memory on that node? */
+/* Publish the memory states of a node that has present pages. */
 static void __init check_for_memory(pg_data_t *pgdat)
 {
 	enum zone_type zone_type;
+	bool high = false, normal = false;
 
 	for (zone_type = 0; zone_type <= ZONE_MOVABLE - 1; zone_type++) {
 		struct zone *zone = &pgdat->node_zones[zone_type];
 		if (populated_zone(zone)) {
-			if (IS_ENABLED(CONFIG_HIGHMEM))
-				node_set_state(pgdat->node_id, N_HIGH_MEMORY);
-			if (zone_type <= ZONE_NORMAL)
-				node_set_state(pgdat->node_id, N_NORMAL_MEMORY);
+			high = IS_ENABLED(CONFIG_HIGHMEM);
+			normal = zone_type <= ZONE_NORMAL;
 			break;
 		}
 	}
+	node_set_memory_state(pgdat->node_id, high, normal);
 }
 
 #if MAX_NUMNODES > 1
@@ -1924,10 +1924,8 @@ static void __init free_area_init(void)
 		 *memory-less node. The pgdat will get fully initialized by
 		 *hotadd_init_pgdat() when memory is hotplugged into this node.
 		 */
-		if (pgdat->node_present_pages) {
-			node_set_state(nid, N_MEMORY);
+		if (pgdat->node_present_pages)
 			check_for_memory(pgdat);
-		}
 	}
 
 	calc_nr_kernel_pages();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8532af052d74b..834d199ff8429 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -208,6 +208,21 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 };
 EXPORT_SYMBOL(node_states);
 
+void __meminit node_set_memory_state(int nid, bool high, bool normal)
+{
+	node_set_state(nid, N_MEMORY);
+	if (high)
+		node_set_state(nid, N_HIGH_MEMORY);
+	if (normal)
+		node_set_state(nid, N_NORMAL_MEMORY);
+}
+
+void __meminit node_clear_memory_state(int nid)
+{
+	node_clear_state(nid, N_NORMAL_MEMORY);
+	node_clear_state(nid, N_MEMORY);
+}
+
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
-- 
2.53.1-Meta

