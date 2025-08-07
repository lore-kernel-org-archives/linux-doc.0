Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018223AB81
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531132; cv=none; b=Tec1x+WEQppGAY0JP4XnEhOu/S5XxErHcoYxgT/6YWyD/JvVnSnfeSjFDoWvcbeLVwq2rGsAOctRhxMr3VzAlb10gkpvqCLsAoIuPTJQXm3S+EsvRaFd29EDwj9ycNNBuseKzHpH0AEsOH+rubH6VzoIJsxaxyhCF6BRJ/EQExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531132; c=relaxed/simple;
	bh=alpPo77l/7pgZG8VakBmdAb8i5nQRPDoWfvaWJcTLlE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXV1IvrYkqn6hhiGHW7Uq/zQdrg5qVaFC3kSV5YvdDwQA10dRx1aCnZhx9cG+pQf8V+FbXV0T3Hqn0MiH6iqPAfUwUPw/hV2O3ux1taq5nbL5gEOpKdBGYX7jwWVry70Yyc8+QF1i/CwC8gxMWhese4fL7PBZl9ESyEeoKB1jFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Ssc+rCxL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Ssc+rCxL"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70756dc2c00so7504866d6.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531127; x=1755135927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQny4bvpzR8mZbBN1/IVSyxQ9U+JDItGyGw2v+12Jn8=;
        b=Ssc+rCxL+/PekNC5vdpImp4eezZQQXUkesj3lXT7/LRqLT5EuydORJWfACh5Cn2cIY
         YBcBm306eWtSCd6DMYtn8CAx4zwsq1WD/ZSlEakuZyk0n/qkn4VIfvmlDDoKdqDckvxE
         Lh0QJtZiZl2GNLax0IITljlWdsRn20FcbKc0EBpqeTJldwIl59uNYW8QL9Dl+sFrrGkz
         j10+/4VMwzmnNppVZw/zQs9Lgx+ocFg7fbqf7ZozcMRQHeIyHquf6szREDwAALh+8kqG
         /HzRidnV0987oBRaJS5VxBh7mjGKe9LUp/SFKGa27PKa+SyW+BmUghIMRcBnmlx14Hjd
         YeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531127; x=1755135927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQny4bvpzR8mZbBN1/IVSyxQ9U+JDItGyGw2v+12Jn8=;
        b=Tl8xBYfuExHWKotmeW7YnzBQtGMvguEOmsNosKcYHBCfs2AuMqnLJ0JkRQ7DuFK+nq
         OcOcc/10U27p5HrAF4yB8XZCwidXHrz8g4CMafjDd4mp6WsTcAQxEbeciUQAtf8hyMLB
         ecYnL4Uy3RFJsi7pCXQb0IpV10n8yr1s5IPNam7zgXygozlAZVo5qZ2thQWkd4Et35dF
         nhh0VGFROEYv/cLHIKaWfGo/9CIs4bsR++rOOqlGbTKjVqGT3TmIrT1I2rS/LDJId3rA
         cv3DOyITNobLpZmw3maG+f4OxZIrRdJ0XswQg3btcojwRmNqXxQaYstKBZslYrI+nbg+
         WwlA==
X-Forwarded-Encrypted: i=1; AJvYcCUnTDu/usl8gRzm9fBvM3I9pOTQDTZEpZS9HyptieJO3pWdknBJLOk0pEOv4TzUfEXYW3P2XmzWJ/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOM2NJoCk4o9MVY+mCPfqCJOFoX+1ZEhDULWLjGyzvhtu4iHK
	UrzM3z8/+6NHxMmDL+Y3N61Qr0jaG0QO7AlvsZQqGICVGse7y5pbfZyMrzj9Tz+00es=
X-Gm-Gg: ASbGnctoPGVq2XqueMaRl8/tQT9JCrIZrTFzR5Tdo3FrrrUrnQJ8Sdz82Y/BKixQqXk
	5A/c6vsA0a28iJu6JjABEW77X6aEN2YxmZsBPdSZ1RDllAYeMJEtkSihfPNXEqrVzuGVU6txa4m
	JeLXfKF0YNw4Kec75sIiMiveGs5yepEt8ikDGRc7zPz1DNPW4eC2rmNdtoNjHyqguASra9T5i5h
	aizzFrCxuNyLQIVcnOzE3TZE3YyGyMBI5Qoi4MCyIa3PaR8tpcGOdx5QhX0pXAy9QrzKZZMRAlX
	gRoUF7YXW36/HabGRgP+wqNRIkqLnk/toybAupRLr6jajPnaFe/W6C3KJ/IYkh1kpSQk2HDlemA
	AiKFBxAK/zeGAXgFeEEkukVXN0WnqBREMlVUMPdO+1IFeb6p5EO+2neaziM6PnUh43E9Pjuh8Jj
	hF3NM7/uxdBeSD
X-Google-Smtp-Source: AGHT+IFqMT0HUt9lre9uw9F3rpS7vpTxQLIi22l4S1gL4FMPIdcVTcCnIgm3Am+TvXdeRU0xrWJBwQ==
X-Received: by 2002:ad4:5761:0:b0:707:5694:89e4 with SMTP id 6a1803df08f44-709796c75b1mr72234786d6.47.1754531126973;
        Wed, 06 Aug 2025 18:45:26 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:26 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v3 27/30] mm: shmem: allow freezing inode mapping
Date: Thu,  7 Aug 2025 01:44:33 +0000
Message-ID: <20250807014442.3829950-28-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

To prepare a shmem inode for live update via the Live Update
Orchestrator (LUO), its index -> folio mappings must be serialized. Once
the mappings are serialized, they cannot change since it would cause the
serialized data to become inconsistent. This can be done by pinning the
folios to avoid migration, and by making sure no folios can be added to
or removed from the inode.

While mechanisms to pin folios already exist, the only way to stop
folios being added or removed are the grow and shrink file seals. But
file seals come with their own semantics, one of which is that they
can't be removed. This doesn't work with liveupdate since it can be
cancelled or error out, which would need the seals to be removed and the
file's normal functionality to be restored.

Introduce SHMEM_F_MAPPING_FROZEN to indicate this instead. It is
internal to shmem and is not directly exposed to userspace. It functions
similar to F_SEAL_GROW | F_SEAL_SHRINK, but additionally disallows hole
punching, and can be removed.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pahsa.tatashin@soleen.com>
---
 include/linux/shmem_fs.h | 17 +++++++++++++++++
 mm/shmem.c               | 12 +++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 923f0da5f6c4..f68fc14f7664 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -24,6 +24,14 @@ struct swap_iocb;
 #define SHMEM_F_NORESERVE	BIT(0)
 /* Disallow swapping. */
 #define SHMEM_F_LOCKED		BIT(1)
+/*
+ * Disallow growing, shrinking, or hole punching in the inode. Combined with
+ * folio pinning, makes sure the inode's mapping stays fixed.
+ *
+ * In some ways similar to F_SEAL_GROW | F_SEAL_SHRINK, but can be removed and
+ * isn't directly visible to userspace.
+ */
+#define SHMEM_F_MAPPING_FROZEN	BIT(2)
 
 struct shmem_inode_info {
 	spinlock_t		lock;
@@ -186,6 +194,15 @@ static inline bool shmem_file(struct file *file)
 	return shmem_mapping(file->f_mapping);
 }
 
+/* Must be called with inode lock taken exclusive. */
+static inline void shmem_i_mapping_freeze(struct inode *inode, bool freeze)
+{
+	if (freeze)
+		SHMEM_I(inode)->flags |= SHMEM_F_MAPPING_FROZEN;
+	else
+		SHMEM_I(inode)->flags &= ~SHMEM_F_MAPPING_FROZEN;
+}
+
 /*
  * If fallocate(FALLOC_FL_KEEP_SIZE) has been used, there may be pages
  * beyond i_size's notion of EOF, which fallocate has committed to reserving:
diff --git a/mm/shmem.c b/mm/shmem.c
index 8e6b3f003da5..ef57e2649a41 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1329,7 +1329,8 @@ static int shmem_setattr(struct mnt_idmap *idmap,
 		loff_t newsize = attr->ia_size;
 
 		/* protected by i_rwsem */
-		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
+		if ((info->flags & SHMEM_F_MAPPING_FROZEN) ||
+		    (newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
@@ -3352,6 +3353,10 @@ shmem_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 			return -EPERM;
 	}
 
+	if (unlikely((info->flags & SHMEM_F_MAPPING_FROZEN) &&
+		     pos + len > inode->i_size))
+		return -EPERM;
+
 	ret = shmem_get_folio(inode, index, pos + len, &folio, SGP_WRITE);
 	if (ret)
 		return ret;
@@ -3725,6 +3730,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
 	inode_lock(inode);
 
+	if (info->flags & SHMEM_F_MAPPING_FROZEN) {
+		error = -EPERM;
+		goto out;
+	}
+
 	if (mode & FALLOC_FL_PUNCH_HOLE) {
 		struct address_space *mapping = file->f_mapping;
 		loff_t unmap_start = round_up(offset, PAGE_SIZE);
-- 
2.50.1.565.gc32cd1483b-goog

