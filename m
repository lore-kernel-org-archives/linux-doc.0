Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094F1D8E1A
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232857; cv=none; b=NZbrDsNAalNBmNpR698AYWDndhO5bJxjuLzZMcevhOWr9PCn8nuVGpjRMz4tY9EMTWMar7P6h+2/CJV8M7q6JXJAI1EIWexiItezBSxtSE/VOf0aAxbAlDGUnRRrfhzqFzCYwCz2N6o3CGCZl97IMJRTO2oVvtHQauSwNWR0q5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232857; c=relaxed/simple;
	bh=y5H/oyb5yTq6yRneEBepHGREG8blFWXRMu5RqF/mU9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BcZwNSpJ/ohR6mpqGFxAoRYmVZQzIa2JEBeGlu6uLpsEDY2dwi13GTAq1QSdZGMVOGoT4LGML4KeMUPLOwEipNqZ1RyJy0WgnCG1xfH+ZycR1ISxb1X0jiqvHnr6VPXYGDO1WbCaebrQFvactEP6Vc3i0ngSD42AyvquozRiUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVpx/Eud; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVpx/Eud"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so12303524a91.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232854; x=1735837654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=itcT003jdnlfYy/z4AAxsZgzhf2fL1y4OTxlsN9l2Ik=;
        b=XVpx/EudRd2RdUgnbP2+o1KeYdk0hBPA7u6i0leHRz+RMK2vL4EyuhFYEX/fMEp8UD
         RKa6LVtvdivBnacgyZ3+CdcjfiJC/gMuDDjTr1JCQ1hy7dRwqmEMvRIAXmacvCLpy2T+
         L2m1/0w5MupzW+8aSmJE8LMdbi6pcXwTnl8nUGbYfm90a17pcNxBILRKRR+/yvcT0C+t
         CIXwFQVuZwC5OOtWNE4Nyrqnvw6cFfEI0Aahznta2GB5vIuxKUUoqd08LRHJcf3UGDTf
         FUkUlVzYTJ0DRx/GnEXX3lZ79NRCfAugzBscAPb9EL8IASawu44C9P7V3TzqRo05PTpQ
         +ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232854; x=1735837654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itcT003jdnlfYy/z4AAxsZgzhf2fL1y4OTxlsN9l2Ik=;
        b=DD0vxSSwfkCT/p/XEs4CN1nM60aoRApD1o3w+YbvMpAsW/RgQdTjtuAcqY+3eXp9mR
         pQuwCn8MJr73Ajh6p5du53KtjvrGIdStxbaPo+HiP9Moapa1eKR5hK95Wex6TsdUJUwW
         Yb8TNj0ehUMw8To31ZVE7AdXNQbxrQGpVVZOsA7cjalZLhUm0TnGpMpa0gG1Dpmj4TKd
         wuvBd6g7tWsTHcQAT3K6ov44hv8hQdcRTMQUMwc8f5xGGq51ilqylFQSlepgnspE8ggU
         r2GYxOvp0/cyWU9zqlVkfBIaGRTroSwjggc8cj7xT2TCb8r715pOh6bpNKURkM/tB70Q
         BJNg==
X-Forwarded-Encrypted: i=1; AJvYcCXpkrdxfz63rR8PNmsaDV/qud1/K/C8Yn2+dDUCIU535ykhuvDR87sbKQF/59+eO4G4demzoqs3sPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIa5X4megrMjTJ0eY5w/axzj+IfJFvganLhQU0ll72ti1yfvpr
	ClWqV2do3sfrbG9oteO0Er6s+08V1Ah5334ydFltNjVE9ZYD/xRLPOYJkPbsdM6qjC1bM5HWKuD
	QhA==
X-Google-Smtp-Source: AGHT+IFK/ZcPw9QQ8rKy9Iz7tN9PwEqV+omG9KoBZdHVze2si2OKYWeWR6yvQPLae2+NyznTr7bIa67cCm8=
X-Received: from pfaq3.prod.google.com ([2002:a05:6a00:a883:b0:725:e76f:1445])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4308:b0:1e0:c8d9:3382
 with SMTP id adf61e73a8af0-1e5e0847084mr38655491637.45.1735232853953; Thu, 26
 Dec 2024 09:07:33 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:02 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-11-surenb@google.com>
Subject: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_start_write() is used in many places and will grow in size very soon.
It is not used in performance critical paths and uninlining it should
limit the future code size growth.
No functional changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 12 +++---------
 mm/memory.c        | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ab27de9729d8..ea4c4228b125 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -787,6 +787,8 @@ static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_l
 	return (vma->vm_lock_seq == *mm_lock_seq);
 }
 
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
+
 /*
  * Begin writing to a VMA.
  * Exclude concurrent readers under the per-VMA lock until the currently
@@ -799,15 +801,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 	if (__is_vma_write_locked(vma, &mm_lock_seq))
 		return;
 
-	down_write(&vma->vm_lock.lock);
-	/*
-	 * We should use WRITE_ONCE() here because we can have concurrent reads
-	 * from the early lockless pessimistic check in vma_start_read().
-	 * We don't really care about the correctness of that early check, but
-	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
-	 */
-	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-	up_write(&vma->vm_lock.lock);
+	__vma_start_write(vma, mm_lock_seq);
 }
 
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
diff --git a/mm/memory.c b/mm/memory.c
index d0dee2282325..236fdecd44d6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
 #endif
 
 #ifdef CONFIG_PER_VMA_LOCK
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
+{
+	down_write(&vma->vm_lock.lock);
+	/*
+	 * We should use WRITE_ONCE() here because we can have concurrent reads
+	 * from the early lockless pessimistic check in vma_start_read().
+	 * We don't really care about the correctness of that early check, but
+	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
+	 */
+	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+	up_write(&vma->vm_lock.lock);
+}
+EXPORT_SYMBOL_GPL(__vma_start_write);
+
 /*
  * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
  * stable and not isolated. If the VMA is not found or is being modified the
-- 
2.47.1.613.gc27f4b7a9f-goog

