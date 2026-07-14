Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C8418A40
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060029; cv=none; b=iPX2W6n6oZ+SdGJNyZy66v315Jf9AosD1B3bgVTaG1nGoxFL4adhdnRGPKiD4CGwgVsVfllKgN6lr4IHqy7QkEbmQAt+iEn4VueQZbphxm/JV8/i4lZM4zB/RleAOhQffMOxshj7cjP7q0iJnSvdt7tgLbDkhaHkxIlxbxRfSsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060029; c=relaxed/simple;
	bh=KZcIzmwaCHsF/oXSa3XD2VjZoWtXc+ZOgaxQjm2rE1U=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QuqmorgnaYIOP3j9MhKKdliDvcGljRUVFVpW3ayPElt5PRvSEbqPg8fi2r7hd7vK6y8Fdm6wZC4+ByNhqIGx/+DzHZME1AMArzleGrBdtEKC7/KEWn+WOxgDnexHplQdvkro7VS5hrW1otOzOBv0VLRxdXvQfhNY6v8EM1/pREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moJRbPeZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moJRbPeZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so56759475ad.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060028; x=1784664828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=moJRbPeZuuK1Zw0TeuRKOD3VC8HH+vbDw+XXRp8EIO8IAmiEie6jLlw2Il59iQp8RF
         DI8Cl2cFdiAbpqZmxa1COwfJBrwoyHuoA58QmPU88atgYnNjGzzYc2MjKQU8J51sYnOE
         T+3vAA7ZXoyqATGjwydpsKsp3u+TW5zbkUw6UG2QEdx8I83RoeLjIzyyFKY/4zsC3VtT
         VOXHa8woFd8+2vJPda/Vkr3y9LPlgfr1EUJQgBlaSJtFuly2vr5nYvIMqrFMa7yeANFT
         1cVr3tNV9UiTMU0W6rHNxokp7odK63/MbgUeljSlQBqn/thl8wx0zCoriz7iTJNtNK7m
         GcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060028; x=1784664828;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=Ol1DEP+KK/f/XTXL5oNe27sHburSASHjqISdEgIQTRsFa1ECUcfULbYjPQyD5YUO71
         5Xk3RWl/wzUkzkeLvnCx0kxJyF7nAPCSnmaJUHAgQ8fg0btOBo1fPjJD7jIJjSbh/PrY
         y5eXDAMWonDU+E5FmuF1Gn04rmAm3MXLByW03X8HPiPayIUtyRZ+K5eh+EqwzsNLJh8z
         FsK4GsM+/Z9ClQUnLCpsodnYft2Pd3B6X2y8vt8JXVTQHufB7w4sU/UvoJXRmlnJ4Nwz
         nZCQBSF3/azcPQaN1coLk37IrZRdLjHfR7MXMoZ1LU34tzKmC9LgIEG7BzKrEZews7iA
         Ldbg==
X-Forwarded-Encrypted: i=1; AHgh+RrQipDmtDfzb29yMzSW2kfe+srPxB4MMoL1K5aTw//d8OJeGgm4pHexOZ/7n655enjclf3XtgtTAb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZaSh+rpfkLyPuUw/4ZN4blnqdvPf7Dao9ce7Q59B4k4O19Gxo
	k+ZrmdVgbrrSD4+CNEhb/AjKU6j5GacRFEv1zWRhnkZSCvWFkDCUmBf6
X-Gm-Gg: AfdE7cl2EPmrTcMcQEsLfuAJNBSp1/TvaTrwAFA2IJV8AnleSgSfCfXnEiHE/CQknuA
	bmjB0yvWfY3/sNSOYquEep7t5PNfvd/sDfCtYj3rBnaZ750Cj0zW1gJDSXAWWRRL+/MUqx0aPuO
	5Vm7ax1jKQfMC+D08azttWrjaEbutMifRBOj0Os3AWeJo1QOAHEFUphMBlUgEnHUDs0rAtsDjUZ
	cQT6IMDFiBe2/t8Km0zn8Eeob6uIVqM6xHC8g+5jG/jmF4lLTDW/031V+3J6ar0HO8s/GOUcOF8
	pbTU47wkp5CiEc7EohmlHddPRXznGZADXkCuisQX7x6Jc2oi3Nnh63JK8U4vpdGAP9int137ec6
	LlF8gFfgA+AAri7j77kjAHdcJyddepkEXimCbXiahIHHUpGPAF9xDPF7hQpSPGIIv20fNR7R5Z8
	S6TX9OWa0OzTwRtVu2D48usTNhNg6RIOWYXInrKq+XbFJqODqlMsLlhHN4dcY=
X-Received: by 2002:a17:902:d591:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2ce9f15d1f6mr140607525ad.38.1784060028032;
        Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d45csm120844995ad.62.2026.07.14.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:47 -0700 (PDT)
Subject: [PATCH 3/4] fixup! accel/amdxdna: use
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
Date: Tue, 14 Jul 2026 13:13:46 -0700
Message-ID: <178406002613.1082778.11295976907808029605.stgit@skinsburskii>
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

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. The timeout passed to that helper is meant to bound
HMM's internal mmu-notifier retry loop, not the whole nouveau retry loop
around mmu_interval_read_retry().

Pass the full relative HMM_RANGE_DEFAULT_TIMEOUT value to
hmm_range_fault_unlocked_timeout() on each attempt, and retry from the
nouveau-side mmu_interval_read_retry() check with a fresh HMM retry
budget. This lets HMM continue when it has made progress, while still
preserving a timeout for repeated notifier invalidation retries inside
one HMM fault attempt.

This also removes the open-coded absolute deadline and remaining-time
calculation from nouveau_range_fault().

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


