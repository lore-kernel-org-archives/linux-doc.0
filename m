Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AE2F657C
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770007; cv=none; b=WFEUEUgwJNtpTnofLPDAAZBgNfMy0ka0QrZXkEzTIpR97+izGvFTOK/kd2gYntBC39pjCmBO8zi5Q5RrsoNlunoKuzoFztbXTeySsu20tflM/dWZYBcI5FeAgXygi6MW7obtsWvCDV6RM1qcSrh/qtgC3o2V/CxcUDFdYLJqovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770007; c=relaxed/simple;
	bh=GqUB6OdRuR8B21IHUNRuCDfou43BL1Hu4iux/1Rgm2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VM6BUclE9TPJ4+IL61ld8LBUlC2dA+HEsDtgSomEFeJl4KVA/A3icjUPdOih6puQVHD+YSQalPnOHL70xNbV6xVFzncgsDIjJJOw9/3/CkfkefOkWpIaxCjX2bD8+Llgjn4nqBKvSycG4LW7rK4IYy2POBV1BaMdWd2CfYAuPh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=UrC7Vxy9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="UrC7Vxy9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-341988c720aso2324954a91.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 02:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762770004; x=1763374804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9Um+h9dOsIowK0Xeh4oFsJO5SmqkrPeMg+IBmuohd8=;
        b=UrC7Vxy9NcOWP0GluQ0+3haj3LpfvglBOtrHkGy5ENZsletZ8q2xJQVQT7nDnJm9G1
         i/mG4ofKsZZIxaNHWLSK0TNwkfv45fjxDtpjPY/pZNyGb8kRaSpVaOpG7AqhaBT46n5w
         N61R6PgVRuZctFD1zPXUzNoIP2A175oynVWjJk9YzBKcGekiaAJCE7vR7Aa6Ymx1SKjR
         kHSJZ28MjuAPqHgDJcMXi9RHRpbcg373cajVcydof92fnZYwvuwdkjxTSuJsE5GatfMY
         Gu9gtcyCK0vBcqKFDqOoeq+SKDBPtZfBvMS7yxnwbVV6Q12GmHwK1olSC5uuaUsJuGH2
         rNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770004; x=1763374804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9Um+h9dOsIowK0Xeh4oFsJO5SmqkrPeMg+IBmuohd8=;
        b=WDvbByIfJpBqItYTJMVpls5sWg1hNn+cSRW1xSjepubBfOXMeGc6+EUJ2Dg1sn5onn
         tkejLi4LlS0bygVA81rEzX3cLkMrdsiw1bC79aqAH6hB1yvN48vpRyXVpteYeliTT2L/
         7mXyjUQJZEVx5YjXmm9DYzq3teoynmvjwT1YG+vFUV5HKIRSIOzs2Zy4Ov046z4NP+rI
         pryqeNJf2SEWlUOLZQVdlTWIvB8vuIlqiYQp7bd6g486wim+aWIC3590o14dHyvcRmIv
         iduSG03eQrmfTN0F6+sOZSsVr6RnCrIPobE37f3sLhxbkcdz0I8gGzCy1sFEaiiZsI3r
         MoNA==
X-Forwarded-Encrypted: i=1; AJvYcCXHW7oscMwbcX9SSe8hhgEMLEJoBypMl4EHjTErQRUCwxSEXeeW5xhfOlunah6ImzXu8g2Eqp+yHGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQA54biPz21mWXNm3hIvGwnxo89r64z1iNPZO6Zf5RttGAgB4Y
	VMVishHq0yH/MX4qR/PFM0NFoQRkFyTnSYT4VOmRf7I1FlC+r/5xSRs5xA+HB1J96TI=
X-Gm-Gg: ASbGnctMF5vws6uyQV4LN2XOvNr7pKG8OPuo+nPftZX3grlC/tWtIvi/0VUxJ2ivnsi
	pvu66vReQ93o6trehus9Iry+IjNPuY6tMBR1zboO0rjcw4dV9yS7L0XxiC+PoRJFKwUmWj9C1q8
	9N720u9BB6GEFxYgFK0WqUxuikkS7t69ynSBd0tyoLT0owTuQGkWpdVp4NyHpj0d9cbCq0IH5OX
	+mBrPwfyCYN2ARey+yG4aNLQMVWxBNdbGEYvXyEuXOJffJ/h0YLunn1Zw5+xj5/7tcp+eW1pxmi
	hFDUTsG+VPG9zhnr85/irCsMzK+hiOemZxkrVZqSKBuzpY+zjDQy1iIlh+J4lnOIbiOaGryVnha
	3KLS32yoG5gx4rPhAqbQVEjSXMHP8HtQUt4CzUIkGqid0ETzdXV66JTM81iMldPYsEXz4yCloQO
	k6hktQNgqD4PBmpg==
X-Google-Smtp-Source: AGHT+IGg+qZi4q9NfQViBJozr4dBl5TzCMHd9K8BS4nEMBk0sFI9y2oNIm83/8ZcSK7PJ3Gqzu8SSQ==
X-Received: by 2002:a17:90b:582b:b0:340:f05a:3ec3 with SMTP id 98e67ed59e1d1-3436cbc8edamr8666587a91.33.1762770003828;
        Mon, 10 Nov 2025 02:20:03 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm17372339a91.19.2025.11.10.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:20:03 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: linux-mm@kvack.org
Cc: tj@kernel.org,
	mkoutny@suse.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	joel.granados@kernel.org,
	jack@suse.cz,
	laoar.shao@gmail.com,
	mclapinski@google.com,
	kyle.meyer@hpe.com,
	corbet@lwn.net,
	lance.yang@linux.dev,
	leon.huangfu@shopee.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for on-demand stats flushing
Date: Mon, 10 Nov 2025 18:19:48 +0800
Message-ID: <20251110101948.19277-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory cgroup statistics are updated asynchronously with periodic
flushing to reduce overhead. The current implementation uses a flush
threshold calculated as MEMCG_CHARGE_BATCH * num_online_cpus() for
determining when to aggregate per-CPU memory cgroup statistics. On
systems with high core counts, this threshold can become very large
(e.g., 64 * 256 = 16,384 on a 256-core system), leading to stale
statistics when userspace reads memory.stat files.

This is particularly problematic for monitoring and management tools
that rely on reasonably fresh statistics, as they may observe data
that is thousands of updates out of date.

Introduce a new write-only file, memory.stat_refresh, that allows
userspace to explicitly trigger an immediate flush of memory statistics.
Writing any value to this file forces a synchronous flush via
__mem_cgroup_flush_stats(memcg, true) for the cgroup and all its
descendants, ensuring that subsequent reads of memory.stat and
memory.numa_stat reflect current data.

This approach follows the pattern established by /proc/sys/vm/stat_refresh
and memory.peak, where the written value is ignored, keeping the
interface simple and consistent with existing kernel APIs.

Usage example:
  echo 1 > /sys/fs/cgroup/mygroup/memory.stat_refresh
  cat /sys/fs/cgroup/mygroup/memory.stat

The feature is available in both cgroup v1 and v2 for consistency.

Signed-off-by: Leon Huang Fu <leon.huangfu@shopee.com>
---
v2 -> v3:
  - Flush stats by memory.stat_refresh (per Michal)
  - https://lore.kernel.org/linux-mm/20251105074917.94531-1-leon.huangfu@shopee.com/

v1 -> v2:
  - Flush stats when write the file (per Michal).
  - https://lore.kernel.org/linux-mm/20251104031908.77313-1-leon.huangfu@shopee.com/

 Documentation/admin-guide/cgroup-v2.rst | 21 +++++++++++++++++--
 mm/memcontrol-v1.c                      |  4 ++++
 mm/memcontrol-v1.h                      |  2 ++
 mm/memcontrol.c                         | 27 ++++++++++++++++++-------
 4 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 3345961c30ac..ca079932f957 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1337,7 +1337,7 @@ PAGE_SIZE multiple when read back.
 	cgroup is within its effective low boundary, the cgroup's
 	memory won't be reclaimed unless there is no reclaimable
 	memory available in unprotected cgroups.
-	Above the effective low	boundary (or
+	Above the effective low	boundary (or
 	effective min boundary if it is higher), pages are reclaimed
 	proportionally to the overage, reducing reclaim pressure for
 	smaller overages.
@@ -1785,6 +1785,23 @@ The following nested keys are defined.
 		up if hugetlb usage is accounted for in memory.current (i.e.
 		cgroup is mounted with the memory_hugetlb_accounting option).

+  memory.stat_refresh
+	A write-only file which exists on non-root cgroups.
+
+	Writing any value to this file forces an immediate flush of
+	memory statistics for this cgroup and its descendants. This
+	ensures subsequent reads of memory.stat and memory.numa_stat
+	reflect the most current data.
+
+	This is useful on high-core count systems where per-CPU caching
+	can lead to stale statistics, or when precise memory usage
+	information is needed for monitoring or debugging purposes.
+
+	Example::
+
+	  echo 1 > memory.stat_refresh
+	  cat memory.stat
+
   memory.numa_stat
 	A read-only nested-keyed file which exists on non-root cgroups.

@@ -2173,7 +2190,7 @@ of the two is enforced.

 cgroup writeback requires explicit support from the underlying
 filesystem.  Currently, cgroup writeback is implemented on ext2, ext4,
-btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
+btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
 attributed to the root cgroup.

 There are inherent differences in memory and writeback management
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 6eed14bff742..c3eac9b1f1be 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -2041,6 +2041,10 @@ struct cftype mem_cgroup_legacy_files[] = {
 		.name = "stat",
 		.seq_show = memory_stat_show,
 	},
+	{
+		.name = "stat_refresh",
+		.write = memory_stat_refresh_write,
+	},
 	{
 		.name = "force_empty",
 		.write = mem_cgroup_force_empty_write,
diff --git a/mm/memcontrol-v1.h b/mm/memcontrol-v1.h
index 6358464bb416..a14d4d74c9aa 100644
--- a/mm/memcontrol-v1.h
+++ b/mm/memcontrol-v1.h
@@ -29,6 +29,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg);
 unsigned long memcg_events(struct mem_cgroup *memcg, int event);
 unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item);
 int memory_stat_show(struct seq_file *m, void *v);
+ssize_t memory_stat_refresh_write(struct kernfs_open_file *of, char *buf,
+				  size_t nbytes, loff_t off);

 void mem_cgroup_id_get_many(struct mem_cgroup *memcg, unsigned int n);
 struct mem_cgroup *mem_cgroup_id_get_online(struct mem_cgroup *memcg);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index bfc986da3289..19ef4b971d8d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -610,6 +610,15 @@ static void __mem_cgroup_flush_stats(struct mem_cgroup *memcg, bool force)
 	css_rstat_flush(&memcg->css);
 }

+static void memcg_flush_stats(struct mem_cgroup *memcg, bool force)
+{
+	if (mem_cgroup_disabled())
+		return;
+
+	memcg = memcg ?: root_mem_cgroup;
+	__mem_cgroup_flush_stats(memcg, force);
+}
+
 /*
  * mem_cgroup_flush_stats - flush the stats of a memory cgroup subtree
  * @memcg: root of the subtree to flush
@@ -621,13 +630,7 @@ static void __mem_cgroup_flush_stats(struct mem_cgroup *memcg, bool force)
  */
 void mem_cgroup_flush_stats(struct mem_cgroup *memcg)
 {
-	if (mem_cgroup_disabled())
-		return;
-
-	if (!memcg)
-		memcg = root_mem_cgroup;
-
-	__mem_cgroup_flush_stats(memcg, false);
+	memcg_flush_stats(memcg, false);
 }

 void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
@@ -4530,6 +4533,12 @@ int memory_stat_show(struct seq_file *m, void *v)
 	return 0;
 }

+ssize_t memory_stat_refresh_write(struct kernfs_open_file *of, char *buf, size_t nbytes, loff_t off)
+{
+	memcg_flush_stats(mem_cgroup_from_css(of_css(of)), true);
+	return nbytes;
+}
+
 #ifdef CONFIG_NUMA
 static inline unsigned long lruvec_page_state_output(struct lruvec *lruvec,
 						     int item)
@@ -4666,6 +4675,10 @@ static struct cftype memory_files[] = {
 		.name = "stat",
 		.seq_show = memory_stat_show,
 	},
+	{
+		.name = "stat_refresh",
+		.write = memory_stat_refresh_write,
+	},
 #ifdef CONFIG_NUMA
 	{
 		.name = "numa_stat",
--
2.51.2

