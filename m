Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C46443A87
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756698; cv=none; b=G9cgbMqAeofBpGEEAuIZtZyeNv8tcCUfy2mWGMSOURvaskmF+stb55Ir9txSR2dTdbPQA8Xpp7fboPgMsfILmKIBw1IoqzXbOGm4xbjRRLd4lxWTYoACMj8U6V0Stywj3XMBVhkraeueV99Jap929er/Y32l2pz5zyryx5ymXtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756698; c=relaxed/simple;
	bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npuWi56j3qzIKT02eGM4tzvcPmwwZH0VLq2THtNERTxpudqPlBm7j2C+1QW0If/hJv4t8EoWFmHgYMljBIPBH6QmeFgLTHWqBDIh2QBiiGCtje1WrxJNzOMRq1Xgy2zf1WwwzlssMC5RrhBQctyO9VZ6pkK+NU929ftufUXwGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjXGis/0; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjXGis/0"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2dcede83so12909349b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756695; x=1785361495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=MjXGis/08C6P1DbvTDS6XJJiOLeKA3eQfTgRH93dbv1sJJCfHSRkL3aF/mNyyMkS+M
         2/bzui3U5K4koDZ1W+02OsJlccKvZw20haIwOpjsQL6hK4muM/KJT0lqRDPbyLUU18VR
         pm1Mgq7UGLlKE0DYF+SgPGFSWxgOKUnaQ85PNqqo5naqIWdQKyv4vHEXcrv87MBWVXKn
         zra+0ehpmUoykyEljanDVPzp3AfQRYC/c5nVsAoTFdRDqc+tF2ByiA7xh7hs5Dj0b0x1
         OEtwLJzVmH1UNoPWyOsX/CF+qI+idQQHhRLt2Svm9kDITmGxLhByKG6WSxAoISesyuHF
         es8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756695; x=1785361495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=V69xL36UlDZSf5hsPuH3yHZbSqawdBjoKnsRUHJp2oxBDMKryL4Swfa9DMuRubPX9m
         omlOqp7x+FJ9etO1TcBlP5uR1rvNzLaCAamR9WSWsltRz9MdEJeEwux6LlVM9PsSzzXl
         rgm2wuVIHlGlzxgeV+m/g7DGiXJyGRraeVtnZaSepVbOPapUh/SJX3bApj4ophokyX3Y
         nDXj/CnhoHXwyck9BOvnR9/bMHGUaaYQsgmrA/8C6MKFdl9+bo8HvcZmbjedNgJRKLA0
         RzuvIIa7ZK3VTmzkN3XTLWd9SarVidxW28Uzk4+c3pi3zz3wcRaLJs9GOQ4jVbEmdYL5
         gt5A==
X-Forwarded-Encrypted: i=1; AHgh+RoQft3M0JVqP/OZYMdxIZFs2NfLkwXS8i+eaENU7B9Q2mEJzoblBm2uoThemDL8QCDskmcd9KV+BVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1z3QvSetxgdVQr9NdD+TAKFnlA/aSbM6myhDNfgq6t1iaRxUt
	9yOEtaGHy0Jw5iaZb0fEzcqiQCsotE0p8qCC4TZbVPaJdxjFcvUkgMkK
X-Gm-Gg: AR+sD13KCd7Z30WIP/GWC379F5fsxPJQcbHokBZqXyW6Z8VM+V8TSEutPLy4RAHIr2L
	lCK/tpNL2lujJpWEZldq5pG/YgaxH2erG+xeOcLBKqNcSQJcXO9Xzyh13eaMANUAOCn1gLlO0Bg
	uLV8SLOsXCoQo4DBmzv/HzM2CTm/hF52xHLzydZzM1xNv9Cyylk7Lk6l8fo80bZ2AvGBMAmwxzZ
	7cyu0S9bdg6ifKG/iL8Tjv64KVpJzBqB7xaGHotoUmigOK8IPXPa/dIB5KRChw3BBG+jTUkdSUU
	kZnzTD4OyuVTF69/u3Awf8/ZReSt7TEPBEm1aRqr8eD/NuytEye3VkVRu0OzLlEpwpYte7iVc/2
	CaNoJxoBx857huuxa+ovWGxwz+le5H9q5dlQDBM+/lbVSau9uvvN4G6NJHEySCc4RHvzxmdHUTO
	7HF1jU9XG0a5WwJzCNEUfN5s0Mbt0lBUfOiAWRLjV/kbIg5Byf
X-Received: by 2002:a05:6a00:852:b0:848:46ea:bbe7 with SMTP id d2e1a72fcca58-84e2bc6b5d6mr673956b3a.19.1784756695183;
        Wed, 22 Jul 2026 14:44:55 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:54 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:27 -0700
Subject: [PATCH v10 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-5-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2163;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
 b=uKgRFxKY7gMhEFoK0hHnwQl6N8UsouNcazo70jIAxend3BGPO0koGFjjGoE03g3KTWZd66DI6
 5tAsc5/qbDAAjPQ/pjqrtB3km5I7U9rctkdARaqcdzu58Lj+SzHd5bT
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,20 +678,22 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,

-- 
2.43.0

