Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640244;
	b=BUgcJtoHGHrc41dvaGb47tRHZA8VMY1T1dZeFkUhQOqEGVkqGUO8vcSpONmZcimvS7C7
	 ZLXcP5szHP9ZsoIm174olUiSPHJnbG/cNJdqQm/Jil0jany7n9bKYP2LHNLhrfkhXqWgB
	 +vfT5JMn9C7E9fgqaV+t3mMdi1dipkS10/g7oo1nln18wI191U69/FImHFlE6U5BLbne2
	 F53qz3iJQzxz8QE6u5igRlx6R0a7En+FsPAFLk+C6WGPEkoV8Tr9T2Mo1EAyIt81ZDWPS
	 fYTZCDpM3FhBtZSyKr6C72jQ7goySzXDr0mtpHiPp5WYBkImJVhK/eW+JShPg45W9mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
	b=Hd3FWAYl0Y8BLOqm+Mb8gCRjrh9RGxCJni5cwf45UhJpHZWPWLOWQ66fUHypUfx4+6bA
	 XbvAAtA8IwngV6KgaDEno75WS4EG+6mKLoXupu7Q2jdjO/VHe1AB6Hd5OUHlK2hdc9xJL
	 ICP/IWeNbYlmpDN9ho5Xfrv4WMPLbDJrLRBRFUQ0Sp9M/rMiplI5696Z400LwGm2YZbAJ
	 ayMPClJzcxGnQ+qBnkOEMR+bHtWOetqAGP7TGuz6QviyHipUM0jeEPgzA0R+TidlU8hXD
	 eX2dsOVZRQq14LtJ+3uLTDrafC3PTuG8fGrLZVt/qmp5+HYyFpx+7sBX5+ZWk5s5XBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nYHBg8wX;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06AD606C0E1
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06AD606C0E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nYHBg8wX
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f332a4b2eso5816226d6.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640243; x=1795245043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
        b=nYHBg8wXg0qd2OLFeULJZyli7YFLsh+SFzWO7/iy4xXg2aPrsY9G1bQFvrVonOQERw
         aJvSir47vDAVcOgXfyYlBuf0S/W33PrQG26IQfhl+qNXU2KzfyzFtuWqKl3GekADzeHo
         f3OEdVAQ/VfmVo1riPrmlWvEzE4RXvsnxw8s6Waq+F5o/EZvtL4RgvH6N+X+EDg3nNwF
         ADDhjLO6m5evIpLDrNbPNg1ue+RdJAenZ34bGDvXtXkXkzaJ+Bgdqhq+877eIIeEC9CU
         ZVFYfcl2OalMDy77ozKSNndUYB0lOWbg/ZrCb9l9LNs8lgUX++ZjAjf15SyaMF68dMMD
         BPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640243; x=1795245043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
        b=wRcbLMvysLplocUgBbYJd6nbWscFnvF/sXMY9Xr7moPlgBTOjJ/buJniy5whdO+Ux3
         BB/l6jUWGgzUKybUOD2v41Zd/KnyPFkAN5386Q1+YTKIPe6ipdx6uQrsRvPLhPh75G8g
         tg9UDDOkhRT1sqhfk104uRf5PyFSFVXCmPArLCKDgft9wF3cWrKyJcL9nFyRtJg+b2lA
         ESffFNo8IaU8m38oyDQ0tUsOF8X4+fW1yrKVupxErcg9Ntijdn7cog+yJ6YJ9biYXZtU
         if8mEeaX+m3mIBjGa4j8UAYHHoAdzWbWe7r/baFDf+zkyL9QVmEE2NH10wjMKHuSlDY2
         jdzA==
X-Forwarded-Encrypted: i=1; AL+hErE0ehG3qm61QoqlaWvS+jqs96F0749GA2qhNpegi6n3AYbbebuRjNs1CnpLctwMKFBqD1KJmOuDVFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QkA3XCXoJ/EL17ddvZ4RxTieL2S+K6lzgH0/q89Y0c+HfI/pS
	HU1ppWZVD7TkzgF1Avkfrgw2fuFPqvrxkqgOj5qD8U+FyzRXhKWH/Oo9e3XarLpXK64=
X-Gm-Gg: AYBFou1kGX6MCG+2uOBdQj/+ou+aF9T/ZHZJ40dfCgpzJOTxRDh6ZVWCmkU0eKC7k6z
	UbLzft0VokvbUtOmv3Fa7Levl+qbWT0A2rjV6qrXFv8EvMsdgZ5c2kZ+YyC7wOd7h8xAjeAVasY
	4f3QyTpqlmHBp22OaJmKeGPOKmSvPVFwb29GycWVGmV50YjPzHmrNSf14oI/m6c93QtFEyq9g2S
	V7dlYSJoI60Uq2mBq4oZhTOcQx+dvDp2D/1DO4lhIgmsE3fCjEciFsKhBPzCxlabLc1YOplfu29
	kFpCCV//d6DzSiga1W8SGyjJVcekAarPwaNVihON6QfxuGSkicGK/Bsbewcev3BSGfBu8CmZl+M
	J7DinWFPcya13QFl3KXLKV2hb3upGCPWLrD0B75OBAnhX+QTsoesRnS7kr8bzIJsqawh7PrIa8m
	56GRFDeW4NNlJk1eNOq3f5VSJzxfBmgNkytCRr9PIyhDxk5hgQeb5PVwYqH1c6i/rnEkdPKW0R5
	EzAixnsJiIhO+Q6glkO+NYkOep42r8vaqw2W+E/nyxCsjMukEa4MaRH/dksIgq5n2ET2hcQKTBv
	BtIppY96mgeNa8ou0g++1M7hodgfpsvUTUGk0qSMbhalQEe3hkTX7thN37E9DR3EMgVVS1eXbEm
	K+4kMnzOxZj2Mt6Q=
X-Received: by 2002:a05:6214:8503:20b0:91f:1498:4e2b with SMTP id 6a1803df08f44-91f24194a18mr55953066d6.9.1794640242842;
        Fri, 13 Nov 2026 23:10:42 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:42 -0800 (PST)
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
Subject: [PATCH 18/22] mm/compaction: restrict compaction to common memory
Date: Sat, 14 Nov 2026 02:09:55 -0500
Message-ID: <20261114070959.3490008-19-gourry@gourry.net>
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

Compaction serves the ordinary allocation domain.

Restrict it to N_MEMORY_COMMON:
  - start kcompactd only on common nodes, at boot and hotplug.
  - walk only common zones in direct compaction and when deciding
    whether more reclaim could let compaction succeed.
  - compact only common nodes for /proc/sys/vm/compact_memory,
    and trigger proactive compaction only on common nodes.

The fallback zonelists hold only common memory, and all memory is common
at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/compaction.c     | 14 +++++++-------
 mm/memory_hotplug.c |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 426563acf7acf..6a40e1a9ba78c 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2496,8 +2496,8 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 	 * Make sure at least one zone would pass __compaction_suitable if we continue
 	 * retrying the reclaim.
 	 */
-	for_each_zone_zonelist_nodemask(zone, z, ac->zonelist,
-				ac->highest_zoneidx, ac->nodemask) {
+	for_each_zone_node_state(zone, z, ac->zonelist, ac->highest_zoneidx,
+				 ac->nodemask, N_MEMORY_COMMON) {
 		unsigned long available;
 
 		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
@@ -2855,8 +2855,8 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 	trace_mm_compaction_try_to_compact_pages(order, gfp_mask, prio);
 
 	/* Compact each zone in the list */
-	for_each_zone_zonelist_nodemask(zone, z, ac->zonelist,
-					ac->highest_zoneidx, ac->nodemask) {
+	for_each_zone_node_state(zone, z, ac->zonelist, ac->highest_zoneidx,
+				 ac->nodemask, N_MEMORY_COMMON) {
 		enum compact_result status;
 
 		if (cpusets_enabled() &&
@@ -2973,7 +2973,7 @@ static int compact_nodes(void)
 	/* Flush pending updates to the LRU lists */
 	lru_add_drain_all();
 
-	for_each_online_node(nid) {
+	for_each_node_state(nid, N_MEMORY_COMMON) {
 		ret = compact_node(NODE_DATA(nid), false);
 		if (ret)
 			return ret;
@@ -2992,7 +2992,7 @@ static int compaction_proactiveness_sysctl_handler(const struct ctl_table *table
 		return rc;
 
 	if (write && sysctl_compaction_proactiveness) {
-		for_each_online_node(nid) {
+		for_each_node_state(nid, N_MEMORY_COMMON) {
 			pg_data_t *pgdat = NODE_DATA(nid);
 
 			if (pgdat->proactive_compact_trigger)
@@ -3366,7 +3366,7 @@ static int __init kcompactd_init(void)
 {
 	int nid;
 
-	for_each_node_state(nid, N_MEMORY)
+	for_each_node_state(nid, N_MEMORY_COMMON)
 		kcompactd_run(nid);
 	register_sysctl_init("vm", vm_compaction);
 	return 0;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 410a29732bae7..c8ff60e6417ba 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1209,7 +1209,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	if (node_state(nid, N_MEMORY_COMMON))
 		kswapd_run(nid);
-	kcompactd_run(nid);
+	if (node_state(nid, N_MEMORY_COMMON))
+		kcompactd_run(nid);
 
 	if (node_arg.nid >= 0)
 		/* First memory added successfully. Notify consumers. */
-- 
2.53.1-Meta

