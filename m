Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152C42D766
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 18:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139418; cv=none; b=F8fNxq84bL0qpeo+ChFS8bAXx1SngTIhnURfOjW1zv8PJ2eUd6VZLT2FHr3fBK1g+1Bv21PfhskzFZwQFa2svYKVUhQLCmyNRw9ndELt4GQ77Q8EJlqvEZifWzj+PjfqI0Xz4aQG1zdJ1H60wRt0DxLe4mCIHNsE6Sy5KidQKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139418; c=relaxed/simple;
	bh=6NKYp0288qzLifvPuOSD1Je8XdLGvJewQimz4GqkDvY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ax+R1SSt1Pr8sXsWynkWm4u/SWhzCPHBpbHoqvZ2KBIBGOZfCgiloU5RXVe+Jl8y8VMxic+A8UaI6zF/F334JExHPAu1ayObA1kDfRAF6rEe3pdQX1WaJisC8DaeErxqRIYL073uChAPxFNRRAuL3Cfbo2FS2G0T3Vn4YxWAueY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrjHT2VK; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrjHT2VK"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so2580876b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139414; x=1784744214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kQ5Orso9YJMZEBfqLHTmR8qEZ0VQA0+aPO2YU4j8nyU=;
        b=XrjHT2VKQ8wiUtUJfEJLZtQG0DFxIdba+PxVYeqNbrUigLMA7tel0Na/hJm21QIteP
         AcYFy8Xhvdv8JAAQfwdPAU2cPGb5bFuqZhlzo55sE9RTzF0+qus+jXbytsXHsqD6v60y
         +XCq0Jh3DLMXDQfJp+3HK01Bkw83DgcHVPqHJGqjnBpyr8C1B54JzBYMkTCbqkj3/PUZ
         hOC/zNGGsmp6wQ/HX6Qqal+NEsalXIgLtEUv53vztsvMuc4M/ayCSBMY1W4PjMfdWhfT
         TA3toRSVz5VF04oh1QMKoq4CWgT3bS0KDtFZ86QMlu0eaD8K7UyddIhEtU3c2XwprgZB
         G+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139414; x=1784744214;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQ5Orso9YJMZEBfqLHTmR8qEZ0VQA0+aPO2YU4j8nyU=;
        b=DSprNdnphk3tx4QoaYYy0Y8rQ9i4kuFR7cSSSjLIiezLY+hAV8J5wQBn3pfm3+ZcZf
         VBq2Owsl/onYaQ+E5+e+YkydH2Gaw7aZYS3mfdW9Wc7R7SMhG0oTPXZS8DV+rW96ESh6
         vr1beuW5SFv+jFt9Qusyxm9p8j23NaYviYQIL5mJm2PHGhUGRiC9gmSVjmwU3AEMdvP2
         RA7DChr1/jqQuXr4PlYT+bPKbN0RJRMRd0tLsjApG+yY+5ea3wSrP+nyvzPPhqGJXUbe
         4XmEF1VPYDuOS1lLHHmCwkYuA2Z2ETXvK3ytcHqMQwORcrI5bvhPBM1CbZmSaiDMj0dG
         qoIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/t1AvoO8kSMWhNJK+XTW/F4QJr3i+drY7nkZ2WIMRCnlEv4MGC9ks/Lymfy1dI5cy92lwHH1SkgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjoipgcCp0rhjDOkcri+pFXjhKtSjQ5rihKxnLCXYmbfsXkpHJ
	um07g2faSSXMP4WofhsVC30x8+/SPTW5VkchFeLaFk97K25/vSUm0RjX
X-Gm-Gg: AfdE7ckxPBVFXyKh+GjfYP2XtL71LyylLmYytXLr+j77BMkLY/+cIjDDSQTfxVoaY26
	Ft235KTgt3SVHjLa8DA+P0fGzr3jigPl6bjwE2rjSOSyPc3JncUYKHJaYj9ER/MT1CA18nAhEQV
	Al2jqmenqiH2I0knQhFoB/144x5FUDJQHjb3xZ667rd/lRLcWoXbGZxeLhQEvKQkJQaFrknJ+Cy
	QCJuJJ97+GViTcAHfpcqVR8vuSndws/KYeRKR6m2aDRiHGxoZNe9oJ3RsuHCNzeEytfowl+3kqC
	e8VS8rnl2UeskQYnWLtSA/f8JdTuneA+EWJqDctMCH5F7wRiPwFEM19qb6E9C4wZZJdhN6tMROo
	yzIbLcnS5ocjmE/WLvNLgwe5TvPpjSmqVly/SYMxghE2AbI+W11HGYeLY4CKqjOGBMuFaqnzZHf
	38UUGvS8eN1xauEP3GCK/u//H54s82XtPwKNCL3F0Q1BXTJ27Qj6TQqg3zREQ=
X-Received: by 2002:a05:6a00:10d1:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-84a9d0e5e99mr412854b3a.14.1784139414332;
        Wed, 15 Jul 2026 11:16:54 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ede81asm621883a12.11.2026.07.15.11.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:53 -0700 (PDT)
Subject: [PATCH v9 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
 range faults
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
Date: Wed, 15 Jul 2026 11:16:52 -0700
Message-ID: <178413941236.1155966.14485211391150425997.stgit@skinsburskii>
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

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault()
and open-code mmu interval sequence setup before each HMM walk. They also
retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() for those faults. The HMM helper now
owns mmap_lock acquisition and refreshes range->notifier_seq for its
internal retries, while GPU SVM keeps its existing driver-lock validation
with mmu_interval_read_retry() after a successful fault.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
fault attempt. This scopes the timeout to repeated HMM notifier retries
while preserving the outer retry loops that restart when the interval is
invalidated before GPU SVM updates or consumes the mapping state.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   61 +++++-------------------------------------
 1 file changed, 7 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..de5bbfe58ee9 100644
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
 
@@ -1406,8 +1390,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1422,9 +1405,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
-		return -EBUSY;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1439,21 +1419,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1720,8 +1686,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1736,24 +1701,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
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
 


