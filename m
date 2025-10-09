Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F401A9FAF
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026525; cv=none; b=q17HG5BeHBQJkbvZep5hbWGMDTiDTi1uZPBILIriZKI9ImaEWGtqyr8luWCt0RADRYD/wHRG/re5yGIfQ96X+rYUqJClyOp8pWkGTrtEm65PvPFp7SOt97KViEPgwO6yAxYzdXD4Ehz/HRbl+3qo6uhRx9C2Fo+s2zRRWlyaal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026525; c=relaxed/simple;
	bh=oGk2QLydZ4vPVtGl33YOjNXkPTH69PgzTxez7YUnJ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQz/6yaXz7mphESuPpp03Gox5q3tlHTFEq8pLtVAJ7COqOPgqUHFPIB+qP4tYZt8Yb+75q+Jv1HO4mrv7cCjuVTLEaUMHLPdj1W2ImIHzCdz0wz8fT2paC1NMZuoq8FF9n0AgSzDVV/4h1d0K87kUHpEogwN/iiKPLBkrUk6LT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=P4J0IxF2; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="P4J0IxF2"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-875d55217a5so120731485a.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760026521; x=1760631321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+5SvdqRqDaLVpZovzo/tjgIBi731xvYHaxEt2u52vI=;
        b=P4J0IxF2obcqdX+Dmnm2EWX0PfZ8lQ28UyD2+CZ8+luaV2KLubQToFCdv1gKyVi3qs
         mZI+H3mN0tQ6L14W70deg4y5/0J4Ar28cWWikj52zjly3/Ehraez/gOhAikkjkeg/71U
         OWoqWiplnioHzxrow8msLW9GsVW1Iu0hb/WA9k28/WfOlQMZTfwVCL/xYiLdnkrqu+4G
         RVajzcf++Ibf3i36uPyioXJMP3B0yS86/DRbi+baIm4Y5YQwK+rbO0C90At9fMEDTppc
         GJq5zRRGIdGLRZS3YNr5vE+D3KnzEelZGAqlJcMtb46pRpzAwCmMqLpIrml7qHCS3eCp
         BGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026521; x=1760631321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+5SvdqRqDaLVpZovzo/tjgIBi731xvYHaxEt2u52vI=;
        b=dzziOgZnTnYENQEn48KGgtbgXrSyotXd2qRHGvICyYCtCKOJPuq9lk1tHldTA3JEIE
         hSdqH9mw4nDK2holqJeZtkafexhJmGILbp53VERi2ajZYMdIxSf3FrJbGqYU6BN33NMx
         PWwaMfJaie6I0LyUma3TFAFzIZ5XvxZK/8hpapjk6L/jQNx+GQReWiyL1JsY8hs946u5
         wUgFESI8WDYprv9DQZU+HD7nif+0JP0dNCGEBJZJctvBul4IsxkX4J9C9DL+f5qA7ugJ
         bdmJf8yXuPItwB3sLgkGjLT9I7QSvcqXM8i8WJBbdmQ1756hw72p3ejsGUyde9iaBUP9
         VSJA==
X-Forwarded-Encrypted: i=1; AJvYcCVNA2XIZHQidbOcXnu0d/BRQI3nkMM+CNKQcEYCg7zdPxH6wz6t+nGunUlHxUHQFPCkrEEov2nc9nE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuiZsVRsZUwKhc+QedC4EE12Z2ur2Psq56aAEpg0gpcq7pqor9
	pR8VbCXCPlsk8ut8JKZAzKBHkrVm89eL4WY18OMB/lSyaFdBgs88UwsWa4N+TmVmCNA=
X-Gm-Gg: ASbGncveMHu/q8j7kZS7NQrOl0Fxvce/tH+lv8S8pdGXgT2JUYAyMY3DnJSYM8PYYZK
	2mFy95CZOCczSFFpnM+9RarKJweyxX+UYPu+AIWJXfl22x+UvYfm+4jk9MDYWBDeZg/EX9y4YCF
	2g0syj15kLYkjzeyIeYOMhyOMcVzvFvaLxvKg1PN3eZ8SkhYeVfcd3d+iL4qbmhjumulmL3btQZ
	gJ22FPwFwmZXrB1flgIk0RIqreFASR7Y6XF91mSB5wHJsMXyx218n3QskZTrGSgwaKbgkAbLaJJ
	e79RGbocGachXLPP6cJHu1qY5iYOpxeeCbHIJ7iVVAkn43/zZIrsZ0iw8iPqhNTdMj5MMtkqapX
	bBKHgcQM6+3nmr5AJflFK4Web8oZ17+PWbkCN9EwawPzXbLaaVH08HccJ2zrcQISJNs+CVWVb1H
	nsM4ENQvjSPTUTWlyrY2uRM2ohNU28+avofq6yW7d/s/5/EQ==
X-Google-Smtp-Source: AGHT+IEj2zy9apxWY9vObYs3hv/JmdQttOhxDDHvUjAsMStwiARm4lbIvINlMgC2GhXAwwntSoBprQ==
X-Received: by 2002:a05:620a:bd5:b0:870:90ff:90d with SMTP id af79cd13be357-883533693admr1130340185a.8.1760026520890;
        Thu, 09 Oct 2025 09:15:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f2e2098sm224285685a.13.2025.10.09.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:15:20 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: corbet@lwn.net,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@redhat.com,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	laoar.shao@gmail.com,
	gourry@gourry.net,
	mclapinski@google.com,
	joel.granados@kernel.org,
	jack@suse.cz,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: [RFC PATCH] mm, hugetlb: implement movable_gigantic_pages sysctl
Date: Thu,  9 Oct 2025 12:15:15 -0400
Message-ID: <20251009161515.422292-1-gourry@gourry.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reintroduces a concept removed by
commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")

This sysctl provides some flexibility between multiple requirements which
are difficult to square without adding significantly more complexity.

1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
2) onlining memory in ZONE_MOVABLE to increase reliability of hugepage
   allocation.

When the user's intent for ZONE_MOVABLE is to allow more reliable huge
page allocation (as opposed to enabling hotplugability), disallowing 1GB
hugepages in this region this region is pointless.  So if hotplug is not
a requirement, we can loosen the restrictions to allow 1GB gigantic pages
in ZONE_MOVABLE.

Since 1GB can be difficult to migrate / has impacts on compaction /
defragmentation, we don't enable this by default.  However, since there
are scenarios where gigantic pages are migratable (hugetlb available in
multiple places), we should allow use of these on zone movable regions.

Note: Boot-time CMA is not possible for driver-managed hotplug memory,
as CMA requires the memory to be registered as SystemRAM at boot time.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Alexandru Moise <00moses.alexander00@gmail.com>
Suggested-by: David Rientjes <rientjes@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
---
 Documentation/admin-guide/sysctl/vm.rst | 17 +++++++++++++++++
 include/linux/hugetlb.h                 |  3 ++-
 mm/hugetlb.c                            | 11 +++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 4d71211fdad8..89dcee3c3239 100644
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
+ZONE_MOVABLE. If set to non-zero, gigantic hugepages can be allocated
+from ZONE_MOVABLE. ZONE_MOVABLE memory may be created via the kernel
+boot parameter `kernelcore` or via memory hotplug as discussed in
+Documentation/admin-guide/mm/memory-hotplug.rst.
+
+Support may depend on specific architecture.
+
+Note that using ZONE_MOVABLE gigantic pages may make features like
+memory hotremove more unreliable, as migrating gigantic pages is more
+difficult due to needing larger amounts of phyiscally contiguous memory.
+
+
 nr_hugepages
 ============
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 526d27e88b3b..38870d21724a 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -172,6 +172,7 @@ bool hugetlbfs_pagecache_present(struct hstate *h,
 
 struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
 
+extern int movable_gigantic_pages __read_mostly;
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
@@ -916,7 +917,7 @@ static inline bool hugepage_movable_supported(struct hstate *h)
 	if (!hugepage_migration_supported(h))
 		return false;
 
-	if (hstate_is_gigantic(h))
+	if (hstate_is_gigantic(h) && !movable_gigantic_pages)
 		return false;
 	return true;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 753f99b4c718..24dbd30d1b69 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -55,6 +55,8 @@
 #include "hugetlb_cma.h"
 #include <linux/page-isolation.h>
 
+int movable_gigantic_pages;
+
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
@@ -5195,6 +5197,15 @@ static const struct ctl_table hugetlb_table[] = {
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
 
 static void __init hugetlb_sysctl_init(void)
-- 
2.51.0

