Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AE3BE14A
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453667; cv=none; b=otPmytqM+y5nteEzc+U0qbH979bhq92lYvBv2GzKcie54T/tQwGGQSTwGKO1qDIH4i7uiwCpqNYbLX9EFwobk/BNAzxJqh/C2gqJzFmgzFM3DtDHB7Lm0A0sfJszF8kx+AbjI8P8NbXp5XDD2lo8YHEuho5XVvvchZ9gaEgRhk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453667; c=relaxed/simple;
	bh=Jv1y8m8D6x2KYmcmzXGqhn/fhSnu37R26ZRIePclFU0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbXjdwUr+XvsYasWGEqMpI8HvYTxAIiI5+qSBYGqqDz5qxRh6r9FggPwrWUWYiJhFrSF9S8YuTY0HHMKuBk/Q+0hOAxvDwraVeN3u7/di3TrMz+4+dPYSSe4LaOyKXzMoCwGk85HpK+bh3FGOgYEZmM0kx1/8wLBz31R76FEnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2lstC0n; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2lstC0n"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847d1e9db22so5061428b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453666; x=1784058466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CyXJGY0usHae+LXmamNtPRV/qmWOdkzAleKaxE3NMCI=;
        b=P2lstC0npA4x5UUpkz5rt0EviBkV+UCDuKsg/eu0vqeo6e5gCXc3tYpHWNP3MC8u0Z
         CG0AebqOS5Tw0VXyXK7D8QxkU/69nBjX1+nyiMqwYk8E//niBEvV+zdefSr7dpYa4Lr/
         vOXtsAXWxisSJWizsfpTIf9JQTpVJ27ghFB7+4M5w9sxbyGcdOQ9XxPES0ghgKyic04+
         gz/E50TxBJs2VbdaijLWnw+cBQi9xclObLVAUAhbTef0opcR48Y8Afe5ILfX0X8JS85L
         MBKtsEk3ayzwcgZMzp8fwGpGkcrqPtoCb2GoXWx5jWVrFVCOClzpQP9eGVJ+vJ6I5R21
         RyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453666; x=1784058466;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyXJGY0usHae+LXmamNtPRV/qmWOdkzAleKaxE3NMCI=;
        b=Po6d0DNN1os+UQknjN6BxmRcBb8mK0qJyOVcQ2VqqSlCJvWO0ep+OKOQB37sQClvTB
         afdiyuhrAF9yydEvH607s0lId5KpxI8yDIFPGK6zuDiI8L4qiDinCPvfDe+Smo0T7Fbi
         ZlB/QqdJB+SB3YwNTmI1loAX/64aNMxEzCSjF5ZbOdpliRKGcBb2ZR0c8oCN0FHYQuhV
         K1QaFJcjCJ+K1KBOkQ6rYM7VBpjJqEYE4ZO9jHhBBgBS/pLSPRpp0FxijP+RGydmg1rN
         xu4MkhUunYTG3g/2TJgSojB1xHzzwKFdjIfTpqf2/s2V+aoN2E+DPl2ooPRdojuYdIDH
         1NZA==
X-Forwarded-Encrypted: i=1; AHgh+RqLseu7mZ7+osM28JDB/vet4d3YUie6eNq5HS2VuhDu+ghZnjvO8Vr6OSree6XmT+azl8M766S2b4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctDzxr01KH+M8tBLSem/9rWm2dHpINtHaPM1oRV0sfabtAvmb
	HQ60bL/cnJAaqHKItG31KPW3oi3jc1ATMMG+zG8zr9DG81I+ujCbTFPK
X-Gm-Gg: AfdE7cmCCKTbfQAP9q0XGa79nvyBgqU5EyOu7rBQK3MDVSCe0ewG6SF2kaMaWgCpish
	VmUks3Iu40hhxOjIox8YxZxXMJP/vJNay2tLiPgyQNoo7PgqPkJ4W9AOTE4xOEoqGnO8S+e+fBU
	I+hYap7Q+ZAYD//x3u0VWZYsiL/ILy0sy9U/NMJvBhHlNQpkQ75euKDmC7brl0drtLPjZ8bXk2z
	Xkx5t1EsdjXiPMsYgxaDJmQ/FZA025fY7Wqx2Z6Zvp2yXtGshKgMKP0RlhJg+UPHSyh+ScW7Dq2
	O5/7guYRlvv2ozPS+sWcjQ/gs/fbyEVieGpFypUkhFKGfMzbeqYfnAEOWwuZkFTNCfjQ8znAHds
	F3DSt7aknF/H9cfIZx2xNklQIx976jI5rPI1gLSXIqEIZ4tulfwikqkbxoiklOeSYubPxdAdTTE
	owkIuXpGK/ujtgUs+oWfMOduUJF0iDTmuq3TAdfGIedq+Q2+fJ7H7Fg2/3aDA=
X-Received: by 2002:a05:6a00:b89:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-84826c09c93mr6251882b3a.14.1783453665761;
        Tue, 07 Jul 2026 12:47:45 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483dc66f2asm280202b3a.24.2026.07.07.12.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:45 -0700 (PDT)
Subject: [PATCH v7 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Tue, 07 Jul 2026 12:47:43 -0700
Message-ID: <178345366389.660027.12986386801605494596.stgit@skinsburskii>
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

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
MMU interval notifiers whose mm matches the mm that was locked for the HMM
fault.

Use hmm_range_fault_unlocked_timeout() for those faults and pass the
remaining retry budget to HMM. The helper owns mmap_lock acquisition and
refreshes range->notifier_seq internally for each retry, while GPU SVM
keeps its existing driver-lock validation with mmu_interval_read_retry()
after a successful fault.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
 1 file changed, 7 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..2601b793428c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	if (err)
 		goto err_free;
 
@@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 


