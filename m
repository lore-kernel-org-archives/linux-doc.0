Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF1481A9B
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139391; cv=none; b=jfXGKssVp2BHurGKDhYRIZziPCyXxVDn7w5V+yyjrRkx8wQ4bkEvOZeCyE6UBLvAETJr+cCXY/Bfgmw463jGlrRxEXWBZbIwLIJORgj4vK/nHcB1ss2ahp2CH59U329xODYDvsXVUEU64yYcMRuScftd+Wy4FN2+ZUqP85UtcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139391; c=relaxed/simple;
	bh=EOg2ZjoPxr72IvBeSadtcakyUfjjFdqXJkBKoJGcRuc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHWcTt1eDTxbRaEvnIUmvThEABaEdRKjIzWEwQdETqc/kp15LOKozAjex4MVD48+sk3x+e+x+oLQmQjwS/pugpGot+TIgGpRs9radZEvZHYiQj5mNfLrH+NtbwCdXe5VcyePl3SgEYiPJXU4TtGO9olM5sP2s3tcIEkh7XeSJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6gkHHSo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6gkHHSo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacf197759so40562225ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139385; x=1784744185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hJyDStROVAjhZv77Mf9h0pLyMcLfVsgmfa9JsYP9Vb0=;
        b=P6gkHHSoPcOHTtXVT5ndm82zHgiCao4WSKbPZQZqMrFzfi9b91NHW6W6bDf76GFKc+
         V2//TfZzlXpKALwHQhMPY8Zl3D4XV8JjwdGBV1pH0U6phUjFagHjCGfRtk8IXLV2Imum
         CfKvSoZlVDw3iOkQclgUWd+JAVizHPpai9ki4fyAz9uVerKub4iY6BPqKndnhSHBAGoo
         gyreqXpRoG/SFVbEopCCzpdRGB0QKHCgl4GVIa3zBRXGaZtSz/1jqB9W4YTSvDJJabNE
         INBxbwdX/APtpw8aQ5JpmPySK4qLr3M9klrZ7csLhkKTpHYxDBEh3Ouy4UBzptYziWP7
         pbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139385; x=1784744185;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJyDStROVAjhZv77Mf9h0pLyMcLfVsgmfa9JsYP9Vb0=;
        b=kFIUKkYzcrmGHfzA4RsV9hZ3/XnSaB5CBvtFVRsAawJrhanhaLLMBIP6IcbyWF7nCk
         ThAR4WHcJrxDCq/J2pwn4+QNhOsm0fkFvxuL2fj96hFz2olW9LmLRctB5qMOrCczv4M4
         BmQNYuYdGFaSLY5LZ4NESkMO/S1CzChgkwan3KDmBykSgNqX8FXPZ53K1HvKg6okcrgr
         Meu1aqbUsY/1mhucbB7q7lYpqRBPiUaNNbDiH5orCRMR93hP08iiLFz9VuFFeAkloU1z
         iY1NelrFSKkzHJzTf9LYVuuFZVm8ZwOnJyYGapyNhuTdsplW1wU7n7LIqhU3Sb4EXi4o
         0HKw==
X-Forwarded-Encrypted: i=1; AHgh+Rrx1Bxf8oIS134lvMZDic1J9dAnV/1AbQaMxvNq0oI8/nJxNU6ScIWOsJtx1AJYD+Ga+fIO8PR5VxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxf82/bdY35rmkTKXIpxF3Y24//nNyLtZNpLxL1joQuMmWuBZi
	VsjsxW1czBn0hnWc8ACZQbNx6oQ5tJ9NmBZnC0JO8qRLupb5dv8U9cl6
X-Gm-Gg: AfdE7clyRzeVrvdES5vZ2bJkioaglz78b4qJAILlLX2oavtGp0/hpzFv5ZNEmRrLpJW
	1H/kTwbg2tvwDTL+zx03Ibd+5AJxawliDt1wUxiz9fcShNOZ8wihHrBcweu2TZEp4LijBoyxQ6d
	vj2yAOb4OPB5Wd2IZyivhytSixOiGNtCuRFi+ByUbXz3VajE78YRjiSK26DCyZr5xx7kXr4Gu8/
	aQ0VC5ItFTG0ZcQWiKj+j9ie80Y6APLoOJG0GI8YB3kcUsl2iQbF0kXPuB+7RdbFlB61omqm6W5
	KZTky09KVOVnA0AVjc2qOOU+GrH9GulLHLyVpnkMEN0tyRb90gsLndbae2tKWcoXkLH2l+D7ued
	3BNwSW426BQ0pUM194GWcMGDSkvg7iZT5CgrAsyji1iSNyGtJ1hLOPphDk8mytGSJUtj3h/nQnX
	/Agx1dT74m/ab3ZG87v+sMsVK1XLc/llv79oRaTrh5SSYoYcsukXNmS8dKmcU=
X-Received: by 2002:a17:903:19c5:b0:2ca:bb6:e7c6 with SMTP id d9443c01a7336-2ce9ef22bc9mr189071215ad.37.1784139385005;
        Wed, 15 Jul 2026 11:16:25 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf0fdb3a0asm7052845ad.0.2026.07.15.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:24 -0700 (PDT)
Subject: [PATCH v9 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Wed, 15 Jul 2026 11:16:22 -0700
Message-ID: <178413938249.1155966.292562154596800687.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
 


