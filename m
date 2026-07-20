Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50AC48035B
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576127; cv=none; b=HdQzAaMDgoOghFkYOWcauu2zhJXALzz4E16wR84kvkRtJpkLJYfVsIdrjyv/0QY7EEaWLroTd1ag5D8B+Sum/cmXpRCOIOcRuScp17DMlWCKn982fludFyNu6M29yMBOE2C35DEH28yBYlo8KEL3V1dLDR/YI9sdWV1SQ8SUGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576127; c=relaxed/simple;
	bh=AclVB29m5XEXwT6jfLm+y0Vje/ATQlFgKmkw+sbjY3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SO4Zl/qJrYGbqbibQZ3SKJEM21YIjX8/vKqQe9EJxMoqE5e5AA/fpFAq90aLZsfnHr4PK87hxN3trxAPUtlrR2aemsRMCXjtoPwu4KYNM5ovaLad38KTkB/FyWRHb8vYA00eUPZonimDhLq7sfeDXi/0PvaJ8XoBGgA7mTfjd7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KTYLBPs3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KTYLBPs3"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e533aacf2so395281185a.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576123; x=1785180923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2LDhxlVOpgNtSXDCdv8imM0ubGsvF9EJ4oiPoX2j2c=;
        b=KTYLBPs3dWcRB5tNY5Y315YJNYwSMrSW38ozrn7zBlvcl5Bgj0pNovXwYuhmdviEr6
         vGvh5Tm6m6ydUQi82zIG49v7mWgnbI4X0h3X9mabjFu39jmqmc0ad6N6+0VTgyeMRySg
         U67Thqs1ToMZc0ZR+8TgO8LsSqcKGdmBEkEQHgfrraLsi0CXj8Ba77QZxDY5AKvlIRFi
         6q/dihXzF+eQ9FAgtleDsSd4cK5HY0uc5r/y6rh1gmcA1PS8AAV7YHcb3xRC5QQMheCa
         vFx1oCPPO8nV4G83ZDlOcBlYxLNa8TfGyggXhkeXkCtRXY8EycNoBEI8uEixfJ4mDjdy
         lU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576123; x=1785180923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2LDhxlVOpgNtSXDCdv8imM0ubGsvF9EJ4oiPoX2j2c=;
        b=jKGxGxXKV6xs3aDRWo8UB8I2NVbZLFaPBN/BHUKAul3Ta2XA3Unbl23hfw4ifRk+HK
         YtyWJASq6X42aXdwDHc5PJN8rSHFusFsVVEfxSEcNdIejNbicQ1spzNhT5AqMis2OVkK
         PbZ1nyeY6bHncomZNfU5DGx9DGg/5U2kof3eXptEydR/MJeJkugtl/Bmco6s/dA6Y6pO
         TQDSPhpk3clzBS27lrtaKfdaFFFG8l+NqUc2AdsWf7w6TjgtEbuBgQByzSfBopz/j8J7
         zybgbf6p+iboy7l6XUhZVJyGVI0G3lRNEnpAl0Zl3HWkn43ygM8gGg/G1WUBmiefmtnn
         bb7w==
X-Forwarded-Encrypted: i=1; AHgh+RpF2jH98CmMpUe3iqiM1eUmz3x7IexdXX0PIkntQ92W6kKkySiCymNVw4LA5yOJYFCYzCW/IGbBqvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/WIP5F14IXB4OyTQtrpEfX/aSgsQw6xUh0dPJlXVVOYRmNcpG
	rd/h37FD0WrfSdllLv5gv9sXBVHDU3RTvYLNa6oK5QjWSZVSSgwTyU437nEHi+jJtXo=
X-Gm-Gg: AfdE7clpwvqw2fIRgGhFMXjnJc2pRWP/8nXvU80knLSkYS/QnklfZ3WdqSDopuoqQGr
	HfHncJnjdP7az19S0y8a6XD2j0hBjnrPfuM1kNhXYXWM4IETzI6V882Fvl73SzFgtKLkCy3KvRs
	tHKFOMpfdH9Ug3lI8MixXg0O4kH9jNfuFZpdt0Wj7czN5722tDsFjUMbjpLSJBi6sVv9NZpGMoq
	eBNX46XTumvDW3GlvzHyj68AR6mSPw6Jnrr8BHB0sL0Xrimu2hND+Za26xgsfM9lxsozEJP+qzW
	r1iLcMibXsKB1+1xr4FYAyPorO+VRn3alPcZCJP3/gSRE3Llyk23CyrlTpG89T4eqbPtekZgNTf
	O6WSASjutfVDn91UZaGarSaBUbuKqy4SanZCkqqPaKTGaGt1LZedgqcRDsQE7d4ts5Z7pAmN5+d
	NC1WP452M0gA5apAsi49T1u9mit2xwkr3QalgIut4YroO9Hmbu6w8chrNnN5vi41kLkpx9oRkdV
	A==
X-Received: by 2002:a05:620a:288a:b0:92e:f3ca:2ec8 with SMTP id af79cd13be357-930b3e4b8a0mr1508481385a.19.1784576122786;
        Mon, 20 Jul 2026 12:35:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:22 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 17/36] mm/vmscan: disallow reclaim of private node memory
Date: Mon, 20 Jul 2026 15:34:11 -0400
Message-ID: <20260720193431.3841992-18-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Private nodes do not support reclaim by default, so prevent all
reclaimers from operating on private nodes.

shrink_node() is the common chokepoint for most reclaimers (direct,
kswapd, proactive, mglru, etc), so it's the best place to filter.

DAMON's proactive pageout bypasses shrink_node() entirely, so we
disable DAMON in a separate commit as its own discrete service.

Other reclaim entry points are already covered - e.g. MGLRU's debugfs
interface rejects nids that are not N_MEMORY (N_MEMORY_PRIVATE is
mutually exclusive), and madvise pageout/cold skips private nodes.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/vmscan.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index e26c6931f5fde..86b2334c23b98 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6141,6 +6141,13 @@ static void shrink_node(pg_data_t *pgdat, struct scan_control *sc)
 	struct lruvec *target_lruvec;
 	bool reclaimable = false;
 
+	/*
+	 * Private nodes do not support reclaim by default, filtering here
+	 * captures all normal reclaim paths that may attempt eviction.
+	 */
+	if (node_is_private(pgdat->node_id))
+		return;
+
 	if ((lru_gen_enabled() || lru_gen_switching()) && root_reclaim(sc)) {
 		memset(&sc->nr, 0, sizeof(sc->nr));
 		lru_gen_shrink_node(pgdat, sc);
-- 
2.53.0-Meta

