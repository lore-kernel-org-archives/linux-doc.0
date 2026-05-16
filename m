Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564E37C11B
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965457; cv=none; b=CnFbpB9zC5OeOFBxwovVupm/YblJZRJVy77rs4iukYA587P+ijDfiEo60o9OD2iDLcTfemuSRfcoAk0G2reFlcdceGtXuos0c0ONba4owTwT/09MFMJQj2C+VEHlouTTUCYU8u6iI5s0i4McjEzEZp4AycBwrNkXpIQZK4DJirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965457; c=relaxed/simple;
	bh=suVlmThmLOSeu54xK5SymaNpAeUN5cZJpWPOhRRKbjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eQ8U6rirrVgVLWV6vHGNdUiDZFRwrVjfWYzYIIlCpxkpqoFtKD8sWq5nhZAzgUef5W1Y0v1hd86Q7p44pNxL4TcrHNJKhGR8+mcSXT5zo7HEUoL7zDXRttKo47sq6/y0vx617Y3HB86YpCuSOWX2oN2Ku7kabEanYtyNGUaAPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMlU6PXe; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMlU6PXe"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-7bb0d18c7f9so4155987b3.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965453; x=1779570253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGoieryUDtogh5w/DQ0mDHeFWPd+g3z7hodtgl9YwHU=;
        b=sMlU6PXewrPbwoTHIo7YnyFrz3N4Pe6k3cqaMdkLukovsB4jFWkLoT2jQnckqzlAic
         FEeb8InzNM8mLtiueFPo+wCOAyRD9T0AlNPEbRvALgARn+Q/RqAF9CsVJBvjD40MakwC
         SS6i8XSdVDuPiF10kP8l3CwRKYwXxI1PGqvKC4RLeGzi/rolhbvnZQxw7qbR8AsdYkbA
         UrgUa1YtaFSkLSC5w5Hs6H/icEdrvPnuQ7HO1wXRFy884vngkHrcSAvCCR/yfjJALYUj
         0K4xbHUP6ckS3/TxVIlLZ3eqH2lXLwyLXlCNMpj0cVwnxhSTKteOCj67c8l79ws1+jTG
         1Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965453; x=1779570253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fGoieryUDtogh5w/DQ0mDHeFWPd+g3z7hodtgl9YwHU=;
        b=rwXGqn/1Et3OG9CmA1aOJSiLAJnwmC9egwv1Ek5Fg3RNTnRYYHF/pC+JPJHb8V3rNt
         EZh06O94UJNcU3GI7uyaAfEJ0upDVFvkMPUsRhAEI8wJZzm03+lMrT3vnKYpJHBG19G6
         Rq2yyRyq/XwA7hJlWYyrZGwDlWYMF57/WGaOkBLWszps9fqadrglBGiFmCRTDJ3D2gSN
         R+aL2bTQTOHv1NKLrLq0nJE/e6qm8NZIcrDm12JyK45v9fBzvU7gThxkD2JV/R7KBtzQ
         rMuItdBDWuuKHmLdRHH1gyo1Y24EE8eTaxjyzzy/9gs8b9BD+kIagMVl5q0TBQzdxLPV
         togA==
X-Forwarded-Encrypted: i=1; AFNElJ/pmZeaLSkKhvZxZH40rZhvPv4qDwC2hISgu+J4V7lZSciKRHnOcAL/LfmV6uniXt6n8XFalV46rYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwELre34gvQ76XlWHdaEaX0FdCQnlf052HeUKKhp+JRXQVu2r9M
	xzhMgOX9sw/gCCfYmrjHHLYO30wnE+tOun5MGWndnKAeeC4ginN1Z94=
X-Gm-Gg: Acq92OENPXIWFute1nK8DJSvy59/lspcEVpKJ54WPPmdXzouF8kS/sxFFYXFDSJ0W9b
	Du8SmK2rVItAPEH1p4uXBYuG6SjrqYvumKHCFgzBGKNGAHkxhNLWIlwkK4F/jNXcv7Tmwd8+KBR
	JDMy0/Y9cAR/Nadu8e2n9c5Wqw4aWvl1+U2wV95bq9Vf/9rigC49dBbRJcPPbc/VAKTCpaE7zLP
	ZfJXxyU3q+6zylQU1KHMfKW+WNXt8gzjGOGI/7LjrfRZm4dNY8mqPF8bYP93cukGLI2Ak2992vr
	kuTHcNBtwJ1+YApxHzfe+fUc0HZOjerrQLkN2pRmdJo7MDoCmQFXN4j9DAwCvGF5Sy7ZeuUhdZu
	BL9VAlx0xwPTe7ykTL/Jq77BZYdg2eN57+i6PHfBG+OZSCs+pmdLbV/8XEbtvn6lrtFSgZ/acDZ
	VSba3RmA3L0H3Iz4BNKB+pLrHwwAV26W3KFj29+gbHwiTbFD6KC7nX18Y7P60mtbeESNizP26Pd
	Q==
X-Received: by 2002:a05:690c:e4d7:b0:7a0:4146:6eda with SMTP id 00721157ae682-7c959b8ebabmr94328007b3.20.1778965452710;
        Sat, 16 May 2026 14:04:12 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55bca95sm47468617b3.39.2026.05.16.14.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:11 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 5/5] mm/damon/paddr: add time budget to migration page walk
Date: Sat, 16 May 2026 14:03:57 -0700
Message-ID: <20260516210357.2247-6-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516210357.2247-1-ravis.opensrc@gmail.com>
References: <20260516210357.2247-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On populated physical address ranges the pageblock skip optimization
alone is insufficient — most pageblocks contain at least one allocated
page, so the walk still iterates millions of PFNs.

Add a 100ms wall-clock time budget to damon_pa_migrate().  Once the
deadline is reached, the walk breaks out and migrates whatever folios
have been collected so far.

The time check is amortized by only calling ktime_get() every 4096
pages (~16MB of address space), adding negligible overhead to the
fast path.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/paddr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index e844c990987b9..a2565287bc10f 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -14,6 +14,7 @@
 #include <linux/swap.h>
 #include <linux/memory-tiers.h>
 #include <linux/mm_inline.h>
+#include <linux/ktime.h>
 
 #include "../internal.h"
 #include "ops-common.h"
@@ -254,6 +255,14 @@ static unsigned long damon_pa_deactivate_pages(struct damon_region *r,
 	return damon_pa_de_activate(r, addr_unit, s, false, sz_filter_passed);
 }
 
+/* Maximum wall-clock time to spend in a single migration walk (ns) */
+#define DAMON_PA_MIGRATE_BUDGET_NS	(100 * NSEC_PER_MSEC)
+
+/* Check the time budget every 4096 pages (~16MB) to amortize ktime_get(). */
+#define DAMON_PA_MIGRATE_TIME_CHECK_PAGES	4096
+#define DAMON_PA_MIGRATE_TIME_CHECK_MASK	\
+	(DAMON_PA_MIGRATE_TIME_CHECK_PAGES - 1)
+
 static unsigned long damon_pa_migrate(struct damon_region *r,
 		unsigned long addr_unit, struct damos *s,
 		unsigned long *sz_filter_passed)
@@ -262,6 +271,7 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
 	LIST_HEAD(folio_list);
 	struct folio *folio = NULL;
 	unsigned long pfn;
+	ktime_t deadline = ktime_add_ns(ktime_get(), DAMON_PA_MIGRATE_BUDGET_NS);
 
 	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
 	end = damon_pa_phys_addr(r->ar.end, addr_unit);
@@ -283,6 +293,11 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
 			}
 		}
 
+		/* Time budget: keep kdamond responsive on long migration walks. */
+		if (!(pfn & DAMON_PA_MIGRATE_TIME_CHECK_MASK) &&
+		    ktime_after(ktime_get(), deadline))
+			break;
+
 		folio = damon_get_folio(pfn);
 		if (damon_pa_invalid_damos_folio(folio, s)) {
 			addr += PAGE_SIZE;
-- 
2.43.0

