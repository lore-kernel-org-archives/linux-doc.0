Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1A401494
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732078; cv=none; b=qBmoyVXK/HV2Z2TqWlxnEguv92T0eBpYArkT6vXbnW9tO5oWNJxNVYOejMaqVyhf+wP4C6Sgxsc7ICDr0c36aLf+a0UYkgcfLsCEHebUthTF9/FbrLTotsReMBOlMnjd4tEvi5McMsep4VuzDYOoB4zAkLOGsFP93VpZA50mav0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732078; c=relaxed/simple;
	bh=rmA6lbmeewtNynEeQyD3OFXugca4E/SnJ/sz0pIL1Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OMtWuSGq1YutPlJ7ii4Ey9aNPb/b5vwOkTD1VhTTG4PWnwqjy5Rgw5lrodTGtTZ5QH5ksoTH12JrsZTbNJdSUb+e3yhS2BSiNENywCDoaPRykdJWvoxKhrsih6kqtoFDE2YYn6yzuhFV7yXz2djCvIxXs1H6mcTz5UUOUdgBJWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5xI3Pvu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5xI3Pvu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso6634115ad.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732076; x=1783336876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZhyMCX2Xpon+A3J1pvJv/6ZmIfArBWFkybN/rEQAmc=;
        b=a5xI3PvuLnZdhtW0DlZJUdQmgtFrchJ7JCMl67o9mNdjWsHz39bPSPU48GmkDoRMhH
         kXgSa+R2WCFLmyDtnlMsIEPJbFuI0FR6okp29xq2cfRitdVPVX6xiz3geY9ip4ixxgdm
         9DowuxJ+HY9XC2FN1U2uknQxxU1ItqFHztJmY1qAx+cfDYdRRBGOHZvXD5UlOMBWZF5I
         wzhc0nPxa5fBSax/J4TZRYTP5YXmjzPeLqGpSTOMjnrWrKFld0IKK4CnX2EuemXc/kcv
         tn+7nQVyOHMkbTia5Z8KKYUqXZdBPqFZ0afBVVNlEY3l8+soKilmpFuQs3tTKbF9/bbs
         a5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732076; x=1783336876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZhyMCX2Xpon+A3J1pvJv/6ZmIfArBWFkybN/rEQAmc=;
        b=E8T+jfH+INyLN5Co22xT3Ov6iF8wW1TdkRVixE4hpLauaCpydI7WilRtTa+DcsY1DJ
         aDVtTLq1AwGfufJxp8h/rgIu0jkB0nVFcSIgB0Gu2nDOjwAkUfWnFKr3eufxjgcrgnCY
         XJ8feH2SwlX7BMq7VYUm7U867WeLoZtPobtPhne1e9WlrVA+FpCnjD2oMYameQS5xhm9
         AaaWoqQVFpDmeiHsRPjqB47liqyjxvk7i19AO0VkM8wEtkmQYWyTSkW6bXYv1oBFCvcp
         rIEWiHmh4EjAFuvH0/1rc7FpW5H/lx3O+vumP9YyepHMCyBtEKjRjy7Ci5c/bhauIQTm
         WFJw==
X-Forwarded-Encrypted: i=1; AHgh+Roq6mLGqRjHIlQ/vlpp8IWe8AeBCvjcvyGlSBQFtEiojYKJILdcWdbEGSvnQgPlxMtNE72rnDjmhjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6tj/36KSn2vOm8cROpKYHOmqm6WDMM4v3dKta/sSN8qx+6Q+
	bqg1P2Ae4TSPetmeyN2dlAaYY6XVCPxbSFZyXsUQ7Fafzt/FF3UliDhZ
X-Gm-Gg: AfdE7ckgKskOSYAk7GCqiUM6TB6jYXd+vCipj6EpQxe+WLCcklCmax8V4GWUDm7UVQP
	tS8CspSD625LjDUcBBpPjMntxWH7qMUZQVlV4EKe9hrWHQWAOUL9YEVsVOx0FJh3pLZp9wzYHqh
	0W/sY9ZOdg5qcDbZxI4aS0xvSSfyJ1rPtJUfoyjBEe4xyhPhg3S6pm+xsIwv222IFTRY+720FJN
	ejjEzjBn/UAkMzsXgitIeLH0YITmE9/zdUiVEbjnQvH+kHkDjQgf/OFLB9Dwbp3ma3wbK8UbswH
	PEDQ29QZaMto6hAOTBIGpjrIUNqrUMpa0nYmvDDSPQNs9AcVK3xbZMFQhchZ5ZKyWZFzFR5oc9I
	oC3KyV0Vtat4J20ZQWZKzSBw8OcTfbHsLg0vPOEQYJTo0LA+exnbFd2/aL/1RUTEDPW9NZa4Hnj
	Iz0o65zyVzLjmT5kBFmTsVgtNiwmy4jjndtiNBzPrW
X-Received: by 2002:a17:903:38cf:b0:2c9:97a7:328c with SMTP id d9443c01a7336-2c997a7340dmr98402305ad.46.1782732076224;
        Mon, 29 Jun 2026 04:21:16 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.21.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:21:15 -0700 (PDT)
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
Subject: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
Date: Mon, 29 Jun 2026 19:20:30 +0800
Message-Id: <20260629112032.20423-5-jiahao.kernel@gmail.com>
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

Zswap currently writes back pages to backing swap reactively, triggered
either by the shrinker or when the pool reaches its size limit. There is
no mechanism to control the amount of writeback for a specific memory
cgroup. However, users may want to proactively write back zswap pages,
e.g., to free up memory for other applications or to prepare for
memory-intensive workloads.

Introduce a "source=" key to the memory.reclaim cgroup interface,
currently accepting the single value "zswap". When set to "zswap", it
bypasses standard memory reclaim and exclusively performs proactive
zswap writeback up to the requested budget. If omitted, the default
reclaim behavior remains unchanged.

Example usage:
  # Write back 10MB of compressed data from zswap to the backing swap
  echo "10M source=zswap" > memory.reclaim

Note that the actual amount of compressed data written back may be less
than requested due to the zswap second-chance algorithm: referenced
entries are rotated on the LRU on the first encounter and only written
back on a second pass. If fewer bytes are written back than requested,
-EAGAIN is returned, matching the existing memory.reclaim semantics.

Internally, extend user_proactive_reclaim() to parse the new "source="
key and invoke the dedicated handler zswap_proactive_writeback() when it
is set to "zswap". This handler walks the target memcg subtree in a
round-robin fashion and drains each memcg's per-node zswap LRUs through
shrink_memcg(), accumulating the compressed bytes written back until the
requested budget is met.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 ++++++++-
 Documentation/admin-guide/mm/zswap.rst  | 11 +++++-
 include/linux/zswap.h                   |  7 ++++
 mm/vmscan.c                             | 24 +++++++++++-
 mm/zswap.c                              | 50 +++++++++++++++++++++++++
 5 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 993446ab66d0..bbcc9695aa8d 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1425,9 +1425,10 @@ PAGE_SIZE multiple when read back.
 
 The following nested keys are defined.
 
-	  ==========            ================================
+	  ====================  ==================================================
 	  swappiness            Swappiness value to reclaim with
-	  ==========            ================================
+	  source=zswap          Only perform proactive zswap writeback
+	  ====================  ==================================================
 
 	Specifying a swappiness value instructs the kernel to perform
 	the reclaim with that swappiness value. Note that this has the
@@ -1437,6 +1438,19 @@ The following nested keys are defined.
 	The valid range for swappiness is [0-200, max], setting
 	swappiness=max exclusively reclaims anonymous memory.
 
+	The source=zswap key skips ordinary memory reclaim and
+	writes back pages from zswap to the backing swap device until
+	the requested amount has been written or no further candidates
+	are found. This is useful to proactively offload cold compressed
+	data from the zswap pool to the swap device. It is only available
+	if zswap writeback is enabled. source=zswap cannot be
+	combined with swappiness; specifying both returns -EINVAL.
+
+	Example::
+
+	  # Writeback up to 10MB of compressed data from zswap to the backing swap
+	  echo "10M source=zswap" > memory.reclaim
+
   memory.peak
 	A read-write single value file which exists on non-root cgroups.
 
diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index 2464425c783d..b49b8c130389 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -131,7 +131,16 @@ User can enable it as follows::
   echo Y > /sys/module/zswap/parameters/shrinker_enabled
 
 This can be enabled at the boot time if ``CONFIG_ZSWAP_SHRINKER_DEFAULT_ON`` is
-selected.
+selected. Once enabled, the shrinker automatically writes back zswap pages to
+backing swap during memory reclaim.
+
+If users want to explicitly trigger proactive zswap writeback for a specific
+memory cgroup without invoking standard page reclaim, it can be done as follows::
+
+	echo "10M source=zswap" > /sys/fs/cgroup/<cgroup-name>/memory.reclaim
+
+Both of the methods mentioned above are subject to the ``memory.zswap.writeback``
+control. This means that ``memory.zswap.writeback`` can prevent all zswap writeback.
 
 A debugfs interface is provided for various statistic about pool size, number
 of pages stored, same-value filled pages and various counters for the reasons
diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 30c193a1207e..e5f217759894 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_folio_swapin(struct folio *folio);
 bool zswap_is_enabled(void);
 bool zswap_never_enabled(void);
+int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback);
 #else
 
 struct zswap_lruvec_state {};
@@ -69,6 +70,12 @@ static inline bool zswap_never_enabled(void)
 	return true;
 }
 
+static inline int zswap_proactive_writeback(struct mem_cgroup *memcg,
+					    u64 bytes_to_writeback)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* _LINUX_ZSWAP_H */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 35c3bb15ae96..56ed7ff48ec9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -64,6 +64,7 @@
 
 #include <linux/swapops.h>
 #include <linux/sched/sysctl.h>
+#include <linux/zswap.h>
 
 #include "internal.h"
 #include "swap.h"
@@ -7855,11 +7856,13 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask,
 enum {
 	MEMORY_RECLAIM_SWAPPINESS = 0,
 	MEMORY_RECLAIM_SWAPPINESS_MAX,
+	MEMORY_RECLAIM_SOURCE,
 	MEMORY_RECLAIM_NULL,
 };
 static const match_table_t tokens = {
 	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
 	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
+	{ MEMORY_RECLAIM_SOURCE, "source=%s"},
 	{ MEMORY_RECLAIM_NULL, NULL },
 };
 
@@ -7869,9 +7872,12 @@ int user_proactive_reclaim(char *buf,
 	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
 	unsigned long nr_to_reclaim, nr_reclaimed = 0;
 	int swappiness = -1;
+	bool zswap_writeback_only = false;
 	char *old_buf, *start;
+	char source[16];
 	substring_t args[MAX_OPT_ARGS];
 	gfp_t gfp_mask = GFP_KERNEL;
+	u64 nr_bytes;
 
 	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
 		return -EINVAL;
@@ -7879,7 +7885,8 @@ int user_proactive_reclaim(char *buf,
 	buf = strstrip(buf);
 
 	old_buf = buf;
-	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
+	nr_bytes = memparse(buf, &buf);
+	nr_to_reclaim = nr_bytes / PAGE_SIZE;
 	if (buf == old_buf)
 		return -EINVAL;
 
@@ -7899,11 +7906,26 @@ int user_proactive_reclaim(char *buf,
 		case MEMORY_RECLAIM_SWAPPINESS_MAX:
 			swappiness = SWAPPINESS_ANON_ONLY;
 			break;
+		case MEMORY_RECLAIM_SOURCE:
+			if (match_strlcpy(source, &args[0], sizeof(source)) >= sizeof(source))
+				return -EINVAL;
+			/* Only zswap is supported as a reclaim source for now. */
+			if (strcmp(source, "zswap"))
+				return -EINVAL;
+			zswap_writeback_only = true;
+			break;
 		default:
 			return -EINVAL;
 		}
 	}
 
+	if (zswap_writeback_only) {
+		/* source=zswap and swappiness are mutually exclusive. */
+		if (swappiness != -1)
+			return -EINVAL;
+		return zswap_proactive_writeback(memcg, nr_bytes);
+	}
+
 	while (nr_reclaimed < nr_to_reclaim) {
 		/* Will converge on zero, but reclaim enforces a minimum */
 		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
diff --git a/mm/zswap.c b/mm/zswap.c
index ba01bf0e44e9..9cda96f05508 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1713,6 +1713,56 @@ int zswap_load(struct folio *folio)
 	return 0;
 }
 
+int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback)
+{
+	struct zswap_shrink_state s = {};
+	struct mem_cgroup *iter = NULL;
+	u64 bytes_written = 0;
+	int ret = 0;
+
+	if (!memcg)
+		return -EINVAL;
+	if (!mem_cgroup_zswap_writeback_enabled(memcg))
+		return -EINVAL;
+	if (!bytes_to_writeback)
+		return 0;
+
+	while (bytes_written < bytes_to_writeback) {
+		long shrunk;
+
+		cond_resched();
+
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+
+		/*
+		 * Use a local iterator to walk the memcg and its online descendants
+		 * in a round-robin manner. Upon exiting the loop, mem_cgroup_iter_break()
+		 * must be called to drop the iterator reference.
+		 */
+		do {
+			iter = mem_cgroup_iter(memcg, iter, NULL);
+		} while (iter && !mem_cgroup_tryget_online(iter));
+
+		shrunk = zswap_shrink_one_memcg(iter, &s);
+		if (shrunk > 0)
+			bytes_written += shrunk;
+
+		/* drop the extra reference taken by mem_cgroup_tryget_online() */
+		mem_cgroup_put(iter);
+
+		if (shrunk == -EBUSY) {
+			ret = -EAGAIN;
+			break;
+		}
+	}
+
+	mem_cgroup_iter_break(memcg, iter);
+	return ret;
+}
+
 void zswap_invalidate(swp_entry_t swp)
 {
 	pgoff_t offset = swp_offset(swp);
-- 
2.34.1

