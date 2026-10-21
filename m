Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562624;
	b=5DcZs+NunNidkFMschyBZpTPR4m1pyLbChNH4Htsx5cwughoddxUoAbR+3G1/o5MdMt8
	 rEyRqoSGeeZsxGgp3FdR0scdfxmxPVL56CKOwXf3etVP6RBdJ0T9Awr7GhmozwBqST4+S
	 hdnKYm/+lbbHSz4s7vNBq348nSGNFCUOFwAj93W9pc/xs5lbW12Usl5P9MBAST2GgINjx
	 gRHoSrYkBgIe2abqsNL3/Wd9gZari5OTKtOoNMGPvN3mV7LvNoB1xUangh2E3sRoAq77l
	 ZPS3pcA74fYhSzM0bTjV3/wAs2jnHOatRTpm17M3G8fJ6Ev9gO8mZoXDDcMXU33Prdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
	b=zqRHEiQCcB4zw1262YCojOc+cKa0yNm0etsqsUvPYsW0UDUuvUd8ZJKtLOYq4dD3u6WQ
	 hVT4qMk21glZiCGuN0CFWD9Mueqek9C7Fer9jW7YbgKeuG7qiOsPG1+QgpyObuzhgQGEC
	 65bmJNRv/77C1jPj7rjOqjE+7Cc4AGYSn+cZnXisXj6R/TmVJy5hBly9b+u3nCsKu0iLO
	 qvTmYCubPQrNtzyZB/tH3nDBPmtfEXQMprhw1tbwfM0y3WiXoWPAroSZuOVwBDlW7fqxh
	 wvUoLX+bxXvG7Krlpo9pwYyPNkiFo3KVd8qdCpwmw9w/d8usXeIXDUR0bKmDZfkn/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NsPaKD2f;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894E60A262C
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E894E60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NsPaKD2f
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so345204d50.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562623; x=1793167423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
        b=NsPaKD2fIf84Pt4WIbaiiZ1JbCcqSw/gidqj7LyzXn+G5xJ/6ye97icBsoIewABXlN
         bzoQhxfB+4qvA+XPI2BamI0J5lDZHqJNI7rQ1JBAbJ+ZC6APEhToIIXKHIaGGO9ggfcF
         2EcTcF8JH77So0rLNX19lRvlPA05qFrTNoURxcgUE+WpweFR52daI8q0EokVcJ9NtEac
         qZysdlhw9H2y3bs7ACAjb0gkfpl7BcNjeWtT/nJb1CS/CQb78FlXbaNDoUpbPn1M+fy7
         WtBfmZGC+u5baOyyqrW9R7cpsazBfaKu6A3iMmwkefSRyb1MEbS7KR9WS4P1hqvtCXoO
         9XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562623; x=1793167423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
        b=uTESyFWR1mAL5pzPRQG5UsjczoATVQAWq9fQ9L0ORw9bbxclHh2b7GqQC1esNX/3Gi
         fjzz+7T1QaunXdhaoZjEj8z2Xv6PRsmUoj3Rf15hS02D2ylIqTJ/waNcogZd01BpV9KN
         D99rjpFXpb2RaPSCgQdkpAnW4xj2JPe5iIIXwLsfh8d5n8np8/CikDr0MrIjnrs9GxTD
         waHi0ggdEsS2GTPyTD/8GuqNel2+OKUUvgDTqkdxnleGN9WbfkPWa4xqjCvcEF5CH9ZH
         UqClSNc4HzDS7xH+uADDUahW/mTcLBbzU3FW8R0xcfVCRQ8ZzWgNFCwHshVPUsrTkYc2
         lytA==
X-Forwarded-Encrypted: i=1; AKwUvByI6G8gQXP8JAZk30OPEpl5wi9isl3ih5Dakf+CrZfK5blrh/3gpYkSTGHRa44imkpuQsqaK3leop8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaVT9m83RqKk1bbZ8V7OqhXbZaOLusiJ62/b+CQtDEK60bzKn1
	JzDVBn99TlOGMjf8HLOzGj8X7pTroRyQPqMF3FjWVv0Q1ohwdJPhMMon
X-Gm-Gg: AYBFou1GMSPQJEeLAiR0Qsc+xhy+mbt3K3MoQJFUyppa/uH1pB1LaGum5DGS1pMcyOi
	CdnUA/VvuMHI6EOj8MWr9UQu4sMyLq8BT25F0Z2kuLq2xOFxFTBfgIYFw5mwHbzPDq2DC0vAm50
	Ss/Y7a6dRKkhcyYu3+STMzj5fN+xgHNr1Cjv7bDDB8/G7a2KaUZLrbY+4pQv1STzMm+t9adCW9p
	bE5fZMMqen1lg17B3yJewBo1hFEOg+f+3X53lup8N552uOOeSVbscVPtMhzdJK5iaKMJ/J4kloz
	xoCTdid7y5Y2dlXDmsS0mFe1WYFGI4mWbADSs5wSNIKGAdOJuJ9I+glllYfOb7lhbwM3uu3otzb
	4ped0ME1sUKudByoVzyt4HlRVpNSQWzltX/Px2Y2HsZhBjQqgqxHsbuADC5z//CwJow4+A++MXe
	Kc+Ck+UaSMV2aGt55XlJH787JdBVD9wuDqDFTeZb8D84vdOdiNDFxWVP7Qs8sf16p5gMKEQe916
	xXxEr0YBPpfFxT/Q/AeWCK/bJXiAA374gEvuQhI+7T4uWxc7Uaw60GCGlGvUxuGKe5FMXJjFEA+
	lCy6+1O6PS/I4NWw3GBeGykyCrPOu/3HgTVG6WRZq5Shmt11rynbjdLrGZATImSM0BgagkQFKsv
	KSjP/kw==
X-Received: by 2002:a05:690e:488d:10b0:679:8c5f:3fb6 with SMTP id 956f58d0204a3-67a0e0417acmr381635d50.9.1792562622988;
        Tue, 20 Oct 2026 23:03:42 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e496732sm619480d50.5.2026.10.20.23.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:41 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 05/12] mm, swap: enable THP swapin for vswap entries
Date: Tue, 20 Oct 2026 23:03:16 -0700
Message-ID: <20261021060323.553433-6-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
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

Swap a large anon folio back in as a unit when its vswap entries share a
contiguous run of physical swap slots on a synchronous IO device,
instead of always falling back to order-0 faults.

A zswap-backed or mixed-backing batch is still refused, and the fault
retries at a smaller order.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/memory.c     |  5 +++--
 mm/swap_state.c | 17 +++++++++++++----
 mm/zswap.c      |  6 +++++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9f651d247eef..430b83900ba8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4885,9 +4885,10 @@ static unsigned long thp_swapin_suitable_orders(struct vm_fault *vmf)
 	 * lack handling for such cases, so fallback to swapping in order-0
 	 * folio.
 	 *
-	 * THP swapin for vswap is not supported yet either.
+	 * Vswap entries are checked later, under the cluster lock in
+	 * __swap_cache_add_check().
 	 */
-	if (is_vswap_entry(entry) || !zswap_never_enabled())
+	if (!is_vswap_entry(entry) && !zswap_never_enabled())
 		return 0;
 
 	/*
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 3900975c675f..6c8e8f49e349 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -174,6 +174,9 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 	unsigned int ci_off, ci_end;
 	unsigned long old_tb;
 	bool is_zero;
+	struct swap_cluster_info_dynamic *ci_dyn;
+	enum vswap_backing_type type;
+	int ret;
 
 	lockdep_assert_held(&ci->lock);
 
@@ -202,11 +205,17 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 		return 0;
 
 	/*
-	 * Reject a vswap batch so __swap_cache_alloc_folio falls back to
-	 * order 0.
+	 * For a vswap entry batch, reject if the backing is not THP-amenable
+	 * (e.g. uniformly ZSWAP, or mixed). The order-fallback loop in
+	 * __swap_cache_alloc_folio will retry with a smaller order on -EBUSY.
 	 */
-	if (is_vswap_entry(targ_entry))
-		return -EBUSY;
+	if (is_vswap_entry(targ_entry)) {
+		ci_dyn = container_of(ci, struct swap_cluster_info_dynamic, ci);
+		ret = __vswap_check_backing(ci_dyn, round_down(ci_off, nr),
+					    nr, &type);
+		if (ret != nr || type == VSWAP_ZSWAP)
+			return -EBUSY;
+	}
 
 	is_zero = __swap_table_test_zero(ci, ci_off);
 	ci_off = round_down(ci_off, nr);
diff --git a/mm/zswap.c b/mm/zswap.c
index 24c4e7a73d56..1b91dba992ab 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1753,9 +1753,13 @@ int zswap_load(struct folio *folio)
 	 * range on the backing device, so scan the range rather than rejecting
 	 * it outright. The caller has pinned every slot, so zswap cannot start
 	 * a store or a writeback into the range while we look.
+	 *
+	 * A vswap batch is checked when the folio enters the swap cache, and
+	 * its backing cannot change after that.
 	 */
 	if (folio_test_large(folio)) {
-		if (WARN_ON_ONCE(zswap_is_present(swp,
+		if (WARN_ON_ONCE(!swap_is_vswap(si) &&
+				 zswap_is_present(swp,
 						  folio_nr_pages(folio)))) {
 			folio_unlock(folio);
 			return -EIO;
-- 
2.53.0-Meta

