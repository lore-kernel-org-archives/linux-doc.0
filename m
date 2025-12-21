Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED727B4E1
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766321805; cv=none; b=nf0RolAb5PerLPMNCKrm5As2zWX8P2EAiO0X78vBMJh/qD1XUhCkLbGruWyLlIzwBr755hr6N8eOhlba7nxogMKGVsjTcEO1t+SzKaKAoStLuTA6fasc1yBSn9y0poY/wUx3860vhiia6r0aTkdJ600aIB4bLtEZEK6mMTMegCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766321805; c=relaxed/simple;
	bh=P+vDLRN5bA/R1fQ89+MCNxM2c5px2Px7tk5h5VBNQok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJhIepdAns28jEZ2gc6QCq2IKFO1gbRPXIqfCX+kGAYKJytWKVGjlIoTxfcxUOSHgDRHXwB+vhIlJ0vkOt5yldWVA0hNEil3m0pdnw1dHSj1INjRWUNetUC4iYPYm8sY21Quk3xbcMYEiLSdBNDbScdtheV3m2PzjlnDz8PCoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FkBs/Ks0; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FkBs/Ks0"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b21fc25ae1so307118985a.1
        for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 04:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766321802; x=1766926602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ivv8/3ACbIKOnDf+l354pCkgSIU4HYGFindxr8g4Hs=;
        b=FkBs/Ks0WBKX8bMZLStBeXFxwcJbtKYkt1tMqVS4YkjNfLo1GoNJNTQ81FvQmId78L
         NmQK77Cx++cZJrQTiM267aUvC6WnnAKJM5rwm3oFURNH+83v4cf4zS1tHmDf8MutCE2b
         TYcblsV423ZNxgMMm9pIKJa5pf/ufTWGABWbwfwvieodTsQlcNwiTWYypsM3AU3ipqiP
         XhanSLILeA7UJYZBsDFx1nlOPMaO8FbJ1oEmHr0Hr8FOtszkS9u96CfNbfB0H4cU3f6b
         FTZXxCfMAnMf57pd5jxH8tJwxuXCT7mB1kLl+ENrx+qpMLNjvz3h5tBxjWBJF0FluSOY
         OFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766321802; x=1766926602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ivv8/3ACbIKOnDf+l354pCkgSIU4HYGFindxr8g4Hs=;
        b=WoDmJnOObdtQ7JsB/V7CFnprE2pHOREqM/5COLPmEzJjpqmXD7SqFX+y/Fn/+SpEe2
         5rMoo/YmYyoSKna69MPNDY7ErqDWKfjdQ2saGiUqjWQJIo+kRiXTWqaX+eaECLkV/O+w
         szPQNiFnPY5QZtjSIIU+k3tGJ85ZKjIUqgqbfVr+GfwMQb5s9pt9+uU7UEV6hdJ06X4p
         P0+p3nu83XoxB1V3aqSPajXR3zXVakR9kncROnx/zNX0zzTOgK0j6ECLWtsLivScz7Go
         M0gqpPhe7ElX0fIl9vSpg4l2vz9sbPIVwOus9n7sGZ2c+CXwMncLxUajA60prodvybhj
         ED3A==
X-Forwarded-Encrypted: i=1; AJvYcCVvVZE+/Iq3slUo1XTLA8K5dMJJJe1zNTnHsohytpl4o20u0bukhgMYAhg/aF1LwpwCgVTivfwOXm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXjPmePs8XKE4vBV0PUad2F8IOTuaupCK45u9Sc4IzLcOKKPL
	zSRuv39v2vc/gKhWw496Bp8gZM1GHhqnSaqhok9e2I2bouOgb0HMP6vCV75NWvZPkjo=
X-Gm-Gg: AY/fxX4NH1QB8Gi5xJKc+Dvd3yCk9mlr4YHTZaqasFROCJY4qlp7oBNNq0BRUUT7/qH
	7klxy2UDQEgRn0naEqWOlyr+CvlIkw65ZVblY5eYLuDqXzu1fu4/lFBximYRofZ9HYhy3eiVTlL
	pD0IBatjPIlxGHxBzd1yLUyFB5koOh8vz9ltswsrt9UfsHLCgHEjYi1bO7T/6WDZRpQga3WSEx1
	eXM2x5oFddqVpydhKJKcjhhZFRywJkks6Y6FLJkoLNkGzhBKV/4NyCvm8PyuZEQOQLiiH/qI9Q/
	VIeFV+Vkb/1ccYFkXJ4PhQEUB2xanDsbDsqq7oa1783LFfPm/d5F25ga++lAHH35Urp66eNJ0mV
	E9y/sr/hDVDCDa23Qbs4OyOAYzpu8uYsJ+28dpsbP3KZOnNBqjOA80bpmgNVwMnR0Kba6xK7s/b
	lRwyI1SbIcxU/YQq1aGIEjiJqGOJrRvT98X5ALF6MERsDeIP+EehOYVB9dACJeA4peFzbW/tikb
	GcMovB4POreUA==
X-Google-Smtp-Source: AGHT+IE0BrkfD+Cy9oYJoP0dF/V6XgbZIAfAJdoj4kHZiMOQbZ89Gxxq8Q27csX/VrtUN9ShpMHINQ==
X-Received: by 2002:a05:620a:190a:b0:8b2:eea5:32f8 with SMTP id af79cd13be357-8c08f6763bamr1307185985a.34.1766321801715;
        Sun, 21 Dec 2025 04:56:41 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0968935b5sm619955385a.19.2025.12.21.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 04:56:41 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	muchun.song@linux.dev,
	hannes@cmpxchg.org,
	gourry@gourry.net,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	David Rientjes <rientjes@google.com>
Subject: [PATCH v5] mm, hugetlb: implement movable_gigantic_pages sysctl
Date: Sun, 21 Dec 2025 07:56:03 -0500
Message-ID: <20251221125603.2364174-1-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reintroduces a concept removed by:
commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")

This sysctl provides flexibility between ZONE_MOVABLE use cases:
1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable

When ZONE_MOVABLE is used to make huge page allocation more reliable,
disallowing gigantic pages memory in this region is pointless.  If
hotplug is not a requirement, we can loosen the restrictions to allow
1GB gigantic pages in ZONE_MOVABLE.

Since 1GB can be difficult to migrate / has impacts on compaction /
defragmentation, we don't enable this by default. Notably, 1GB pages
can only be migrated if another 1GB page is available - so hot-unplug
will fail if such a page cannot be found.

However, since there are scenarios where gigantic pages are migratable,
we should allow use of these on movable regions.

When not valid 1GB is available for migration, hot-unplug will retry
indefinitely (or until interrupted).  For example:

  echo 0 > node0/hugepages/..-1GB/nr_hugepages  # clear node0 1GB pages
  echo 1 > node1/hugepages/..-1GB/nr_hugepages  # reserve node1 1GB page
  ./alloc_huge_node1 &    # Allocate a 1GB page on node1
  ./node1_offline  &      # attempt to offline all node1 memory
  echo 1 > node0/hugepages/..-1GB/nr_hugepages  # reserve node0 1GB page

In this example, node1_offline will block indefinitely until the final
step, when a node0 1GB page is made available.

Note: Boot-time CMA is not possible for driver-managed hotplug memory,
as CMA requires the memory to be registered as SystemRAM at boot time.
Additionally, 1GB huge pages are not supported by THP.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Suggested-by: David Rientjes <rientjes@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
---
v5: build fixes, clean allconfig build with intel/klp.
    Sorry about the careless churn Andrew, should be clean now.

 .../admin-guide/mm/memory-hotplug.rst         | 14 ++++++++--
 Documentation/admin-guide/sysctl/vm.rst       | 28 +++++++++++++++++++
 include/linux/hugetlb.h                       |  3 +-
 mm/hugetlb_sysctl.c                           | 11 ++++++++
 4 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 33c886f3d198..6581558fd0d7 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -612,8 +612,9 @@ ZONE_MOVABLE, especially when fine-tuning zone ratios:
   allocations and silently create a zone imbalance, usually triggered by
   inflation requests from the hypervisor.
 
-- Gigantic pages are unmovable, resulting in user space consuming a
-  lot of unmovable memory.
+- Gigantic pages are unmovable when an architecture does not support
+  huge page migration and/or the ``movable_gigantic_pages`` sysctl is false.
+  See Documentation/admin-guide/sysctl/vm.rst for more info on this sysctl.
 
 - Huge pages are unmovable when an architectures does not support huge
   page migration, resulting in a similar issue as with gigantic pages.
@@ -672,6 +673,15 @@ block might fail:
 - Concurrent activity that operates on the same physical memory area, such as
   allocating gigantic pages, can result in temporary offlining failures.
 
+- When an admin sets the ``movable_gigantic_pages`` sysctl to true, gigantic
+  pages are allowed in ZONE_MOVABLE.  This only allows migratable gigantic
+  pages to be allocated; however, if there are no eligible destination gigantic
+  pages at offline, the offlining operation will fail.
+
+  Users leveraging ``movable_gigantic_pages`` should weigh the value of
+  ZONE_MOVABLE for increasing the reliability of gigantic page allocation
+  against the potential loss of hot-unplug reliability.
+
 - Out of memory when dissolving huge pages, especially when HugeTLB Vmemmap
   Optimization (HVO) is enabled.
 
diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 4d71211fdad8..d2e13413e16e 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -54,6 +54,7 @@ Currently, these files are in /proc/sys/vm:
 - mmap_min_addr
 - mmap_rnd_bits
 - mmap_rnd_compat_bits
+- movable_gigantic_pages
 - nr_hugepages
 - nr_hugepages_mempolicy
 - nr_overcommit_hugepages
@@ -624,6 +625,33 @@ This value can be changed after boot using the
 /proc/sys/vm/mmap_rnd_compat_bits tunable
 
 
+movable_gigantic_pages
+======================
+
+This parameter controls whether gigantic pages may be allocated from
+ZONE_MOVABLE. If set to non-zero, gigantic pages can be allocated
+from ZONE_MOVABLE. ZONE_MOVABLE memory may be created via the kernel
+boot parameter `kernelcore` or via memory hotplug as discussed in
+Documentation/admin-guide/mm/memory-hotplug.rst.
+
+Support may depend on specific architecture.
+
+Note that using ZONE_MOVABLE gigantic pages make memory hotremove unreliable.
+
+Memory hot-remove operations will block indefinitely until the admin reserves
+sufficient gigantic pages to service migration requests associated with the
+memory offlining process.  As HugeTLB gigantic page reservation is a manual
+process (via `nodeN/hugepages/.../nr_hugepages` interfaces) this may not be
+obvious when just attempting to offline a block of memory.
+
+Additionally, as multiple gigantic pages may be reserved on a single block,
+it may appear that gigantic pages are available for migration when in reality
+they are in the process of being removed. For example if `memoryN` contains
+two gigantic pages, one reserved and one allocated, and an admin attempts to
+offline that block, this operations may hang indefinitely unless another
+reserved gigantic page is available on another block `memoryM`.
+
+
 nr_hugepages
 ============
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 019a1c5281e4..5c190b22108e 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -171,6 +171,7 @@ bool hugetlbfs_pagecache_present(struct hstate *h,
 
 struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
 
+extern int movable_gigantic_pages __read_mostly;
 extern int sysctl_hugetlb_shm_group __read_mostly;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
@@ -924,7 +925,7 @@ static inline bool hugepage_movable_supported(struct hstate *h)
 	if (!hugepage_migration_supported(h))
 		return false;
 
-	if (hstate_is_gigantic(h))
+	if (hstate_is_gigantic(h) && !movable_gigantic_pages)
 		return false;
 	return true;
 }
diff --git a/mm/hugetlb_sysctl.c b/mm/hugetlb_sysctl.c
index bd3077150542..e74cf18ad431 100644
--- a/mm/hugetlb_sysctl.c
+++ b/mm/hugetlb_sysctl.c
@@ -8,6 +8,8 @@
 
 #include "hugetlb_internal.h"
 
+int movable_gigantic_pages;
+
 #ifdef CONFIG_SYSCTL
 static int proc_hugetlb_doulongvec_minmax(const struct ctl_table *table, int write,
 					  void *buffer, size_t *length,
@@ -125,6 +127,15 @@ static const struct ctl_table hugetlb_table[] = {
 		.mode		= 0644,
 		.proc_handler	= hugetlb_overcommit_handler,
 	},
+#ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
+	{
+		.procname	= "movable_gigantic_pages",
+		.data		= &movable_gigantic_pages,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+#endif
 };
 
 void __init hugetlb_sysctl_init(void)
-- 
2.52.0

