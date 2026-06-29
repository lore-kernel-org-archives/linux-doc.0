Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672CE3B8948
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732086; cv=none; b=SBo+mUHbWLIagrAYcGiJ9Y0GxS4ilPCzjEzdKBCjygme7W7lBDgl4BhYDogOtZe9dZVgeyEcJShYzLvAGmU87xDatjWTqK+4BJyrpClqlwwq/E9kH1yxNaweO5TwjSO3c0/EJCKo90JUY5ghvre5gywBNphMJNbTrQtQeF2Rq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732086; c=relaxed/simple;
	bh=7fyuj6uKPVKtUKyqELTJHTOgZaw+Ks429n2Qoa9wGiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ji33kd0XumkbVVD44Vu6MzHW0t1mWZoORIavoDJJSzuwUOEXDMrq7vGZsP5AgQsXS4pKAIVGUvLoRPh26wXrBfdTVMrEMWafcyz7s1Aw+zEec4LEAL1zVN9L7vI1J1cLhsjlDTZ8YZNWgBSJMAxlSW17x8EVLhkKNsu+9PcmQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0i8ObMM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0i8ObMM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c82538b6b0so20120525ad.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732085; x=1783336885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVnCy/CrjXKjbO/P/cQp8T6S+cexbTlMyh18cejWmw4=;
        b=S0i8ObMMHTLTLS9RwnNtN9zF8oOh10cK9k87sLFImrGNHhVr4OwD4PmebNGOawEANQ
         FSt3KYmWyqXGKIAJKNz3pJgQo7Nl+xHs/qC9on7uYECfispoadTHsBcGrGycF2NtnDkh
         iZ9DCfbTfMHlbxi6U2twnBiB36i7s2qMgBDUkKhuzS9eCmK9EXbrAUavnlshSZbftLC5
         HGgapphNhNOfYU3bMVMrqwnb/ujjpG4iwm2a3OR4alLj19hNReEcEnq5ca5LHH5TR711
         Er9UufHxZ7GIGEEWiQsxnv8SJlRoM33DA0BQK0Y1vsGQkL9gPltwx7vtCZIhA9NtYK4b
         ysBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732085; x=1783336885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DVnCy/CrjXKjbO/P/cQp8T6S+cexbTlMyh18cejWmw4=;
        b=XFQo/TVt9vvxps9a3ts1aOJdTQfWWTyujvg936ebAJ2QrqD41vDSx+7FfS5vZhCyf2
         daY52ghdEkf5o+4kHWRiXRHeS1coWjo3YiubRke/ntxbGt14V2QTo1nFXp6vhb2b0byj
         +gHV19X4uhp54oWAZ0/V4ez1yE/vKzkzdGG2/gcUk1N37esX7vL89YtpALmA9O73pCEM
         AahY6Q6bxJkGfJ9DAB7KRaZchEkVoWHrfF3TYK+W9mhXK7nspQ0EbkotIFyJwaXoVkae
         9E0tfF/vaBnMFlfSwMfLYjEOfK8hzdocX2y73lcAgxXFUcdAlpuZ/OF6CQqPlR+kzXgr
         HZfw==
X-Forwarded-Encrypted: i=1; AHgh+RqUuId6eKHSxaIKJVc4HhFlcFM6/Tx0fPBI0iE+oQ9TKfX5lKL0XTZodQA4O6zHQ20X+6zvknzFN/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwK6PIPKxWQLPYpiLEkFC4yc1w2k2+Ktmqjj7aHXR7+wvf720
	FwpUz6O3WFNqKrzdcVChi4cZw7bL6JLYJ3w1HHpeoPEN/EpjVAY9ZF4X
X-Gm-Gg: AfdE7ckDtZWQHcNUBAmzci6maPYoYF+jQiA7MP7i2i/4F9bz5Emt1xzk3CqWo+3INZE
	NuZU/mDahCypEXhEuH7895TkaFSceu2G8Jewqdq/KRZvvbm2Nchn0VvYmoQtJ8Fw13E/2ABoX1U
	N9HFxuCZEOTaZq+ukhSw1Se9xwyD2+VOkGlpFzROLHFA4rnTfBQdZtw48MLq3sQynREAEc32wp6
	ARiO+WKLarMdFHWsReruJ2c/K87AG2fKJXWBrpewIYdabtVqDRHByS01fZ/BtFdCywz20XY69xP
	4dW5T7jY9lrO4+LT7DqU5TqCUwYG9iF5JrmukRjg9QU9QhM/wd0v220EKapEWvn5MJ32IMuBEb8
	9MmMIqqHavpgzmojWIU+fcUK+YA127X1JSUOE7PvPO0ScSQr1fydFLlTvQFSVnWZxd6VNLDnPiI
	b3KpMBO2Elw2VM5/Fdc7+CPRMbWh5TEfvfXj6GTec/
X-Received: by 2002:a17:903:4685:b0:2c9:c517:d07c with SMTP id d9443c01a7336-2c9c517d5c0mr58323295ad.11.1782732084710;
        Mon, 29 Jun 2026 04:21:24 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:21:23 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v5 5/6] mm/zswap: Add per-memcg stat for proactive writeback
Date: Mon, 29 Jun 2026 19:20:31 +0800
Message-Id: <20260629112032.20423-6-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260629112032.20423-1-jiahao.kernel@gmail.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Add a new stat zswpwb_proactive_b to memory.stat. This counter is
incremented by entry->length during proactive writebacks triggered
via the source=zswap key in memory.reclaim. It tracks the
compressed size (in bytes) of pages proactively written back from
zswap to swap, allowing users to better monitor and tune the
proactive writeback mechanism.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++++
 include/linux/memcontrol.h              | 1 +
 mm/memcontrol.c                         | 3 +++
 mm/zswap.c                              | 4 +++-
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index bbcc9695aa8d..e1f6a4729a65 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1748,6 +1748,10 @@ The following nested keys are defined.
 	  zswpwb
 		Number of pages written from zswap to swap.
 
+	  zswpwb_proactive_b
+		Bytes of compressed data proactively written back from
+		zswap to swap via the memory.reclaim source=zswap key.
+
 	  zswap_incomp
 		Number of incompressible pages currently stored in zswap
 		without compression. These pages could not be compressed to
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index e1f46a0016fc..56580b264dc4 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -40,6 +40,7 @@ enum memcg_stat_item {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_ZSWPWB_PROACTIVE_B,
 	MEMCG_NR_STAT,
 };
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d20ffc827306..d81c34484bca 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -433,6 +433,7 @@ static const unsigned int memcg_stat_items[] = {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_ZSWPWB_PROACTIVE_B,
 };
 
 #define NR_MEMCG_NODE_STAT_ITEMS ARRAY_SIZE(memcg_node_stat_items)
@@ -1558,6 +1559,7 @@ static const struct memory_stat memory_stats[] = {
 	{ "zswap",			MEMCG_ZSWAP_B			},
 	{ "zswapped",			MEMCG_ZSWAPPED			},
 	{ "zswap_incomp",		MEMCG_ZSWAP_INCOMP		},
+	{ "zswpwb_proactive_b",		MEMCG_ZSWPWB_PROACTIVE_B	},
 #endif
 	{ "file_mapped",		NR_FILE_MAPPED			},
 	{ "file_dirty",			NR_FILE_DIRTY			},
@@ -1614,6 +1616,7 @@ static int memcg_page_state_unit(int item)
 	switch (item) {
 	case MEMCG_PERCPU_B:
 	case MEMCG_ZSWAP_B:
+	case MEMCG_ZSWPWB_PROACTIVE_B:
 	case NR_SLAB_RECLAIMABLE_B:
 	case NR_SLAB_UNRECLAIMABLE_B:
 		return 1;
diff --git a/mm/zswap.c b/mm/zswap.c
index 9cda96f05508..d356c1739c68 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1747,8 +1747,10 @@ int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback)
 		} while (iter && !mem_cgroup_tryget_online(iter));
 
 		shrunk = zswap_shrink_one_memcg(iter, &s);
-		if (shrunk > 0)
+		if (shrunk > 0) {
 			bytes_written += shrunk;
+			mod_memcg_state(iter, MEMCG_ZSWPWB_PROACTIVE_B, shrunk);
+		}
 
 		/* drop the extra reference taken by mem_cgroup_tryget_online() */
 		mem_cgroup_put(iter);
-- 
2.34.1

