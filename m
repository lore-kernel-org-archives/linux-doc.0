Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029C84A4E
	for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2024 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731830981; cv=none; b=uLMZSe47oykDycrM85G9gWD8ZtQWoucZRWt3uxngqKj5NQkJvwtZtJLgeGujwBwdEvMbsHBnu5Eg5FxvrpFJwgFTiq8IFaW0D988DaZmUY59HIYPAHwqPyfeeYTc6JbblQUxm+SRaY26oU8a8EYmhbcQJ2FesJqg6Njt/rt/HZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731830981; c=relaxed/simple;
	bh=8wju+b7uaLmVu0APJU3rHR7dESQZvzmF8mBUVYwqEm8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mNrksJNd1WJHxKC1zSN0+ioUR3HAj8a0nUliXediBbd/6o33NONkg33dPOd3Ej+Wv4Bt5Ef5BlGoZQ5N22V/Ru4svcbcuuMfccK0bB3lYxtTOgZSpWMFH2AJDiFcElv+X/V7iqNoY6qgON7rDzXeAW4V0a7NLwgaMcjC1kCweCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r6d2k7S2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r6d2k7S2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3886f4cee2so770678276.0
        for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2024 00:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731830979; x=1732435779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CZkyrFrgAwaR5MxHWX7P6WpGLYaVbagX6YvpJwNn5k0=;
        b=r6d2k7S2tTsh1PbLwKEuNtdpNl0tYMi40vxoL/Z8KtsAStXwQYHNqmoR5011EGS1ky
         ONqt9XXzGocuzrMD1megWm2y87fN92hWCxWGgR5T7mwZEafPp44UqFQt+AfzDcUZWsho
         zrygkwG+tcF6cGWKk+bGayPwezgMV2XoNgT2DIrP4POaMdPeK1jlMyITW5x3j0uwsPhx
         sbTEgpY/xgIPZo+GerwJJjYSbgDFDIRdFucY4AJr+Z2bw9s5P5nt3FWgFZ3UFjDeFY7e
         3qNMOjI9Z/X4drjDrk4ODk4m9i0BbFhwNX1nV2G6m38QvrNdvRNozspro0O+cdU1UV+n
         rr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731830979; x=1732435779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZkyrFrgAwaR5MxHWX7P6WpGLYaVbagX6YvpJwNn5k0=;
        b=mrin6bNo/EuUDRaEW/TC4DQRAnFE2rYU0iltPbQRIDVrTIzJ5bFmScBJ5jBrM2eQvf
         P1zvGQLNV0MZYqYR7KkhFIn6Z4Ci1Qa3ZcabZeUfgHVTgWEmA+F/x6WugeTqLE1Y/pvZ
         b5TCe2pueryBNj6T9CXqDxeuspNcjiYXJlXlRi5iXgjH2NUq6w2EkCLcUj8BoLOkHIQ7
         PHE339gePWQ5OekFK9Wj8sB1NEJKvC1dePfNjPC/zcsthf01gqxZD9AnavErqf8ctnmU
         B8Rck3aJCVM8LOqy7JzwNcD6GNwPmisPSpY7F2+n3zCaiZNFjz31RLiuWImFnvp0ZTQc
         X2oA==
X-Forwarded-Encrypted: i=1; AJvYcCWC37mZXyRqn0HHNxohUlRLOlcDhBs/cVEzTk19fy2hQJ3A7S7qlx9YfFCEKE8QAzZdptRgckt2zbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCaP3HI7U9jgFGsXTzJzwLanv9yPZ+1qIfjCjLm3EKFQcUStD
	I0FNNI3mz0zeeLrmPzfprpIN9I/Z8gpJDtDSjOS/zvCp8O5Kxw7XFzqPAWXKXLyvRB07TkZ/uSi
	58g==
X-Google-Smtp-Source: AGHT+IH7Nd8pXV7CscbKL6Oe02lMMMIInGW3q+Det1fKSUjvn9CktAIAKXjQIOt60hBNRgC9PV8ouBWRm4Y=
X-Received: from surenb-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:bafc:6633:f766:6415])
 (user=surenb job=sendgmr) by 2002:a25:9d85:0:b0:e2e:317a:d599 with SMTP id
 3f1490d57ef6-e3824ac0065mr340301276.2.1731830978836; Sun, 17 Nov 2024
 00:09:38 -0800 (PST)
Date: Sun, 17 Nov 2024 00:09:27 -0800
In-Reply-To: <20241117080931.600731-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241117080931.600731-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241117080931.600731-2-surenb@google.com>
Subject: [PATCH v3 1/5] mm: introduce vma_start_read_locked{_nested} helpers
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read. Replace direct accesses to vma->vm_lock
with these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fecd47239fa9..1ba2e480ae63 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -722,6 +722,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
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
index 60a0be33766f..87db4b32b82a 100644
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
@@ -1476,14 +1468,10 @@ static int uffd_move_lock(struct mm_struct *mm,
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
2.47.0.338.g60cca15819-goog

