Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A241D63A
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060037; cv=none; b=fXDRJFpN3yuIAuO+UHyQO0hIZ5WNq4d+qqAOej+TevjwwdD4d4LNdlylum9CyrsW3FpjJYwBVe+Q4UQDqVbd78Xa5bDyQmuKfIqGlkVPKsOisnK7nGb7f4VjIg7MBnblzpAKWuHQ8RvUhOuXG2D0wSeaW0R6Ji/7cbQiC1VkfTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060037; c=relaxed/simple;
	bh=Q8uBbE9XdPRVXQaZ0ExTI42TK7zcMOJJhXBlrcrT8a4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/fKc7b+iPy1wTr/L8gVCHtY4+eZWftM/D9FMnCGsIwV9IOqKTidt6Vqh8JovCQzwNCyqocK0HIOfIhSxG7VWy7AlnWv0s8YlfMEjnbkH+8YZg5C4zro7Y5QDK6B/ta+AtfcVKck+iH5HNG2T36syKzC9FBt/8k19+1EYtufMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pC1DnLXs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pC1DnLXs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc97653887so54594075ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060035; x=1784664835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=pC1DnLXsM9pmrYwdczi94TaLLqpfQzcoJ8YoVM1oFGZFe07rDd/ZCswe0khlgNZrJ1
         bnZTQhA9whkBaPIDABjABX27M3zaGGfUO76Dkj5z00rDODdddWT6Euq7TCJeurqS0iI3
         +eHgc2AwQ67JCkvEgbI1biks0xb/SD55hvZpvaIsGXP9UULODby2vYd0uE/y1WHYsLXo
         KP8oZnUlz/rrrGvauR7PVCczqYe+AYH80h0j9wQGrBsbXdSvplOqRnTqBfpFTMMQNRpz
         1jD00Q96/vaw21V2zPNgvEJegojwXZXA6TOPslb58rOSvT4N87aKlLO+AFVZUacP7NV4
         RIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060035; x=1784664835;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=GuK88JPqoaezYDTANRl5uGva8t7xCvU8d5p3md5NHmK5GKsgUbH2M6LKuG3HLPaj8b
         3mtajlwidj/theMzzWZcT/UCmW4hmMlmAce/tOstQsRXgiAzj6/TicHk2cpCygAI40AV
         CFPOl15SROmJKbCLaK0geOqvgCOTgxWC3YPrBbMEhANuz2nCc82yfGnR1/s3ZMPSAvHg
         Dk3hCbGL3b6m4Q6nODThvhL8COIjaK485Q8wq27c87OEkNVMvVY1nL7hyz5Uoezj/DyE
         w5h8Ha0RMko44sEAdEu1VIdy5dxVZ2a4yNGezvQvOzGcD6UZerpw7hCnlXDfHfMiS8t5
         PdXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIKeeScczxTVDzQV/V6G97IeVPHg8dcCjtS2U9EsBLVSRGCbY6XDjcpJzLQez4bdFVBoBr65kwNuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNayC6lBqQ0hT/QcNXSJEwM2bCdmsZ4nYGTdibZtgl8Rsu66K
	kwnlMG9a6fYioGUICudL1t5Q9KSoUSrr6myJmfo1oAzmXgcR7JqxxRe1
X-Gm-Gg: AfdE7cl2SfoY2IbNK4XO9HD0PA36bTPcf8Ysk0xWhdOMNP/Sp18zQm80dUHM7GSwOj+
	WxN6gwpq2/LbXasLlVT1iJvQMH/hyvuBTET5bisAuwWgZ7iiQKQyqELQMDelQMRv9OEem/WMFhr
	F/kNDsVgadg8AAMtnutwuPj2r5kj/Ax7xNhj339DiauP+jBCvztk0w/XD9Hm4EW8fNaDlqgE0+i
	XZYA+ZOSfVJARXX8bm4cnKIBYgTqKZ/K31rPvZIIZH4IGaZLHS4EJnk8tR52qlPW5ETYi2t3g+2
	ayyMv2Y5wMLiAHCqDAFciGKmMM7P+KJGqAYQG1MTnyRFf30G/rAnTcHmyo6aTTS0BY7o1Ldh3al
	aPN5MRVrDJSC33KPHNeDVPZtxHGyMAZjE7KiPSa76XO0+K5nQ9f3Pufa8hxkHroBurK19K4QphA
	87wX9DRAfk42nroS28UGV5CUFAcOIfZAw5NhAluXBEIghCm2q/rvNhVb/WcdJJIqwVuLuIJA==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id d9443c01a7336-2ce9f27e6dbmr139524545ad.40.1784060035193;
        Tue, 14 Jul 2026 13:13:55 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm120937885ad.14.2026.07.14.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:54 -0700 (PDT)
Subject: [PATCH 4/4] fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout()
 for range faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 13:13:53 -0700
Message-ID: <178406003318.1082778.16211328573488321338.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The timeout passed to hmm_range_fault_unlocked_timeout() is a relative
retry budget for HMM's internal mmu-notifier retry loop. drm_gpusvm was
still keeping an absolute deadline around the outer driver retry logic
and passing the remaining time into HMM.

Pass HMM_RANGE_DEFAULT_TIMEOUT directly to
hmm_range_fault_unlocked_timeout() on each HMM fault attempt instead.
If HMM succeeds but the later drm_gpusvm-side mmu_interval_read_retry()
check observes an invalidation, retry with a fresh HMM retry budget.

This keeps the timeout focused on repeated notifier retries inside HMM,
while avoiding an outer deadline that also accounts unrelated driver-side
work after HMM has made progress.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b8f2dd9982f5..76e8a0028c7f 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -852,8 +852,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -867,8 +866,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-					       max(timeout - jiffies, 1L));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1459,8 +1457,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1478,9 +1475,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		return -EINVAL;
 
 retry:
-	if (time_after(jiffies, timeout))
-		return -EBUSY;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1495,8 +1489,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1718,8 +1711,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1734,8 +1726,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);


