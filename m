Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB0306DD0
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893571; cv=none; b=laAw5CKm46rKk8xP+gxF4Fk1cNOZq9Hc8c/9tWCeMOZ+zqdBD+M2GyorRST64A760ZBhbziAFZvkVxUvJvhBJHSvUh2CCXpjoAofBzkAE7sqwfWCo+xED5dWvKwv4pEplcs3B6OC5I8GGhrjnMrTbLVHsLZwBvPa/vqrnMd7AO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893571; c=relaxed/simple;
	bh=Mhpgqk+r0SEE0pBbkdly7K40a+AgWRc9ZIiXP1/YEMY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gv6bFBaEN7fquRmL5l3XPDEbDVdHQ1Gohzm95F7i1Vt1rG2SlYS8rCoZHw/kwL1cDdTOHxKwNbpCo+i1FNESk6O9Qi5/oujX2scJGZm7Q8CnO8zNzk+c3tSLHfx/VRsTuo8i3FqvXEjTyHpgS7ujMJcuOhyc69tn92gXGrOYbS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=vv80tNiS; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="vv80tNiS"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8600c87293so281436276.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893569; x=1751498369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98Jyj99BUXTmYd7+cithe+PSs3lV4fLVI7wtqO1MqXk=;
        b=vv80tNiSYye3mwxbHr1kO/yXpqP54HIUz8vmfdCkwK9fFUrTH5uB0LPHEJuYpnP+ux
         oIsraVe9QgB2MCxKuxLwKOOnwzO2LmEFMm3NaeH8wBQjIw4oc+M3TGBlnP+fBgAmOpjj
         C1aBDe1dGG2pHu6u65BvPGcb9w/lGoqpjwgrvXHlgxIBU38PIUD7gYIcCgiFEnlkbZeO
         2l5y7PX8gYxiJXUcY8k/x+/pzx219Y49rjXt/pxqqvWVnEKHbfq6QkB2vQxIb9+n5Gdn
         xeeSOxwWnKQ8SRbGU8FoGa8Vlnivy0a84VIm7ExTh1ScOuHX54YdY6GwAh5875rFL3og
         5HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893569; x=1751498369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98Jyj99BUXTmYd7+cithe+PSs3lV4fLVI7wtqO1MqXk=;
        b=tIWxTvfm/epf4cI3hz8fTYp3axbwt+IR10fIwAySZJVktqCesCg580g0hE7OhHaNqF
         4x1z2YlQ8PRqsdrSM/Qs8vyA/XLdzp2b5NaX6F81FvDh2DIctuUYOuy06pQ4seYqxpBT
         BZ/QuSGWK/u+t6aGhMBWjfK+UEwrtaba+H9rvOM5DDW9u/QTOR/bn8HK9QeTsVXyM/ET
         0QXLw6cdmTbbKIGrfA/pljOwcsUYQg42XN0xKVQVqMWiPbEn6gkVpjJRImcsApJow61N
         1EhSJ6xqlVGS41ed/abF+RNUEbKJJ6oBa47AnieN6mQp4YAxsLiRoD/WaQt/gim1a7YQ
         LQqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwhQLm5lUhH0MaRYRIwCBe9fuDvHv3lwv11qy9gpkuNmsDagFZiHNb2b+K13ZxeHwXyPgG0dOif9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMd1o//tsPSpxI4vnaZixAusSlzkD7jApqNrDTXLEB81VdMZd/
	r807Z6bj3hoSXyHnqy10r7tYY5UcbAEueDDmtPnCDhlBbRxp3oW3Pd9E4av+Vlq/iQ8=
X-Gm-Gg: ASbGncv6b/6c1sBChfJ36mksNKVrTV8BeSORg8e85Q7EZxkXPPeUZS18MByeQTRErhl
	uF6GlSGaXDOpb77PRVDN/lIhcHCsFEABgZrddtLblkMJQ2xrRKP3IOBt3Vj0BKbX0x7JvNPbJFc
	wh2DGvVmv7n35RqxOaGT79uth1pgXGziiiZ4YU0cC2zFnh4lYvFYve5q0dvby2s1PfSQVIMnFC8
	uyFWaKaKudfm1RFgL/BOjjtT3OZaLbtpo+/oMHr3kh7EvknyArxc0zaKYM/HnxJAnEQSgACLCwb
	XCvHbF43lFFAnGoU1dBIBL+Ky6NtQiU60t902Gkhm1Fdw6CqrUTQDYP19ofXeWXb3uiJvHlnFvN
	bWHIoflHTWRfU4wwnN2gcjhtm7pGZLgYntG6tERtMvBmzdBPV9/O2Zv0zQCiNTBA=
X-Google-Smtp-Source: AGHT+IF8jNEFtQnuXkjTXZtOG0o687rs+JjV2eGPA9YX8TPfu5/LIAkdaGG0i8hzaFHLmFqpeuhnQw==
X-Received: by 2002:a05:6902:e12:b0:e7d:ca07:ae7d with SMTP id 3f1490d57ef6-e86017c3da5mr6432810276.33.1750893568719;
        Wed, 25 Jun 2025 16:19:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:28 -0700 (PDT)
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
Subject: [PATCH v1 26/32] mm: shmem: allow freezing inode mapping
Date: Wed, 25 Jun 2025 23:18:13 +0000
Message-ID: <20250625231838.1897085-27-pasha.tatashin@soleen.com>
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
index 578a5f3d1935..1dd2aad0986b 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -22,6 +22,14 @@
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
@@ -183,6 +191,15 @@ static inline bool shmem_file(struct file *file)
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
index 953d89f62882..bd54300be9df 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1297,7 +1297,8 @@ static int shmem_setattr(struct mnt_idmap *idmap,
 		loff_t newsize = attr->ia_size;
 
 		/* protected by i_rwsem */
-		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
+		if ((info->flags & SHMEM_F_MAPPING_FROZEN) ||
+		    (newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
@@ -3291,6 +3292,10 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 			return -EPERM;
 	}
 
+	if (unlikely((info->flags & SHMEM_F_MAPPING_FROZEN) &&
+		     pos + len > inode->i_size))
+		return -EPERM;
+
 	ret = shmem_get_folio(inode, index, pos + len, &folio, SGP_WRITE);
 	if (ret)
 		return ret;
@@ -3664,6 +3669,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
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
2.50.0.727.gbf7dc18ff4-goog

