Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5139524F
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 04:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769144277; cv=none; b=GTEnIEUFzGbwtQ+o3OrT0S/q8GXWU0VwHnkoa6EApOWpO1gOGWM47xXfAhIlgEtucZwnriN2k3u8PhO66nr7wTO5/uxScuyUPyD3uF7p7bN2b/K1ZYmAf9Er7nsQQuj63zmZ1Ibt4DVfpvJDpVDmfml0DVZzrlbnyKThBXHbhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769144277; c=relaxed/simple;
	bh=REwnbFI5Ih419YIeGbeMhAV79Y8hP0BScdx6C3Cv9Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1QBMAnV2Jaw4pVl/ACYy9CpYvr5S1uBaQAv+CQTJwG/3p4Ca2NytCusCPuspXaO3S/ITY55w1gOMnzOrKgM0IBXfYLgnGM8Q64dginKDMUnKyAPE9UF/S8Ha9ZNX4hp/tu/iuHgw4ehZPKmrCNJQQrmv+xnMPtWYUWUCtLxn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K11H9JBe; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K11H9JBe"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-78fba1a1b1eso32223797b3.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 20:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769144267; x=1769749067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Hj3YMXyp6jb16WaA5iRCtpYS8eji7c2VCvrHXWtMA=;
        b=K11H9JBeVojbyntf6oi0fQt29BeZMje0EkD0VBnlE8yz+ZAwRXCdYrrXxbyi3itefJ
         5BRrQKFuvK6dtXEzYaDw3fGvvh/4cgptfHiiLM/604rXywivNDHwDQLhaIH8V1Wqi/9t
         eDg+qng07YeYfkerfVImV4KqNefkoQNa12/4zanX1jvTajKkS2En6GPMLlnbXkmNb7gl
         WhRQf2meFqXK+Mw3q2LU7XxksjK4hQgpgu5UDIC1aI07ORxrwFBOlLnLRuqQ24JS2WZo
         VsY5hQ7rpbiBaVFMu+kP1TTHyjN4bWtoE898VTeQI5sAE1yuO0ZmOjZttbBjwDknCPzW
         Uk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144267; x=1769749067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2Hj3YMXyp6jb16WaA5iRCtpYS8eji7c2VCvrHXWtMA=;
        b=wTnISMNTC+Jmp1ZlDEHhjBiH3DYPg1ZtE8C3/AsUwWgOYKjYOCiYzClFLNYMCqBIjN
         TVSNuXD7dmQg3vwu4KBaRnDIylYx7VVShCWl/lmpbwv0vDfPdkSQGS6GL8A/EeiAq4IN
         ztV/T1vr9XHrP1XB5Y9Qf5LxnsVeR8wBv9/DrzKRw0HWJ9vm+jl/UpjAHWVbyRb+Xz9W
         UPOgUYGVMOiLEMmfZYkcWW20D0XsTrkBw6zuq7vDVPfaLhbtHRM+qysBkxkYvxq1C+pl
         KwB+7A2qpg8bZ9aWx6zWnzC5ufHhod/fk3wcXx+n8MKXZd2UwHxlsFHZBYq3y65W6byW
         iyig==
X-Forwarded-Encrypted: i=1; AJvYcCVlmIcObcAtcLBsXSBniI8iDl8KgT29XVv0yVPIyQIvqO23LX5vzh/etz7IcjTFEq6XL0PpPtM2mhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztHo6qrbvIx6sEYhzjQ2lQrATn5fPj2ThGQ8LxCneT/6aXkVKx
	9SvE2CpHyPjtNWN4zuyfIasaTuj1MWO6cn86zb8BjW3Efi5Pf5/JUbI=
X-Gm-Gg: AZuq6aJiMAD23oC5c0TiQgKot77sumo7bF1QwyFj8ZK026pduQ3ujgcIjWcqIEpKIwT
	jnjJ7wUTmaq6T3+jYjOTV1uAK4yKJRpyTCTLEZ2nAD+35A5eyZ5tDw9aIOc/r0KJB/rAgrXO1uD
	GTUmecbxTExz2PkCG/QEdQLZ8eNCJ6iAk/Dad+4NZJ0DwlUDQeUveopkXW/Sizt16lQRpk6gf5s
	P+lDEjeAKri7sXbHJ/DSiSz6el07lfs1ISbcA/WH1wywDY4ZXOBnxtBe+WJWoZL+dPxZQqSF1nj
	uQ85I4Y8k2Ye/mr5ZLCRy23UGOeXPNN7Wm36LqdXC8R3SytKC1JV79QBd0ccgiQs3p1OHtsYtWe
	bcdUUw1haTQ2DvmFZEmyxYCYQ6M3XJdSrqKICFcQWvO8t1m5CCjFxZYWd4Yh35AP4cBEBBU0KsO
	vjpcWfwcDmilsAD99B/aSaPBtK5v2YndwOchzqAR+1AjWlSXs9hzBFtLPO4N4a+w==
X-Received: by 2002:a05:690c:688f:b0:794:1f46:79eb with SMTP id 00721157ae682-7942a70b7dcmr45404977b3.5.1769144267450;
        Thu, 22 Jan 2026 20:57:47 -0800 (PST)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943af14432sm6354717b3.8.2026.01.22.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:57:47 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH 4/5] mm/damon/paddr: capacity clamp and directional early-exit for node_sys_bp
Date: Thu, 22 Jan 2026 20:57:27 -0800
Message-ID: <20260123045733.6954-5-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123045733.6954-1-ravis.opensrc@gmail.com>
References: <20260123045733.6954-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clamp effective target to node capacity (bp) and skip in-migration if
the node already meets/exceeds it. This avoids oscillation and
unnecessary work in two-context DRAM/CXL setups when quota goals
(e.g., node_sys_bp) are met.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/paddr.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 30e4e5663dcb..64dbdd2196a5 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -300,10 +300,54 @@ static unsigned long damon_pa_deactivate_pages(struct damon_region *r,
 			sz_filter_passed);
 }
 
+static unsigned long damon_pa_node_capacity_bp(int nid)
+{
+	struct pglist_data *pgdat;
+	unsigned long sys_total = damon_pa_totalram_bytes();
+	unsigned long node_pages, node_total;
+
+	if (nid < 0 || !sys_total)
+		return 0;
+	pgdat = NODE_DATA(nid);
+	if (!pgdat)
+		return 0;
+	node_pages = pgdat->node_spanned_pages;
+	node_total = node_pages << PAGE_SHIFT;
+	return div64_u64((u64)node_total * 10000ULL, sys_total);
+}
+
 static unsigned long damon_pa_migrate(struct damon_region *r,
 		unsigned long addr_unit, struct damos *s,
 		unsigned long *sz_filter_passed)
 {
+	/*
+	 * Capacity clamp + directional early-exit for node_sys_bp goals:
+	 * If we are migrating INTO g->nid and the current bp for that node is
+	 * already >= min(target_bp, capacity_bp), skip work this interval.
+	 */
+	{
+		struct damos_quota_goal *g;
+
+		list_for_each_entry(g, &s->quota.goals, list) {
+			unsigned long cap_bp, effective_target_bp;
+
+			if (g->metric != DAMOS_QUOTA_NODE_SYS_BP)
+				continue;
+			if (g->nid < 0)
+				continue;
+
+			cap_bp = damon_pa_node_capacity_bp(g->nid);
+			if (!cap_bp)
+				break;
+
+			effective_target_bp = min(g->target_value, cap_bp);
+			if (s->target_nid == g->nid &&
+			    g->current_value >= effective_target_bp)
+				return 0;
+			break;
+		}
+	}
+
 	phys_addr_t addr, applied;
 	LIST_HEAD(folio_list);
 	struct folio *folio;
-- 
2.43.0

