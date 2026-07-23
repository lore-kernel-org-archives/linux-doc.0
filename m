Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C147D473
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828224; cv=none; b=RoLk7jQQ+HaCJhi3etwXGD+jtJEJdKGJjLzAB19+/UxmFjhtPBCwjUhJEb2iJz3OxNBn+b60RaxqGTjgEW0PlsFeTzkZo+DXhUP0tjnnEarTX5oji6Rg3LFOkp1St8enQqnCqPLQV2Zy8NAkAab38Xzoe7xVz3fv7gMdtAxAmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828224; c=relaxed/simple;
	bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIMCiKnRujHg6dfL520piXeA4f8J6OD9GiZp0/tI93GKbNJ+Rr3YHFGZJlJinm1BEuY2uKIBXLBqCpJ/kW2MxG5exx0/HmtMUuFLWqx2HkX1jcm0DjdYPG0kuB5TwUGe3Mh+V/OhHCb4lCq7C2HcAZt43yKmg36lJ//ULqLw77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzoH7ryx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzoH7ryx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8486672f03cso969627b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828214; x=1785433014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=jzoH7ryxgSw+y1bE/RYZqr6Afgy4TpkGNtQTGolNvAGj73SbggEjTkbqeXKAAC0bwa
         4IUqcI6QLz7xVuCtPTYe7yXdTMbbRghVyZ411PH+ypOPC65riMLpSiIiZ5UpvsFuYs4U
         YqN2rgS7wKE6eoocuuu+CF65r3Oe3mUQFrFOMEdjlGQB4sLstr7/0ow7JfsVKNKCZ1C3
         puIE293rl6nIrOUlUN4gKti7+6ays49hwz+eWaISQi5Wj+3NtPmeJ5Js8XTNU3L0wLbJ
         4RN4DeSZpqlSsEfGOx/6IAeIN9yYchuCXgsDbteNoKuPtFrx0TCxK9qwiccpRkxSvdxs
         dm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828214; x=1785433014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=PywVsmVdj5alySV8jRryklxglfodDwKTHCTZeNdocxxLTrDpjgWR9YoaUsTIv2M0W+
         r+JFoq+2X6ohgPcqyCaLgG/lmbK5TpTlYzUPa0XijmNdZWHQsyAAGl6TCjWHyhn0W7Bb
         cWWMbL0Xo3TBeKgD58k1MJmLwu+zEr1wiWyIVYK21DChQzpeJ4flaEahXt/2LIgb2Y5Y
         lfwf+Uuh+WRnIeU0SAZjWuKDNvQ3Sqy2WvTkNYRel2fnNriP2VsYD8GX/74rNIw6YqYH
         RliXidwJQwcf0lg3OU31XN+6fxCf1YIdy7ghiQZjU9iPsLniCzfKVBEbmhpw2mhTLGej
         vkag==
X-Forwarded-Encrypted: i=1; AHgh+Rqy6tSxYTJmu+tQvHUx1uPfxbA5LPZfzOfhU7oNQ3/gqE6o4Nuc7FiwMgC7uDeOMBAkKqqHMbKU7cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmxJ+XnxoCsRG62PD3DYKXrXhAC41K+nwbor1sU4KUIeFIG7Y
	SwlYoCQKyytqpV+XL/ISLPQUhlU1pDv6/R2qOcGYBQqk8rTSgyhUZkrV
X-Gm-Gg: AR+sD12pYYhXNDuaHxFHcmlFSCpv3vU6BG85EgSb7B+A3HFuHgmOVy/vZ8t+y6gw2nq
	W9SiJWftK5tK60FWMb8CqzEjgtultD9OQspctCFPtIVcFxGo+TI+glHCjflgZ04FbFAQNI1Tks4
	uGYPPCBq8aCQLU618zVBd2hMi8dqz+rpkwGnXuHNKG4iqkB5rTsX83O24C6siOrBV7FU0pu/Km/
	rSH0PjimZ5LW2zee2+VFD7sEKKpHTUCdRDrBP0zFTBYvOGSI42DDj4rVX0Hh9B3jQqNp2Y+W/r8
	i7BGrVaru5oSZm03moIaaBUXoanq6eSEXGfAUl+bEPNAyj26FW1BdDVtE4Ovl4+rZwYN1JuULE3
	/Igh/UYIpnel0dAZJCTcrjFdK+mBjsSZlpULHIjg32LcJA9QyLTKOTen7EHhCKOSyX4yXBhUsNb
	wqCHi+1809adxuQz057o5SCr09dFB/pxyH0NW8oYXr5vBHJmaT
X-Received: by 2002:a05:6a00:e88:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-84e2b8aa77bmr4617793b3a.34.1784828214639;
        Thu, 23 Jul 2026 10:36:54 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:54 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:38 -0700
Subject: [PATCH v11 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-6-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2457;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
 b=gezzOLTGQ+6T3Wy5w3nFtel93rrT2Kd9eeZ0n6f5FEQw8Beb0IrNif+mDyjnRhH39tdmJbOsG
 yXEZFknqYwdCOt8awUKVwHYE2B6xTW+3MpwtLFeYQDVzLwrWkfuTvq6
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/infiniband/core/umem_odp.c | 18 +++++-------------
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

-- 
2.43.0

