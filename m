Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6F2DC79B
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850262; cv=none; b=msbaPgy7QtrdzeNgPyAkfpY2+WMyKsMFzMKCa/EiYlGTv/LEy07yvIUz/6ySx4qRkYLR0JTJDqmobIdm5abTcvJLXHxigrmejx03d539kdRvuz6po1yBmP6QO9XmNvcFSv5Mt7GYVykeSYLl1+swUcp6dPv9XVFY+lxiE6bPEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850262; c=relaxed/simple;
	bh=K77jDX1Im6JqjYUrlt8KYiu/mP4dGBWQkfQRqxEPhbQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddl7DfQ6D0husxrNo9HAgmj+WI20ZmFny43rs8VQnOhWeD1MqZ/kDL7BClx8cwVgUHXacQ+ttFPZND3oaZzDr5vILirQAzzjEbR6+NapXMahn8r0tVrptwaIfulONdZkPNdIvbm0pTkQwAuk9gj5Vp7OtG/cPGZ/u4FA2ws7Z1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bz21Qq3+; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bz21Qq3+"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7866bca6765so27781647b3.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850259; x=1764455059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VQkksdHZruPlACBWK27dtPpnM3dj37TPMUXRxmVJ+A=;
        b=bz21Qq3+vAD8Z6TU7I92tCykNJL2f5wdz8jL8X0C4YNqKq39PJ8ad5EeR33Gu404qj
         78+x41wNhUkoHYQ9Sn6ck5cVq4YRaSDEmX0faz4fwqW6oxlMEi9i8dHAGXabLVr2/bf0
         A91i+Mpcg5pLiszDEVMhiEzNpVcehsVnX8iPqZ+hr0/1EL+Ou3UVL3bQdNwso7/YnSxn
         HKIkuCqtIotxg+p/cC0kSQrXnPECUhzpJBe7Xn3jILl+UVOSPM1ghQF2ZnD5uNHmK8NL
         CEq3k4xBw0GF+r6eKN/nEscsAumwMIfpQnXorCGstamRIgo0iq7X0i9u81lrZ7bcII6H
         RULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850259; x=1764455059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+VQkksdHZruPlACBWK27dtPpnM3dj37TPMUXRxmVJ+A=;
        b=ay6AGiuWLXK9HweKAB+Uw03QthJmZFQVxkEeh3F0X24ulxm/+Ve2QUdCQuYCJtDn9f
         mIu9n4jj6qEPazP2+0VnusGdV/iy1b+gtQe2fec/nOOY5QV20AAx9gv77IRigZL+Qiak
         /NTF1zyjciRPX6BwoZdxm0jgCiW8PdQ21z81IP9KRCeRYC6oAnu3DOMV0C/apJ7hi0fq
         REYnw0I+/KoFn0xQblySDFPzKMBxgbO2jH7fPY3mMax22bvvr4HourPl531gOLDt0jHh
         FWW9w0CIJw8HU28WJmNwkrGzpanerQiXq55gdZ3DmrowzlvmaV3oeRi01KbjAsYLh+Kl
         poTA==
X-Forwarded-Encrypted: i=1; AJvYcCUv2ObECtIJwBMUKye6+ALWpP0MO7yfhqiqFvMT+u8AAByCjldd4UfIL6v0Fhx7yW/jGL9Jdy2WV/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bngr2hJNameAn1B8A2mR3ODbryhTdL4LVh8E7pfAFRog7CMI
	oADkrb44GWgK3M1rfRMg6K+TGnY4dqhN6c49GOKfLfPFYtc2SCjQgii4BPWY5nRsqDE=
X-Gm-Gg: ASbGncv8AQGuFcAunF2MaggdSqVpyaYck8LUQ6i/N6/IukwfG//dg6dwyRHfUdTqhLZ
	UtPePRvoPt4sEcR4xKoJdr9IqJW44RZv52WMHyLI4CwpifRZahYFcwn3EdmT6BVNC3xl6KgDJzW
	q6zNb6WCj6Tg8fk3Eq956lkAvJI0wyA7uMpcMU/FDA0SgI9Uoyuaolw9wMlHysIubrqtpl6hNB4
	FQzwSjsYYrUhul5MwUyOElFdm7MYmBk9+MXnDYqxSsrftf6JaOtgmowIln9Z3UfQE2vcj2AOcYc
	xVZH5Ey0kLY6gO0hQ1PwyHjEWVjX06nGMxImMvOtjJbzPfmnWd2o1xV3mr+7FK1TinnFVtEDVBF
	1idt5E3NWHHIWf6ZdXv+fTVpw5J6R5GcLs1uGhcxsCBDDN2jEbGBEK5NpMVdzui6GEKWKUB/2uk
	kCXoSvyAWUESACynUKYxmA7QwARqu8eFFGC7ri41J0eVhuQm4/5Sof/efGlloWZnaZpL8rcfrOB
	PbnncY=
X-Google-Smtp-Source: AGHT+IFvV3+5IXCVVP1oSyL2wYtEL/hA9DOLsYTa2a++REZ5p3m7io8YuDgIHUbUDCoA/rChPi/5eg==
X-Received: by 2002:a05:690c:2781:b0:789:507d:6046 with SMTP id 00721157ae682-78a8b54d78dmr49374877b3.51.1763850258886;
        Sat, 22 Nov 2025 14:24:18 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:18 -0800 (PST)
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
Subject: [PATCH v7 11/22] mm: shmem: allow freezing inode mapping
Date: Sat, 22 Nov 2025 17:23:38 -0500
Message-ID: <20251122222351.1059049-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

To prepare a shmem inode for live update, its index -> folio mappings
must be serialized. Once the mappings are serialized, they cannot change
since it would cause the serialized data to become inconsistent. This
can be done by pinning the folios to avoid migration, and by making sure
no folios can be added to or removed from the inode.

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
 mm/shmem.c               | 19 ++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 650874b400b5..d34a64eafe60 100644
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
+static inline void shmem_freeze(struct inode *inode, bool freeze)
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
index 1d5036dec08a..cb74a5d202ac 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1292,9 +1292,13 @@ static int shmem_setattr(struct mnt_idmap *idmap,
 		loff_t newsize = attr->ia_size;
 
 		/* protected by i_rwsem */
-		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
-		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
-			return -EPERM;
+		if (newsize != oldsize) {
+			if (info->flags & SHMEM_F_MAPPING_FROZEN)
+				return -EPERM;
+			if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
+			    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
+				return -EPERM;
+		}
 
 		if (newsize != oldsize) {
 			error = shmem_reacct_size(SHMEM_I(inode)->flags,
@@ -3289,6 +3293,10 @@ shmem_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 			return -EPERM;
 	}
 
+	if (unlikely((info->flags & SHMEM_F_MAPPING_FROZEN) &&
+		     pos + len > inode->i_size))
+		return -EPERM;
+
 	ret = shmem_get_folio(inode, index, pos + len, &folio, SGP_WRITE);
 	if (ret)
 		return ret;
@@ -3662,6 +3670,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
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
2.52.0.rc2.455.g230fcf2819-goog

