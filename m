Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BD47D45D
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828221; cv=none; b=UUwDb/HP7dOzBeIlx/rQrls0HVCSFNfdDdSWth0sO6EeFYKHQpGgj7oFxlMdJuBqn4fcsKzO8pCgFE1+Njik2yHIHSYMWu5wPcofOj0hXbZU1+pcLa7nu+LRvN78qxqtDjKtXv5Gz3+mng4jhS20gltxlFBinFoZRdhINUvuVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828221; c=relaxed/simple;
	bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TW7ag8U+ydY39hAOBDyZyrt1Pr0sOLnkvGARwrq5zvpKVWC9+7RYxOL64luAxeQ5wPk+BkImgYFpHblj9A5sreMYE5R0HZ9UJqRVBhO+g8IYSBIv4FI/PZsn/sMV5x+3KKp8jeWSTxvy35hKLzDMYcTVz+cU5qezkqa3Cg5bdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxDQV4ad; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxDQV4ad"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485b358552so974777b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828211; x=1785433011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=TxDQV4adhqRRAekWKez2o8M9b2r1N8AqJJwAYODXxBXkLYFJQkJEdchOdxcj8bhvrM
         VAUQBDtVhqqz1QYGH9SkvlUvzw+PSD3qHq/CtSUz95oRVoBgIZpRGtNy6YzFO9ze8Ahc
         D4l4Fj9JpYgfSAKb8NbAQvV/P1dINo9cElUfZDImdi5bzBGJ7Fvl6qInx+o8cYy8zH4P
         YC8f3mFup4oQ0/yGL2PUs92s0+La/W9BKGjKEKhVG4LS1cmmM4WVeeWQmY1pWGdtRoWA
         5WtKrrraSVTNyA8JVVUb05BWJAXZ+Pe8F61u/GCnMpmHA+/hpoSvoIuCXn+I4zdGUo46
         XGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828211; x=1785433011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=W45WgwitvW6hK/wKRcAa4nq+mqZwqcvRkt9+3n8UjbGz6oKzSq8tKKZryo8N9GJvt1
         dpciR8zqErcXl9wkdx6gi+XTe8On/2Enovrk7KN9j5S+ogu0o48+vjlNh4cn9kZsNo+p
         WxnbUH93FzG65alZCeOEir6wCUt1M6JNoLCkc0nhSewUhKz+CPKHJfkvm0kB2gx1/2ED
         nXs4F8nXcdTppRxtn6ftp2tGDQ47qedhtF8X1HDASUFUGi8Ot36c1RSKgQRncrhZtrRR
         pPYMwRCWSeYJTaMnwtut/2BcffFeoVHEUNXP/KYp67mWuHfvbtBs3hpd6IbkFS7xcsMZ
         /lNg==
X-Forwarded-Encrypted: i=1; AHgh+Roi8vWYetW9QMOg72xhudKeRYL4MZyl6LN+CKbCD0trpnSm3GewwYQPD1+fmy378B8IzvyKPl6L3is=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xA37ns7NLA75k4TD/uk0YFugomm1DR80Yd4+MB4Bx6Ri3Mlt
	ZcFVVidE2ner+fuv5HX4ipgzwX167H9Y2lWR/KZnF0+KmMrTF5RMvUYZ
X-Gm-Gg: AR+sD10oC5FziaTbr3E7WJFheIVBBUokkB7kApI1cNjmydOt4Yr6c2Gt0Bw7BxiI2L4
	braE/39q6XPjcxYC9Z/96N89YpVTXxvSkZBJY/y2M+uNEKii+5rD0u4yZKNIe6akwUVK2c590RM
	vmV7RSx1ZCh8oSovnmQ83Fppebh4egKpehRNvjz1OqeHb665IIvNgdodH3u+EzuWKXnQ24njd27
	x9k4KoSKGMo8R73fYZ0aeXjlfI/7xDG3A3aW7WyDgZjkKh4nwfmyqQad082QQN6MP1hsWY51YaX
	xWoaKFq2UuiClKEFzlHnRhb4ifa0geDOvBeYYEEKwryiCGDfo4kKbX2l7a1JHZ0hxQbj2bLTaF+
	fbFV+e0/eXkr2EtoRE+/9WF8sjMo4GF1gfXP9p9EdG1D0yzGnAmei8bLjfoi3lb26ObeITl3tlh
	7oz4EiVAbxC+r3SvzNrZo5lJufZlefoTVFQ4PAg1OoMlSF4d4KhaF047IHIb4=
X-Received: by 2002:a05:6a00:27aa:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84e2bd6923fmr4526185b3a.28.1784828211456;
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:36 -0700
Subject: [PATCH v11 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-4-c55b003a4b61@gmail.com>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
In-Reply-To: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=3646;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
 b=U8sSsRw+6XM+qGDxpQuoe99V7LeZ+M1zXxyPfZetIcbxZBFVX+M/0/c0psrN63mtn0Gyjy1RN
 9IByi6+fiCLCWN+9DASYqtkcc69AC9zezCPbmBdSfWzMLLq1QDXujHn
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

