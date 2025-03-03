Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA54254B0E
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019468; cv=none; b=k6QdxsMZ5Hnxw3JkWnb+yv1ZlJJGI+XeuzxJR+ybMtaKP3MRCNH0fqceF44HV1XkJduhqduSx2KQ7zng6mb4xsFRiMcMok1B7rznZk8LfSyMRQgGzoOaR5oXLZvGGS3s9GchsXGLqEmUH1Tbsq5h14NMMkZ77iID8GwSs7o41Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019468; c=relaxed/simple;
	bh=OBXpWDsR7o4dKf8NkhRON4PwL/H6iQiwplPc25GckEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usp/lN4C0UzcBp6cFGAZ5ermvUemTZUHvdA/W/BGfCTAdePt/3fTMClKb43cCbKoGVqg1vO+cR6QEDUasIaXyF6+WlIJdWvk8jPU7G41dMvN0A3HstYBkWhnkMFczhg0ZAMI1FkJ4RxVrfHAZPt6s+Zmb+eKrR0YkTkfm7og4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7huva4+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7huva4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VusPlBbKEOGpL4wS1BqoWY6CYb2f4HQ+/wIDh8p+vAo=;
	b=S7huva4+8CyDW5BYNNkYfsE38obToU+cJHkm7G3mWMWNnkscHrHdImLM6XPsQG7T2kQikd
	SGTWPl8kQB6NbytT4zOk1AA+hbLlIHTFiTVqz82hDWP4t73BRiAGKhUeOmp4C0dNxPh4uK
	NrLdtDeKCREjfgU0go+mHW3EW1cMPR8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-VDBBEX6UMt-oqMvvxzx2wQ-1; Mon, 03 Mar 2025 11:30:42 -0500
X-MC-Unique: VDBBEX6UMt-oqMvvxzx2wQ-1
X-Mimecast-MFC-AGG-ID: VDBBEX6UMt-oqMvvxzx2wQ_1741019441
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4394040fea1so22860895e9.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019441; x=1741624241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VusPlBbKEOGpL4wS1BqoWY6CYb2f4HQ+/wIDh8p+vAo=;
        b=kIjPRpaMHWz9LouKVJXOPycHAtQ3BrnkzN2f0S5LWbiuW1qefNSbhgpFhfEKPqswuq
         9/mISTZeNu+iWvni9KxKDuQDYk9mFKWE3y5TR++hN2JMsKav8mYNbhCyVTv0xcsCFddY
         2Nc6LjKwoZl4kVBGo42BBI993CCBAUMQfXx+x8V4CRMa27EkLi8+0RGJh9+gV9XOPuTZ
         snq02uYQGSXWZYWamybeT8TU/WaaUDh3ox6b+u7CNf2KecQwauBsFajkuqLeDoQo7jps
         FkjuFvJDnOW7tKipCoAhY6WQbBjw08Lg7xPV+XrejiMlklGu+28iEORKCXjwdtTcAJi6
         B6+A==
X-Gm-Message-State: AOJu0Yyc+Bqux/8TUAS+egtRiuxByAQGG2c7Ii/xbiH6+4TxpuMRDXZ5
	QGIsAYB40J6vKK/HHr5lcMoCFPs/Ifq1X/Wg8HfnySkB8NHjQUbc74D+0E3UjHgMj1FgLQd5rwl
	JkXJK7xJj3vxryJxf2zX8eT6/nHu2GtVtbVfo9lC9e0SJ254FIvHHdCcCVw==
X-Gm-Gg: ASbGncsxo1BNFaG8iWF/C/SPmEH24kHE1f63XOUjvHXbOjeB564umebrlDVED3tOSaS
	Jfm2Lxprqm8U0UAwJYVC8zoz+7X2fVtaSrwUh2uXUxOgTbeTAmDgE8Qvxc0E67HoLfi2C9TowgH
	cDtXvl7JQmcWsAWb6OfwiAuEw2TJdOFaxJcdGNcdC+ksLlHFGP8IZcUViR4TWwJa7sj9sfKDvSn
	x7H5QHZfD9k9uIG7YtZdE2gR8o1unpcojIB5c1nx/vfEgsPNzdQeF0s6b+wm0/pzBDqzCXMjDOB
	Ae1yD75jd5utokxdVdnEt5pFqCZ81tTvvSzaAjZk2Mt38FL31xDhLT59/F8e2kJTBsbFwJbkj+t
	a
X-Received: by 2002:a05:600c:26c6:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43bbb721f8fmr44417395e9.5.1741019441210;
        Mon, 03 Mar 2025 08:30:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6XV9dtRCnC9UYnKtk79gh146334CB5ZefECKJp7wi6xxTybGeqstnFZTU3vfWQysm8+TPqw==
X-Received: by 2002:a05:600c:26c6:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43bbb721f8fmr44417035e9.5.1741019440886;
        Mon, 03 Mar 2025 08:30:40 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bc1b5db02sm42954325e9.19.2025.03.03.08.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:40 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 10/20] bit_spinlock: __always_inline (un)lock functions
Date: Mon,  3 Mar 2025 17:30:03 +0100
Message-ID: <20250303163014.1128035-11-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303163014.1128035-1-david@redhat.com>
References: <20250303163014.1128035-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compiler might decide that it is a smart idea to not inline
bit_spin_lock(), primarily when a couple of functions in the same file end
up calling it. Especially when used in RMAP map/unmap code next, the
compiler sometimes decides to not inline, which is then observable in
some micro-benchmarks.

Let's simply flag all lock/unlock functions as __always_inline;
arch_test_and_set_bit_lock() and friends are already tagged like that
(but not test_and_set_bit_lock() for some reason).

If ever a problem, we could split it into a fast and a slow path, and
only force the fast path to be inlined. But there is nothing
particularly "big" here.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bit_spinlock.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index bbc4730a6505c..c0989b5b0407f 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -13,7 +13,7 @@
  * Don't use this unless you really need to: spin_lock() and spin_unlock()
  * are significantly faster.
  */
-static inline void bit_spin_lock(int bitnum, unsigned long *addr)
+static __always_inline void bit_spin_lock(int bitnum, unsigned long *addr)
 {
 	/*
 	 * Assuming the lock is uncontended, this never enters
@@ -38,7 +38,7 @@ static inline void bit_spin_lock(int bitnum, unsigned long *addr)
 /*
  * Return true if it was acquired
  */
-static inline int bit_spin_trylock(int bitnum, unsigned long *addr)
+static __always_inline int bit_spin_trylock(int bitnum, unsigned long *addr)
 {
 	preempt_disable();
 #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
@@ -54,7 +54,7 @@ static inline int bit_spin_trylock(int bitnum, unsigned long *addr)
 /*
  *  bit-based spin_unlock()
  */
-static inline void bit_spin_unlock(int bitnum, unsigned long *addr)
+static __always_inline void bit_spin_unlock(int bitnum, unsigned long *addr)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 	BUG_ON(!test_bit(bitnum, addr));
@@ -71,7 +71,7 @@ static inline void bit_spin_unlock(int bitnum, unsigned long *addr)
  *  non-atomic version, which can be used eg. if the bit lock itself is
  *  protecting the rest of the flags in the word.
  */
-static inline void __bit_spin_unlock(int bitnum, unsigned long *addr)
+static __always_inline void __bit_spin_unlock(int bitnum, unsigned long *addr)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 	BUG_ON(!test_bit(bitnum, addr));
-- 
2.48.1

