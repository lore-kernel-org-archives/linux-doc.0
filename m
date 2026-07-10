Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CF83BB116
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718817; cv=none; b=IAimP3ivUpLw3fuqbxkBzyn3GxlZTS3qt384eZu8aIzlO24xjdW3XgWZ3sAkVl9cWxiGZYVyEWregsf+l/f5p+ypAA+iA7Tc7HJ/6b4d9hq+GjNCwyXDmybUlsWdeWDq+OMdF6BIDM83nqa+9LUncKp4XqGQCUbUj/6WVJ/P/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718817; c=relaxed/simple;
	bh=UH8EdkvxcBQr7tFP4cWIxItcXG4Yona++Xa1OoLjzWw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jh/jlKzo7GkWuZDOs/CtprDIYHEazmCpvRTDQ+LKkEriqw3xPsJZiv0wtXK3MJXpgDUzlRt4xfHUofz8zVuw0txMmpvOXyNJl0aMvbQ3BeCbSdtDpxDwFY7ZPKxKB0xWoPlP3Vpm2RihJUkResp2b5wYWO4/2Ww24NnW5YNniB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS+elB01; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS+elB01"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso12917445ad.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718814; x=1784323614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3sr6piRbjR+cpoS2FsjQdy3tGYWA8BG46QjFZOECUzI=;
        b=PS+elB011jwqaknWI3rbhruNlyMs7K66rAnCdNtjmlTTNBp+Av55fUFSi/OFOLpXuu
         4hOprDlzJe+ADXayf9himYn0L49KlhKVLfvhOkKJjVFZghqGHPslBBwomaSYndjkm+33
         IZjNe1ISOAOD4VuAwc5okbzUzGhQWKXNlJgTLhX8/FNoeu7VqHe18PpJrj0EIoNrWglo
         YhunuWdBiBzC0JrXTcou9vz6fyY36vbBDkjmHNJM8jju2inJbO6EBiofJdXJjfg+q6Sb
         rQPXjPGYCl5rJlsuwc2Lq4ilyNnC4vrCBaCU24kX1gWZdvjopWq5iIeXnC4zxGVPTYHO
         vSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718814; x=1784323614;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sr6piRbjR+cpoS2FsjQdy3tGYWA8BG46QjFZOECUzI=;
        b=cDNykiikJzjkAEQCnMskmAu4QeqRUl9QrpfotmVwOFC9LeqU6Zd0J91LsGhMZ6aHmo
         VBL51svoTNq7gBg0viyP4KWgUjb1Tn0HIHu9IhaYhwC6ff6yEYPHrvJhIW58ohWlBtBB
         fmPCVfj8U9py1vgCzmhoA51tezvDF4F+qvi6dLggoOAizKMxt5fn+WPjsrpe9f5CCXBd
         uWnAehz3ukxP60OPKr14TGnOKvqlJibV6TxHYRUJ/OMjZFS2sRtz41VFFZF/2pcDth5H
         kKZJ7qlln8LQjKtThUUiMnTaZmRR9NwCvDMnn+YgLJVgi0Isr/FMyfJhoQdX/o3ih6IF
         s7rQ==
X-Forwarded-Encrypted: i=1; AHgh+RpexhrdOtopMrrn8Tl7T9MVpe3us96IACfHdCmvP+DqPAQk0/b/x+RPHezhgwM3IwAEITW3yRprup4=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJ96YIqliHvUsKnLf3jv/KWK/+vXS/JKdmggLx98ynT/IPXxg
	VCOQ9TyZ6yztsg8CJVYHwQEnmAQkteF4ZnAeoyLfpfRrRTAabPMUdvWM
X-Gm-Gg: AfdE7clM06cQRGFHCHSHORPNp7sC1turFVu3krJDpxjK870W2hXq251PaCHgbtmO2RW
	2QcjWYlM4zYlq9aftBuTp/0dX/2pOmrPIf6aS9IwjW45lgUmdK/BMNCy1T3vvmhgTQU4qwaOUsG
	YgPmiXRaQ0WHT2YJlBnvqqw7UUpknCxFuCH8ao+QJy6P8Fj/nCBIzqllNt4/N4kNxTrUXOMXLZO
	VvgQXTTfrgk3i67lsvwsBMVzR2EZluX8SedytdnBbK5QzXkh0C799TyWrhO+ds7ZVHYb7+FZASQ
	7otaiKczWUOWhaov5iFLVQr9eTmUiVPulaUseSYMhNDSFwMTqX4HMHmCQpr/lL7WWoRT8d9bn+p
	XZ330nuks1kVPCwRkBBUnDqeQqaaBYXWLTzYd1AXMtdEpJAGNiZ9U/hSerxOSXqTIY4D3TJvdTx
	EGj4iuHHimFVOI68x4gUHd6fqusVR0l9cSiuLbZFgIHrYV11sbBg3LsShBEc8=
X-Received: by 2002:a17:902:dacf:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2ce9ef1bd15mr7721375ad.30.1783718813633;
        Fri, 10 Jul 2026 14:26:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm66015545ad.49.2026.07.10.14.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:26:53 -0700 (PDT)
Subject: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
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
Date: Fri, 10 Jul 2026 14:26:50 -0700
Message-ID: <178371881034.900500.5214601525971121683.stgit@skinsburskii>
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

MSHV currently faults movable memory regions by taking mmap_read_lock()
around hmm_range_fault(). That prevents the fault path from handling VMAs
whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
mappings.

Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
preserves MSHV's existing unbounded retry behavior while letting the HMM
helper own mmap_lock acquisition and refresh range->notifier_seq internally
before walking the range. After the fault succeeds, MSHV still takes
mreg_mutex and checks mmu_interval_read_retry() before installing the pages
into the region, so the existing invalidation synchronization is preserved.

Fold the small fault-and-lock helper into mshv_region_range_fault(), since
the remaining retry path is just the standard "fault, take the driver lock,
check the interval notifier sequence" pattern.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..dddaade31b5d 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -381,46 +381,6 @@ int mshv_region_get(struct mshv_mem_region *region)
 	return kref_get_unless_zero(&region->mreg_refcount);
 }
 
-/**
- * mshv_region_hmm_fault_and_lock - Handle HMM faults and lock the memory region
- * @region: Pointer to the memory region structure
- * @range: Pointer to the HMM range structure
- *
- * This function performs the following steps:
- * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
- *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
-					  struct hmm_range *range)
-{
-	int ret;
-
-	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
-	if (ret)
-		return ret;
-
-	mutex_lock(&region->mreg_mutex);
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		mutex_unlock(&region->mreg_mutex);
-		cond_resched();
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
 /**
  * mshv_region_range_fault - Handle memory range faults for a given region.
  * @region: Pointer to the memory region structure.
@@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
 	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
 	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
 
-	do {
-		ret = mshv_region_hmm_fault_and_lock(region, &range);
-	} while (ret == -EBUSY);
-
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, 0);
 	if (ret)
 		goto out;
 
+	mutex_lock(&region->mreg_mutex);
+
+	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
+		mutex_unlock(&region->mreg_mutex);
+		cond_resched();
+		goto again;
+	}
+
 	for (i = 0; i < page_count; i++)
 		region->mreg_pages[page_offset + i] = hmm_pfn_to_page(pfns[i]);
 


