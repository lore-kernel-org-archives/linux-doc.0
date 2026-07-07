Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E303B995E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453654; cv=none; b=baw5dozh+u2+8nmFTiCdOV/oVkNk2nDnAsOLhUjSSFCkTIkgvAmpS1ZIX7uSAmOEPMBY4MdHHSfVjnb4I86H8swGylukPTcVaTb6OMiwCKXLkYo6j+sxYKNrkpkwrAa22ehKKhL3sPxoyNF70y5IMmmGBe1550vSzzMwnUpMi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453654; c=relaxed/simple;
	bh=o8/LCoChLc+cjaHIcTVW1iSpwRxITCscyW4bNzHeIFQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQ0nqBhYstkccTjr/1c4/2e1lzo76L0mdfFrqOLHCRYNh2T9wbs0y38k9wizrjrBCwBSW1/yh1OLhjzYIdK0SJCklxigzFJ3ccF9Aa2D3/ghDYuwnrtgFBUJbLlwXp4qBEVAPNoAq7AiF3dn5V7V+FxITTKsOJCQ/lPpNhVjiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mm79clkx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mm79clkx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so28359905ad.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453652; x=1784058452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=mm79clkxUKgHtp7T+8PaY8N5LxlZQvwPZa96TfWFDtURf/utkayfKebvOSuiwap0ns
         JrIfcRXllWxf5E2VCMQoeBf1OtzmVRdFf5e9eLg2ZaF/2JoLU2vg1eA2poBXT+Aso0GL
         0pMq42MsLfMi249f+iiflIEys7jE3S+b5zpY08BXZIAuWBEuLugd9xCUPuG8ugHdytIL
         ln3xqmqqyHvvP2MtNLJyI/YOwKjLsxfTIa7bHLlzDjqqZ7zq9aMoNMjN92lkVVH5vI89
         wpe4qI5nrXPz0VON2fBEPeM+VvQI9sC/FpO/LexNabt6Yp6dFcjKiGeuXQDIWL82YWKK
         R1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453652; x=1784058452;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=S0Py7nGU9ZbegqATeZVwhV8XjVZa6h7xBWIrzTKBMj8RomssMYix7KzNcgkt+7FL0C
         mq27aW3bXTKwohlQ64mf0+G1s4WXxB9zCQGGl+qFgSmD/IFPzuYNRRsmT+9W0C+9F8R2
         64t9oGfF/E8GqdJyFOTZ035doQzGdFFqTJNm7wkl1aiTO+ec9cxCw7mj0+ORUkoXSUd0
         sq3c2ErPKBaNnXIG1qOymNUvtpzfaxgqxJZMoIYe0F4sGzKndDJ3lgH56GjSiFEUGx31
         3SweS5/gcIJ15n2CtSQzlIY6YlvWJb0mXGf6qmV/Tpn8lTR8KVGcDGs/903t/P2SKYyR
         cYkw==
X-Forwarded-Encrypted: i=1; AHgh+RrJn/dOT2EYw+1IcRFQWpXZE5ndBnzGVhTadUFXT6UP3CGNA/IMxn6wyhx85mijiWB+cG+dSh0uumI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkatNeRwVjV1UdkjaHk7NuL6Xss1uoWUjWijBSx21U0tAAjj36
	9UKxnb0m10q1K7fzxSLO6ysmaum8WtBwB/IfPjR6Hg/cnRK599Z9rL8C
X-Gm-Gg: AfdE7ckQ/ztXAlm2QZOAI6h0iFNsmcoSyedHhrUqvBRzFWjwScaRxrhD/id1Z1yJpjP
	ThQjkhX/5jYdvlEtJcoXWPd4JLu+2/Ieipo+pFgtEht04j4Q0PGuqtk/Arn/q83xTwtliFFMrcp
	8SVuRaHZQFon95Za4NOhiqGpRluXzydfycW4lpuctKQQMm9xgHxcBqmncIcNaJxkHHDFGx91aYR
	tos9VI/zp+wPsqpxdqbwZsXRMTX5pYvwZ7yJzLW/80utolByP468oaqqeZ2jg7yIQ3QuxVCkTei
	RyjK1hnfKRkkBKH7WxFijepl1Uo+MSisb+tHPRrwpYD9mQYXuea2MqLvPZa1/zzoZ6A+iOhsA5R
	QbCkQZCHL77oQrJAEWh6rzggmvwm8u8ndQ3trJpOia8xpJ/agV7qVkKRTOi8fqc+4sdsqhT43Jp
	h9xHgLHRVs0uBNgiOSa10GAJFf+zjkHPefRQk/IUJWQlS3pPsSe+0cvzlaW60=
X-Received: by 2002:a17:902:ef44:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ccbe616252mr63274975ad.17.1783453651528;
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm17270585ad.49.2026.07.07.12.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Subject: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
 ODP faults
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
Date: Tue, 07 Jul 2026 12:47:29 -0700
Message-ID: <178345364975.660027.8790629832830633290.stgit@skinsburskii>
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

ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
while interval invalidation retries continue to be handled by the existing
outer loop.

ODP still validates the interval notifier sequence while holding umem_mutex
before DMA mapping pages.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/infiniband/core/umem_odp.c |   18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 404fa1cc3254..9cc21cd762d9 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -329,7 +329,7 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	struct mm_struct *owning_mm = umem_odp->umem.owning_mm;
 	int pfn_index, dma_index, ret = 0, start_idx;
 	unsigned int page_shift, hmm_order, pfn_start_idx;
-	unsigned long num_pfns, current_seq;
+	unsigned long num_pfns;
 	struct hmm_range range = {};
 	unsigned long timeout;
 
@@ -363,26 +363,18 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	}
 
 	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
-	current_seq = range.notifier_seq =
-		mmu_interval_read_begin(&umem_odp->notifier);
-
-	mmap_read_lock(owning_mm);
-	ret = hmm_range_fault(&range);
-	mmap_read_unlock(owning_mm);
-	if (unlikely(ret)) {
-		if (ret == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
+	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+	if (unlikely(ret))
 		goto out_put_mm;
-	}
 
 	start_idx = (range.start - ib_umem_start(umem_odp)) >> page_shift;
 	dma_index = start_idx;
 
 	mutex_lock(&umem_odp->umem_mutex);
-	if (mmu_interval_read_retry(&umem_odp->notifier, current_seq)) {
+	if (mmu_interval_read_retry(&umem_odp->notifier, range.notifier_seq)) {
 		mutex_unlock(&umem_odp->umem_mutex);
 		goto retry;
 	}


