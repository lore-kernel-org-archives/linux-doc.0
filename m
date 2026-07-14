Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B863DB980
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067706; cv=none; b=MfPFotW+4VfwQ/KTZc+usxQy0RHmSX4aYRzDCdIlV92FzM3eJ5prX7MLjtqmlyh8aFQfboPzGoUxB6rnWau+53oyn8SAYA2Wn0YParP2GMhRVFgvCKE9elADc26aQqlSlLnOby+TxFcmwojJM3IkrNG3Y8TjjjVc7VKS7qdeRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067706; c=relaxed/simple;
	bh=A4Er1bYo7B9F/Fh0sK6T9CFPqwFBZai4b02cKx2Qk+I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNYnTdqRP2hWuFSXp6tZbneLZ4AaREy+kS5Zah5B1XTaC8tOn9z5sfHYlUQV59ngqD/hTJxWH15ka8w9sMs3XJHY1LbUaFGBGoCOc4usU3csXSYwO2DfdO2aVQGjJ9+0RVA5lOGtsMVMcVATM84QQJKKXStninr7ubmfGfKZi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e46TpYuY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e46TpYuY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so5395645b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067704; x=1784672504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O6UyZtJMGWyTXwkf9Ut71gXKM+acqkuQS9WqdrHTITA=;
        b=e46TpYuYIxYIhKkASg9LCbTW93foWXhS3iWCTwgoxIytDClVqta+oJc+jdS0lX/WFS
         aonGRXYzGXEa1xyqv4TfG1T9EKB3KiZIgceQ7+LKrF867I5jExmtTGm6Fa/u4orDXx1L
         veodExEc+DzuNqsQkMlP9uvRJB+gjlzNWqVdxj9RhvAmgSRWEP3hqu3h9qZONko5J6oi
         bvN6K8c8dY+mqslrhZ7zmUn/4DZfz0+f0d0YRx2VRZrnmpzZC603qmtEUt/SN29UvHSB
         e++K3ZsNlcgBgRjqNEuR6Yec1BqkHDOIKo0nPEk6DuaCROAPG+ngUwRJc7EG0BL6p3Gy
         679w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067704; x=1784672504;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6UyZtJMGWyTXwkf9Ut71gXKM+acqkuQS9WqdrHTITA=;
        b=MTzGmr8pxWdXasIhiMuC86aQkb0plYTpGqFJn9LXJ/uDjjnF5zaTVy9YFN8HyrgwzY
         NCY3yUVyPBP60763zao6AEDGNnJFd7UhWijCnCISfBiz9WSyHNgrLSbRrzpMN7zdi9PZ
         akqsZMY/zIhUnV2A6wX8fSBa5QxQwgrm90AHltZX/SeaRX+SRLSTsPhJNqTPMIYubYjZ
         1JHFQg4yllGXOXwQFd5FOxNSZkjK8we/dEXkQbzVdqTpVzw3OgzMvyYaBFdPDu2+KEHP
         xBX8M21X639N0FwxsP8fRhQyGEcgUCSgXJcrKniKbnjXZWOf5fsR97drCBH3Bp5iWVc2
         QThA==
X-Forwarded-Encrypted: i=1; AHgh+RrHhM0q2Gtgh6waSFQItw/BkckScB8zb+FsJtfk9fE7uzz3b07CcFw8kLk/ajVbfpKaMhmG/pajhqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fGWBupfA7MqO/kn9swHK6EWMXIVDj5j/lLo2RFi7abMInYLT
	x7CWNz3LWSl7uQVhgBPVjxmbWtE58bTUym6KIzISjLGe3vD6VS4VpWCF
X-Gm-Gg: AfdE7cmbp48RyF+gRBE3B62qNYZE77FOxM7m+a/Q6SUgD+dsDsBIJ28ktkwywKrORh9
	jo12CEb+5IhO5yErBEHywpcsqYF8rF70ykJPmNbB/481XHQCpZptdj7sKte7TyT/NdUxc/oqWt8
	yHP/p7hA/yUwsGhX5QAjxwcoMa2t8haa0Tuy1sJBLUcFNJplUXNhL68ACBR2W5PphjBaUi15MeE
	9jOBzU0DuBOUbqcXyOr8tlTlIJGuy88W4ktBHyA3gLleQo+wt668yf7VDARNOE5zD/yJYw2SduU
	d3d0yLV1grGSfKnMboVLh+lXx8QjvSyWKjXrC15LSfhFEoBDnX9uFvPFelG0NNrp+ORJJxHNd49
	KNjwkxFijGeqDkPYHSwaZ3k7pc96UexaaEW9DStRWp8m8NxCoA/dI43KE/s861oaid8buS4lzKA
	kVKx69fD3a86UbTBMHpQHHKZEV9Ddn/9dhu2H3d/lw6uEQuH7FGdYTfS95f0k=
X-Received: by 2002:a05:6a00:1819:b0:848:4742:90a6 with SMTP id d2e1a72fcca58-84a5140d4b5mr4845081b3a.15.1784067704431;
        Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm2010807b3a.23.2026.07.14.15.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
Subject: [PATCH v2 3/4] fixup! accel/amdxdna: use
 hmm_range_fault_unlocked_timeout() for range population
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
Date: Tue, 14 Jul 2026 15:21:42 -0700
Message-ID: <178406770278.1106335.17232929459598625570.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

aie2_populate_range() now uses hmm_range_fault_unlocked_timeout() to let
HMM own mmap_lock acquisition and retry handling while populating an
invalid user mapping. The timeout passed to that helper is a relative
HMM retry budget, not an absolute deadline.

Pass HMM_RANGE_DEFAULT_TIMEOUT directly to the HMM helper instead of
computing the remaining time from a local absolute deadline. The broader
command submission path still keeps its existing timeout around repeated
range population attempts, while each HMM fault attempt receives a fresh
retry budget for HMM's internal mmu-notifier retries.

Keep the existing driver-visible timeout errno by translating -EBUSY
from hmm_range_fault_unlocked_timeout() to -ETIME on return.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 548ba4315554..21f2817751f9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1037,7 +1037,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1062,13 +1062,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
-			max_t(long, timeout - jiffies, 1));
-	if (ret) {
-		if (ret == -EBUSY)
-			ret = -ETIME;
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1086,7 +1082,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)


