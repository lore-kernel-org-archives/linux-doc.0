Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F933933F5
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769144272; cv=none; b=lOL+mnDxjIHqPuFXBeND7h4jNjcgnpel2+kPwATeczypO6mhRhLTL8xn+VGCZhlm7WX3f4xPfzegRSRU9i04lP1O51k0IZs+6JHJKPpjQIRdJ50VN0Ir1p4X1Y4ZbbPAGxNAtR7oC0mLz/0mzlc+zjLmRrLjoFrc814UbYcKkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769144272; c=relaxed/simple;
	bh=LPrYTrwnUWZ7ytHBL5nCDH6LuVnTbfijgy57EHaTEFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5I5Q0cJQbGod/C7WesZ6BYVjX3Pf1Ky+7RKSAUyD15lp5yoSvAB+yQvm9OLS0IR99/UViyFbDv1gd1oLM1yAG6LT43Lp6rnyKXjah2xS1l8FPxUJH5f+k0iDVEgFm9U3prOiDOKiv9/W8wNqa9KXhwJNtnLhukVn3FGzrHgObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J687YmJ6; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J687YmJ6"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-78fb5764382so18751577b3.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769144264; x=1769749064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0i7a7403YgQyMlpi7E1tGdpNbWRUN7COl/lkLxdLS4=;
        b=J687YmJ6+mAWFyfu1hh12msny+kJzcEuUoiKoWfs8fOmOhmFjKnlEd7iWfGsDW5GMq
         yzZTuNF1bmp7nQ3wFaFLwewEjwYLhla+3zqbpkUU6DDenZ6mJV7CD5y+/YDySHpzs5Qu
         ghOoq6WgTA0RllUzPJsjgqfANAj+aBvue3JfaCRsilIHbnEf2tP/HvhSrNJ4kqdHzKnM
         6TQiSzuVCy33rOwXOUQGIuEmjWsW2upi5rPyXM2Vqod1OOFyxf+B2BGgioy3db8+xB/v
         Y+dZWkOnMgiCyrvzuuEQuczgMfyQHWao6To2XEK7bpLjMPONB2Gg76ULKEBf4tjYlnrp
         QFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144264; x=1769749064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0i7a7403YgQyMlpi7E1tGdpNbWRUN7COl/lkLxdLS4=;
        b=DWaQZEwNdTNIxS770R17jc5u2YP7S8vz8/2czzRLgm2FLekfmWbu2GuTwT5bnnc60z
         JGLKVEsfn2QwWb3/mhBMl/6MTsjSCGr8E9+Cybsg5PWkQ4RKhGw8s10PBIm38nKf/1Xp
         Ur2absZdfB0PhLMs+yXAnADNZUO+OEIB4yhs1Sws/6aXTV6NiBNzm7T3S/GUn34p4Z8G
         JG8CVLBKuNVOlpEqFofMvX55kP4zdQw74k5NA0qigZlAOVI5Nqctm2Von9uzSPMeJaC4
         TmeTlWD5xMqOJ2C6YN9ZzaiEB9lSTgAl970ysup4ElkOZKVFp7/NBIkWpgci5VIyH8Jv
         TofA==
X-Forwarded-Encrypted: i=1; AJvYcCXRgoNqmr0cIEOF3swB69CZTxmQjJh/QqJw0LPbsYZsPGV9dxJ42Tq8r+bMsVnp4mS1WLiCFjYOowk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9iD9qyPFxD1IkQf30tdRffP/rJg/wvyYs1A9Wq4z34Wqt5Qy
	VyuQ1aj3ha+FwKZnnuBgFi8zEOSGQiyqsD/alNpTYC3C4ZoiZUBz8ww=
X-Gm-Gg: AZuq6aJW9frIZDj80oAG3+aMt6NjSWv1D++6MHlsKABwzS0gUzz0eXOKpl0jD4Pn2F2
	TKyRUU2CwXmZz27mw0j0zUOXstS83T6HEpJn3xEdHZV6XNHYkueM3VfmiZHwrKqy1CooN8tL27w
	letwF2ZpQyFjhS3ZzAJR8QxU+7gllZMDzcA/Xv7AxplWR6iGTwlR+YD019lOKJzhOCRJbpLvUdM
	bjanX3QRc3CLTvo1ga9QknmdEJjHBDGR/bAAuaXpV0zCo3vq1y9S35Q/f5ZFPCVUUfvSZdiYAa9
	Y9tt7iRPrUYUNF2wgOJvP94txiOs3BVXa8V6Si07bypF8Uw5CO3enW1apkuv4ckXkoYdX7JEY6N
	USa8XXNu0fDnTxXbPDlztwnvw/FSr5+PxvCPdbDoRR+f4LY45GOmQKvYsBcQI5vXVcFytQf4ZVQ
	PruAYVjAnDu4JQMT8Q9G+U42WHrC55HTUN43FLiYA3MVNjo+w+JkmrUY65vuS3YA==
X-Received: by 2002:a05:690c:ed6:b0:787:b5ac:68e4 with SMTP id 00721157ae682-79440b4d2cbmr136867b3.48.1769144264173;
        Thu, 22 Jan 2026 20:57:44 -0800 (PST)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943af14163sm6332217b3.7.2026.01.22.20.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:57:43 -0800 (PST)
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
Subject: [RFC PATCH 2/5] mm/damon: add get_goal_metric() op and PA provider
Date: Thu, 22 Jan 2026 20:57:25 -0800
Message-ID: <20260123045733.6954-3-ravis.opensrc@gmail.com>
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

Introduce an optional damon_operations callback `get_goal_metric()`
that lets ops providers compute goal metrics requiring address-space
knowledge.

Provide a PA implementation that handles DAMOS_QUOTA_NODE_SYS_BP by
iterating the monitored PFN regions and attributing bytes to the
goal's nid.

Core remains generic and asks ops only when needed.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h |  3 +++
 mm/damon/paddr.c      | 58 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index ec5ed1a217fc..67233898c27c 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -649,6 +649,9 @@ struct damon_operations {
 	bool (*target_valid)(struct damon_target *t);
 	void (*cleanup_target)(struct damon_target *t);
 	void (*cleanup)(struct damon_ctx *context);
+	unsigned long (*get_goal_metric)(struct damon_ctx *ctx,
+				struct damos *scheme,
+				const struct damos_quota_goal *goal);
 };
 
 /*
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 07a8aead439e..30e4e5663dcb 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -14,6 +14,8 @@
 #include <linux/swap.h>
 #include <linux/memory-tiers.h>
 #include <linux/mm_inline.h>
+#include <linux/mm.h>
+#include <linux/mmzone.h>
 
 #include "../internal.h"
 #include "ops-common.h"
@@ -148,6 +150,48 @@ static bool damon_pa_invalid_damos_folio(struct folio *folio, struct damos *s)
 	return false;
 }
 
+/* System total RAM in bytes (denominator for bp computation) */
+static unsigned long damon_pa_totalram_bytes(void)
+{
+	return (unsigned long)totalram_pages() << PAGE_SHIFT;
+}
+
+/*
+ * Compute node-scoped system bp for PA contexts:
+ *   bp = (bytes attributed to goal->nid across monitored PA regions) /
+ *        (system total bytes) * 10000
+ */
+static unsigned long damon_pa_get_node_sys_bp(struct damon_ctx *ctx,
+					      struct damos *scheme,
+					      const struct damos_quota_goal *goal)
+{
+	int nid = goal ? goal->nid : -1;
+	unsigned long node_bytes = 0;
+	unsigned long total_bytes = damon_pa_totalram_bytes();
+	struct damon_target *t;
+	struct damon_region *r;
+
+	if (nid < 0 || !total_bytes)
+		return 0;
+
+	damon_for_each_target(t, ctx) {
+		damon_for_each_region(r, t) {
+			unsigned long start_pfn = r->ar.start >> PAGE_SHIFT;
+			unsigned long end_pfn   = r->ar.end   >> PAGE_SHIFT;
+			unsigned long pfn;
+
+			for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+				if (!pfn_valid(pfn))
+					continue;
+				if (page_to_nid(pfn_to_page(pfn)) == nid)
+					node_bytes += PAGE_SIZE;
+			}
+		}
+	}
+
+	return div64_u64((u64)node_bytes * 10000ULL, total_bytes);
+}
+
 static unsigned long damon_pa_pageout(struct damon_region *r,
 		unsigned long addr_unit, struct damos *s,
 		unsigned long *sz_filter_passed)
@@ -344,6 +388,19 @@ static unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
 	return 0;
 }
 
+/* Generic goal-metric provider for PA */
+static unsigned long damon_pa_get_goal_metric(struct damon_ctx *ctx,
+					       struct damos *scheme,
+					       const struct damos_quota_goal *goal)
+{
+	switch (goal ? goal->metric : -1) {
+	case DAMOS_QUOTA_NODE_SYS_BP:
+		return damon_pa_get_node_sys_bp(ctx, scheme, goal);
+	default:
+		return 0;
+	}
+}
+
 static int damon_pa_scheme_score(struct damon_ctx *context,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme)
@@ -378,6 +435,7 @@ static int __init damon_pa_initcall(void)
 		.cleanup = NULL,
 		.apply_scheme = damon_pa_apply_scheme,
 		.get_scheme_score = damon_pa_scheme_score,
+		.get_goal_metric = damon_pa_get_goal_metric,
 	};
 
 	return damon_register_ops(&ops);
-- 
2.43.0

