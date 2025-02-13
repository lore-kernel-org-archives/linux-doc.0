Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BB274274
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486840; cv=none; b=gMa1tz59UZmwwPz4Wu2O/oJt6PRywHcJ1AnlpcOYlp2p/tmYk2qUlMvMJuNHJikJbvsC0l9IEkp2CgwpgbrAlV0AqXK0iDesj+F9141mm7SsXjeRwckDExQS59PUxapiZWQ2/J4zAkn9pIP8tAKIy5qRdiNZXHF45QifSXKZij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486840; c=relaxed/simple;
	bh=Y4hMd1vQU5kJmXf3djw5SF9D6KSEwo+wW27aKEsq5PI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q2t1m2Ka39NOSoTHTJ0SqFjXhmfEtBLzaoRbHQMGlb++SUR2aWulmpJYmV8QYMIccnizHRu5ZiXCNaH/NV9MZOaBWU2qAPDHnljeZVMuVT4fEGcNumvn2a90sU6aVWhdBLziqN50wIQxPcKw4Tal+kZDCrskt2Toy6R4g4MrE94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+5+IuDc; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+5+IuDc"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f816a85facso2988884a91.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486838; x=1740091638; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNoCxF31vK1w52ANaPw+siaL/yNI9CD2wHk/1nIOSYo=;
        b=g+5+IuDcL2JDSdwxIS2lyLPKLwz9qSKJ6G/fDejQTqxKb552in/KKjFqBX3Z10WUEI
         RljhEmJxkdxAskjo+LHrrhI0SkX1lcPRyAyua/e58b6+JPHhlUQ0PZx1UAZhc011o4OQ
         Y4TPF7Vmnlxa0NsHrBtjwHrRKsnrfYJtOQzyIFPQ/ZDhQ1hPnBMq4LqXCuXRhzUmFA1+
         JavTXxwF/3vHOkxQJ7VGH3VazWShFib2S16v4ZbEXxNXkTKaEfKnz5cvp2W9l2rkkw+h
         pdyih6g/Tw6PRKAhMXKX0YLm4HXq3EfMa22yjK67KMhH6mxSkwxUN2Ak1ZhUDtduNByD
         56Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486838; x=1740091638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNoCxF31vK1w52ANaPw+siaL/yNI9CD2wHk/1nIOSYo=;
        b=IN+u1lcc+vdCaaCjsJUK1tRmjwSIkba8Z0TlY+PpVbhgjp8vB/Jj6LRqlxcslCBuYw
         eNtGIUudtUfGinOA3T0RP3R0uwxpvSo68R1r0F5GGV3qoJZS4/uP5sTNLOKS+2rAl+/L
         Ewp5FsAGwNfKQPaflhKedGra5oWjZSj1b8oNBiWT91zLEKGUvpqvjQ5oD5wp/JrAHKQy
         SSpjyaQXKLJPeZ/VEAHAVl8AgyZHsTBkSeX4XX4NcE4yyXRI0+2dtHOOizpkK7gAoG5G
         Xj8tJvasfXEvcbTuFm/mkBUqODaVTJiGmjh0edFLAbjp0H+9xz0TRCViTyz1zGvd+32K
         9Jrw==
X-Forwarded-Encrypted: i=1; AJvYcCUBLSP2jC2MIt0hopgpN43v6uADML/9sZJU2CcIrGUCY3lVBa+ylLHvJD/58+jEkBe2J1grb/C1/3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUtT4BWzYzxtksmoXCq2gQvZU3KulCh4R/9493K72RmWNH1UA
	QUVosoyu5iPW3WEzouA1KuyzKoLVvj7PH5OfYf24Q3ZYiGQ8iqsVl2AiCrITsqJcMp0dS9N4+ec
	8UA==
X-Google-Smtp-Source: AGHT+IErQJcr8UIFZH8RFb6dXrkV59J3DVPaTleZ6Gt1R/Rh5Le0xTpOCinKGJEwYZoy9GO+2bPedgwmiK8=
X-Received: from pjm4.prod.google.com ([2002:a17:90b:2fc4:b0:2ea:5613:4d5d])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54c4:b0:2ee:ab29:1a65
 with SMTP id 98e67ed59e1d1-2fbf5bc07e4mr13915594a91.4.1739486838053; Thu, 13
 Feb 2025 14:47:18 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:46 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-10-surenb@google.com>
Subject: [PATCH v10 09/18] mm: uninline the main body of vma_start_write()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
Changes since v9 [1]:
- Add Reviewed-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20250111042604.3230628-10-surenb@google.com/

 include/linux/mm.h | 12 +++---------
 mm/memory.c        | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7fa7c39162fd..557d66e187ff 100644
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
index e600a5ff3c7a..3d9c5141193f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6393,6 +6393,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
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
2.48.1.601.g30ceb7b040-goog

