Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41784442B1F
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756696; cv=none; b=eQXyPy9oLNj5pHzoz4VUpkxqrOv6L7GFPv5UjALcfiRtlKOYE9g3WGx5pTnVrs2IVJMNXJqgH6H55LfGbGhhoQk1ofmmGSL7kqI43VPMukYeEUfxu1fFAMK0tPRLP5osglOD5ZcjHTngaPLnEuFU3BrQIoe9lWv/qpxPQ43LYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756696; c=relaxed/simple;
	bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWl3V7bcAEnPgGt4vEzyyPmMHHC/7w7Qv8K34FUDKIsa4FLCYoaTGfOnZiBSExh/qd8SDwooIB3oQuixeo/OUkNCblVeK6QF1tPyrr9M8sqV9/iCjO/y+ufbR0JsBUYNNKi1QpsXI78lWRs/nQJikOIyloaOyLpcTcnr8pnY1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2b1GNxZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2b1GNxZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso14253752b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756693; x=1785361493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=r2b1GNxZG0pMLdmLeYUJ66eog3ws7mntKym23Cgz76GD4C0nsBH3f9m19Hrcw373vY
         MPWtKIY6/nnSTSrV4hxZ2Qi5iWYBvD8PtV/YL/RdqRvyZntwz2M1BXvYgNcrmp4ugxDS
         ZBcwsrYtDo7vcMTi9eLs9+q9nXv5LZlEP2NphZlze0yRmKypPyBeSJOVE61JJMgq4sek
         nE5PMZeAiq/qBmTTWpjLnLhZoLnBoie8tXP2TL5aqjFgygETjzB5LNn28ue2CagrPNK+
         367OCC0BdQLtNLgYOMZksa/UfMZTzrtKUVcYO/YSqHKXz8yJnzhvh4sf7VVa1QEqxfss
         auaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756693; x=1785361493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=soQZFIT4EZBal5u91MgSlYlXe/qZEmVCXfPt+O5X18iKqg0lJutpOk7U4xtMOkIY3r
         MEH06W3pmdr+g1Dt2tTIwIC/d1b0EbgWdXKzsmo2SjnwiDrVoIMBpuXL4+HJiBpCHRqT
         faV4KVYfkEg9+oUr4IK22WYc/4/hv/b9+qOlVyYaUo9hVDcdSnHu48Vg6XzaqEDRGIG/
         w4v+0xWDiPDDrCdAAoZUQHMkGqGAWwkxZa2ils5yrlaKzVUf9HbJspRlE8nLr3VcCNsQ
         KyZrkjbuies2kNrwdYCvMctjtgQqFe7rGfmoNCbehpG5atmkOJ3+kRJcFIRvftdFWS1z
         dNyw==
X-Forwarded-Encrypted: i=1; AHgh+RqI/rfc23a6d+D98yJUZZ2uF78cu/8YFeQfL3GFJff/LW+JOiFqAAkoRZUBjWkVJIHAnbCNZTzQtuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjY9fg6netigsTJSCqS7IaIRHHbPP88Zf8TZ191Fy3rwIRaPv
	C2NEget2g3ZZjLt3R+k5XfIcSkFSJ7pKNJNhGYjSoT7xuy9HpNqcIv2H
X-Gm-Gg: AR+sD12Ra5wrwGMlo8AqjZ21569g0N+432B0R1IITvqivd0wSrl/2tRHBpPJ053ZNR0
	jouyg+l6EYOecRGovFGbWhFTlgKmjsOp8Hu3VyvtLK/7dib+znnXMvGuOm3+B78zzREbct1eLRG
	PVDcMq/KcSOq4kca0gimRDB8ixSQpfbtZR6kGn8Fn6ndEZVg5KaW7CA8S71bWnGP1PLx/d0IT8e
	CPVv7KH+y0yqDSzsq5TQEUfVq4EtA/lhOhDK4WyDYn7+bw5GgE1LJr2DMpukq9tZWI9r7oDxbyx
	/iD+WHQg0X0n92oPv8yG1xl4fPCPXVuPhEwNVkdlvONw7LCoJFR3x3e6FHdbvU+uoHgvsfT2TqN
	CdPCpp1MDpqpgZr/hLXeovQ/M7KB55XGZAIjzWdgMnyAeWLuCDH1nPuSogi9dCiLKA9i2bT1qRD
	Of7yWuJ85h3JOmEbYBCRq9qM1tqEIPB2Oi6Trr6tIThOeZvJoV
X-Received: by 2002:a05:6a00:4fd3:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-84e2b7f59camr674000b3a.6.1784756693352;
        Wed, 22 Jul 2026 14:44:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:52 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:26 -0700
Subject: [PATCH v10 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-4-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>, 
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=3646;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
 b=tdDpNRsCNvmVGCNOZZ9HC3yxGmAH4ax4m27NmzACrsQovmkbRz97eJ93jI+rhX+xJ0J5zVBrq
 FSNwxKzSGzhDXRe3C8R+8iVP4estzVdVfYmBtDp3huLkA3AiN268Vyv
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

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
 drivers/hv/mshv_regions.c | 54 +++++++++--------------------------------------
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
 

-- 
2.43.0

