Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505515381A
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569572; cv=none; b=ETfZroatrnVX+rCdQ++p1IeGL/mExVG1PZhaeyLaM4eLEdmYfv+fmsB1HPOKBqpgGhJ32yZbgAtQwXLPfaSIzahXC0FMxjWffHsjxpTvUzcGnso6zs6yzBLi3EcyTWkzpJjEtDD4mmEbbh7Wo9dOrzkLJo8WPr6oNhGdSgQn4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569572; c=relaxed/simple;
	bh=IFsUotKGGDHGRLDCO6jSjVbD3ipjnlQzpmOBsgKaW2o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oTXeN8O1ObKovBG54umzpYHOBfoC6TZwGt8K9hg3qsNdom8Hzz3wbLsBOIUvXECTuhavRg2PUQE4+Q4ckKqKbVlpEF2LZ/nm+8fddSVXsaBao3BKZOw4qOW0LneUx5XxXe32uc7q+YOLKcwL427UKojvPBNwTSsbJCgwxM4yGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxiBbuFp; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxiBbuFp"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163c2f32fdso69607105ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569570; x=1737174370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1I/dUK+s3BXYUQU4Ou354w8mERlKGBrfGL48eT2fYzA=;
        b=FxiBbuFphGae2TX5ZR2zxf1WMGHvtZ0ygAK+Yjntpr/rkxip7vWALfzPyIisx7Q24a
         VTq8e7WZPihrlYr3ZrcFCSelCIBZJd0SppLaufUHvp+wEnlncudqWJDdaIU+fQIq7sUO
         hC9c2rwxOsvyF+JPsyTG3+7ZfVeB6Iktm0ao9qGbVrGg96kWEgtJ1sGM9p+Ii50FXbhv
         bAiwLwa/hkKL2ulHR5i8y4sTFeVqW4EOpo2OUHqfxLCcxRvVPKcaCa5N8UKk4h5GLSMW
         w6y4yYgQINX8HxT6cE7GDGTa3luEDvZSesnIpTt8xl2EpqN9sdNUwnrGFe9Ggk/IMp+D
         nwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569570; x=1737174370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1I/dUK+s3BXYUQU4Ou354w8mERlKGBrfGL48eT2fYzA=;
        b=g6FY9hKLJ74utnC0rfNuwkb7EtA0se52uAY6aA7HTohqoZsfRDVtkBSBke01Cfo9Rg
         uvxDXB9Z2q7dtkhy3doxGNJ6TzXHj90Lpx+kvE4Cao1M321D9Q1BFo7h5fQhJJ5n8l9w
         We5qlPjfgXLg6cTu7WUtqiPSfJAg+D5iG7LxJxkthIXLI1vL789iFq2P90BRiAztfPMB
         VeB4anRx48RBa8lc1No3X6ucLA1933wupx7/0oCYZ2/fPt9FNuylju40mw6hSnxRw1cG
         Ii4RHly0XxgrItmuF3FoQNVo9MUr5+tW2QW/ovq28rgCekqOrySoiJcZRV29c2ZBc7E6
         QrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7LCb/a1ysQecPUu7c7OfDDyGRBxJAYk7H3iMjHUFetgdTqOcwsnFVY3Uyv3KSkYr5e5rxr8sXQ9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWlZq/5IaqKyLjSZp/69/AnnfDYbVaVWd1AbgeqcrNWHPzA6X
	nMr+GzFU7S18lonmW4GrHheizY+F9Kku2Xd1ZppXfT7vB2YiEHsVpot2lPLakZEqmUhJ5GXhAPX
	djQ==
X-Google-Smtp-Source: AGHT+IH+ZTrdGgYL0EsT9nxpjvST8Wb4PiTOAlOCLTZpVYAikP8aBq9n9KO+/zLUPpIwa+3cew7Rdi532wM=
X-Received: from plrf18.prod.google.com ([2002:a17:902:ab92:b0:216:61ba:610])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d58a:b0:216:6c77:7bbb
 with SMTP id d9443c01a7336-21a83f573ccmr189000015ad.17.1736569570248; Fri, 10
 Jan 2025 20:26:10 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:48 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-2-surenb@google.com>
Subject: [PATCH v9 01/17] mm: introduce vma_start_read_locked{_nested} helpers
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
	kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read.  Replace direct accesses to vma->vm_lock with
these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8483e09aeb2c..1c0250c187f6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -735,6 +735,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	return true;
 }
 
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read_nested(&vma->vm_lock->lock, subclass);
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked(struct vm_area_struct *vma)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read(&vma->vm_lock->lock);
+}
+
 static inline void vma_end_read(struct vm_area_struct *vma)
 {
 	rcu_read_lock(); /* keeps vma alive till the end of up_read */
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index af3dfc3633db..4527c385935b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -84,16 +84,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
 
 	mmap_read_lock(mm);
 	vma = find_vma_and_prepare_anon(mm, address);
-	if (!IS_ERR(vma)) {
-		/*
-		 * We cannot use vma_start_read() as it may fail due to
-		 * false locked (see comment in vma_start_read()). We
-		 * can avoid that by directly locking vm_lock under
-		 * mmap_lock, which guarantees that nobody can lock the
-		 * vma for write (vma_start_write()) under us.
-		 */
-		down_read(&vma->vm_lock->lock);
-	}
+	if (!IS_ERR(vma))
+		vma_start_read_locked(vma);
 
 	mmap_read_unlock(mm);
 	return vma;
@@ -1491,14 +1483,10 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		/*
-		 * See comment in uffd_lock_vma() as to why not using
-		 * vma_start_read() here.
-		 */
-		down_read(&(*dst_vmap)->vm_lock->lock);
+		vma_start_read_locked(*dst_vmap);
 		if (*dst_vmap != *src_vmap)
-			down_read_nested(&(*src_vmap)->vm_lock->lock,
-					 SINGLE_DEPTH_NESTING);
+			vma_start_read_locked_nested(*src_vmap,
+						SINGLE_DEPTH_NESTING);
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.1.613.gc27f4b7a9f-goog

