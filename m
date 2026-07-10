Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E93BFE3F
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718822; cv=none; b=WYN0BmYFDMVgCl1AzNHvLPeouHY1mJ/eT1naPVMQRNSWKlRkblypzWve7uB7dC8Iv6bGMKUYmoAE1DtQVbA+9WyrkTrgpRVM/VB88fqEK6hTYiCsfHGZ0uNkA5wuQ3+l5TJ2eN+FDBwRN3Ybox+xvZ6MdHmdAdWo6upwCfOZltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718822; c=relaxed/simple;
	bh=oLJSKeCx7nGCL58ICDoU/1+ilBudUYNfbCfVls0zVKM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=erCpQsajdGqYO1D1oWe1LR6sCEVVwZgALAg18a+OixC+GYVGdbeOTkbhxfnV4ceptzVZhRfbwg29AX2uMx4b+EU5lpBBHGjDTcdR0rmz6ZbNaEy2q+TA0G8yA6ldUt5AzcrpazqjnDe7ahyYllW/OyO2VBHeNT/2G628BGcgbrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba7UuVa+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba7UuVa+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485fad302bso1397829b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718821; x=1784323621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=ba7UuVa+shzeXiuPbfIfB9GNaimyLY+aaJQs1V/AfART1SAYnwC05hG3fJSB4zEAY5
         Mp6DpLSz6dcfovvJCW02nGUWjWMqMfKR8WZCdLGpdVCZmrFzDtxEEV/IrLQubfWCHXLM
         GbWkTPuSqIcNXWWcUCP35u9sUBZD+BfSEBpx84eUuJS0txs3mw+Yar4YvIQOf0I+8D68
         GVkWroYoz7DqW7ETsBUHS6PEtmLBHHhp2o4YujhYBDKDV+PCp9hVutWg9A6alTITfMcX
         jhM28s7vJCz4Ll1UUG/0IHb/iVNyczMejjsKintfCJXKf4CCt71Ba1i+Vlxkr/nAxLRl
         CEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718821; x=1784323621;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=Ln4xenZ1uS4D6ck1UhGQ6UtZNem1Niqb7CrWywd6kihr7ZEASOIUwRR25WaF6nuqA+
         //Fzg/bnoRJU44oniVfXY62CZj0QOi/Xiw/ITgtHAW/YUZ1SsBYI3e9NI9NOV0vP3FMv
         X0jAr9rM4qQSX8+wU4WqR3L/lXKHbwBDOy+5R1kSeq72nySRUH1zcMnBYRQwp7b5EN8Q
         ut25Bn80MGkquyfwQSt2U3Zp9RnkETYjS2hgxnVh3izqooVnRAkDBNJRhPjcE7nQB0JN
         GhAlvdunmb6PjSCZUVzJFY/rrZ+KjRgI3yTbjBoTh3+iJOSJ8KqkWnxz1JKPo0K6yiFT
         BZJg==
X-Forwarded-Encrypted: i=1; AHgh+RosWBlkalqICOUImJAfDOUnoU+bRXIGrK1vgANiIv5V9z412dd92w6ChSAPI64VSRMzrs/hUOjqSMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iXwCXl9hp5VmEmmfaDM5BVdCYFakItGZU+iUbz+KC3dCAEcV
	3gruHNZopRTZQek9Efc7lxsp8tfGlZMEgpSzR1lJkkK00CqTWDHlJXA7
X-Gm-Gg: AfdE7cmMr8rnsGgQwuqvrYLursK5/vkXp8AJ5fRXJJAX968NxzjLwLgGSgv0pj3Ayb1
	1nScTEpF5hINTnb2AQ5qL2VHNMq72h5Dvkl546d5Ss97FOllG61jZ2Z11Jov4ukkZCe0G8WT4cq
	KDidDE43CW4bQJ7t86XU0y29jUfKNOfFAuz9PCI/XeLSQAbfloUNAd4UawWOD5FOjh921AHSurt
	r4WFHKXbk1dmz2GFHv7H1oLtsp6o5oiQ1szdiY2dzgqLu/WOCSe2O2Q0AARzw3QocB8pR8gHvVl
	EqZGiNv05CsaRAyk+YYm9yQsPxtYoQI0SdUD+6yjecDq/IOjT5C5Fn52Dpw0ERPTBc1o45quM8n
	/T1t5qsMXNuM4Ski0Jc0aWGtPgkPNk/LA9+BDVV6xit0XchbBAcgqTxBNS1/A6mKY6LuU3+j8Lh
	GQ48g+xnEkWmvPoCGIUCEnFSyNbnGE0v8JCRezAg0afGlnwjTme9Vn5/loxM7zYyjsANfCrQ==
X-Received: by 2002:a05:6a00:a0e:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-8488975299emr661948b3a.53.1783718820769;
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm6649821b3a.54.2026.07.10.14.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Subject: [PATCH v8 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
 for SVM faults
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
Date: Fri, 10 Jul 2026 14:26:58 -0700
Message-ID: <178371881847.900500.8789369230260725500.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

nouveau_range_fault() takes mmap_read_lock() only to call
hmm_range_fault(). It also keeps a single HMM_RANGE_DEFAULT_TIMEOUT
deadline across both HMM -EBUSY retries and post-fault
mmu_interval_read_retry() retries.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
Nouveau keeps its existing absolute deadline in the outer loop and passes
the remaining jiffies to the helper for each fault attempt, so retries
caused by mmu_interval_read_retry() do not reset the overall retry budget.

Nouveau still validates the interval notifier sequence while holding
svmm->mutex before programming the GPU mapping.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..4cfb6eb7c771 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range,
+						       max(timeout - jiffies,
+							   1L));
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,


