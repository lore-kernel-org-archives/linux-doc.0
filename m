Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640248;
	b=MGeYjj7iAwuitDXlQxZ4mxfcDqSj31MAjgOtReNoHNw3wafnW1081kujSli1UZUGwQ21
	 W1vGaM6dRQLPI+UYAUNFh5Mmkw8WbBCq+zD5izfhnACLlnH256ll1u1aaO34DP5/QLR3t
	 mtDlPuu+1d9+Sdd5i6DqlR3loO0CyqW7eJAi21mGhaPByiWR7H72XSSJ8Jp3a5OajqAll
	 vN6kpIStss5rku0zO5UltnO9B7jJ/+c4oOibxbXjVmc9GuVXetJkTkVjJF0osfyVDfg+3
	 ZmUcHFfK5scMISvkeO5gvUzlFC5o4WpTpjv3B9LPgLzpUGLJNKxuo0nTX2w9l6uGA+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
	b=uu/QNKWfiBGBxW6bPqK8+f1K9jY66hxbIEFziyYMhmIXjZSMjjFCZcArIkv316r3iHzL
	 mTSuUKU89jM2myppqKJ3HAipUeBO99bCpMbIfpUlJj8hSA+axNxZuarYiNQAkdinjf2Tq
	 v47N7ocandIolS4CTRoiOL/ZDVzZgsssbplb9Z43E68+zOl6phVwGOhquw8424cxasfZH
	 PaPWTHE2kBZQzQ9Ds0loE6rxSC0aJKQQVz4uUeBkU3PjpMRVOlN9oYxJOTA2OHFtLmnpG
	 LRzbhc2vBcODRf2+VR/NtEvA9wAcXMEVfmxYnM+MZ6lzBbM5aWoYJKW62x3HD3yhBnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=BLBdnt0i;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357FA60A380E
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357FA60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=BLBdnt0i
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c1f548f87so41262356d6.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640247; x=1795245047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=BLBdnt0iRNFdOZZN6B0cCDu/hXyt7k9PsSJY3QJCW3ekKrAX8pBPAbkT3WVRuWwYMw
         zSddppBa0D0C7Cm3/JDK/25sp4KjGdI2ObCcZ3l+uuVPtSgiCU952hXfESBUlw1mczJg
         KHLuORDxaFQGrfgG+HMb2PbJ8MbRDgOlPMNKfZQHAiNb7/kvjLe5uSwFHyHGL1c1Wn5u
         n/yf9bUliz7p0g7CF/tctqSCoW6EGDPz3Wmzti2CG/xreKkeI7Dz0p26HxXLxyI8SqoP
         jC1f5E71FBV3WJAhSXNNIB1HwWVEvPiiJHfQHn1hk40/DTFMdowDbXfXF0FkV7eRjWMi
         Jwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640247; x=1795245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=dt4n31pmPgC96uc95xbm174OkGAWO8/TuNry/UH0ciVQGCYmjtdIY10Nu4MDbYrs/G
         hF4tmlHXNoHwZZ8whA3dPfrzVawCMYC8ZJz5EVuZpgS5WJabHQIX0KhQJIgLOD/EBetK
         Rvi3tftvLynxy4qTZ31vKrmIpGctu0u3xa9rrAyW01+koZNZLoMYjqDE/QqobNXiW9MF
         pRE/9I4xJ0Rp2kGi/N4XNLVJVyZ01HwuJYcWnTfR7TwZ06wcXrMRCblL26OeTblc5IwS
         bQXLUcxuLOqgTRqZtvAi6FlWQdB0nwYc5V/eCH3exlgfIxJyKsm9ZoM9NDyrLvyPkblr
         /fbw==
X-Forwarded-Encrypted: i=1; AL+hErG3pgY4+TSJSJyvH94SiflX9XJZNOw/UEncgKnVTocdv465sC2wObJLJEoYdQvA9AdcdoFSGupNV5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAc+0Y4IE1gxVUDRmwJ1XG+XceLctr0sA10vVU4pADVwWaRsg
	ime9b0kE0SVJtcaYIPJlkAkgEH/jZBs8nkXAOdzoiWESb4fED7PhQSIG4JIn9+8waOM=
X-Gm-Gg: AYBFou2ZPeXkB11VKD6Vv19ac/9IFMIWBg5iBd8KktSSUItoTwkSU5dOeyU9N+znnyS
	hoDquQWZyOOejc7OfnGIgYoTDBPnPf/5WaNbZRLOf8P6StfzkPRDrIUpJNxwOJj707r0B2OXN3b
	4IE53EZM8k5hnLYrL0TY26qlnbbc/Yk7hf3+RCBCQZOJMXr7lf+ZWEodGgoCZaTtuGF4dWez/vp
	wvR0AV6jWE06tt2VKxMdk3ex8NCgpaXJMO25C4iKcRitt6VRsLBWzT+fXuozxvg+ePBCqHZbHba
	SvrNLNAB/0IjrdiSjN+WChgIaLunSue1GGYEhxvKUnFhicQJXTfMbvroBoByODMPPblR9CFL4Fd
	Ph2wxM1aYlixJJtl/BZiMKoYV5bPPmthVkeFfkyqZ+t9abOeDnUxBTtes9ZClAkgtg4+vsUhqgE
	OPm3FGQNvU1bRCX6kkAZoL6uoWsQOo0NTvyRsd/+eVrJdk599Xr1j9zOmgYbJ4UfUS6Ho8M4BvB
	f4y/sbq8O28brvrZgGegYiEhHabuoMzybvOXSTn7fmM8jsuYwUgnJPr3300oPz+sFuumfleSNdD
	FQMa6Bukv5S2oiaqn0U6UGkr/191cXkLhFd1v6SnbgOrPoI/SejGBMYhRMnk9aLFTum5OPefaBJ
	4FucZx/OmwMU5kpc=
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-9494bc76c5amr813866785a.68.1794640246800;
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
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
Subject: [PATCH 20/22] PM: hibernate: size the image from common memory
Date: Sat, 14 Nov 2026 02:09:57 -0500
Message-ID: <20261114070959.3490008-21-gourry@gourry.net>
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

hibernate_preallocate_memory() and enough_free_mem() count the free
pages of every populated zone as room for the hibernation image, but
the pages used to store the image can only come from common memory.

Count free pages only in zones on N_MEMORY_COMMON nodes.

The image metadata estimate is a separate sum.  The bitmaps track the
page frames, and every zone's frames are tracked (regardless of node),
so that sum still needs to be calculated for all populated zones.

Every node with memory is common, so hibernation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/power/snapshot.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index d5dba0e50b2eb..8aeb086a3fd3d 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1866,8 +1866,10 @@ int hibernate_preallocate_memory(void)
 	saveable += save_highmem;
 	highmem = save_highmem;
 	size = 0;
-	for_each_populated_zone(zone) {
+	for_each_populated_zone(zone)
 		size += snapshot_additional_pages(zone);
+	/* Image pages come from ordinary allocations. */
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (is_highmem(zone))
 			highmem += zone_page_state(zone, NR_FREE_PAGES);
 		else
@@ -2011,9 +2013,10 @@ static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
 	struct zone *zone;
 	unsigned int free = alloc_normal;
 
-	for_each_populated_zone(zone)
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (!is_highmem(zone))
 			free += zone_page_state(zone, NR_FREE_PAGES);
+	}
 
 	nr_pages += count_pages_for_highmem(nr_highmem);
 	pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
-- 
2.53.1-Meta

