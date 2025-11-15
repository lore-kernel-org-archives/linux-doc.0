Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C03299AB5
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249687; cv=none; b=PyJimVd9iEi+h+BmGR9o2aFyQLAHbPYP1WZeWsxhztijg2wYbU5W67tfgiIPxwLX0QNv5byd22dQhgH5Ir8jfu6TOiDIT9wDtYfmBieIWc9JyMT09fm5RHpx7GgqGfIOTT5oMGFXOg7+cPt51JdkI2M9rJZrdnL51XLuFxfXDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249687; c=relaxed/simple;
	bh=h2vjGzbBg4AU2ifY5ek+1jbDzqzMBe5yccYCDtitHbo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh16/l9HO7gK+/5VxIs/htyKcTAC9M4Vi/gbWM4K5NMwJOAFrqfQQOtSVWQ7B1IBjdvRQLbhNxf1N4aMp1dEC/DhI8OKvZFGhwjhERKmBIDVnvrpfytZ+Gymo/mwrEIkJcmJJWVtvrVYmKri+rwauO6qqE9rFG9BncHaTqFSOvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=abUQnKFp; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="abUQnKFp"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63e1e1bf882so2603277d50.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 15:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763249684; x=1763854484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjp2i+yn5YhJt0E9Cm6hXiIeiW1VzlvDXGR3nMqDfIY=;
        b=abUQnKFpmpaAioTjEc5MaZxSqpGfaR0hBJjJPKmL7grHOerbjdMmY/E/rnBdz4Zhp+
         4f4MzmBxe2yXt3/aZ8GGFg3PoDEr0EK9xI2QfWEyy5kxcZO6eokfC88/6rrn3r0elnUl
         6rmp6vVwi3S5b7+HYnCUfC35j+v8fLarRvPWy/tys6dv+Vit9G/k0UpS4BI0rn469xk2
         efuYF2WtmLWf1gnPhZzveTFPrdjrOG92+HC59YwQe98cWvLIgZ7GRWxqkv1RKmlNyG/7
         T07zhjiovMSPdvCvYYZYNQRa3zmMRuValDIePY9NCniS5ueEd+/NrWk8XrfQ3w1ykU0B
         i/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763249684; x=1763854484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjp2i+yn5YhJt0E9Cm6hXiIeiW1VzlvDXGR3nMqDfIY=;
        b=JKCNOG321XNCN10b01oi2COqCicXHqIuBfIwSw9USfCbZILM+Ug+wNHf63RQ1AGNPe
         3opDOBMunZRMvgmZSEUEO+r+k0fhOc0e9sOMHw6bo88p8kkJXyv3dJuxAi/TTmywOrod
         A/0SwZ3QdXAJgzkFO/IB7SV+yfbYqR8OJwcfL7IBRGGaKIkhNH2q9mn0mJc5gkT5dFDN
         ZU9LMjNtQgj5jQvJwxzf3vFwYywv8mpuU92xv+G/59zLC2aeWde1WTWORkJMl4R+NTYg
         KSOKONJlJEV75n6mMvGPucdo/5Wswys3AoS+uKUuuMoP6qeyNjCSskVtF08ffHSX2/Ir
         +cfg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Cyss4sRf4QTag/tLkIB8IJnW4FFbxCyPUxtbg0vmmN38YvyKrHBZxRB2GUikk5McC3ACe7GJNlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZ6uke0wOuIOpPs4dt/dxWw3MSruVQaOLyw0+aEY0k7kV45Km
	CgLp3dckpSRewdnZD+tKTgplOrvOzemrzMUyQojmfoviNAoXosDa0x1Qh+XQM3P8Jz0=
X-Gm-Gg: ASbGncuXpIK6Y8I/gvxVpaU6JmXBIXFtzyq476q234kawj2adUUsWN3j/NyZ0JWCCiy
	qY3ceMBYNPg+3wobf5IJbzM2twNT9eanJSrtfhCO+q6H7aAGQuIihc4T00M5whgv65qeZ4TjeNh
	kW8GVvuT/qs86Jzcky3vey39XgYWRpq1y5VRsMfGjiY2xG2RlhiY6JiEer1MS1n8YmJORC/YMa2
	+mkKT9HEIeXnG2YX7GJJyw8n2oCnP9xE2QaY5t0ItRYDLxa2jg5ni6dhmBJYjkkP0VgNIbqm4R/
	6D3a44qbt544TVUK75nnELbaMP+zIDlV3wo0NlaRIoLD4m/fhT+9sVtHhNogUPUmWBzRVsWwafn
	0W1BFWzMhtDtDhfS8fHrLIPbi+YCegkpG399TKEoXFWcEcPiPsXIwkri9NhEopkKFyJs1MsMmeS
	cI4pe66lBTKtC7/xwV2VGH9/79NTK3Wb2UpAevuC+4bx9MbvkCzaf3VCD37euMQ5oHNVHaQHRv6
	HXVB8c=
X-Google-Smtp-Source: AGHT+IEqQqw8FjtFSAai2c9iP1dDJFDaXC1XcmhVkOppI5F0MwDFeehYvZcQ8y1up6QBmlqTCYD2LA==
X-Received: by 2002:a05:690c:7408:b0:787:d456:2e62 with SMTP id 00721157ae682-78929ed2da6mr132263187b3.33.1763249683921;
        Sat, 15 Nov 2025 15:34:43 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882218774esm28462007b3.57.2025.11.15.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 15:34:43 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
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
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v6 12/20] mm: shmem: allow freezing inode mapping
Date: Sat, 15 Nov 2025 18:33:58 -0500
Message-ID: <20251115233409.768044-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251115233409.768044-1-pasha.tatashin@soleen.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
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
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/shmem_fs.h | 17 +++++++++++++++++
 mm/shmem.c               | 12 +++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 650874b400b5..a9f5db472a39 100644
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
index 1d5036dec08a..05c3db840257 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1292,7 +1292,8 @@ static int shmem_setattr(struct mnt_idmap *idmap,
 		loff_t newsize = attr->ia_size;
 
 		/* protected by i_rwsem */
-		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
+		if ((info->flags & SHMEM_F_MAPPING_FROZEN) ||
+		    (newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
@@ -3289,6 +3290,10 @@ shmem_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 			return -EPERM;
 	}
 
+	if (unlikely((info->flags & SHMEM_F_MAPPING_FROZEN) &&
+		     pos + len > inode->i_size))
+		return -EPERM;
+
 	ret = shmem_get_folio(inode, index, pos + len, &folio, SGP_WRITE);
 	if (ret)
 		return ret;
@@ -3662,6 +3667,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
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
2.52.0.rc1.455.g30608eb744-goog

