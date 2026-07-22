Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB64446F1
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756700; cv=none; b=nzfVj0dXcRAfbWv4nJXQJaGloLe1MKmrJQZhXgtOvwla2pmvVrcjqdt0MCt8jUZiI8yvfAUcD5qr3/YajHJs2eC75KpwouXaDKVaPBOQCyz0CWyufiBvnH5zztfADwA2cRH6OByISVL2aLgd/mBVpx7JC5e2wevnxIx7QtU/lI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756700; c=relaxed/simple;
	bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2+3trM9mHqcbND2lShjbYNMUBpjylwKi+brCo08L9SLC9hf3I9P0WpiLpSwn9wEuFZJhVY1en+C6izMOsk1zzYbCOhSf/gGsKYMQqr8f3A3H42BpKvKgRxnnuMZndcm8L3HlhWhhkerxX00S6C1WqB/b8dD2T+lB8Q0D653/nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTMOc09F; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTMOc09F"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e27035206so598730b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756697; x=1785361497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=PTMOc09FpcMlM1DZNUhPtBUi/K2aOWkLARcKfkanolkLZxB6W1E4j8SxD8pdcvvU3Z
         4OUnqhRDqm7SnYk5Wyg0CyjAOu+KMvNSVcH0xAukoVzeUEA5fYXzT/o94NBxxSD6MGj+
         IN+s+1LTizRBVmM49hhXv/iwOHDtKTfca33m7E/iLv0BsXJr7if4H293U+9R5KwknEDc
         qNWwMa8WmksgPgWpWSvXsaG/Wv3WYnO6t2667aKZv/CyHt9b/835czW4PgMGP4VHlIfH
         fuGhVRvQNL4OgtpnRhLvGsI9w+lVynv7fPfX3GsEp3GJiNoLJqpqbdjC1mTY91lWJ+TV
         613A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756697; x=1785361497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=AzLdnsHjGDkxLI2/JMwTZeuJz31GQJS7GDNNhpCbmH4aEpITX3U7lWg45LopJaIg0l
         +Gnnp1dQVOhzWDkwQKFbdww0Qi/ayYph9aDZLAmau6aky4AwNvz2tFpcDwFmqzPEtZMH
         m5A8Hq6niI0PW3m5arb79J63ljgK1L7hMzrc5ntFpNykW4Wtx6RvsVEl5aFQea4tzMW4
         bZGOBWa7tTa91v9mzUNS41lebWjZDacXHaNI4SGY8hNDu7NQIOr+MJnXSHYv5+L71FUX
         NTZYXRfpyQa+KFzhF5bgfWJTZ9/Pv4bM7eCKF4Dz60UaaBj+vwstRqOKsBG5LgeflfSs
         hO0w==
X-Forwarded-Encrypted: i=1; AHgh+RoKJ/ad9m+IBvSE6T+8e2YGQLnu3Z4pzSkNph+qtjt3n/kovHz+bzgLT24wIme6AJoI57CRXKuHq00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIMPdvZJq2hSwE8EAKvqAt++Hq2NIZDPHFv8ejNwFqveBwWbm
	+b7jpN16f9VXXyEjp96VGR9DcAMmNxA06RjtdN5v8h4p3ymdpJ82uKXj
X-Gm-Gg: AR+sD10k/OUml49v9QiYXTSilezfsRZSzZiUyTkcmEQogYd4FNXFHcidlmfv76bRRZ9
	gX92ngtKRrc5dlugZzfIMCdvcrEMR3eBp1KkX4yjgnRUEsn/sFEeYseCM2mcT5Lv1t5mlRetvdt
	101Pa3locCtjfQzfOUD03GD0wNpMeBxwN4ZpBfAtiUIcnRINEv/g2MOGTz4QuREAjVp6H+noXjd
	szYvdyJ5DZTJg5V1+LN7pgxyJIuDTu7AtBJgqexfR2VWFVNSsIb69UtEFOiwPWjegZ+kG5sF9rs
	YI/ngsEvJl35hG476UOyBjtuIQbThWAu6fxZzPymMSZceSH33xvBYGsy/jpSeY1ILpOYNPqY2bS
	xxFhPZrxnV+y2TXHvgqKaRM4UXhYdyoYfGxSR6EZ04aIKcs5SaBeG1lpkeePf8kftTySGgmd8ic
	QTnUX+X2jfruQcNFZ4lHlkF80frKh+KtpmVfsOqLgcER8Fj3F+
X-Received: by 2002:a05:6a00:1388:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84e2c1b9f43mr598680b3a.39.1784756697112;
        Wed, 22 Jul 2026 14:44:57 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:56 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:28 -0700
Subject: [PATCH v10 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-6-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2457;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
 b=oTLl/A3KKM6QVfczDQir+MiwWd6xegg7AP0nwym7Jb+EYIV4zgzMMZlGO0Uy3Tv+0wtFJYifg
 zfmA30BQ0D/AoP9W2yBY0iwSakKcdy31nmnUIbQ0QmfiWeEgduaY6fE
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

