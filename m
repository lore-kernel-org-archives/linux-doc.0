Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9444606D
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756702; cv=none; b=ZVcw2OjmakjwE8xKqmOiuxRmOYJmING2i7aYYUDQT1t9bAcCvyfJihwRDEa5GC/ieNixhq7p6nfJbqQCYrLEhWdHRuMs18areismV5UM23iDlnnxjfXdJb32i/yWRvmOm4UHOuWVHdWbWewY1kvnGnQ43MlTgmTh3s8UxQeJyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756702; c=relaxed/simple;
	bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHgh2LMCECcmQIckuwF47gizBvvv/jpPDPGM2LhRxkb9WWx9+U4PX9At6fnF+0SpPKBacgCmvfM7Tl/OjeDE3f8bW4k5OPydCle+8fi4LPZEE1H1HT2En0bkptZJZn+d+OrJafe/F2d3XSXLf/21VFKnI5bXdjeTb9K0otPKUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqfwTEge; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqfwTEge"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso14253820b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756699; x=1785361499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=bqfwTEgeLLBzB5btm+3q41Gfm+tsHhfYbXFwI58ASYtVh9ExV7vdkWmUMY3W9XDpcQ
         /7a3wuLg87gEATfBwM7u6oitGBFUa39ChxwuVNJBxRF5Ak1PoUFo+L11pE45bP6ya/bg
         po9Y/JtM8iRcws9GV/n53TuQp0N9DDeyysQITt8sLvx82dVDk3AHl6ES5s560p1EIxIh
         SKAkCGq/X6mzwji+sQSViy1DJMv462IYVEYVhRbDr5vZuA5ErWeQIivIDyGOl4Wuq19S
         AfHVZTJ4snaeY8S9TL+mwHfhE0yJr033IVhHgsDXAp574jP8wgYVYClSB7JWyYBenWW4
         01ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756699; x=1785361499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=PcAdxyvHKYhkT456Lr/79FlmMR7fH0qQTo//u2joaB1NUFOcFH4eks/MPpk4JBNLe9
         dwU4W4lq1Ch1vCEpZwpVLbtwXlF4OuDKT+wyXYWRzdUY0BWBcfPYfLeS9UixQk8N83Ia
         VZpeE22kTaHc6n0BWtsS9naqcT2nVn2eVHNNcuoZF7t7KLRqnZ5Q8j6EPN+gzOGULuGw
         xAgyLdO8xNDrD+Ynwsw7ZCengc6yS3vSXPa1MMbK2iyeghh1HQXG7JHv2lpwrQ78xvTC
         yvob1o+oLdNlU22MtTvzEuvcGqPDeMLNqFkHwV2SIk9x8y8e8RXE8B9I/sLibOwOuskX
         rb/w==
X-Forwarded-Encrypted: i=1; AHgh+Rrmu/kUKJkARZZb+WhtCpZcoNyQx4y7fuaSrH24ZuRioU6WxI6Cv+hf4kPGCWrQ/pCRVHD1YWqiY0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9dEIZVRpp6GYbADhWkkg1dPxz4o7sK+4pAdAbf0GQAgHBMmC1
	4G7ttPjSWmWA7ZICXBHVUH05E4+4o0JtbflN7URXBbRZA3ciJoj2cdXO
X-Gm-Gg: AR+sD10RBMuWFJhwgI0BfAlpPkfEbsxbD9V4Yy4cK3KUzDgR9QXaiUP6a56igky7u84
	f6JBw0XmEGcgkjPiyYnl2CI8wPBWqSIkXD3G9Klvlkf6VitN9Byqvk1fTh4XuXutayxzM2COTvG
	CQIcNxXBnCD61PhotnQ7yoj6AkQGTUEQSFd7x8aILBnNC9NefS0LPIiRWckM98iQn8GMsyrE1yM
	4weQIbnD3UhfeN/y5floTx7GgpNZeDZIKWmWFbwF65OKxVE9WPq2v0T1qjyGrYqVl0PNJJXLWsU
	Tcrjuw5wmUn8u3nOY/Cmexj+qoNa7GSoM9Tj7lUVPtdwYuspkRHdQ1AjrjSRqe42dhUt1Xfspa+
	RafH49xws/wHVM4QIe5vN19UUidefHd6FVZkWjY3mcSNhI+rc2DlCVwGWfi0jaUxVxim0gFmVhr
	LB2fWZNXOejOT18SkcbTFbYYVfRqM4+5TTDVXumQMQAcDnBxth
X-Received: by 2002:a05:6a00:2e21:b0:848:5ca1:bae0 with SMTP id d2e1a72fcca58-84e2bb3728fmr677188b3a.42.1784756698735;
        Wed, 22 Jul 2026 14:44:58 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:58 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:29 -0700
Subject: [PATCH v10 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-7-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2650;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
 b=OvUAdAx0y7f+AZFnN5LSfteCYnBEUqdMQ1drzLwHbqAw6OKXvHLZibJ29BghZSxMaAsL2Igct
 7dhM0ZwBa4kCtizE7Rk+AH/sCkM9/0Xx1LPVtAK4e1kYz6EQ4qhx7vD
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It also open-codes the mmu interval sequence setup before each HMM walk and
retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries, so the driver only needs to call the helper and then validate the
sequence before marking the mapping populated.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
population attempt. This scopes the timeout to repeated HMM notifier
retries while preserving the existing outer loop that moves between invalid
mappings and restarts when the interval is invalidated before the driver
updates its mapping state.

Keep returning -ETIME when the HMM retry budget expires, matching the
driver's existing timeout error convention.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..b5b4ca263002 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1034,7 +1034,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1061,24 +1061,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
-	if (ret) {
-		if (time_after(jiffies, timeout)) {
-			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1096,7 +1081,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)

-- 
2.43.0

