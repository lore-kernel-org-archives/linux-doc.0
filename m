Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562637;
	b=0NBPVUqrYqEMlMnwZs6Z2pWcz/0b+mlEDyDd0Y3WvaJ0c2OfvZ3anyZiSTBt8ios/Rc+
	 MNeOEx4Dpkkq5KjQaRhh63OLJDvsEAmpU39bVp+INlv5GHqlGx5Iu1MAVzNmaKgrpMKN1
	 TqAkTznvWyWUV22ex/Jck4c2SfMRbDCYts96jKpJVnXRIKjj7kvLqBl66jXIvuYqxo9g5
	 MWpZjcF33TVAvA6LV4GxV3jq4khuAj8OP52QauI8e4KhnuzTWA2ZIfEGaKg0Iq1OYIrnm
	 TEGqtX5a7ZE0h/xeXLX7ZvecMd248/g7mMNq6gPnOfhjCMuQ+xi5CeL7IottUwXmJsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
	b=VnjlPbLQkOrhIg9Ag39zhTx7B+V6JD5FBWVew6iMNv3is/608gJQRv2gVa2a+DTBwrOW
	 psKLbMLhpKTL1VJM5+mejIAUd/YBokQf97kPcnVzeTPAGEnhKoH3JQmStuGyL+eQ2UBQU
	 R68WHCdxhHe0JsBNrYz9QJ+FQ0sbkORLUFxM+Cw1M2lKOQFzRXooZyhrud8lccxIzozO5
	 fpeC6+fx2IJJghhn7h6eMjo3QxcI2YYDNzzJV1BWES6Zh6v2NwSNgm+LtDXisFpVcowvf
	 z5gjjt1pzgO2NRlmVmvaBUuNBU9+WHhgsx15mNpKwwQ2hekXebqpDS0a8EHorH2/ZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFHBudiq;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A560A3836
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9A560A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFHBudiq
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac4806e210so3210687b3.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562636; x=1793167436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
        b=cFHBudiqdnv6DAu+tQmyNNZRynSkOYTlu2N06wKLPRU41eE3jBx52bn87pBU7yE6Zu
         m58pe/p9uIWeanxtVlPsJ2OSp4BusAsA26Pw4oSery9Vh4Ekn0kntCNUXHAM6GqCaEdT
         5sXoumkGf6MfpU7PtAgfy6ArFeoXqy4ea0v4Sg8p1XOCYdWfoLwfAVsQzWjDeKoN4nFY
         qKIjsx+x+b964+u0eqbROXdRj4tfp9jVA9Kf3BDuQ0gi22vBh60V9wl744es9ds89JIm
         qVZL+GbC50Exbo90BRGe8pSxKsikoelIsDLlxAYta+NtER/B7rjsltI+RedNs7QZ53KT
         JV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562636; x=1793167436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
        b=ZmJntNksfHkCBPv2ROPB2UgDpLgUum95s7FY1iMfwgb5WQlFWsY9DCOye+4SXn79k9
         W/w1SzGeldIoaFeGESUzrTKAXsb3HhUrh+7q3MrBI2JV2A4iPeGPsALrvcZKSav01vr7
         5RXl1Dufmk0EYaI9SQlDbxZMTgm6J6udJ5KBX7Iz1RPoReJYqbeBs91QudbRT3zG4F/x
         Gp8sJCzIEDMLFqEN9SHVgEHt/aK3HuTLcWbTC5fV8Bq0bBobvj7yYEBTmNDDx9GftR1N
         fFIrsMg2olDk4X8wdNILuw4RkUL+4uIzD8O2WnYrONkSOYpno82pMU1ykE/D8rCBU7iS
         uMxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwCXEQtK1zB3eJTVBB89aY+6jyYgDWk3AFs2dT4drGLcHFlBmf1uZLBa++3Afcl8dR+bn+sxqTlgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ+8Wjj6HmjYAiR92cUtHhxn+KW1NFJDby5a/uxU55/maT3zIZ
	f4er+xuKVf2Jo+uUdTH5HL5NGVidZXlaKU0IfztNCJq2mMVCaZpJ7gVc
X-Gm-Gg: AYBFou0pCH5+gHEOCUyxE02R4U+0wF30NAYSELQGAWlhPjy/aTRH95LOMtI8sNO786w
	g90qr3o9Ts4Sh4jY2Gt42WVcNLRufqmaiZ1DZ3+8H+NUlVAoP+OYDXU0XHZeTqRQ+x4J0Yfw24E
	SjPu2ueh3RIULydpHFIfJUK/NOFA5hDgCvvrNkIVeIlPNL/xsMaFTRE4u7W9pEXCH5zpw+KJIz1
	a7S+fHI4v6UWVOWDN8u3HKwjRyq8oOL3rS6iUOoIMFRLbbzAZFCGyvh3HzDl3/G32ji214eyrQd
	BHLqhmSc5HGG2O1D/n6ynXs5aZJI1hXQmmGXhP2anmXniySiGiHgVoc+6T3NhdIJmCtjlKMawpf
	hpcp3lDXk8ket/eR3zCxwtWrGFJ7HHpaBrhIoFCY3A5Crn9xTC2vipH7CTdm/K2rviIVdF23qmU
	41+/ChSKKucGRZMTaaBftkhsoQyn0IUr9FCMSCmu56N3j2SR4ChNhGJZrVPVzj3w/r6tN5T4xhi
	Zz9+XNVbOSglY0kJJYPG3wRhxYvKn7aNiO3jYC/WvcUsIM6
X-Received: by 2002:a05:690c:660a:b0:8b0:d3c7:52e9 with SMTP id 00721157ae682-8b13400d0d0mr4996737b3.36.1792562635989;
        Tue, 20 Oct 2026 23:03:55 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300eb0ecsm7200107b3.26.2026.10.20.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:54 -0700 (PDT)
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
Subject: [PATCH v6 09/12] mm, swap: add debugfs counters for vswap
Date: Tue, 20 Oct 2026 23:03:20 -0700
Message-ID: <20261021060323.553433-10-nphamcs@gmail.com>
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

Add /sys/kernel/debug/vswap/ with two counters:

* used: virtual swap slots (pages) currently allocated
* alloc_reject: cumulative pages whose vswap slot allocation failed

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 341077fee23b..12cd5caeaaf2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
@@ -146,6 +147,7 @@ static DEFINE_PER_CPU(struct percpu_vswap_cluster, percpu_vswap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
+static atomic_long_t vswap_alloc_reject = ATOMIC_LONG_INIT(0);
 static void vswap_mark_cache_only(struct swap_cluster_info *ci,
 				  unsigned int ci_off);
 static void vswap_clear_cache_only(struct swap_cluster_info *ci,
@@ -1997,6 +1999,7 @@ static bool vswap_alloc(struct folio *folio)
 
 	this_cpu_write(percpu_vswap_cluster.offset[order], SWAP_ENTRY_INVALID);
 	local_unlock(&percpu_vswap_cluster.lock);
+	atomic_long_add(folio_nr_pages(folio), &vswap_alloc_reject);
 	return false;
 }
 
@@ -4874,9 +4877,25 @@ early_param("vswap", early_vswap);
 /* vswap does no IO on its own. */
 static const struct swap_ops vswap_ops = { };
 
+static int vswap_used_get(void *data, u64 *val)
+{
+	*val = swap_usage_in_pages(vswap_si);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_used_fops, vswap_used_get, NULL, "%llu\n");
+
+static int vswap_alloc_reject_get(void *data, u64 *val)
+{
+	*val = atomic_long_read(&vswap_alloc_reject);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_alloc_reject_fops, vswap_alloc_reject_get, NULL,
+			 "%llu\n");
+
 static int __init vswap_init(void)
 {
 	struct swap_info_struct *si;
+	struct dentry *root;
 	unsigned long maxpages;
 	int err;
 
@@ -4926,6 +4945,12 @@ static int __init vswap_init(void)
 	mutex_unlock(&swapon_mutex);
 
 	vswap_si = si;
+
+	root = debugfs_create_dir("vswap", NULL);
+	debugfs_create_file("used", 0444, root, NULL, &vswap_used_fops);
+	debugfs_create_file("alloc_reject", 0444, root, NULL,
+			    &vswap_alloc_reject_fops);
+
 	pr_info("vswap: created virtual swap device (%lu pages)\n", maxpages);
 
 	/* Last: everything above must be visible before routing starts. */
-- 
2.53.0-Meta

