Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8582E7165;
	Mon, 15 Dec 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802335; cv=none; b=Qx+GL46/7rfxZESDzL7coiypB7hkHDDeZITojGfK3IlLPkIqN7aiw6EiXmtTmJEi1Bbb7LpeRrlWqxVbDT25j1Mr9CnGPHb/YnulHWeweHYhmCESEginBYyfjywBSHpZ+1P97VQh//AhBlHr5vHmxqHi/lm3CA58HhaxXznLozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802335; c=relaxed/simple;
	bh=M5SxYHgMILPUUL/oCGUjeYmSXVWulfxGvpYDfAJ5XVA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BhwsUxANjEUEi7VF8shDy9Y07SquhneXfNjid/F/cgfH0RjnoDpqHNzuPpZianp5feVj8LkKsyHiGnETelz7YwKqgitsYQFZs7u5sIoaFZhgtPd3cDwWccc3OzWqGt6aV1RCxqtab0tJjv1YR+2WpHba57O70Fgji2lx3tX12ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ozeGgroW; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ozeGgroW; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ozeGgroW";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ozeGgroW"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AW0l/Uli7Z07C+DpVlWxg/EIyCazK8znY5p+Q6tLPn0=;
	b=ozeGgroWgPskKUtF699HnhH+rj4mHe42UZ73V00jt0OMbDT1tWCo1K+9+9GSu/bCaWRDBIVNT
	wHk+RfvFSJFceTqwv32x+f+W5XvZUk4XFanapN7yf3VtMbWvznEaC6K5VM/9rSVRGWRZTDwiGNx
	3V0I9rHzxUAfSf4wb9J5OwE=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dVKNl2gmGz1BG31;
	Mon, 15 Dec 2025 20:38:31 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AW0l/Uli7Z07C+DpVlWxg/EIyCazK8znY5p+Q6tLPn0=;
	b=ozeGgroWgPskKUtF699HnhH+rj4mHe42UZ73V00jt0OMbDT1tWCo1K+9+9GSu/bCaWRDBIVNT
	wHk+RfvFSJFceTqwv32x+f+W5XvZUk4XFanapN7yf3VtMbWvznEaC6K5VM/9rSVRGWRZTDwiGNx
	3V0I9rHzxUAfSf4wb9J5OwE=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dVKLh3NBCz1K968;
	Mon, 15 Dec 2025 20:36:44 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (unknown [7.185.36.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 5ED061402C6;
	Mon, 15 Dec 2025 20:38:42 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf500012.china.huawei.com
 (7.185.36.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 15 Dec
 2025 20:38:41 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <corbet@lwn.net>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<Liam.Howlett@oracle.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Zhang Qilong
	<zhangqilong3@huawei.com>
Subject: [PATCH next 2/2] mm/huge_memory: Add sysfs knob for executable THP COW
Date: Mon, 15 Dec 2025 20:34:07 +0800
Message-ID: <20251215123407.380813-3-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215123407.380813-1-zhangqilong3@huawei.com>
References: <20251215123407.380813-1-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500012.china.huawei.com (7.185.36.8)

Although THP-granularity exec COW can reduce the number of faults
and improve iTLB hit rates, but after enabling it, the THP folio
allocating and copying operations may introduce higher latency,
and it consumes more memory compared to page COW handling. These
side effects may be unacceptable in certain scenarios.

Therefore, we add use_exec_cow sysfs knob for THP COW of executable
private file mmap. It's enabled by default, kernel will try to
allocate PMD page and map it. If it's disabled, it will fallback to
split PMD mapping and do pte fault handle.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 Documentation/admin-guide/mm/transhuge.rst |  8 ++++++++
 include/linux/huge_mm.h                    |  4 ++++
 mm/huge_memory.c                           | 18 +++++++++++++++++-
 mm/memory.c                                |  3 ++-
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 5fbc3d89bb07..c6d7ca045c03 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -201,10 +201,18 @@ page fault to anonymous mapping. It's possible to disable huge zero
 page by writing 0 or enable it back by writing 1::
 
 	echo 0 >/sys/kernel/mm/transparent_hugepage/use_zero_page
 	echo 1 >/sys/kernel/mm/transparent_hugepage/use_zero_page
 
+By default kernel tries to use huge, PMD-mappable page on private
+executable file THP mmap fault handle. It's possible to disable
+THP COW of private executable mmap by writing 0 or enable it back
+by writing 1::
+
+	echo 0 >/sys/kernel/mm/transparent_hugepage/use_exec_cow
+	echo 1 >/sys/kernel/mm/transparent_hugepage/use_exec_cow
+
 Some userspace (such as a test program, or an optimized memory
 allocation library) may want to know the size (in bytes) of a
 PMD-mappable transparent hugepage::
 
 	cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index bae856a53e1f..d86215f06ac9 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -55,10 +55,11 @@ enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG,
 	TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG,
+	TRANSPARENT_HUGEPAGE_USE_EXEC_COW_FLAG,
 };
 
 struct kobject;
 struct kobj_attribute;
 
@@ -323,10 +324,13 @@ struct thpsize {
 
 #define transparent_hugepage_use_zero_page()				\
 	(transparent_hugepage_flags &					\
 	 (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG))
 
+#define transparent_hugepage_use_exec_cow()				\
+	(transparent_hugepage_flags &					\
+	 (1<<TRANSPARENT_HUGEPAGE_USE_EXEC_COW_FLAG))
 /*
  * Check whether THPs are explicitly disabled for this VMA, for example,
  * through madvise or prctl.
  */
 static inline bool vma_thp_disabled(struct vm_area_struct *vma,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 35ecd62f64c4..430b80318aae 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -63,11 +63,12 @@ unsigned long transparent_hugepage_flags __read_mostly =
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE_MADVISE
 	(1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)|
 #endif
 	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG)|
 	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
-	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
+	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG)|
+	(1<<TRANSPARENT_HUGEPAGE_USE_EXEC_COW_FLAG);
 
 static struct shrinker *deferred_split_shrinker;
 static unsigned long deferred_split_count(struct shrinker *shrink,
 					  struct shrink_control *sc);
 static unsigned long deferred_split_scan(struct shrinker *shrink,
@@ -442,10 +443,24 @@ static ssize_t use_zero_page_store(struct kobject *kobj,
 	return single_hugepage_flag_store(kobj, attr, buf, count,
 				 TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
 }
 static struct kobj_attribute use_zero_page_attr = __ATTR_RW(use_zero_page);
 
+static ssize_t use_exec_cow_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	return single_hugepage_flag_show(kobj, attr, buf,
+					 TRANSPARENT_HUGEPAGE_USE_EXEC_COW_FLAG);
+}
+static ssize_t use_exec_cow_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	return single_hugepage_flag_store(kobj, attr, buf, count,
+				 TRANSPARENT_HUGEPAGE_USE_EXEC_COW_FLAG);
+}
+static struct kobj_attribute use_exec_cow_attr = __ATTR_RW(use_exec_cow);
+
 static ssize_t hpage_pmd_size_show(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%lu\n", HPAGE_PMD_SIZE);
 }
@@ -475,10 +490,11 @@ static struct kobj_attribute split_underused_thp_attr = __ATTR(
 
 static struct attribute *hugepage_attr[] = {
 	&enabled_attr.attr,
 	&defrag_attr.attr,
 	&use_zero_page_attr.attr,
+	&use_exec_cow_attr.attr,
 	&hpage_pmd_size_attr.attr,
 #ifdef CONFIG_SHMEM
 	&shmem_enabled_attr.attr,
 #endif
 	&split_underused_thp_attr.attr,
diff --git a/mm/memory.c b/mm/memory.c
index e282adec9165..5e3354e16b32 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6134,11 +6134,12 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 				return ret;
 		}
 	}
 
 
-	if (is_exec_mapping(vma->vm_flags) &&
+	if (transparent_hugepage_use_exec_cow() &&
+	    is_exec_mapping(vma->vm_flags) &&
 	    is_cow_mapping(vma->vm_flags)) {
 		/* Skip special and shmem */
 		if (vma_is_special_huge(vma) || vma_is_shmem(vma))
 			goto split;
 
-- 
2.43.0

