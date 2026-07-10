Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D63C5836
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718837; cv=none; b=DTZvCcN15oSkKIsUSgTmiu3QJB6c+2CBH8BmSkqj9xV/mBUjevlZFV4t50AUgSIqIbJLQjnovQE+09EdyQyRFcaFLt1cAPpq97sOqaw7xvuUn3ITff1jL2jwnGbfRi0+/9fG2M4BOwVou2YqtFYuiUBfO2zdaoXRoY4phug/IpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718837; c=relaxed/simple;
	bh=frLTEoZS2wGW/Ath+1xF9AQS7YavZ223qWxxIXaQCHM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JIADfcik6PJGtdbntyQK5NmTmGndtzP9xSGNmnW3r5pqY4vVSN4CTbB4oURVDn8c8NzbnRhIb8BQZA3dmx59nF9qRQ7eyrfVanSR6+jIXDsJzrWlGsFsda801fd7L1q6HuGn2Ez3v5jsXbzEcG1hP2/i1EoU4kt4INEz9OG+xU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/VZYUF/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/VZYUF/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84864086bfeso1383451b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718835; x=1784323635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SsZ1Rl/n/xZapvBLsULQnfYoRJnC5F850v9mJm5328I=;
        b=W/VZYUF/7h9WMWshohRHlXGNZolufAM16SPlqA7yzSN+qryXDBTHduVRfgW7xo8e11
         c0zi3VKDuH6vf9y7+YqUszJKLOvq4DTa5wJ4LNAxi0J+yqEb3MFK0I10Fwk3BTEYvSoW
         Iyzj7eAXEP4xHbjWawOTmXFDDDyYkF98W+d0h66+QLYr1f0j5wfc8es1nHxGa8nXIMlC
         k1YlXzuDHFYKhOwN9KUyCiulItSLbyErCNcYUn81aWbFsDaoXmZHVrWnDfx5adiZujQH
         2f7EZzIofWVLNS5rzmbWSMVGelsd4WYhX8BKw3vhS1UPMiQewcOuSgDO8M9a0hWuM9I7
         B+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718835; x=1784323635;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsZ1Rl/n/xZapvBLsULQnfYoRJnC5F850v9mJm5328I=;
        b=NGePyJwbcBAWzFSPwIiazZXBbvfQjToViECjOw8LCM4kF4ABrNGCV1Ro+ak2qtPgd0
         +faTG1GI82iwPlEmQHwTRZFKG9jvdQfumQvXtmzgOEeigjaOgOTCabcIxfwbiAYaSp6t
         Ty1leCEKY0EXIKRmtFcED0UQ1EeBcWq0V+cPzHZkCH5JfuFx8A4HkQGMitfrEqz2iOQ9
         x/QFJEqXn/vAyMVngsgiQ2MjXcMRx6vPpsLj8ZQotWXpLVgaJaAnUDIgTmHeNvNzhHCI
         rdlrYCOvO8KobAcqstSRbYR+XcVqj3rPWWHHcqdSyIWPvq//Llu8Wcd4s8kXuBeknkQB
         UZdg==
X-Forwarded-Encrypted: i=1; AHgh+RpCABFcwdrnK8lyB6q7YedFITKrik22GVO7vPes6PhenP5KoHWbeVd75SDV+lDcXSiHwn+O2LuKEN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3a0Wk8zDHB2nV6OIuXPnucfqpQ+3FJgBMb/kOpsugOOPKgeG
	mkTxeDYKJx8QBrvCo6SSHKF5vgu2UPwivV4DK3lrAVuXfBxRv/jByd2a
X-Gm-Gg: AfdE7clbQbz+2oO6Lk+P/4DClsAs443js7oCSyZaJ5j8viuEvM3skQQvGUUXd+xc5HS
	HEwXCAAeU3vJjZLrmTfxYk19Zqcbqu0EwCZdgkC4k5IMeGV0BAmFbdoA+JRNlIOdI/XpbvSIJ1Q
	bMquaVkKG3ffXF2nVMu9YDJKmFjcLKqmd0xaoY8B0ZUp3+06kTt57wz+clIcNGD6U9jcHHQANL7
	kQl8aGtDAsKTcSCBgj3rTesIfFlF7sNsKKlvem5Tll+X27CJO20n6d/9jq7vT7DJPbn8gY5zJ1P
	P0pONPfk5Be1pUb/Wc0gVV3ceVnEiS6KmzunBnOfEDnfMP3JuHb3Qvj13HiimXSrg26wVwDPnov
	SnpMk+7BcsebCC7TlrdPHD32zqZuMHwwmgEIUYHga5v94TFNuamphmNueKLlX247ePlOiJHEQCg
	koYUhOdP+IPn93iUfKOfnM7fRzsBkJFNOOYe43dhmTeZ5Xkf2NzTXepGoFLvKh0VANmXYSTw==
X-Received: by 2002:a05:6a00:3397:b0:848:2f84:737 with SMTP id d2e1a72fcca58-8488990b261mr583131b3a.74.1783718835015;
        Fri, 10 Jul 2026 14:27:15 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84870d76ce7sm1801076b3a.55.2026.07.10.14.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:14 -0700 (PDT)
Subject: [PATCH v8 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
 for range population
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
Date: Fri, 10 Jul 2026 14:27:12 -0700
Message-ID: <178371883276.900500.12789147320642521200.stgit@skinsburskii>
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

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
and retries -EBUSY until that deadline expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries. Pass the remaining jiffies from the existing deadline to HMM,
while preserving the driver's existing outer loop for interval invalidation
retries and for selecting the next invalid mapping.

Keep returning -ETIME when the retry budget expires, matching the driver's
existing timeout error convention.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..a16b8d7deaea 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1061,22 +1061,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
+			max_t(long, timeout - jiffies, 1));
 	if (ret) {
-		if (time_after(jiffies, timeout)) {
+		if (ret == -EBUSY)
 			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
 		goto put_mm;
 	}
 


