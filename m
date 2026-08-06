Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0C3B4EB6
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041794; cv=none; b=Nu20P3JuetvhAgAwO7dMCxmcPbTpBPbZHe7KeyWesCoUWKiSRIURnd1mp+GxoI9bHna8q+ret6axI5Snfa+FSLqZwuKHeyIqc+n3f6CO8bsw5UDBp1CGoQuitTOuZrtxlSFuOCmoMCTXHK+1jmZdNzkTgOv/hRtG6xfsLr4pN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041794; c=relaxed/simple;
	bh=SNocFtXa8C4f89zudX1FgBzt9ndc5ukWPrs95OuM/mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ccb+9aPSoqDAwBD7RC4Or9sfElf7Zg8KrbDdCeRPIVz7JfYZL685nwYEQfjX8oLeAgPDsakOyLObho+5MBBFGE/Ctp97l0n9P6Wl8YqsYoFjKIZWKSMDQ1Vx6lZAslN3xt1VJMTbLPtj23zc2zEIrpYP6l3WgwgHgBVuksRsjI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptmri/R6; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptmri/R6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb545db3afso1783722a34.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041791; x=1786646591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJDCmTvRD2vNfT2YGrgT7EosXDcYWyreOqvvzwLRIg0=;
        b=Ptmri/R6ZldQ/qJl2OO758kFbjzO5Ug6DAyl44CthNFbeD7UqwI/8cClwyM9iMzvJ6
         nterH73G/ggywFCtl0Gr8Q6F16EN5VeK1t6N9kI8B7mSQ1mSOc8rGMOSgY7Yw8L6TWDt
         fhrxOlmM/QrsqAceSfFvWWB+uOexdgIEvgVPcB+gMfFQgoPjnvCXWtq5M2LWFGWkiQuG
         NT14HIu8f+VIgIZDeaVAcgzkRuIjvQtDvQfz+rglaEKm6wuTe76L0r4vSFx8i5jcdiyG
         Dk8TBnR4k26DzBbnf2J+S3V6e7HRpHznE+euBtEJXL3Qm/D5RZTLgneNcFeIvwFGESfy
         xmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041791; x=1786646591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJDCmTvRD2vNfT2YGrgT7EosXDcYWyreOqvvzwLRIg0=;
        b=DiaeLFUmEr+7lAB10WpIWKCL1nS5f+7BcpHOCbq0fAOMGiAL0ARBJYjd1ODoiCnV4H
         MvPx9o6dVdl+HHbP071s/vlC44Cy53g5mdLy2ZaPwu0kOQB4tt1Ks1qiZ5JplU2UuAvA
         aL5H+SHRLnSDSZSe1YecuvtLfpXvpdGxLl8SFTPWpm1cFrkxaUQq9tOfJPY5Zag9atgu
         iNeYo7BjLCLRzTZLfqfU5NK0mTAT0bbAZXp2wSvxq4HVi8yVmS0PP8t6eA0+aGjHTslk
         1+i7WNu5lah2H9aGHDdgWvJIphdAAoMqw8ip3QJTc2t04BNUammWuM4M3XuVX+g3sgvW
         rO/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDedvvyYYp3yUsoYR+3RDJWcjsXbJHGBtl+Gu0OwaCilaBaIdVv+tBE37Y78bwFPpJsTxSqzVjsbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLdZQdc5f3tXChQIFSzj0/pljVPgENAqwKE1bpt+PAKoBaKPe
	WEqmfk8ir317vFEWPfOR+o/A2FPOUKYys4oX//yuTKUlSsIsBsy/rlH/
X-Gm-Gg: AR+sD13ckuspCrwYczApnKIe0woLjAwDTAtuoSQK5s+le/NZvSbGF68WPA4OJ72sm30
	rs3uWVKGOfii9bgdAFnaXGaXJvQuox4X+TadESgwYZceRRvILrppc3hFcWLd946UFHaq049KAlJ
	PJuVd8GaCZX6EGuxz00Zhk9eI3U1DCoicxcqXy0OOQG4ZPf1ohnQicOxcIJBYGNMio/wTJeVp/S
	PuKMAyvp4twKTxZYnyOJTYFxf9HwU+fLJIT3Wku+gtho8oND33wSJUuNB9sfvF8H0aA9RuhhC0I
	qvM2JyN1p9bZGW1R6RrT5SjN/997HF7/VFB21JtLtrDC8ukbbznC2pwB8PHmqRF+62q06kRR+H2
	MV+2AqEkQuFbVxDXvLY4Rl3XPhsRepq1gL4iGsFbIImXOAfs6D5ss6ViOdmNDlkXdgyBW2ev9Ws
	w92SEz/5Mu17Pv0DoBe0OYejrMLDf61WuKP2jxgZRo1KfXp+gDJbM0ElaJOC1ADH+X3NUVy3Ysk
	wDvXoE02wcNZY70IGgQbaM=
X-Received: by 2002:a05:6830:6404:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-7f1e5d0f423mr10084761a34.6.1786041790716;
        Thu, 06 Aug 2026 11:43:10 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5a4f9bsm5051028a34.23.2026.08.06.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:43:10 -0700 (PDT)
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
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v3 09/11] mm, swap: add debugfs counters for vswap
Date: Thu,  6 Aug 2026 11:42:52 -0700
Message-ID: <20260806184254.3790858-10-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806184254.3790858-1-nphamcs@gmail.com>
References: <20260806184254.3790858-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add /sys/kernel/debug/vswap/ with two counters:

* used: virtual swap slots (pages) currently allocated
* alloc_reject: cumulative pages that failed to get a vswap slot

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1a2d9d9625fc..b4d7af21ca1c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
@@ -133,6 +134,9 @@ static DEFINE_PER_CPU(struct percpu_swap_cluster, percpu_swap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
+static atomic_t __maybe_unused vswap_used = ATOMIC_INIT(0);
+static atomic_t __maybe_unused vswap_alloc_reject = ATOMIC_INIT(0);
+
 #ifdef CONFIG_VSWAP
 static int sysctl_vswap_enabled = IS_ENABLED(CONFIG_VSWAP_DEFAULT_ON);
 
@@ -2056,11 +2060,13 @@ static bool vswap_alloc(struct folio *folio)
 	if (folio_test_swapcache(folio)) {
 		/* alloc_swap_scan_cluster updated percpu offset already */
 		local_unlock(&percpu_vswap_cluster.lock);
+		atomic_add(folio_nr_pages(folio), &vswap_used);
 		return true;
 	}
 
 	this_cpu_write(percpu_vswap_cluster.offset[order], SWAP_ENTRY_INVALID);
 	local_unlock(&percpu_vswap_cluster.lock);
+	atomic_add(folio_nr_pages(folio), &vswap_alloc_reject);
 	return false;
 }
 #endif
@@ -2665,8 +2671,10 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 
 	VM_WARN_ON(ci->count < nr_pages);
 
-	if (is_vswap)
+	if (is_vswap) {
 		__vswap_release_backing(ci, ci_start, nr_pages);
+		atomic_sub(nr_pages, &vswap_used);
+	}
 
 	ci->count -= nr_pages;
 	do {
@@ -4862,6 +4870,7 @@ static const struct ctl_table vswap_sysctls[] = {
 static int __init vswap_init(void)
 {
 	struct swap_info_struct *si;
+	struct dentry *root;
 	unsigned long maxpages;
 	int err;
 
@@ -4896,6 +4905,10 @@ static int __init vswap_init(void)
 
 	register_sysctl_init("vm", vswap_sysctls);
 
+	root = debugfs_create_dir("vswap", NULL);
+	debugfs_create_atomic_t("used", 0444, root, &vswap_used);
+	debugfs_create_atomic_t("alloc_reject", 0444, root, &vswap_alloc_reject);
+
 	pr_info("vswap: created virtual swap device (%lu pages)\n", maxpages);
 	return 0;
 
-- 
2.53.0-Meta

