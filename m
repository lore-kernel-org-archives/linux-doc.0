Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A934B413
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070774; cv=none; b=C515dFvI859E2mczJeCB1spSJRU8x42xu75q2vvCZXoaY8Qfr59RHgqwmUwrDs/DxIF8n0W5c1zNFKAycoFGkNuiH3+9TMjoE9qIo/yANz1xhxLezmNUA0fPQACTVYBL1QonHkQpQLTFzAY62RjEHWGY6470xiFjWGg6jshFeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070774; c=relaxed/simple;
	bh=+2BbT7ZdrJHpNk56nfKKYn8WJrq68cefYFV/yfVNGMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WI84aSIvsP9QnDfXzgaUCycBuE+La1q6ZPwlQHX+h74TfBNNcJkvJkCmjjv02Ka7UFPyoyoqNSM+R7jWpoLrj2Jp2nQ81NHyf0A6V6RDaprJs4+WkCp3RjxtUJGLktoZHp9UWp04H53Wt9MHU0oG7w33tEtT3fdlvRmJeht6Rp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WewrITYg; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WewrITYg"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8b21fc25ae1so72857185a.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766070770; x=1766675570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLCkWcJ72BOOvYYIVNRu59Wv5wRsTr7T9AgAEW6gOVw=;
        b=WewrITYg+2hnXqiB+Ua1M6W3fSe3wrcL6bj5Pw9Nz0OtX2PoGvpOK8qzpUmDNfZH+m
         pwp9eU1J9v6jrVw4fo044d005Rilz2MzcsxbIfPwxZ4Vw4Cl3byD9MVlc5OrZyZJ7WMx
         p0StzZyrfrLGAQOqlpSqMKIdPnjRClNqqC2Q1JCmG93pSnDh//IcKSVLdQ/d2az1XJ7f
         pPzVJtk/pPjjO8OGxbBbx6Y5ySSIY3AFu/PRoXfb/mUbVH935TuUXSsducE/vDiHiBoS
         ttBrUHF+Y9qxZQYHVfvUW/EJPa2mkXRFnNe1441PUGruBbnxKugynniIG0l9W04MV+kG
         boyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070770; x=1766675570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLCkWcJ72BOOvYYIVNRu59Wv5wRsTr7T9AgAEW6gOVw=;
        b=MwwyhLsELl15efQ5yf/D9aCXADvR6HUPNuK83K0XEitgzFiIrA4r9XiN+hvZ13gwRg
         fH8UV0IOyM8bNVAf30ZmIs9/yvKHb7il6lJKvJgPUKLHSbRnIeiPKPJox6yAcZx4e2rP
         Ezc3yopb9l58+kKNQyYSIuHdFd8H45JIG1p6yiUj4HyCSBGs6RgMtJ8uiGF97ejf32TM
         W91aL8T80qAvJlUpDplAjjDKWrwNOAWrhAvfdCnpT1AiWHSZlMdr5I2noZ48ELksdTdP
         tvz8Ez1UTFlr+L06m1WnC3ZoMeE34zkNVbdh8ISr9kie9yGy3lnVIgrJIEZZpEYkdFSj
         /U1Q==
X-Gm-Message-State: AOJu0YyQPT6j0x8gliDMSVaMC4WJi/hYkICaI0v1AwLhqE7tTGgUpdye
	Hd8K95/P0BMDGCT4jV+iCEAlHu6mva/vLoLWN34Hy4uLqQrVw2dGGrYkbjBWEhrP1yo=
X-Gm-Gg: AY/fxX6/hN98i8yqjl/2NEConeFS6LTfdSzZ36ex1KotbVQo55PaOEF/7ZnCD/njZ+J
	2xDq8DgEYHqEgDspeWTjJeQsYc4+XQREQQiSDYMIZNMPYkRjzaiev1pfZqaTDTR1W5P4k7LqOK9
	rKsH0B2jOYoDxNrA1uETMpa1Sq2Pi/wvI2EmtADAVFqlDgYm71j1uhiQiy1DM+ii4T/psa88gjS
	LJPT/+Mv0aPm0meogfEo55exTPvEFPHsHTJKMxOWo3+beQ/fJBXOz+0DyHgsBMhQQOjKpFlhdqS
	R4i+jlFcnaoljJ+SxBx8dVhJpZN9Ts2KBB1Dgh06ekc7RG2HlKMTwGvQoV07EiIeLBsEkxPs1SE
	4A8URu5JBGwpVGqxEaCnjEvJ1k1fn2EwCBPaIh4Hugrn7WTZEVkQsBneFIX6n/nMdmi2rPzQAiF
	rJ339Ve16UAVq5F/7pGhlEkvSZbbAqETJLfenOImGgyvfQVnLUmK3cVtSuoEu6DWVloSy1Y7uhC
	uQ=
X-Google-Smtp-Source: AGHT+IF8QOjxn198ZMWdMy5FbBZV7CcXkJ/i3SNag1nGec5ERyqxySnQHrvGD+ibIfbBL8iHi7Z+2Q==
X-Received: by 2002:a05:620a:4706:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8bb3a36becemr3007188885a.54.1766070769870;
        Thu, 18 Dec 2025 07:12:49 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeba394cfsm181923385a.42.2025.12.18.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:49 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	laoar.shao@gmail.com,
	brauner@kernel.org,
	jack@suse.cz,
	hannes@cmpxchg.org,
	gourry@gourry.net,
	mclapinski@google.com,
	joel.granados@kernel.org,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	David Rientjes <rientjes@google.com>
Subject: [PATCH v4] mm, hugetlb: implement movable_gigantic_pages sysctl
Date: Thu, 18 Dec 2025 10:12:11 -0500
Message-ID: <20251218151211.1237411-1-gourry@gourry.net>
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
v4: additional hotplug documentation requested by David

 .../admin-guide/mm/memory-hotplug.rst         | 14 ++++++++--
 Documentation/admin-guide/sysctl/vm.rst       | 28 +++++++++++++++++++
 include/linux/hugetlb.h                       |  3 +-
 mm/hugetlb.c                                  |  1 -
 mm/hugetlb_sysctl.c                           |  9 ++++++
 5 files changed, 51 insertions(+), 4 deletions(-)

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
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9e7815b4f058..084d45d5311d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -49,7 +49,6 @@
 #include "internal.h"
 #include "hugetlb_vmemmap.h"
 #include "hugetlb_cma.h"
-#include "hugetlb_internal.h"
 #include <linux/page-isolation.h>
 
 int hugetlb_max_hstate __read_mostly;
diff --git a/mm/hugetlb_sysctl.c b/mm/hugetlb_sysctl.c
index bd3077150542..22a9e15e534f 100644
--- a/mm/hugetlb_sysctl.c
+++ b/mm/hugetlb_sysctl.c
@@ -125,6 +125,15 @@ static const struct ctl_table hugetlb_table[] = {
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

