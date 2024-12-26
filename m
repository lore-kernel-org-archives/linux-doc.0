Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE0F1494A5
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232852; cv=none; b=KaRxO9DzReUd50fYuFRKo8FzHXP2EnHZv7s2dLdjl5rdNr3kaiqo6ZTHrOHgJXlIarh4YA8EGfzxWo0+JOqTmyhsvf+uX1zka++d0TzU9d0aQpELoTpvNYNxWT+Gi4qVTc+07F7pT8P673z77G9X0lIk0vLvoFSvodeoao/MTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232852; c=relaxed/simple;
	bh=7e8BADgSS/eI3b4iWIZ0Vev97Rzzh61LrDXN/gVavY4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LFKnpSuqz1NIAMqKn5KXGfPpf8JoFdAJdyvyGl4dDKORcpbjC8yVpcxFMjW4v8F0YGvjnqvRayV4FHkabVBXB1ALItMVQ0i0LILxSTsz/nQN7Yjk54z/UjxxEB44CwHC+e6XkBEl86o9NTddEVeerOnIwojHsw8EnMynTieo+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QuaRa0qT; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QuaRa0qT"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2162f80040aso75877105ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232850; x=1735837650; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqq50JvZ531gII06X2js4uIjNkeT7syCyMdKPeFhteI=;
        b=QuaRa0qT4etm+sFBA6ezx4cwSUGZpTQusYuRn66OSuWRWWvQQsUdZQN8zy3ArQ3UHw
         fc3YYrHntsQY5tMdKT9CTqTeUetaLetgrInjQgUad1aCW/tQS3EJrow2rS6Ef0cdUsYX
         dx86Yo8S9yHmzRwWuvbK3uOVKgsqNbPNn+Msh61aLSeFXRWgY/tP8ZFR9AzAmm7Zze14
         J9/Ue0FGpf88YbwhprpBNo5EN/VR7XsLdDq4yvekA4PeGvBemQoMrDIxORMWTfHJuxzH
         6D9e40mzJ8tgDplZx0zjqy6utvgS1QdeBOst/XorTBsiJ8HRnIdfFy3ocJaNMlkLMARA
         vLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232850; x=1735837650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqq50JvZ531gII06X2js4uIjNkeT7syCyMdKPeFhteI=;
        b=cklf5exFNxP9idk8PLi3m1yfIy12qQyNLRRDkrpEdd7odZaQj1zdCLts2DBAu1WyOB
         TAZvykRpvpk2if/Vqp4k7YYp3a2TJIZFGqLuoqdFhPOEpnakV/FpjCuJYFF1wI/PBfaI
         zYAXu+g/L69l6q6gxtXg9vFQXEUY05nQW9SwFlDC1Cg7tUqE76ZEo4XYexW0APdmxP08
         J14bRxKeZPTTXEOXhXilPqnthVrdhjvULTif1Ea652Cl4MKJOMZMsQv4jCAf7y2YYioc
         HVFvYduovJHly3URHJaxciJ0VIgoD/440kdmrS/qXvs8zj+eqq0xraBpzUSSs1tRpx6h
         3zsg==
X-Forwarded-Encrypted: i=1; AJvYcCVbbwz8Jjk4atb8peBafTDyCe6w+GA5mMXgDNKt3bJ5I8qW5rPZ+KAGzj/ZZ3lLYGgY3xlyFnwg1dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqbdMxLOf/pp1OBzzh4hgrZGjAdTwJWb/uLGfMIoJIVgvcCnfD
	Kg3/z2fOFNTwPx7zPfiv34yTBAej7eeildjxdn2W7nw+y9XCzMHmIjG37Q9ZxpsSx5inA5wsjNY
	OTA==
X-Google-Smtp-Source: AGHT+IFQ/9ir9mO2gzhzka3p88zGCJjxZamQMl1FNnXg5zmv9rf3CH9hBVzxn6/eqqjJbIU25WLMpAjn/FY=
X-Received: from pfbbe9.prod.google.com ([2002:a05:6a00:1f09:b0:725:936f:c305])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6f0b:b0:725:b4f7:378e
 with SMTP id d2e1a72fcca58-72abdbe0cb5mr31015210b3a.0.1735232849837; Thu, 26
 Dec 2024 09:07:29 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:00 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-9-surenb@google.com>
Subject: [PATCH v7 08/17] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
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

With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
possibility of vma_start_read_locked/vma_start_read_locked_nested failing
due to refcount overflow. Prepare for such possibility by changing these
APIs and adjusting their users.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
---
 include/linux/mm.h |  6 ++++--
 mm/userfaultfd.c   | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c50edfedd99d..ab27de9729d8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
  * not be used in such cases because it might fail due to mm_lock_seq overflow.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  */
-static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
 {
 	mmap_assert_locked(vma->vm_mm);
 	down_read_nested(&vma->vm_lock.lock, subclass);
+	return true;
 }
 
 /*
@@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int
  * not be used in such cases because it might fail due to mm_lock_seq overflow.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  */
-static inline void vma_start_read_locked(struct vm_area_struct *vma)
+static inline bool vma_start_read_locked(struct vm_area_struct *vma)
 {
 	mmap_assert_locked(vma->vm_mm);
 	down_read(&vma->vm_lock.lock);
+	return true;
 }
 
 static inline void vma_end_read(struct vm_area_struct *vma)
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 4527c385935b..38207d8be205 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	vma = find_vma_and_prepare_anon(mm, address);
 	if (!IS_ERR(vma))
-		vma_start_read_locked(vma);
+		if (!vma_start_read_locked(vma))
+			vma = ERR_PTR(-EAGAIN);
 
 	mmap_read_unlock(mm);
 	return vma;
@@ -1483,10 +1484,16 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		vma_start_read_locked(*dst_vmap);
-		if (*dst_vmap != *src_vmap)
-			vma_start_read_locked_nested(*src_vmap,
-						SINGLE_DEPTH_NESTING);
+		if (vma_start_read_locked(*dst_vmap)) {
+			if (*dst_vmap != *src_vmap) {
+				if (!vma_start_read_locked_nested(*src_vmap,
+							SINGLE_DEPTH_NESTING)) {
+					vma_end_read(*dst_vmap);
+					err = -EAGAIN;
+				}
+			}
+		} else
+			err = -EAGAIN;
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.1.613.gc27f4b7a9f-goog

