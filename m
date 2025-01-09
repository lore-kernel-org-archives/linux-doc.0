Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC018871D
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389850; cv=none; b=SeNjQeQeylYfp4qiMK6KikvdfS3K49ele8Hl2/2je3eu9rXQZfzqBJ0k3ogyioHcLz8zsRacawDDG8H7iap/iMuvhp4Js27+AwI41XMucTt/cEz5V4vMxJv2CxwyVam7WLRLSAJ5FZsc0Vso+qliztBdJCoU3WgSgwqNpnnGFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389850; c=relaxed/simple;
	bh=kpDMdaA8Wnm0en69OwGvizhVO0/tRNViItzC/WKTMDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k5GX7flq1vp6OZr+jTKsgrnBRNTJolWU3bcrbsuejKVmt8PEqzpFAzek3tBOQOfXKs6fquH+h+g8jIvrM09PgTdRj8IlCu7TfJjU/6vi2B93I8TlFadkgP2leQ/rx0X8HG+x5PDkAaUw+PksfwhWxvZqIQHgdeIsqn+HjvVa4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W/riyiUZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W/riyiUZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so822917a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389848; x=1736994648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IjUQkFQTPO2uWvItBGSJ4zf4/1EWZkyRsCZwETlqeC8=;
        b=W/riyiUZPkjOIPIyO9e0umTfMDQHRBEBqWTBIvfR728H1FHTOVtlhHsk1/4s3v+C/T
         ZFHkVkkg/zMEyx90V+e8eQxUL+4uSlSEufxMFaWCbArhT3uc+qP/EGTQu0C3o6kGGPUi
         VjxXEWCN4GsmGHiIwzLxbebP49LNOguaRFmViAl9/kLl5s0HAKVlp0ASbsavPw2qFYlm
         vlC92fzcH6qYHl1caCT26uq7jpT0CMkJ21T/yArCZ3k3g3xaylARma8xkG7p/xnnPtiB
         8atjK+0XkkIMwPzVKWRL4pWwz4tcarqumP3btP8jv50MrufbiGnrylPjzyWwG9/Izx3q
         FfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389848; x=1736994648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjUQkFQTPO2uWvItBGSJ4zf4/1EWZkyRsCZwETlqeC8=;
        b=gNUtGSHws0lnoNMdGbJC0G6PwoDkfCtytgUqeGWvD7POpKcVxMpsRYRisYw5G29dd0
         7206n/H0I3b8SRmmAScT79RAQDmn2JVWZrNXGWm/BnF0P1Gx47C/tTrpCKcx+ZqseCPl
         5ntRaj0QcwgKUolvBCfze5Z//uzz6Ld82DIwZDer47eNJn0M9/cdsyRG08IGCsmdk2zD
         GgIx49LXkYc1FXWBMSD2GIx/vim44BrIDNDMjqF8rQWpWCJkBXd12dUQv7HBwypXGpye
         ZhOF83FXSxQrSd2YlZXjGvDjA009xCrbGUm1ybA+qzP4TDa6/vJoqdIo8rSIe70e4QkH
         QjbA==
X-Forwarded-Encrypted: i=1; AJvYcCXJnUDALxt/ZPPJc28PjdNYV9f2v8Z35/FNnqK02Qyrj/a6MVOruFpd0Dba+9jsnsZz5FbfTq3QSLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqC8QFyOrOzjIErPLg7XUdsg6AiH/jDA0HMNBx2eBKUCLiN9zA
	CkULA6CdTUlUKcoliiJZX2BfCjtWMHZFl/LyrnxiDtJf7RDgWYQMtclCjOL9Z3LFFr0356KZgHT
	KLA==
X-Google-Smtp-Source: AGHT+IFjjwr5ru1uWVNvi15QsRRv5yn9aK9DytE2ceD8f/6OYw8sNNdl9g7eT88QVCpaGBCf3pVchkAXDj4=
X-Received: from pjyd4.prod.google.com ([2002:a17:90a:dfc4:b0:2ea:5fc2:b503])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c7:b0:2ee:e518:c1d8
 with SMTP id 98e67ed59e1d1-2f548f1c3f0mr7653251a91.30.1736389848454; Wed, 08
 Jan 2025 18:30:48 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:18 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-10-surenb@google.com>
Subject: [PATCH v8 09/16] mm: uninline the main body of vma_start_write()
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
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_start_write() is used in many places and will grow in size very soon.
It is not used in performance critical paths and uninlining it should
limit the future code size growth.
No functional changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 12 +++---------
 mm/memory.c        | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6e6edfd4f3d9..bc8067de41c5 100644
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
index 105b99064ce5..26569a44fb5c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6370,6 +6370,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
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

