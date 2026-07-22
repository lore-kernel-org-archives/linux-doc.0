Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033ED340400
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756703; cv=none; b=kjS3g7353ipdV2KyV6ugqj6NKXK/UlJpvbsRKha5lJIZc8kd0q7cY4jSeZd+s6w9U/d0OF82+iGjJlh/w0Jj2lF6WtERcODI/osfae/qNW/npdef+kOMIVh3J8dAO+QsKWXHqInEVqdLIQGXihYBw3QbMaR1iihQWjmOgCijUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756703; c=relaxed/simple;
	bh=JxcTBTW6lEzlUH9pe80rZJYyQZGUPa2uP7JaZIpbDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqWPyKBsECJQgIyJw3jFsfjAEuCwaOaCUnZTwP6fdW2Az73g6Ml+vmRSLzjvfmuUYURRXilutGmHKFOrWSXboQC7grhFYPC4vcYnkKFyF20bmDFijzb1JuAzr/8BTTyzCl3Fy54BVLnDLqw8yKw2oQhUQ0a8qrxFZ9c8HVl0JxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEUHhGML; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEUHhGML"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84867f07d63so14622256b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756700; x=1785361500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=QEUHhGMLlERdp/ksj43uAtQfYB+uqlIx+aW6wnIUJLXOblYCFHTacX1v8ZLFDaRmBb
         ab77uFTIEJJ4vIYBPI33HDnSx59zsUnf2fnv8wBy9NWyQSivjbsekbWa3q2OM3pbk+cr
         vjK0lSgyPyEUQSjvrR2mi/XHNb3Ym/7Xd9gQrOyvm+sU+srsKQQgweud9ATK2ZVqGnAA
         Lcvx8JIV5RPb5ShYWnXIH2/Jk024MogiOW80uEDsrhOE9fTwU4lWHi25YbqLkonyqme9
         kR1A4zPE2CtfcPM8bXudQiXO5/aEzI6C9a+fil8Tz1qe+SrWjrNIgyqT+P8mafVfVkUS
         NFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756700; x=1785361500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=lfGr9Shum9q7JbIH1by2EtY1IhBZztZNBQg5TeQA3ETqjULRkD89p7puokgVPChHNU
         9O0HEVFE9+hMF31XHwYZ4zT18iqXQ3sTxrKJrpYISNq6UNLPzfLb4rE9V2r2d0/5WeBr
         7gvLqYoJSzUCLebE+qGDY4lxK2ruYyhkrSMqThPuGxZchDK8CqkdKwwct+0kXTWFVBUf
         PaxWCz7WlPQJBH59PXGMeQaiQ8TYooxiFuYETqE/j27+PnhN9VOiH6ZQ6kLwETc+SoH9
         pQeaG+SD4xriwLWh4ru/hDvZjI6lkmFT9zecQxBUdIs5wso0bRq0Dz4rdG1eZdaqqnDc
         3CRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+CRDNDnZF9Ki0R9VdOkEj8QTmFAqEnLu7UPe45RtlkqnW+lzNAYKl2mfp80PEq7F2xthdm70253w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqolKbfPJBkPrUDskIL22Sp2bPAha2I+jT4uTkAxXfuKRz9rh
	VBEvdnWzopPiqsTrih8XJtYQDC8AKb4o69UIXq+rSYPuhbEhZwiNcgqM
X-Gm-Gg: AR+sD10JLfVW4IWufAmKpgMkTigT0PKjG56i3vyfzY6Y7ULLoJLkHRQAkCrIZ7UwhMF
	z70nxN71vQp0RnE2bmXvZ0WrJU2w0jvrt9IFnJvYw6weTKxWL7mYovecV2C9ls7M8a2t9KJauz8
	HvTSGQcpkHcNITqF1CNqhAkZZYOYzynVzhFztjn2FsUbUziI0scJLrFMnX8iw0T6NXBkFgjumGy
	Tm6Xj/hv/GiE7CyV6tBNGp5DrLwXsWHaq6QtteYnoX4T8fI6EhXfyLkL/7CEG4Ga9nwgc9DuGiT
	yAygtKW/Puw3CCHXv8nQkaLPVXNKy1VWeZ4JaKubTRe+PDmNw72arPjNHyS5uy6pc0l89AUBv4s
	PJbpSbkS9PRKerBgsIXi2PPgz0ySBHDcgVoKADvnCO23rXnDb+sQrsyx/eyUlNbGUPO4gLu3htM
	xk64b3pZsI79iLQXN5IDzMOUJFpo7smC7/aIJh2Mu323dQAStZ
X-Received: by 2002:a05:6a00:94f7:b0:848:467d:293e with SMTP id d2e1a72fcca58-84e2baddf66mr627847b3a.43.1784756700316;
        Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:59 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:30 -0700
Subject: [PATCH v10 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout()
 for range faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-8-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=5001;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=JxcTBTW6lEzlUH9pe80rZJYyQZGUPa2uP7JaZIpbDO4=;
 b=t5pXaIaExV86XNOZX4rodLg/qlkvO7z8UzQMAKDvBSpVBwUgOqPA+1uKWVHHstjr3FsmGAV1u
 FhiXQ8BfH3FAK6QXFIhXuSWoEAqA3lYTf5A7cJupNOmjpSFDJW/pEX3
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault()
and open-code mmu interval sequence setup before each HMM walk. They also
retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() for those faults. The HMM helper now
owns mmap_lock acquisition and refreshes range->notifier_seq for its
internal retries, while GPU SVM keeps its existing driver-lock validation
with mmu_interval_read_retry() after a successful fault.

drm_gpusvm_scan_mm() and drm_gpusvm_range_evict() pass
HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM fault
attempt. drm_gpusvm_get_pages() keeps its existing absolute outer deadline
because it can be reached from GPU page-fault workers, where fatal signals
from the faulting process cannot stop an endless invalidation retry loop.
It passes the remaining time from that deadline to HMM for each fault
attempt.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 60 ++++++++------------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..b946f920b7a0 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -773,8 +773,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -788,22 +787,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	mmap_read_lock(range->gpusvm->mm);
-
-	while (true) {
-		err = hmm_range_fault(&hmm_range);
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
-	mmap_read_unlock(range->gpusvm->mm);
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1408,6 +1392,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long remaining;
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1422,9 +1407,11 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
+	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
+	remaining = timeout - jiffies;
+
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1439,21 +1426,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	while (true) {
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, remaining);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1720,8 +1693,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1736,24 +1708,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	while (!time_after(jiffies, timeout)) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-		if (time_after(jiffies, timeout)) {
-			err = -ETIME;
-			break;
-		}
-
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-		if (err != -EBUSY)
-			break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 

-- 
2.43.0

