Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC413A86C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389848; cv=none; b=NzBpfbLHQFvdwABGsQeA4S9mzgm5oEe5o0ccUfBkqrQXdqVCSoGr4Z98Pr/Bbt05D3wLwX3rxuE4o2vJLNqNbbPvickK5X7RujYnzKkEko/jIoUdL1d0oN4clkUprGpHqSHNSpFKlo+KjIvV5kTa5l6pSuDE/Y5g7epkbW4bpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389848; c=relaxed/simple;
	bh=ZCtusRX0CFLoEEKgeZ6+wWBSV3rTZgAWPuc+3VLvu1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UYNFnm+sIDlwcbuF7uxZWSABLSQxKzDioePXFDV0AfKN4S03maU4sIAY9sQKhCFXi/UJ4CdzV73I9s2kFKpO3ybdYlgzSWeobSHba2v2vNURAd1SXvCHvzYxRVTWzUgrkM8O3SyD2wZnNq7AkZf+X2TsrdxTENCegWjeyV+UdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PbWu0sxD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PbWu0sxD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so812664a91.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389846; x=1736994646; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjOxH5E6F+PRJReyBLOWVSfVgJNT1AsQeggvw/y9xao=;
        b=PbWu0sxDv7dNTwuaOKoxcG9lAIB91oZZ4EPYHnony9BDGOc4yBzJ8vadMGW7CJ7DuU
         hNZgSX5bsr4VdTQ0h6ZXic4xDKIkvQgXtIU15szz+3bKwjeyAbU1lU6SsWTATijofW71
         477TvJW1E4ctoJnxpxzr47POAo2tgn2qJf1oSp6tvUIbEhs7Tqrn40UXJ9r56+YsKvNX
         eXriu9RBKU+KxA+BgLFAJ8AvTc/U3zoOSt7nZjEn2Iws1/Sgzl+AJnjSiTdpzCtnZGSw
         Y5y6xkx6R6GB3ak+o/AD6XsedeWiA5urWtV/gPufJ3Lu3j1Nzj1WYPiKWcxD2JKe4nHd
         7OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389846; x=1736994646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjOxH5E6F+PRJReyBLOWVSfVgJNT1AsQeggvw/y9xao=;
        b=B2JqUSfo80lvP9doQZD1RTqoeogwC4JDuDDJjMgQkXSeENyQOuY20TGqI5+nXjtCgs
         yrWFoRjyKqGGmV/V6EzL2HY82mcqhCPXvPfUnXCOB3yZl7LcRWdtHSqSl9CCbm72gKzw
         ZvAaOBYYo6gcd7NqnZPLhyOaVzofdarRgXhDtclgBAykaMzx/slzSOloIFx6QHNWWsUT
         GVaFg9f3DvBLiJ2hmP5J3rcBMpp2pHxss1YK7Geu7/LE67uqKyOr4J40biSKNKfpBub4
         6RcoW3NRgOqG/Kmho6qWwTkkWd8lT7vRV7fvLAytm8//CH/OOpWcdq9VeCvNrFAPtz35
         9trw==
X-Forwarded-Encrypted: i=1; AJvYcCXBP6aVygEivzr6wGQQo2HpVAkx3pBZPUNd3uptEw+dF1vJhuiDRdkx0iYKFuSHk2Ps99zFuUQDFmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMF167Jb5QV73lAMyM4eJhtlrBIBHdmRid6ObfPFHhqeRNWTX
	eccWG54GNzPvIB5BIevWuYEEXMmoYwz0vX3g0Ydq/hGIDAn0G0lTaEiE+T+5mxzRq2lR+mKqRpq
	WSQ==
X-Google-Smtp-Source: AGHT+IHADv1eWMN6DWgWw8q0R38itFS4KVDDVQ6L3paem0ou1tKWUJt5aWqFRQtQ6rnHlKZNXiGFJ2Bl2n0=
X-Received: from pfxa8.prod.google.com ([2002:a05:6a00:1d08:b0:725:e46a:4fdd])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac2:b0:725:e1de:c0bf
 with SMTP id d2e1a72fcca58-72d21f2dcbcmr6756667b3a.9.1736389846286; Wed, 08
 Jan 2025 18:30:46 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:17 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-9-surenb@google.com>
Subject: [PATCH v8 08/16] mm: move mmap_init_lock() out of the header file
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

mmap_init_lock() is used only from mm_init() in fork.c, therefore it does
not have to reside in the header file. This move lets us avoid including
additional headers in mmap_lock.h later, when mmap_init_lock() needs to
initialize rcuwait object.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mmap_lock.h | 6 ------
 kernel/fork.c             | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 45a21faa3ff6..4706c6769902 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -122,12 +122,6 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
-static inline void mmap_init_lock(struct mm_struct *mm)
-{
-	init_rwsem(&mm->mmap_lock);
-	mm_lock_seqcount_init(mm);
-}
-
 static inline void mmap_write_lock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_start_locking(mm, true);
diff --git a/kernel/fork.c b/kernel/fork.c
index f2f9e7b427ad..d4c75428ccaf 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1219,6 +1219,12 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
 #endif
 }
 
+static inline void mmap_init_lock(struct mm_struct *mm)
+{
+	init_rwsem(&mm->mmap_lock);
+	mm_lock_seqcount_init(mm);
+}
+
 static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	struct user_namespace *user_ns)
 {
-- 
2.47.1.613.gc27f4b7a9f-goog

