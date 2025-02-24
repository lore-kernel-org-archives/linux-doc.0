Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEA266B47
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416192; cv=none; b=m/8RyyF4yuk7ueC82/AD5imdtzKWIXGvPdqxTo5eBmiK+K94fIh+/90kNtnfixH/DdDHqlQvjLxrk4UPJwGk6yUIv9SwkxgntF0XYY9jjDr/C9jDtDoZEAPZF8bQBjBYml/izoOxKaqCBMzj9us2c9n8FjG31byRVfY7NflXVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416192; c=relaxed/simple;
	bh=OBXpWDsR7o4dKf8NkhRON4PwL/H6iQiwplPc25GckEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsYTxZ+kVZ/wA1DhdE3QUmT1romVOCdr0hwb6MUmaIDn1CFdMNh5fukVrj4B8RUdEU5mUGK1pQOKEBJoQjdYzhjBkfFl5gfAy26PoHtLZO104HgZ1i0HI7iWGUPuY2NMSoOnz6Y8o0WASfSOaERVSZBJJBztcev5LSSwagG4dfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GXSIAcDw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GXSIAcDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VusPlBbKEOGpL4wS1BqoWY6CYb2f4HQ+/wIDh8p+vAo=;
	b=GXSIAcDwufAWg0YwVWCfMZiIy83ilr2g1jbMeBNqunZoCZT1v8vMm9a900zGlqzaqjp7FU
	aUuB8pP8/FVzp9VoHHh6y6pgmArEiutiuD9MFakCNsJ/RVb/zKVIUEvDJc44C0/+MtwEs7
	s82O6p+Usyu5W2foCj12MZ3EALznRcM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-lTMeSkxiOGmMstiYQOciPg-1; Mon, 24 Feb 2025 11:56:27 -0500
X-MC-Unique: lTMeSkxiOGmMstiYQOciPg-1
X-Mimecast-MFC-AGG-ID: lTMeSkxiOGmMstiYQOciPg_1740416186
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4398a60b61fso23729555e9.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416186; x=1741020986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VusPlBbKEOGpL4wS1BqoWY6CYb2f4HQ+/wIDh8p+vAo=;
        b=liC6EzBQMcGL3QhvWEGYLWU/01b4/SIIaY4q5WKEUhi5zRxizr3QqvDzN0XkLHeLRR
         c6WuajLuiJvVgnog+YwPTrIaopcaQoOGbXvHr71Z1lqt4fwljUEzLcrFKNChqrsO9pVs
         vkUpe7p7G9meGr0N9PsGP5UiG5oMNYqSTYCedcrieWWUEZ0Vn5ltqye/XiozVj1/d1Ey
         cazK4000B3+Zx2kg2HvaxorGGJbnJlfJn6OrDQxVTm3BVeedlSmIVj7QVcDyu5HAone/
         9sTstyJz3qgZaCUOKg23J013tViFVUCjcMLGaVY2x7QW37oIRxsAghaIrBt0md2tOdZ4
         DXfQ==
X-Gm-Message-State: AOJu0YzKZIH/Oc00pegAZ4t5Z0the0ESCXUum6O0sGA8N96/GSw6FOe4
	fg2S7q8ujrCoiC0LuKS/ktmY9jT1pU3EGcCtUCvPdolhAXm6Sg0qX/NPJkGnzd/kRyz5iOuryAx
	Uk3gS4cK56tpk/R4te253MK7jxrOunm/uPG6XQaLI8uyMJ5CWzQI1e8aP1g==
X-Gm-Gg: ASbGncvS0PjUKZf7DARILxY94MYQb2SVVSGeV2EMJeHP+cWZMa6OQVUhl8F85LaDuhe
	bUwUD9B4/srGTH/2Ftw2eezS6uO1dKS+jA+GfKPeR1Rsx8kx2zrDm7x6QRfkId2fWeJYqsJ/fjf
	Y846Cf0LwFKp68Yt31GATGLT4zn/anXU+mmmBSk+GqzuBOLsQALvHJuS6NzT8fr5pvAm118raYr
	lo/pDbRhPwteyGwoosSop1f1jUbx5QMp+8gTYv33GXo8FE9PoKtrhuwp/vbz99Qd/rWwEswoLJv
	E5J1ATDL0x61y9/jrwwt/in4Gxdh4lOX3XHMmVbNXg==
X-Received: by 2002:a05:600c:4f43:b0:439:9828:c425 with SMTP id 5b1f17b1804b1-43ab0f2db61mr336845e9.7.1740416186373;
        Mon, 24 Feb 2025 08:56:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWfaIC9jLsYbcLXi3Fdeg1qCi0/sJNUC8bLA+3qaJ5mWtkIjQvv3YtNjkQQj/btQBGxQxPlw==
X-Received: by 2002:a05:600c:4f43:b0:439:9828:c425 with SMTP id 5b1f17b1804b1-43ab0f2db61mr336445e9.7.1740416185910;
        Mon, 24 Feb 2025 08:56:25 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439b030b347sm111391345e9.26.2025.02.24.08.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:25 -0800 (PST)
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
Subject: [PATCH v2 10/20] bit_spinlock: __always_inline (un)lock functions
Date: Mon, 24 Feb 2025 17:55:52 +0100
Message-ID: <20250224165603.1434404-11-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224165603.1434404-1-david@redhat.com>
References: <20250224165603.1434404-1-david@redhat.com>
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

