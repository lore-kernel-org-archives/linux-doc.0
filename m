Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A9211A28
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893527; cv=none; b=nPTyBmp7Ld6F5i2oZDa/mWioSfQH1izvYoTsO31bCtH90hKanJsHnaK/ZJVAzOVavSJZxPomOSofUrHLqxp8i9V6gdhOpaiw1YW0GGiwJgLJtxgjzGfDS7iS0qoeJWjQuE2ZFi7aUkWBgMKAbErjaJ+XmFTTUbnEQDtrckctm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893527; c=relaxed/simple;
	bh=f+GDZMWDZJ+VR9AGii24ODCbYkbiXkpxGsAaLIJVFdg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyX+GLQ0lxdph07LqDDtkC/hwrydOrJdwABz59EKBwqAj1vkaStxatleFWGzBlIZVtlNoo/QhJgcEpjDciVY3R6MP6/LKlzJcO9wXxVZeSsNb2IRlK5Jz51NFwuEQ4EXGqA6c1zfhBaxgIYF1cEJseOlsJzB/a4X0SYJkCLGRPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=VxWLPP8s; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="VxWLPP8s"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8259b783f6so264959276.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893525; x=1751498325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inB1PU3JWa0vbtTol7UPnIAGavYFixpKMP3Mnwcd84A=;
        b=VxWLPP8sdoTqx1NZa+ByQnknb19kCXNJc4kTPASmEGQM14/7IXnhVO9f18/4xNfefP
         QZddIfROvU2MphkpTgwoBEcd2kNeO9Dhv7WT7xF4M2hBlbXhWDdkYpO4QaiTPpFGm2xM
         tYHh+DF5DTv10A22NQ8DzI+365/RBXspAo+Uygo9VjGYCtXRYTGbd4kGCU+2WX9DDUvq
         g2pDlhY/TdfTCGZVy2PegTcp1vVwrlVUyrXYHzFknl0iM1RJWUVBYYXeHnu5F3feqrVL
         fZPN2DnwYsX3hL4MAcjiMA2a2k1cvBHUWB5rWV1KWKSbrB7xaIQPuEs5+BYfaaYY9DTB
         cXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893525; x=1751498325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inB1PU3JWa0vbtTol7UPnIAGavYFixpKMP3Mnwcd84A=;
        b=gHuDUKL6yqWBGrdcKCSWEl2F7TYF0UUHYOxrJSJLCP9k5qMZnGENZbvZfViSHaGRZO
         yP9nGpGmHpvqWDMOxgchB2d2ZOWjEYD8jE3lU8edVmlE/timHwZWhmC9LJQqD/ahHqjD
         fBHHAF++a2ki0iamMr4iZk0PmScpxlS2295AfPaZzq9RSY58Bio5XkKNmc3PijG5hMgL
         hVh5xDPxBBp+jV5LxcqclUpojndbCmGqMgR4bcMt0lmtHG+92TnRp8IXyCWNyuqZcr9Y
         /S0WZx1Rs3PZtdBIcgIMgY1eQaGGJ65sBNeXeSv97WZpe0+5cXMrK9r1h+Vwyj1+krZc
         Jg5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdeCIkW9JstH5bDwRPeS5FSUksGcizqZKQXXpdDB2BbYhWA9xxCciVGoWGvxolxhFeqlu2+OOGoWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbgEu1Y+9+m/vK1cBEqw4NmjL2M9Hevg/VzLQ1Tks232XFxF1
	dS/sdFqIlEVj8qzuwOBt3AzpbtCc/nzhpPRUJvOFI2jB3oS/ZPM75OO3YMT4UztRtUw=
X-Gm-Gg: ASbGncuGrNjLVl4HckitiMdus9cwkwUkOupLe8laQjxH/dqzpBuNjNaDhI7/LdHFLi+
	dIXM4zCEW03tarMFzbIodHMcnJTXC9qGKT/6QzvENI28vBjHgXzUnreKK6+Zs7NLGmKnmW/tSxP
	mxxVgt304BZiJ9rnQanf44Dq+ViBqQUNUO3+xce9uhWtwTylfArDhv4KrXEaUrcTaxDov+P4b6d
	1dtVAQJrmWwxhEhMCk0Vup53ULAYXt+i/0qLu4aNbxE79TczBkHx5cPlmkEEx2Mj6jOQ8zZ4XoY
	age1Kh2zsxzCFGmB7RN2utTlxpCYHiN6AACJbmmxxAHpH4AQ2I6RH9IQ9f7j+yUzCI7OAQY6S+i
	dNZMGb/6kv34i2OYWd5JzmZTqjoOliy4kSm3u0KNb/tskSgb+GCW6mDOkjjMlomM=
X-Google-Smtp-Source: AGHT+IHRsJtLlwzyJUd/Ox/O3krs7IL9puzl8GoqWoWuzYibrteq8e0xpTf2XL0zflmCtIomZsxpVQ==
X-Received: by 2002:a05:6902:10cf:b0:e81:e333:fc38 with SMTP id 3f1490d57ef6-e8601762c25mr6548852276.19.1750893525010;
        Wed, 25 Jun 2025 16:18:45 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:18:44 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 01/32] kho: init new_physxa->phys_bits to fix lockdep
Date: Wed, 25 Jun 2025 23:17:48 +0000
Message-ID: <20250625231838.1897085-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep shows the following warning:

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.

[<ffffffff810133a6>] dump_stack_lvl+0x66/0xa0
[<ffffffff8136012c>] assign_lock_key+0x10c/0x120
[<ffffffff81358bb4>] register_lock_class+0xf4/0x2f0
[<ffffffff813597ff>] __lock_acquire+0x7f/0x2c40
[<ffffffff81360cb0>] ? __pfx_hlock_conflict+0x10/0x10
[<ffffffff811707be>] ? native_flush_tlb_global+0x8e/0xa0
[<ffffffff8117096e>] ? __flush_tlb_all+0x4e/0xa0
[<ffffffff81172fc2>] ? __kernel_map_pages+0x112/0x140
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff81359556>] lock_acquire+0xe6/0x280
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff8100b9e0>] _raw_spin_lock+0x30/0x40
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff813ec327>] xa_load_or_alloc+0x67/0xe0
[<ffffffff813eb4c0>] kho_preserve_folio+0x90/0x100
[<ffffffff813ebb7f>] __kho_finalize+0xcf/0x400
[<ffffffff813ebef4>] kho_finalize+0x34/0x70

This is becase xa has its own lock, that is not initialized in
xa_load_or_alloc.

Modifiy __kho_preserve_order(), to properly call
xa_init(&new_physxa->phys_bits);

Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation")
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 5a21dbe17950..1ff6b242f98c 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -144,14 +144,35 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
 				unsigned int order)
 {
 	struct kho_mem_phys_bits *bits;
-	struct kho_mem_phys *physxa;
+	struct kho_mem_phys *physxa, *new_physxa;
 	const unsigned long pfn_high = pfn >> order;
 
 	might_sleep();
 
-	physxa = xa_load_or_alloc(&track->orders, order, sizeof(*physxa));
-	if (IS_ERR(physxa))
-		return PTR_ERR(physxa);
+	physxa = xa_load(&track->orders, order);
+	if (!physxa) {
+		new_physxa = kzalloc(sizeof(*physxa), GFP_KERNEL);
+		if (!new_physxa)
+			return -ENOMEM;
+
+		xa_init(&new_physxa->phys_bits);
+		physxa = xa_cmpxchg(&track->orders, order, NULL, new_physxa,
+				    GFP_KERNEL);
+		if (xa_is_err(physxa)) {
+			int err_ret = xa_err(physxa);
+
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+
+			return err_ret;
+		}
+		if (physxa) {
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+		} else {
+			physxa = new_physxa;
+		}
+	}
 
 	bits = xa_load_or_alloc(&physxa->phys_bits, pfn_high / PRESERVE_BITS,
 				sizeof(*bits));
-- 
2.50.0.727.gbf7dc18ff4-goog

