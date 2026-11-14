Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640231;
	b=wXtO03Vfeyg0cK+98C2HXe8cPGJ7YsIDsC1r3XGEMcrY4EqHw3q5Fpo8QAV5HzFhpaX7
	 EP3i/sAEsf9WfdlKu9UWfl3VHJfd2HasdZ2cLRX9qsTVD+9nR7+9rsRnPhhiLDP+YiM57
	 h67pDEdK5UBadKK7tN6noaFfjjYF+bBXp8/pycXT0P7yuQGbUnUgByM2FqWBvqxtVo2Un
	 MAhoiO4WiY7gZCK+dTXpgPQlsoCgw/lGALlzS8W8EnsVk2l5FimL5DTyfSf+VPnhRYNFe
	 IN34wLMfm4eBybgQF9UBX50bNoW5rRTM7glLJugT/oUS+I5S3kFkbTs2NZpAIUIIfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
	b=Ua6DDqJlhd7D6E//R5g6vN8QKHrOKFx/B+4jud+vhZxln7D8QvVilN2MealwpIkULhht
	 rjn6/ndwVftcJRdAHZYOg68u1TaDQuZU1wRelnNMiaBD+zZXrwzI7Tv1BdxYx9lZNdnOb
	 8Egu0IMuoBMUwiFb4uWsAx35dbW/Vh87T9B7TLeVZgjXGN/Uo9Dcow7wZlxv8J0+9rSuT
	 u8OUP69wMVn8BhVI1Xhqm3kS5gR9P2Z5WOUMqMt1xaUBh+RfLqNV7FIGlmhKOFLtX+rty
	 abcxHIwnhEn9RC1NPA4ViftM3qTGhMvW1h5fGzxBD3RK+Vyx6UdTrAjc3lqtiBRp/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ThWtUYOE;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9960A6F5F
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE9960A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ThWtUYOE
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91f332a4b2eso5814506d6.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640229; x=1795245029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
        b=ThWtUYOE58bojETOwoiS6cs6qdiFDpgzkHXRgjHbjxmm/AONOSeugBbicD457oiBaL
         3kem8a/H1pX9d/FFkl6ik8me9yyXIiRnIWseOAR9CUTiE4gCSGTyPH8x2wcwHLj/wpFw
         av3lh3aajoSLB7WMBw7STl4nb8kBzWmr0i2io4kqZUGb4DyNf0T8SwNigv21OL7iKq1R
         2m3pPEnA/fZtCZtxcItt5v45X7mgSC073KBaThPkUuZU37zOufiZKj1oz/8Z616xJKwp
         LYaXfzMeVQbfL6BjgCt/OsbPS+4qNbVTjASn2JD5S6sxZNk5zXDYXfSbJpd1mUMa+WdL
         PAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640229; x=1795245029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
        b=SfJYsA1/P/VWDkJICNlb5SzzvnBX3DPkNDhHvqssq1oIPBO6LtyOExHoud2iFvVVaq
         bGCzSxVwPCEKKg4p1w/YRtGaRJ0LW1xSJ40v9jnwGA6gk4PW42RBBZUVhxdcAxzRmV8d
         Oq2JgbKvIifTMVPdEfol7WLZqZftoPPTsbs2vREfARH+FC+oaIbwJQNTS1V7saJFCkMh
         55tV6Wxs3cuOKhnM/osLG6UC1ZKgUJusE1EM6iTwu27gn+onOTOnV7NCAQUva9+p3h6P
         t2Hd4JOqKbpt0Q1+AitSY2WB3UGEML/YPxrjSJXMU3DZGN8dlUnMbwIbXA0O5NcIhvzN
         P7ig==
X-Forwarded-Encrypted: i=1; AL+hErG+qgrRSMYVVR6gRljTN4Xd88RJETot3UMF8TvtUuedU9J37GgSRuDVMu8y5lLBvpCtX0wzNuiZp/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gyq34kJpbRmXDBuRGZeF55THHQBmK73H9xBOURClR8xjcExjR
	VZ1kSt6OKrTVhDJvGX7gbaWcMBSI8B8jAQy1Ah2yel8OAl7Qm8kJRL55toXmZG/41U0=
X-Gm-Gg: AYBFou21X5Cd5a2ZjUrOTNVGU4nTZ1jaEPMIBrVtE5yUp4RazYdyl21kBgxLQeRKRz5
	/oFfnGkfKqDNnRhf+MyDtwPVuAMqaFr3+Uf/uhegcoxnazDjfcZZiu144Twdaly67d3tOUQUCnx
	xiaie8ufONikVnjvrEctNWqruqPoklLQm6dF3SZI70viFzX7JFwGncnzKCmpbZmCEAOnBmU9mqf
	7NIjFOdm7d4TouGRAEj2AmIesdxewCaOGEMAdB04MwEWcZuCeVpuoViwd5sbGcHwNyGWWP7sBP+
	bm1aTPzjpTlI2dpOQafUdDgh+p6qQdxyPXfo4qYI9SsJ9N9OD1D9OESjl1gd6n0P1OydWB7Zb9R
	Y/BFUlJhoGHBCBpyfnG4N3Zw6pNZoVWFUqP9zVvipF8FCVnhidfF6AavYL27+Rxd/WdeYn8Q7lt
	6NeW9ol5z5CTjqgfUX9FUmeMVRvFKBjaWay+K0Q1ZLgqBES/RU+1riR9CmJopMHE6i17g5MHL9G
	3g5eyvSEIaRPC4PDDKw3wr6Cam9hcxnjxZMSwoKIX8OqUVtQ7VX5C2C7ogFiLrwv4sRpKLh0gu+
	o1ZC2Cl7YA86Ub+5ND8yhhTR8+Lxs+lpddAlMfFAvSfDGGALxtj8hZgpLwW2dyRv7RtBZU2vYmK
	g5DwbWeM0WpIbw1A=
X-Received: by 2002:a05:620a:4005:b0:940:e34a:aead with SMTP id af79cd13be357-9494b9488f8mr838653885a.5.1794640229507;
        Fri, 13 Nov 2026 23:10:29 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:29 -0800 (PST)
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
Subject: [PATCH 12/22] mm/damon: restrict DAMON-native folio operations to common memory
Date: Sat, 14 Nov 2026 02:09:49 -0500
Message-ID: <20261114070959.3490008-13-gourry@gourry.net>
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

DAMON acquires folios to age them, check their accesses, and apply LRU
operations and migration. Treat these as general-purpose MM services
and restrict them to N_MEMORY_COMMON.

Memory outside N_MEMORY_COMMON can still hold ordinary LRU folios, so
it would pass the checks that keep ZONE_DEVICE memory out of these
operations.

Treat these folios like ZONE_DEVICE memory.

DAMON cannot acquire such a folio, so it never ages one and virtual
address monitoring reports it as accessed, and DAMOS cannot isolate
one for migration.

Reject migration destinations outside N_MEMORY_COMMON.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/damon/ops-common.c | 7 ++++---
 mm/damon/vaddr.c      | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index b9571f53e538c..51b4b5d572e77 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -17,8 +17,9 @@
 
 static bool damon_folio_acceptable(struct folio *folio, bool monitor)
 {
-	return folio_test_lru(folio) ||
-		(monitor && folio_test_hugetlb(folio));
+	return folio_is_common_memory(folio) &&
+		(folio_test_lru(folio) ||
+		 (monitor && folio_test_hugetlb(folio)));
 }
 
 /*
@@ -498,7 +499,7 @@ unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid)
 		return nr_migrated;
 
 	if (target_nid < 0 || target_nid >= MAX_NUMNODES ||
-			!node_state(target_nid, N_MEMORY)) {
+			!node_state(target_nid, N_MEMORY_COMMON)) {
 		damon_putback_folio_list(folio_list);
 		return nr_migrated;
 	}
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 1e65e7651cd98..338876559140b 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -830,7 +830,7 @@ static void damos_va_migrate_dests_add(struct folio *folio,
 	if (folio_nid(folio) == nid)
 		return;
 
-	if (!folio_isolate_lru(folio))
+	if (!folio_is_common_memory(folio) || !folio_isolate_lru(folio))
 		return;
 	node_stat_add_folio(folio, NR_ISOLATED_ANON +
 			folio_is_file_lru(folio));
-- 
2.53.1-Meta

