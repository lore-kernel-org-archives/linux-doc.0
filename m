Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EB25785F
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873463; cv=none; b=ofHO53iEoYrgnSIHT/XYNUW9nGzHP6v+0VNYGFqfZJDNF/oWzOwjpp3tMUnLEVjWJnL9M1rUmjdIfPyMm/d/WC3cbif4LI62sXBiFlFvEnYZS4+i/XMVafjwAgHgvXWWQ0Xkm3cZdXglwaw9elXZjwIgrj3AtZYe0Eq+8Qg+Ezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873463; c=relaxed/simple;
	bh=9ATgpajYqPbWUEOZbjmpVFtNwtU+nUdpqff+qkI9n6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfno7qO0M13e14if4nvzMa3/rEzhFjt2blquwndvkk4M3Cmfna619S1JK6hCgcsS1v4B+VZP7mV1ipJITriO62YQRRyS7lCqL4W07MUcZXNnNShFV312EGUhM+fOVqyY/40qjKrKnvIrizXzd6vz5LmOpJpmqjZgx3rCtMnK218=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pEsKjfEh; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pEsKjfEh"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-86420079b01so713667985a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 14:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759873460; x=1760478260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ6FNVlq5hGhSL7hTDiUZ66uQN+FQVKqg+d4ewOqZ7w=;
        b=pEsKjfEh825le5gbTJjmBtcoSKNfF4369718MK2el+WkKOnduJy7PfAFO380bev/d1
         xrqmKdcyCYWcpoXkG9+YEu0eFi2dBWjxwMHAD8iZJ1P71ChDtwydPuLb0lXIqK0hP0tz
         daBtc1MgiQnP1Z95VZQlVoNIs2ZaUSJ3sVjYUgFN8VKpkd3s1mhBooCdfIgDCJ/j4F8q
         VW+bdr79js76JN2jWiCPEQhV/RQ+l5j4quxhQHDNUob8Kreudoe7vULaeVb0kWvumofB
         wNAqPK3qZ8n6RmLXZr15V1X71kzBS4ni5vMxrySOrbe+baL585wqycC1ouOFmfLwosac
         J0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873460; x=1760478260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ6FNVlq5hGhSL7hTDiUZ66uQN+FQVKqg+d4ewOqZ7w=;
        b=W8HR03lqxnyIMoSplFdJtFsPcNbP/0NfrCax9xaeyldYmZQGVFtUgeq+uE/ykwI1IH
         RMgD1Td5us+bUnpbIcJpNoFRs9bSyn6pC3/1eDWfeGMx5QXjKe2f9yEXBAVFtMFpt7Sa
         pAWKzAeFgFdxYekGMV32i9umePa1yt1e1EO4PMZIQjTRgEjm9FCAlY0Z5GKZLV+AgbY5
         lzY4EBuEwWq0N7iPrkdxdXRdmfjYchGHk9CFErvTgPhP+orycugBD1Y04/M6FbTTuIED
         31Ip1J4V0mUsDYur+RgF4/Idm02Lzw1x0xSzQimxr+6F/ei/E79ChFblMv9LmWWW8d2s
         eFDw==
X-Forwarded-Encrypted: i=1; AJvYcCUt/JM2fI+Uslt5PYsk/2wBZP3NrqnOL9BQwnmVdzdlsxcmqF1B9tVlKsRl6T/M924WS953gmpClUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+TDIWZ9WqEQ5PD3+lBGiONkCe36hQpsqNF2SiUfkru8XHsO+
	4OwFxC1pJm6kvCMf7KZrCrf3XmzYxFQtA5tc7GlkPQmZeo//atZZ9GCPHwN8Uqx+tPo=
X-Gm-Gg: ASbGncvAL29emzN5lalUQZkN5cBZo2WJ8LPKX7XcfzJK83aZzI+jihh4h0/ES0XRokK
	CAI+EIYU385YznB64XUcpG77RmfSG0FHi8WvMwG8tiUGrJQ2zmsS7kK3ykUrl1UlOCDK9MH1KLX
	QDOpcXrNW300/T/HfZLvmqf8Nkbmvfy8pF5wn3KpZK94WFRV8IjXw6TLUWqPIp5InKVtiOu7FH0
	310BCVXlQ7oiesJmvfsft1nraprED4W0Az/u4SSmPZKtxZL5DCyICx2yDJ8VoQs0ck3y3HpgHAl
	pATg+e/LQKN7lCKqtFPwOHglA6g3Fjb17ViG1Mjv+rZfA2xf3twtzvVQJyDMlruX0nwgE9bDU5I
	/VmKsxLY0nTAk9C/bXCNbNYINrnKSRjMRFj2V51mV6XkbZ4+SuXnC9pggKpSdb/ka/rfMX/Vtyi
	13jukzO0MqAL7ZnscsP/K8VO9oP79WF27AluI=
X-Google-Smtp-Source: AGHT+IGN6hSDMo/jOmPaXEPkY0HVxfHCLbCnKRX69X29HAgR3RScLY8hno4OXo4smrIIuH6tZiBVUQ==
X-Received: by 2002:a05:620a:1a8a:b0:80d:6f37:ed35 with SMTP id af79cd13be357-88352d95aa5mr264472085a.73.1759873459722;
        Tue, 07 Oct 2025 14:44:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129fcdsm1574102885a.13.2025.10.07.14.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:44:19 -0700 (PDT)
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
	brauner@kernel.org,
	mclapinski@google.com,
	joel.granados@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable sysctl"
Date: Tue,  7 Oct 2025 17:44:12 -0400
Message-ID: <20251007214412.3832340-1-gourry@gourry.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d6cb41cc44c63492702281b1d329955ca767d399.

This sysctl provides some flexibility between multiple requirements which
are difficult to square without adding significantly more complexity.

1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
2) onlining memory in ZONE_MOVABLE to prevent GFP_KERNEL usage
3) passing NUMA structure through to a virtual machine (node0=vnode0,
   node1=vnode1) so a guest can make good placement decisions.
4) utilizing 1GB hugepages for VM host memory to reduce TLB pressure
5) Managing device memory after init-time to avoid incidental usage
   at boot (due to being placed in ZONE_NORMAL), or to provide users
   configuration flexibility.

When device-hotplugged memory does not require hot-unplug assurances,
there is no reason to avoid allowing otherwise non-migratable hugepages
in this zone.  This allows for allocation of 1GB gigantic pages for VMs
with existing mechanisms.

Boot-time CMA is not possible for driver-managed hotplug memory, as CMA
requires the memory to be registered as SystemRAM at boot time.

Updated the code to land in appropriate locations since it all moved.
Updated the documentation to add more context when this is useful.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Alexandru Moise <00moses.alexander00@gmail.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Suggested-by: David Rientjes <rientjes@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
---
 Documentation/admin-guide/sysctl/vm.rst | 31 +++++++++++++++++++++++++
 include/linux/hugetlb.h                 |  4 +++-
 mm/hugetlb.c                            |  9 +++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 4d71211fdad8..c9f26cd447d7 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -40,6 +40,7 @@ Currently, these files are in /proc/sys/vm:
 - enable_soft_offline
 - extfrag_threshold
 - highmem_is_dirtyable
+- hugepages_treat_as_movable
 - hugetlb_shm_group
 - laptop_mode
 - legacy_va_layout
@@ -356,6 +357,36 @@ only use the low memory and they can fill it up with dirty data without
 any throttling.
 
 
+hugepages_treat_as_movable
+==========================
+
+This parameter controls whether otherwise immovable hugepages (e.g. 1GB
+gigantic pages) may be allocated from from ZONE_MOVABLE. If set to non-zero,
+gigantic hugepages can be allocated from ZONE_MOVABLE. ZONE_MOVABLE memory
+may be created via the kernel boot parameter `kernelcore` or via memory
+hotplug as discussed in Documentation/admin-guide/mm/memory-hotplug.rst.
+
+Support may depend on specific architecture and/or the hugepage size. If
+a hugepage supports migration, allocation from ZONE_MOVABLE is always
+enabled (for example 2MB on x86) for the hugepage regardless of the value
+of this parameter. IOW, this parameter affects only non-migratable hugepages.
+
+Assuming that hugepages are not migratable in your system, one usecase of
+this parameter is that users can make hugepage pool more extensible by
+enabling the allocation from ZONE_MOVABLE. This is because on ZONE_MOVABLE
+page reclaim/migration/compaction work more and you can get contiguous
+memory more likely. Note that using ZONE_MOVABLE for non-migratable
+hugepages can do harm to other features like memory hotremove (because
+memory hotremove expects that memory blocks on ZONE_MOVABLE are always
+removable,) so it's a trade-off responsible for the users.
+
+One common use-case of this feature is allocate 1GB gigantic pages for
+virtual machines from otherwise not-hotplugged memory which has been
+isolated from kernel allocations by being onlined into ZONE_MOVABLE.
+These pages tend to be allocated and released more explicitly, and so
+hotplug can still be achieved with appropriate orchestration.
+
+
 hugetlb_shm_group
 =================
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 526d27e88b3b..bbaa1b4908b6 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -172,6 +172,7 @@ bool hugetlbfs_pagecache_present(struct hstate *h,
 
 struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
 
+extern int hugepages_treat_as_movable;
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
@@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate *h)
 {
 	gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
 
-	gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
+	gfp |= (hugepage_movable_supported(h) || hugepages_treat_as_movable) ?
+	       GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
 
 	return gfp;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 753f99b4c718..4b2213ccbb29 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -55,6 +55,8 @@
 #include "hugetlb_cma.h"
 #include <linux/page-isolation.h>
 
+int hugepages_treat_as_movable;
+
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
@@ -5195,6 +5197,13 @@ static const struct ctl_table hugetlb_table[] = {
 		.mode		= 0644,
 		.proc_handler	= hugetlb_overcommit_handler,
 	},
+	{
+		.procname	= "hugepages_treat_as_movable",
+		.data		= &hugepages_treat_as_movable,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
 };
 
 static void __init hugetlb_sysctl_init(void)
-- 
2.51.0

