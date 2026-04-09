Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954333A3E85;
	Thu,  9 Apr 2026 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778161; cv=none; b=Dn/wKpAW+oFXbktfvW82CY46krj/5dXzksDYt/65lZ2ERXFHIht+NdMF9CsH3vL0eGxU6uXEx9N8uPVcV6Ix4nLiY7qUZIi5Ft96cEHQ3QQlYAKrXQcmTPeS3a6DUaASqz7kK+62nhx/W2pOvRt2PUywm1PX/6G4R3YKvuP9GqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778161; c=relaxed/simple;
	bh=2OAByqA5Nx8Cd6psGP4ksD0JexZUpVJ4iS3sIBdW8Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrRMilRRZ9ZqCgh+UncZVz2GtjAINLTq2vp8WkxLBQOeCtCIPf+g3BVN7qyR9PcTDv86++3YzQ2WQ9WJ0PpCT9Tb+qe/TNxp+SkyQY7YurRp3cCBo9rYPhAeUG73j6nAX1UEc4hkH6IcXr9t9V39hD+YOF/Je8mJvC3Zmiy1uMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZY01yaV; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZY01yaV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JtW2f3522833;
	Thu, 9 Apr 2026 23:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ve0WH
	KfZecPDYUxLfEInPAl0u6biNq0N1tCu6dq7iGM=; b=cZY01yaVx1wbA0wkMEfF8
	zs3jxIOxfF3JqWOd4x5V2Nz//nXX9zqSyw6u3WPAS+bscIxwol7dOUNET2GodZgy
	CFoLl2fZtMPW3VlAYjAdz/p+lAqykxb+pQQ6tvfO2K+H/qdm2eqWRyLlEFjwi7l+
	HfdeBgokCj+xHg9uPvVVBJD1pBjT2PCewS6VQhb9boev04UmxBXBCPHqKaIx3iUF
	EEMTph8oZi2UnxnvZCbkzyd0dizVD9hrrNuGWMqLNhlnLnbK8KtvF8IZPtY3dJ2m
	5bgaybbZZAeMzNzjQ+imB068gxZm0j14kbtEv0GuSAY9GW6FdKWYILiVkCF82AK0
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqb0pwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639Mb0HP040079;
	Thu, 9 Apr 2026 23:42:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmnbj4sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:14 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639Ng6Yr038323;
	Thu, 9 Apr 2026 23:42:13 GMT
Received: from brm-x62-16.us.oracle.com (brm-x62-16.us.oracle.com [10.80.150.37])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4dcmnbj4pp-4;
	Thu, 09 Apr 2026 23:42:13 +0000
From: Jane Chu <jane.chu@oracle.com>
To: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
        osalvador@suse.de
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@kernel.org,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
        skhan@linuxfoundation.org, hughd@google.com,
        baolin.wang@linux.alibaba.com, peterx@redhat.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] hugetlb: make hugetlb_fault_mutex_hash() take PAGE_SIZE index
Date: Thu,  9 Apr 2026 17:41:54 -0600
Message-ID: <20260409234158.837786-4-jane.chu@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260409234158.837786-1-jane.chu@oracle.com>
References: <20260409234158.837786-1-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIxOSBTYWx0ZWRfX9QjuJMgPFi9e
 1s0CT2IKyhifo+DwMlALFs7fATUU0D9TSMMyvk0wGIgUdrZlyUnICk4D3wqss7ck/xM+cvJhd3K
 +eIYwmSOYFyoNuJY3Q6yTj/GM5vdmXGkDbxMqVxJnf4MUbVJIjVi/haD4kZUUw9+YhFGX5Dknaj
 t66+YkCN0mWztuKEvYgR7LjG3GpFxKv5Y22bHaZkYzvZQCScwTnXG1yw3sH+Gu2YkvviCBCepvL
 P8qC8xkjOX47yMsBcf6xRZRkfKHHKgIFhjdOqcl44CVstUXZK4fKUIsPbXfRTJ+s5S/g624k0n6
 ozKp1jYDA5RriQ0cQc9uQ9KwTXNB4eMDtkUEbvTFvlvR+ilYy/UY31Hv6e5C1dqV7ywHBUxmf19
 6R4CobsFpVLpJaZP531ohtFIZ3UOa1F6C8CX30M9kknJu4ZWOByktxcLxZEUKlvrrm9V9mu50vV
 VOXCpAkWkSHaxBggUQg==
X-Proofpoint-GUID: sGfNb0vxfvq3RucVF6M8h43ZKbt16ZS6
X-Authority-Analysis: v=2.4 cv=Oux/DS/t c=1 sm=1 tr=0 ts=69d83957 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=PimoNoQ6ervgX2tBKDwA:9
X-Proofpoint-ORIG-GUID: sGfNb0vxfvq3RucVF6M8h43ZKbt16ZS6

hugetlb_fault_mutex_hash() is used to serialize faults and page cache
operations on the same hugetlb file offset. The helper currently expects
its index argument in hugetlb page granularity, so callers have to
open-code conversions from the PAGE_SIZE-based indices commonly used
in the rest of MM helpers.

Change hugetlb_fault_mutex_hash() to take a PAGE_SIZE-based index
instead, and perform the hugetlb-granularity conversion inside the helper.
Update all callers accordingly.

This makes the helper interface consistent with filemap_get_folio(),
and linear_page_index(), while preserving the same lock selection for
a given hugetlb file offset.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 fs/hugetlbfs/inode.c | 19 ++++++++++---------
 mm/hugetlb.c         | 28 +++++++++++++++++++---------
 mm/memfd.c           | 11 ++++++-----
 mm/userfaultfd.c     |  7 +++----
 4 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index cf79fb830377..e24e9bf54e14 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -575,7 +575,7 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 	struct address_space *mapping = &inode->i_data;
 	const pgoff_t end = lend >> PAGE_SHIFT;
 	struct folio_batch fbatch;
-	pgoff_t next, index;
+	pgoff_t next, idx;
 	int i, freed = 0;
 	bool truncate_op = (lend == LLONG_MAX);
 
@@ -586,15 +586,15 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 			struct folio *folio = fbatch.folios[i];
 			u32 hash = 0;
 
-			index = folio->index >> huge_page_order(h);
-			hash = hugetlb_fault_mutex_hash(mapping, index);
+			hash = hugetlb_fault_mutex_hash(mapping, folio->index);
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 
 			/*
 			 * Remove folio that was part of folio_batch.
 			 */
+			idx = folio->index >> huge_page_order(h);
 			remove_inode_single_folio(h, inode, mapping, folio,
-						  index, truncate_op);
+						  idx, truncate_op);
 			freed++;
 
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
@@ -734,7 +734,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 	struct mm_struct *mm = current->mm;
 	loff_t hpage_size = huge_page_size(h);
 	unsigned long hpage_shift = huge_page_shift(h);
-	pgoff_t start, index, end;
+	pgoff_t start, end, idx, index;
 	int error;
 	u32 hash;
 
@@ -774,7 +774,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 	vm_flags_init(&pseudo_vma, VM_HUGETLB | VM_MAYSHARE | VM_SHARED);
 	pseudo_vma.vm_file = file;
 
-	for (index = start; index < end; index++) {
+	for (idx = start; idx < end; idx++) {
 		/*
 		 * This is supposed to be the vaddr where the page is being
 		 * faulted in, but we have no vaddr here.
@@ -794,14 +794,15 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 		}
 
 		/* addr is the offset within the file (zero based) */
-		addr = index * hpage_size;
+		addr = idx * hpage_size;
 
 		/* mutex taken here, fault path and hole punch */
+		index = idx << huge_page_order(h);
 		hash = hugetlb_fault_mutex_hash(mapping, index);
 		mutex_lock(&hugetlb_fault_mutex_table[hash]);
 
 		/* See if already present in mapping to avoid alloc/free */
-		folio = filemap_get_folio(mapping, index << huge_page_order(h));
+		folio = filemap_get_folio(mapping, index);
 		if (!IS_ERR(folio)) {
 			folio_put(folio);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
@@ -824,7 +825,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 		}
 		folio_zero_user(folio, addr);
 		__folio_mark_uptodate(folio);
-		error = hugetlb_add_to_page_cache(folio, mapping, index);
+		error = hugetlb_add_to_page_cache(folio, mapping, idx);
 		if (unlikely(error)) {
 			restore_reserve_on_error(h, &pseudo_vma, addr, folio);
 			folio_put(folio);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 38b39eaf46cc..9d5ae1f87850 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5515,7 +5515,7 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 		 */
 		if (cow_from_owner) {
 			struct address_space *mapping = vma->vm_file->f_mapping;
-			pgoff_t idx;
+			pgoff_t index;
 			u32 hash;
 
 			folio_put(old_folio);
@@ -5528,8 +5528,9 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 			 *
 			 * Reacquire both after unmap operation.
 			 */
-			idx = vma_hugecache_offset(h, vma, vmf->address);
-			hash = hugetlb_fault_mutex_hash(mapping, idx);
+			index = linear_page_index(vma, vmf->address);
+			hash = hugetlb_fault_mutex_hash(mapping, index);
+
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 
@@ -5664,6 +5665,10 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
 						  unsigned long reason)
 {
 	u32 hash;
+	pgoff_t index;
+
+	index = linear_page_index((const struct vm_area_struct *)vmf, vmf->address);
+	hash = hugetlb_fault_mutex_hash(mapping, index);
 
 	/*
 	 * vma_lock and hugetlb_fault_mutex must be dropped before handling
@@ -5671,7 +5676,6 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
 	 * userfault, any vma operation should be careful from here.
 	 */
 	hugetlb_vma_unlock_read(vmf->vma);
-	hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
 	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 	return handle_userfault(vmf, reason);
 }
@@ -5696,7 +5700,8 @@ static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm, unsigned
 static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			struct vm_fault *vmf)
 {
-	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
+	u32 hash;
+	pgoff_t index;
 	bool new_folio, new_anon_folio = false;
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -5707,6 +5712,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	unsigned long size;
 	pte_t new_pte;
 
+	index = vmf->pgoff << huge_page_order(h);
+	hash = hugetlb_fault_mutex_hash(mapping, index);
 	/*
 	 * Currently, we are forced to kill the process in the event the
 	 * original mapper has unmapped pages from the child due to a failed
@@ -5920,13 +5927,14 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 }
 
 #ifdef CONFIG_SMP
-u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
+/* 'index' is expected to be in PAGE_SIZE granularity */
+u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t index)
 {
 	unsigned long key[2];
 	u32 hash;
 
 	key[0] = (unsigned long) mapping;
-	key[1] = idx;
+	key[1] = index >> huge_page_order(hstate_inode(mapping->host)); 
 
 	hash = jhash2((u32 *)&key, sizeof(key)/(sizeof(u32)), 0);
 
@@ -5937,7 +5945,7 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
  * For uniprocessor systems we always use a single mutex, so just
  * return 0 and avoid the hashing overhead.
  */
-u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
+u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t index)
 {
 	return 0;
 }
@@ -5952,6 +5960,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping;
 	bool need_wait_lock = false;
+	pgoff_t index;
 	struct vm_fault vmf = {
 		.vma = vma,
 		.address = address & huge_page_mask(h),
@@ -5972,8 +5981,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * get spurious allocation failures if two CPUs race to instantiate
 	 * the same page in the page cache.
 	 */
+	index = linear_page_index(vma, vmf.address);
 	mapping = vma->vm_file->f_mapping;
-	hash = hugetlb_fault_mutex_hash(mapping, vmf.pgoff);
+	hash = hugetlb_fault_mutex_hash(mapping, index);
 	mutex_lock(&hugetlb_fault_mutex_table[hash]);
 
 	/*
diff --git a/mm/memfd.c b/mm/memfd.c
index fb425f4e315f..911ff8220d05 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -64,7 +64,7 @@ static void memfd_tag_pins(struct xa_state *xas)
  * (memfd_pin_folios()) cannot find a folio in the page cache at a given
  * index in the mapping.
  */
-struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
+struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t index)
 {
 #ifdef CONFIG_HUGETLB_PAGE
 	struct folio *folio;
@@ -79,12 +79,13 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		 */
 		struct inode *inode = file_inode(memfd);
 		struct hstate *h = hstate_file(memfd);
-		int err = -ENOMEM;
 		long nr_resv;
+		pgoff_t idx;
+		int err = -ENOMEM;
 
 		gfp_mask = htlb_alloc_mask(h);
 		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
-		idx >>= huge_page_order(h);
+		idx = index >> huge_page_order(h);
 
 		nr_resv = hugetlb_reserve_pages(inode, idx, idx + 1, NULL, EMPTY_VMA_FLAGS);
 		if (nr_resv < 0)
@@ -116,7 +117,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 			 * races with concurrent allocations, as required by all other
 			 * callers of hugetlb_add_to_page_cache().
 			 */
-			hash = hugetlb_fault_mutex_hash(memfd->f_mapping, idx);
+			hash = hugetlb_fault_mutex_hash(memfd->f_mapping, index);
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 
 			err = hugetlb_add_to_page_cache(folio,
@@ -140,7 +141,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		return ERR_PTR(err);
 	}
 #endif
-	return shmem_read_folio(memfd->f_mapping, idx);
+	return shmem_read_folio(memfd->f_mapping, index);
 }
 
 /*
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index c053aa4389b6..9482b25d3d84 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -504,7 +504,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 	long copied;
 	struct folio *folio;
 	unsigned long vma_hpagesize;
-	pgoff_t idx;
+	pgoff_t index;
 	u32 hash;
 	struct address_space *mapping;
 
@@ -573,10 +573,9 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		 * in the case of shared pmds.  fault mutex prevents
 		 * races with other faulting threads.
 		 */
-		idx = linear_page_index(dst_vma, dst_addr);
-		idx >>= huge_page_order(hstate_vma(dst_vma));
+		index = linear_page_index(dst_vma, dst_addr);
 		mapping = dst_vma->vm_file->f_mapping;
-		hash = hugetlb_fault_mutex_hash(mapping, idx);
+		hash = hugetlb_fault_mutex_hash(mapping, index);
 		mutex_lock(&hugetlb_fault_mutex_table[hash]);
 		hugetlb_vma_lock_read(dst_vma);
 
-- 
2.43.5

