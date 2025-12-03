Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D20239E7E
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743922; cv=none; b=KvYMxNV6AKyYxMgXxBPVFBYOJoNrZ+yqxi4LtmzEntGaAQZRcpygZ8rOI+JUvIkrYGpXLuJXLILWSn5NEXuhOJtwBJVG6PCSlDeBbLpMni39JdPl9lqp7gWwR159Mgzbb0IKGISEmHSOVSyLFj7JlrCMpulVrhfmg2tE1JG2tbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743922; c=relaxed/simple;
	bh=hEN9MJGxU3zqBCGV67E1XxamOMWFtnz4xHOC10qhtaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9IcfX2xb44Dg/wNf1aLcN4d3JjbyAecDCBJf1k33l0FvHtbG+mejAS1C/HXu4NlmGgUut2G32XB8/Zzpc06X0F/0Rk0yd5Nn4DJZ2HDmo5tZgik6yjoNYJ5y/+N2jb5CgTbu8025tVqSuKTSPw0A8kgEkqVMiJoqknECZWPWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uSw7UZkg; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uSw7UZkg"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso75129911cf.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 22:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764743919; x=1765348719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9S8oWWqtxvxhyq40CD0IJGBT9vC2Emq6MEZGdYkjVic=;
        b=uSw7UZkgVoJbrKWtolOyfS4fa3FBaAvdrNIGHzO9xITDxtgW1UV1Ffag4KMv7dYoyP
         WdyS79JxbvfrlifOkZuSsHv69f7oRAMLApnSAPBwpV4JDdifYBT6DIMP7MI7i0ojd+aB
         v41b1WIP2X16nNwMCHz+BfB2KFOhPCVcoF/XIPf12cb2V2Yvqyo80Yst3UzIxev7Qio+
         k2ql6VKkUFuWJDaDBYNg7nHf9glxE+lr4Fh8Vb2oPCSEQw5v223TlXOC0s3y4E+k+Lcl
         sc++W8miSJxOSPcY7leN18gTb8iPEZ8+91pBqOU0ORPu5XUBs4nZdN/GSWQwexxWm0yP
         2Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764743919; x=1765348719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S8oWWqtxvxhyq40CD0IJGBT9vC2Emq6MEZGdYkjVic=;
        b=jWhTXuD7HdGCwWMcDbPuP/RwStWmfyVtg0hAmLJzczrqyqDSh7y2nBkPG/QpDpTsPO
         uJJEk01fZSW06aohXvJWzW21pxGpFou7gj/74RYzLlU135SmusRspZeBw4YCUV9ecOOF
         u8pT8ZE5kayWNt7N+GML9i8wRIB1VcbOLKQefdimACCeEiiSAV/qkYsLSDs4aNUBzCTe
         UMi5S87R2AoJ3QXJ2A5hWwT69ooaGRl8l9DmGsT2GoSlHtpbjvjVGDCzbNVm9B8UG7rC
         gBK+LPyqSa3sjU0HcEVRI6ZScSYnuNW0lq7sODMGEQ18ZXDuz5JXASwtwYXBkFwXIGBX
         qv6A==
X-Forwarded-Encrypted: i=1; AJvYcCWhJl+9zDFHyp6WP6jJVEhe2XbGKyeULwqez90omeFlhzR7vLmbX6J9cPwONH5b9aXbAzRJTjang3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ojxwrGv4LYC6IzDjxj+/eyrIJeeUjIpIWoNwSZUKTV7k5C9Z
	Y7cdAqp/dd5JSutvQONbKlot28Hb+4/t0tdpGEFmNIFmvqMIVD+7mr4htrIIxAIkdf+HV1Cpj6z
	0Ayry
X-Gm-Gg: ASbGnctKTk3PIhP1xl+5y5aIcq6dZ9vAHTFdXxWSz4EyfULqOVuoro1ajHiysmP/mwc
	qgv/4DX13lw978dL8Un0nDw+r5zr8gv7Z7aOgvZWttIsR8ksI8ffKKdjAKPfimwsTBwMbjXxCc9
	uQpLU5tXMNFN9LdJrGeuqoKP1zeqzpOWHwa5TI3ajV0+dUWhKTbJTOivIk4duexde7EN/CrdaQ+
	MO80E4OoWDPqQPEGY5deQGvTjg70eL9noTxyiqTTf5DrfoZQ6UMpoG+Zp2EE3QkMOEzDpaxiy4C
	mPVsO2o1OmISFUX+M/zG1vCoT4uoMHLMeW/RBfxrbKXNcZcLQ+usyb+XcFnYnl74js2r8GcxWAR
	EDh67bHj3ZIq5nuCs1C3T+jC1jccT5EozxlfbzfI9cIx1Jc5pQo1mgpCXaBmnD+Z1z/Fa5Q1m2f
	SbaYB4EWXydc7he2D+FWxDpyzzPrTfuIyfFjrbSD4NtzBchGsfkX2jHPLR0L52fNYI21By/vSuk
	U4cz7mAVTy9dQ==
X-Google-Smtp-Source: AGHT+IG2GsJDu1Gr867kRn/HsSoRcJfAe6D3mpSj1vgtxayK1qOVZUhW3MX+moExAjZkAMo5bpt1Hw==
X-Received: by 2002:ac8:5fce:0:b0:4ee:222b:660a with SMTP id d75a77b69052e-4f0177152ddmr18215391cf.76.1764743919621;
        Tue, 02 Dec 2025 22:38:39 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fd00c0sm109192511cf.13.2025.12.02.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 22:38:38 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
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
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: [PATCH v3] mm, hugetlb: implement movable_gigantic_pages sysctl
Date: Wed,  3 Dec 2025 01:38:36 -0500
Message-ID: <20251203063836.187016-1-gourry@gourry.net>
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

Note: Boot-time CMA is not possible for driver-managed hotplug memory,
as CMA requires the memory to be registered as SystemRAM at boot time.
Additionally, 1GB huge pages are not supported by THP.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Alexandru Moise <00moses.alexander00@gmail.com>
Suggested-by: David Rientjes <rientjes@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 14 ++++++++++++--
 Documentation/admin-guide/sysctl/vm.rst         | 17 +++++++++++++++++
 include/linux/hugetlb.h                         |  3 ++-
 mm/hugetlb.c                                    |  1 -
 mm/hugetlb_sysctl.c                             |  9 +++++++++
 5 files changed, 40 insertions(+), 4 deletions(-)

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
index 4d71211fdad8..36a390c0561e 100644
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
@@ -624,6 +625,22 @@ This value can be changed after boot using the
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
+Note that using ZONE_MOVABLE gigantic pages may make features like
+memory hotremove more unreliable, as migrating gigantic pages is more
+difficult due to needing larger amounts of physically contiguous memory.
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

