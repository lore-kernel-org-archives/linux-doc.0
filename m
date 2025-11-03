Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E42C11EA
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156388; cv=none; b=gfuggJdbI1iPHp4cPEzoBc2xxiUKf6zge7woUoAx0i4VFmXPjFP1lFnKntSUzUtquyhbjst7Hg/3TVizCNKLCDlc13p/xNvfAuc91/wZUWUjYWp2i/jUNVqHG0og0H5+KmkOK9OGVp8NAl14h7ob9nuOUscJ3gZVG2JOQTBi8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156388; c=relaxed/simple;
	bh=XmQDlthpnpMTvEzwkFjfGJ/iooKFkhBQ7geY68RrYh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6l/iRffQennlGy4Di+1zlTAuyyMi49C5LhAQHJETlhKDnILSHP/Li5AWESQkcniAdAC1yXVE/QORqm4uJmqc+GG3N63M3jW4vCkWoBBB1K3yZcRv8YnPNFnLGcPQgLnBkntJybtUji/o2xD6QxfRBMXJgCmpbU3gDKTLMWryag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=isrfGv9n; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="isrfGv9n"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34003f73a05so4641771a91.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 23:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762156387; x=1762761187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ky+X/IaBSB0OFL72v+WlIKaOZyGxRoEyNHwdneD4KGU=;
        b=isrfGv9nyKlGgMjPIsRq5ngvRJI0AdihmR8Z290majg8XvmW57J2zNjBaLgiHuQWR+
         5I0vrpuvZA8Em84RYkijNaU1CspYuNSYrkUtWaGVPBAylPIHo6J/C38/CWw/j2H/vD2F
         pk6u0rmwtF2n9MJMNXNnYGgf8xT01N092W8/V4P62n3TYPBt1Dh6kK1Msq+NHEVhFLp3
         fQvimB0k/NOdiB2IegczFMQTw/LlOct5+NBLz9NgDg1EJttxqJCN+2p1YdxTrsf2pY+5
         8P79nQemwIlQdl+dmCy1QCO9+hT3mH2et6n3iCqJ9yO/xnO0rV6BGSAt64F9Fsum30XS
         R2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156387; x=1762761187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky+X/IaBSB0OFL72v+WlIKaOZyGxRoEyNHwdneD4KGU=;
        b=hc7i0+K46zUVFsHXYUJHms6ntWhCzHPAFKLQIX6wiWW5PdZnT8dm0on8uqtdQTBY2g
         0ADxiJpCOjKnpomes9CXhmExX6HE5mGbtUzrsWpRzkh9G99ZRYB8kG1DBT5Li2iovUC7
         rG32zZO80e8MOjQJxL0phGuUr5TRdOUJTJorNz6JucV0NgF06Mi9+yDLIJ96c/g/7cef
         voN2/QTA43cnuZlfGFPsQiboxz+T7MRxJP5bz3dndvSmmMDR2I0uoD9SCbgZ9eG1te7k
         m6knv8nXobcTUiYpQlNGCLeoqVNBtyKhDLZ2I5+f3d7cFfb/GP95HOR9nsNXkXwMZFHA
         98vw==
X-Forwarded-Encrypted: i=1; AJvYcCXPBMb7OXpbHl6z6dPx02rGMTEjFnihWZbN+ExhDC/fzk0PGc9vPxy/Y82+uh4BxkZ4/3NRwpYX75k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4+1DiLJ6VCM3Ll4b6AbVtOkpE036/RtISdgzrnmpPTaxDk0P
	XsOSkubweJ2ttPvMxAR4mXE0lZpD/60W7T1cPKcvN5yfuSgtcW8HYQT/kyrEGM4tvJg=
X-Gm-Gg: ASbGncsDcJXfew2Ex1plUk3aXxGD/gJxmdSqscgMsEw8YDktd51DwwVkDaP+Rx4kEGg
	6J6rQ1penXPvvrzqhhAAlQTIkjRpkVH+6ca7EMidDkRw/gHwW1GyuY9zmh/VVVeGYyE+TN7eq75
	5+KdRelCStAse7PTJGJaT/HdAWynIaMPaon/fB2e+Cc1YXWuCT3rTmJFufXQX9VtYXSO1K9I20U
	zbiQ6YZoGM4uYQExmB4WWyZyhXDZYD2je1Xl8eRydHR1bj+O4CQsg9mzi/zjlakim/826NkfpUM
	BTCheZ6l3mqKrRx69fDr7ul1mp5HdvWwEJWc7jKKGXsP4TK+6qTg0lqT6HuqFReh1nfXNcIvtel
	2fFt0EBKlSkJItSCmIN6tEHcpu8yANsEL1zU8LU4RNIOv8NgImgQYXFI3qZIr14ewclySqQT27e
	pX6mTnQwNLBO+rF2PZIAEFfEtWL9tOW0M9/Vs=
X-Google-Smtp-Source: AGHT+IEyO5cEySxDDsa5P6gc4+o8FeVcq4k+ABlDqETwxZQ5qkG9gowGljWIIRKONKOHt2sI5vETgQ==
X-Received: by 2002:a17:90a:d410:b0:340:b572:3b81 with SMTP id 98e67ed59e1d1-340b5723cf2mr10885892a91.11.1762156386624;
        Sun, 02 Nov 2025 23:53:06 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a16652sm34552a91.20.2025.11.02.23.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:53:06 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: stable@vger.kernel.org,
	greg@kroah.com
Cc: tj@kernel.org,
	lizefan.x@bytedance.com,
	hannes@cmpxchg.org,
	corbet@lwn.net,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeelb@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	lance.yang@linux.dev,
	leon.huangfu@shopee.com,
	shy828301@gmail.com,
	yosryahmed@google.com,
	sashal@kernel.org,
	vishal.moola@gmail.com,
	cerasuolodomenico@gmail.com,
	nphamcs@gmail.com,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH 6.6.y 2/7] mm: memcg: add per-memcg zswap writeback stat
Date: Mon,  3 Nov 2025 15:51:30 +0800
Message-ID: <20251103075135.20254-3-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251103075135.20254-1-leon.huangfu@shopee.com>
References: <20251103075135.20254-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>

[ Upstream commit 7108cc3f765cafd48a6a35f8add140beaecfa75b ]

Since zswap now writes back pages from memcg-specific LRUs, we now need a
new stat to show writebacks count for each memcg.

[nphamcs@gmail.com: rename ZSWP_WB to ZSWPWB]
  Link: https://lkml.kernel.org/r/20231205193307.2432803-1-nphamcs@gmail.com
Link: https://lkml.kernel.org/r/20231130194023.4102148-5-nphamcs@gmail.com
Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
Cc: Chris Li <chrisl@kernel.org>
Cc: Dan Streetman <ddstreet@ieee.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Seth Jennings <sjenning@redhat.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Leon Huang Fu <leon.huangfu@shopee.com>
---
 include/linux/vm_event_item.h | 1 +
 mm/memcontrol.c               | 1 +
 mm/vmstat.c                   | 1 +
 mm/zswap.c                    | 4 ++++
 4 files changed, 7 insertions(+)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 8abfa1240040..b61796a35d2b 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -145,6 +145,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #ifdef CONFIG_ZSWAP
 		ZSWPIN,
 		ZSWPOUT,
+		ZSWPWB,
 #endif
 #ifdef CONFIG_X86
 		DIRECT_MAP_LEVEL2_SPLIT,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c61c90ea72a4..03a984287e5b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -700,6 +700,7 @@ static const unsigned int memcg_vm_event_stat[] = {
 #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	ZSWPIN,
 	ZSWPOUT,
+	ZSWPWB,
 #endif
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	THP_FAULT_ALLOC,
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 57891697846b..3630c6e2bb41 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1397,6 +1397,7 @@ const char * const vmstat_text[] = {
 #ifdef CONFIG_ZSWAP
 	"zswpin",
 	"zswpout",
+	"zswpwb",
 #endif
 #ifdef CONFIG_X86
 	"direct_map_level2_splits",
diff --git a/mm/zswap.c b/mm/zswap.c
index 69681b9173fd..a3459440fc31 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -674,6 +674,10 @@ static int zswap_reclaim_entry(struct zswap_pool *pool)
 		goto put_unlock;
 	}

+	if (entry->objcg)
+		count_objcg_event(entry->objcg, ZSWPWB);
+
+	count_vm_event(ZSWPWB);
 	/*
 	 * Writeback started successfully, the page now belongs to the
 	 * swapcache. Drop the entry from zswap - unless invalidate already
--
2.50.1
