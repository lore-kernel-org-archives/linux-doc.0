Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640214;
	b=u9+vF71FtVmZ9JAyw3NUCH6y6FgACSrbq1WBCh0DwvDqcdl+mV79czi0/itL3KEWh+a2
	 qXnvZmTXrZ6qEUChGmS82NXUEwDvG6E4PVXsN8ELohvctqtjEv7QsJK/r7UugOcWn2Isg
	 7w1xMOPgOirvrlHYFecLu7oqeaK3cy4WKByBad7mVm+MeCdUohouPt9bCoVe7lV9aIBVH
	 JgR6F+guMH2ZXnX/8ZxV2Lbf+XyBb3W25DtXEjtiSf9i9Cl6R3j8K2R75TgF3nIBYT9Qh
	 6rN/QsmBJ5cSPK0UGqcos71qdU35nXUP+4ubbfDe2DF0MwW9dinr5ZBGL2CdbBIkLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
	b=CqVUp3XJxinJirDyW9i3PlqOXx90Rh4yYgIT54Bp5kHSz0kNsG+zuYigaD8Dk4X6ZN7x
	 Sc8G3W6FX0sQPxi6CKL9Lq7rLDbT++ECxaCT/cVw+fXfoc8oYSHqp0ui5StmOHU6W6kRv
	 uQoHGZowRVe4XQsgtH54JtSRAhDgW4p0wJAYhMghm1hwQyk6j6qLgTB8FvgZcWnvwSq4d
	 +yO3+NJiKYbIsnBHcb8ThpBABSuT64pAoFP4LGOicXfOcSImzCvynbQfZtTHleysJKB8X
	 rJ2bZI8C9ArbSln0Z6AiK0KdKpuTC8B62SMYooM6/RAH7dCJ6/fJy02gExKdf9mLRmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=deoAJpuv;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1B60A260C
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F1B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=deoAJpuv
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94962d80d34so26213685a.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640213; x=1795245013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
        b=deoAJpuvk5/EHzr+FRoWKty8TA+vc+0SUXmTiCKtNa4uUcimyE81R96fWgRz7/nC7/
         nxOrejc2E0NpG+giC4B/bA9RN9+l3poG1jjFyoVlP+tK1N4FUjhnopETAblwvEegsWoC
         N2vrbbw0sLOK+/H4lTrzKguByBIJzuZwK7nM3cHZBJXYMU6oG+tKG62dAlm+3g1Cg81f
         VstGy/u/BNv0z/ag+mwjSrVmjQoyz5R+W7jxdvdz9gY8a6SZa7GWQvZDoyMKi60knIWj
         bNNh1qF23hvGxiMH1MoODeCtKNf/Hnaz6wjOCTAeFWZ3TQbm8zBv4b+McPCHHjOM7T2S
         JqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640213; x=1795245013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
        b=gyJvmCr8CwEgn2ECrxI9vaM83IEUhQvGAChG+AsNgU9Y523QB/I7k4XwhzPG9Up/cY
         gqtpBW/sg6vxTch+S4YP7axnyDuxLwKI5nLyGtbfQXaIvaSxX7a7HxFOQIM6/eNPz//Q
         kVX5ccplpc+/WRzyMQGv2eT50bUKaylULrRCUJaQHkMqvav12E9TGdDZRjeQiB4u5fQ7
         9RmX8/L7hIWI4VBkv6dS5UjJvHs64QtL0BBmLaxj7bSGLF+NExxVVaAQagDhZVEMH/5Q
         Vi56+YIByap9G5hi3bb81yVfd4+TLI2Zgp545wcm/W2K/wI47L8MNXcp4BzUMkbkhiRy
         fzfA==
X-Forwarded-Encrypted: i=1; AL+hErFm8t0XYd6hfBBmBRObxSuX/s9MnEjCCw/EbIanx9bb/PG6HDlS153Ut8OiEsep22SJRjS9VDUMylk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ux0+U1jfa2awudaoM/x93oZIqKrOjzw0DJ60AI1AM417efsPH
	do4FmRJnoANwTplwq4lcm2Y9ZdFrCq4wTUwwqlLEByk/skH8pMCq4BJHoR84hybTVzo=
X-Gm-Gg: AYBFou3GLnksfWxmP1MHW9qTutqV5iGOx0Y+vudwffF/4QXvMTtLtF2+FJFqCj6oZbH
	r9NaKaWB0HSYl+Ys186IvwW8D629HAvGwF8/AsLOD9r1XZfIWhHGOZumc5RU1PmAT4fn9CNG/L/
	n6iVprUXAjy4Zbf5ePr2UBgzUc7TEDIztsF0JS1d3M48D3k7p6BN2ysicGypHpDAg1l8D/gXgh3
	S3GXsYSrMKRjiS3QBq+RuYAsEy49CZXwOT0dqYouEAfltmLjk16G5kZpVRhlrpYNl0G/UE2fQOV
	E2K4psb8OWUVtSsWSqlhAtEA0h5PKNc56p0kC0NqLM4efLES1XhZ5EmXlwEk6xdRD3hF6yxWTCJ
	TUuYzdvr51CZFLbvAPev5Vt+nT/SFH0AxfBmTs6751AlSjC7rEg9j2UBCb7A8UANmBHslyOPa2/
	B9rVAmK44Fqnww4/o3sou7+BqbWXnFtEeIqbvftjWs8bVpukUYdphu7SVhnSLp7nSIZQVNY+MR0
	MzIVJuM2pGpCnzu8lnHvXl2pN+4xX86o4PnYagI/jx0/H3yoUlr2bull/hgXbGNhfpeiP/444a9
	BQkzMusNBD/bdPAOM1M1plUmNHa7jB60pXRSAntbnEpLcLJKwuHy/B1H+8+MRs+uEI9k9cXbxHs
	WSvCy8AKCS+TZvBg=
X-Received: by 2002:a05:620a:7087:b0:949:402b:f18e with SMTP id af79cd13be357-9494bc7e777mr835710585a.66.1794640213010;
        Fri, 13 Nov 2026 23:10:13 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:12 -0800 (PST)
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
Subject: [PATCH 04/22] mm/page_alloc: build zonelists from common memory
Date: Sat, 14 Nov 2026 02:09:41 -0500
Message-ID: <20261114070959.3490008-5-gourry@gourry.net>
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

Zonelists decide which nodes an allocation can reach.

The fallback lists hold every node in N_MEMORY, and a node's
__GFP_THISNODE list holds its own zones whatever the node's state.

Ordinary allocations should reach only common (general purpose) memory.

Build the fallback zonelists from N_MEMORY_COMMON, and __GFP_THISNODE
zonelists only for a common node.

The build_local_zonelist() refactor lets use reuse the code to build
a local-only zonelist for nodes outside the N_MEMORY_COMMON set later.

Every node with memory is common, and a memoryless node has no zones to
list, so the zonelists are unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6ffa972811462..580feeb608b7a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5906,17 +5906,14 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
 }
 
 
-/*
- * Build __GFP_THISNODE zonelists
- */
-static void build_thisnode_zonelists(pg_data_t *pgdat)
+/* Build a local-only zonelist when this node is eligible. */
+static void build_local_zonelist(pg_data_t *pgdat, int zlidx, bool eligible)
 {
-	struct zoneref *zonerefs;
-	int nr_zones;
+	struct zoneref *zonerefs =
+		pgdat->node_zonelists[zlidx]._zonerefs;
 
-	zonerefs = pgdat->node_zonelists[ZONELIST_NOFALLBACK]._zonerefs;
-	nr_zones = build_zonerefs_node(pgdat, zonerefs);
-	zonerefs += nr_zones;
+	if (eligible)
+		zonerefs += build_zonerefs_node(pgdat, zonerefs);
 	zonerefs->zone = NULL;
 	zonerefs->zone_idx = 0;
 }
@@ -5960,8 +5957,12 @@ static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
 
 static void build_zonelists(pg_data_t *pgdat)
 {
-	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
-	build_thisnode_zonelists(pgdat);
+	int nid = pgdat->node_id;
+
+	build_node_zonelist(pgdat, &node_states[N_MEMORY_COMMON],
+			    ZONELIST_FALLBACK);
+	build_local_zonelist(pgdat, ZONELIST_NOFALLBACK,
+			     node_state(nid, N_MEMORY_COMMON));
 }
 
 #ifdef CONFIG_HAVE_MEMORYLESS_NODES
-- 
2.53.1-Meta

