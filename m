Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCD3B7B97
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453640; cv=none; b=Z0EbEiGXLECvS/S0d8aP/9u+J9wV1L2mG91i3Io0BnzX1B7/ml97QcN/OahgyFBTrZKfeS5ocHeDI/OmP5TW4VmqxYQeFe9wksDfokTG2g6BFh7PIAoupUuxhkptAEkaXhZ11x4fkQwwldCrWhCsKglOI8k9DoP7Z9dXQlYUGvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453640; c=relaxed/simple;
	bh=y4kdf7jDco6ySPlhlG10NkFmrsOAGPDs4XhdHxu7r30=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nXNJngtSbKGfGtjf/UL7kbe09JqSf9zIDQnHMG9a3BDqzv3I7fR6Rv/UjMNOKmGqrqHl+pkkSKaCusnun1aWzIRIKtx5lJ+oQT95smElu52FNlkVcvqCdLxaszQ9hKP2oN3vBgGSTKZvU22/l+XgWbOsGetCk2bPV2uVCh81ZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+1RU7E8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+1RU7E8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso8a91.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453638; x=1784058438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vfGwKSNbrl+nU6kvbTrSHfyfMmoFAmwmGff/pR29LWo=;
        b=g+1RU7E8JfhVwad/YWEmP4e09DfkRefbo+a1P3tNzwFx+E7LtWbYGhDKdtaOqVvgMP
         Cnev6FTdzFjrbiaGsl20piHN4eoHrbubU9hWBYN5dPUrg19R8uvmNEskb2fAnVZISNmk
         eeHRs1l+bZmP4QwIg+HtkHuay9VkbeVXoICYq+x89FOvI+GNW36xY6QbIuPWMdbsGGVv
         zimJ88WKlPNVGXUfud5e29iA+MhtCus+59bv5JRqN2PEbSavCHtUudqN/lSdiF6m1raL
         PsIREfeoI+EFQxRjoaZ+ENa5rGHKVcIM+ToyQq62kFctftkbSeGUN127aK1GZcUyrrXp
         Uh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453638; x=1784058438;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfGwKSNbrl+nU6kvbTrSHfyfMmoFAmwmGff/pR29LWo=;
        b=cgw08u4DUvMgbC/U3ui7LS9sBHiqMR20BGtS5pFtTCwXRhHkohpA8zdFnZG7jwfpP6
         rUblk064ml+yu9qdVeeVTlt5wsZIFdj+2orBWobe0CHgAV8e+ekx7heeZOMxCkDwC4BF
         4UTD+lITvF76H5m4LC7oL56T2DoaVT9lnrTi7LApa4iQ/qsGJJvmo9kSdEHOUykLMXjt
         g4hHq9lGbD16KIeoDqQotI59X2HS/4mv2pr4b7lOwJ1pA63f4LoRsEWwSNqI6HGk+fA8
         kuRtkoNp/KsmbAv5+cD86xXTMIdyyoqZkZT7IhloNY1jYAe319N7qNtrE9AZFp0MYGXk
         NvzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUGW9BC2WXVfVjGgmOgl6KS7lAavbKvvKxm/7JxIUwKtBUNdYYsvF8TYSYBLxBGeiaOc9v1xqjvws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmb13ttLEkvrYd8r5Vys1YtQybogJcIrU8Arv7hs2a3+RVk0ba
	NTLyABMm9jndDFcYtPCQJKyk2Z3iPvNo5j8wAD3DV0H26Rav7jsuRnSE
X-Gm-Gg: AfdE7cnxYYNMdZ4/4IPYLFoRxmyU3X2LMh+QoyqA066A/m0jQIR3u6KoMrFQ1pRlZqW
	WquwC2JjvxCMNcqJHn+/iJ22Kvy5SlBzdHuQwsEnX+kIvySPN0+6ecz7teCzF7bgVRFRtqKSRll
	uKMiOR+Umcfwk7+m+Cja8X1WQ30MpdKFWyYC4xp5aQEJKDezCZ0pNp9NPTBKWNEweWnZF6pbEHt
	3W77tJDnUiNoQzLVyXNtoazxjihSc9oljz2QimTyTVKDTwQypHaHFSoqwq+VHwqRs0RYljj+c/A
	Sr01toX8O+uD8kHoHGWW/msp4xWu6Cpy/qc2TPgGIJKv5/n8Xj/36AK+TORw00p4SeVEtvmyfsf
	pI4VN9YQE+Y+PxBEZo3b34pamOpwNio0fMm6ID/sSBtaOYu5n7YsgCLhZwsxl7X3pE5t9Gqw9rJ
	YDXZIUh3aA25+1DHzYm3NSVOd60kek+3LlRfYxjx3OeCjgz0fQCtutXEo0bjc=
X-Received: by 2002:a17:90b:2e48:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-387573b24f7mr6589891a91.16.1783453637572;
        Tue, 07 Jul 2026 12:47:17 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d36675d5sm1660092a91.12.2026.07.07.12.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:17 -0700 (PDT)
Subject: [PATCH v7 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Tue, 07 Jul 2026 12:47:15 -0700
Message-ID: <178345363584.660027.14063544694872741718.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

MSHV currently faults movable memory regions by taking mmap_read_lock()
around hmm_range_fault(). That prevents the fault path from handling VMAs
whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
mappings.

Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
preserves MSHV's existing unbounded retry behavior while letting the HMM
helper own mmap_lock acquisition and refresh range->notifier_seq internally
before walking the range. After the fault succeeds, MSHV still takes
mreg_mutex and checks mmu_interval_read_retry() before installing the pages
into the region, so the existing invalidation synchronization is preserved.

Fold the small fault-and-lock helper into mshv_region_range_fault(), since
the remaining retry path is just the standard "fault, take the driver lock,
check the interval notifier sequence" pattern.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..dddaade31b5d 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -381,46 +381,6 @@ int mshv_region_get(struct mshv_mem_region *region)
 	return kref_get_unless_zero(&region->mreg_refcount);
 }
 
-/**
- * mshv_region_hmm_fault_and_lock - Handle HMM faults and lock the memory region
- * @region: Pointer to the memory region structure
- * @range: Pointer to the HMM range structure
- *
- * This function performs the following steps:
- * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
- *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
-					  struct hmm_range *range)
-{
-	int ret;
-
-	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
-	if (ret)
-		return ret;
-
-	mutex_lock(&region->mreg_mutex);
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		mutex_unlock(&region->mreg_mutex);
-		cond_resched();
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
 /**
  * mshv_region_range_fault - Handle memory range faults for a given region.
  * @region: Pointer to the memory region structure.
@@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
 	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
 	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
 
-	do {
-		ret = mshv_region_hmm_fault_and_lock(region, &range);
-	} while (ret == -EBUSY);
-
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, 0);
 	if (ret)
 		goto out;
 
+	mutex_lock(&region->mreg_mutex);
+
+	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
+		mutex_unlock(&region->mreg_mutex);
+		cond_resched();
+		goto again;
+	}
+
 	for (i = 0; i < page_count; i++)
 		region->mreg_pages[page_offset + i] = hmm_pfn_to_page(pfns[i]);
 


