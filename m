Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE325FA05
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531129; cv=none; b=IQC6HlGHK6jGayLCuu7af37xbu3qlFruOHx//PY9HVtvKYPZVvYCYXaQK5QOmMXk0Jbr/7/wfALeBQruiAFpZi6hm973CsaYvvzvvgla2SW7rmq0MFS+AXpkJdIszmmO04aijGERTjqpG4lWhw9qgfPoB11cfzfgSj6ZFADrRF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531129; c=relaxed/simple;
	bh=VigCaModk7XbRG7Y45+D24UjlgsEkrae9/KiWmPe5Y8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLxGf9Fk+LsJrGJsZFWnIaYH7BZrmHV4RVFYEayfKIlIwU+/f6MUPutPmsbei7QKGf+y4akWKAgvedho0cJE40VLnn8A0t6tOqoR4xnXu4S47b0D3IAmDRk+Cuum7RIeeY7Umw8W2Vk2f/0CJaCovaZYPO6TyvX6q3fP5xxcXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=LPuEzxR1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="LPuEzxR1"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70748a0e13dso4961156d6.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531126; x=1755135926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeT2iJHyifY4gFOC9716oziuoen1egRU2pBc2ZJ5N/k=;
        b=LPuEzxR1BC91WMfiEEHE4f3Y2aSQpB+ovSYFpb2lzFt4VN4qOOCvZt9ouc3ERW9Lon
         a/nME5FxSO8yyR8mWCu1TgSXB3iiaxaQsq2lmOCNobChf8RD0U3CNMC7U/gbi1AKmTOE
         3bOlgvaBhXcbwYQDyAzgUZshLnhG+e1zEWQDQb4kX+LPKsmSj4EJPZxTi2Jc/nJvJnYE
         FyHaiFn96LEM9xQ9qj6vD6ePUJQYx7Q1xKf5anFSjLqqgp8TMZOHI8arbpLOdtVeNPBB
         SFVXm/bdH3jS59nsEGpl4rDG6SRb6P1pHpjOMwAmlnqcxDFUIQcpfQ399Udag5PMdf3v
         sNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531126; x=1755135926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeT2iJHyifY4gFOC9716oziuoen1egRU2pBc2ZJ5N/k=;
        b=VHZIddxeCQh7YbFy8dLbVNgMA24uK11LMovhHflHt9vjt8+MLdwBULpkYCGg2qDR6j
         nG2wnFTj/TSjrYvobzTTFRU1Sc+yMYKBSWSMtWpIC/sk8FDQt9UKInaAdiqPWBEBA0To
         rcngDK3QU3Lp9RLTMdfJc9GMqW0qKSvNRwWMBBDtHNqrsYkbNUWmJCD3SjTgQC4rFnY/
         YBoobceLfaCr0/oguT1IUA0tDFpHIPyeS7f7L+sxRBW4ly4bTww3FoHjLe49hl5+ySQE
         Vy2HjS7JnWwPvqouczvCizzqDX494cEQ41uXZmvuJJ2ug34YtfJ8ZhYZqRDN4V0cif63
         q/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8DQmTK0w9YReMoo/iXM5WruqhBMWQy39UURfzLknAc82dA9v0RzjvSnGKX1a5x4iM4vHcBLlrweE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXpI7ARnxrxDgdMM79VVwJhpN3/yjekLvTs8TcpHFafPxzFDT
	cnuptqnOtQWgjbzMsq4gRZLszU3l+vw58NZB51XDMhFP+sqN73Fsuy6RbEvlhHgs8Ew=
X-Gm-Gg: ASbGncvYsdYxPa/ORMjSHJxcDZOUqM9U21qqN7kUp2sMru2Yma/Ca0U51qITIb9BQG0
	gKb8M+5Ylt2DAB7oA6ylKJL14lCClbgUJYNztrRsrsy4rOLCV+WMjoUcQT9io+PgXTVZFPOXxYQ
	Z5IT01x/TtHwy5PdavhbpdJxGqDeobvzNd0gqJF9qSgF/U/rJQFGR0slpe+934XyNbGNh190vVU
	qFFAhg2rd3qM8qG3OzeXxkK+42qJQ08oYm0ltPVV0ojMfR87o5HAx9+j4hgZE+UH4QJM5glmFC5
	rI2D9CPOEnSYc+HrqdB54fGB+RXnbEWjRjGuIPbvUIpDNncoTsTnRumcOxq4zBg9XPcNaj/5ZXz
	3bv3M3KsymJZZi23/WvtC+Sf0ObfONPDO39x7+Gpx9tYq86yO60+aealouAD6Fk+DTg5tCMmLd6
	Q99I7iatL1M174
X-Google-Smtp-Source: AGHT+IHk0tb1uB19BidWcJjqq6Q8qaHf0qnKstZyA8KJ/vdb4dYPPaNrNMTJmHZnrPtb3+FE1z9qUg==
X-Received: by 2002:a05:6214:5099:b0:707:61a9:8bdf with SMTP id 6a1803df08f44-709795809c9mr79245396d6.22.1754531125709;
        Wed, 06 Aug 2025 18:45:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:25 -0700 (PDT)
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
Subject: [PATCH v3 26/30] mm: shmem: use SHMEM_F_* flags instead of VM_* flags
Date: Thu,  7 Aug 2025 01:44:32 +0000
Message-ID: <20250807014442.3829950-27-pasha.tatashin@soleen.com>
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

shmem_inode_info::flags can have the VM flags VM_NORESERVE and
VM_LOCKED. These are used to suppress pre-accounting or to lock the
pages in the inode respectively. Using the VM flags directly makes it
difficult to add shmem-specific flags that are unrelated to VM behavior
since one would need to find a VM flag not used by shmem and re-purpose
it.

Introduce SHMEM_F_NORESERVE and SHMEM_F_LOCKED which represent the same
information, but their bits are independent of the VM flags. Callers can
still pass VM_NORESERVE to shmem_get_inode(), but it gets transformed to
the shmem-specific flag internally.

No functional changes intended.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/shmem_fs.h |  6 ++++++
 mm/shmem.c               | 30 +++++++++++++++++-------------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 6d0f9c599ff7..923f0da5f6c4 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -10,6 +10,7 @@
 #include <linux/xattr.h>
 #include <linux/fs_parser.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/bits.h>
 
 struct swap_iocb;
 
@@ -19,6 +20,11 @@ struct swap_iocb;
 #define SHMEM_MAXQUOTAS 2
 #endif
 
+/* Suppress pre-accounting of the entire object size. */
+#define SHMEM_F_NORESERVE	BIT(0)
+/* Disallow swapping. */
+#define SHMEM_F_LOCKED		BIT(1)
+
 struct shmem_inode_info {
 	spinlock_t		lock;
 	unsigned int		seals;		/* shmem seals */
diff --git a/mm/shmem.c b/mm/shmem.c
index e2c76a30802b..8e6b3f003da5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -175,20 +175,20 @@ static inline struct shmem_sb_info *SHMEM_SB(struct super_block *sb)
  */
 static inline int shmem_acct_size(unsigned long flags, loff_t size)
 {
-	return (flags & VM_NORESERVE) ?
+	return (flags & SHMEM_F_NORESERVE) ?
 		0 : security_vm_enough_memory_mm(current->mm, VM_ACCT(size));
 }
 
 static inline void shmem_unacct_size(unsigned long flags, loff_t size)
 {
-	if (!(flags & VM_NORESERVE))
+	if (!(flags & SHMEM_F_NORESERVE))
 		vm_unacct_memory(VM_ACCT(size));
 }
 
 static inline int shmem_reacct_size(unsigned long flags,
 		loff_t oldsize, loff_t newsize)
 {
-	if (!(flags & VM_NORESERVE)) {
+	if (!(flags & SHMEM_F_NORESERVE)) {
 		if (VM_ACCT(newsize) > VM_ACCT(oldsize))
 			return security_vm_enough_memory_mm(current->mm,
 					VM_ACCT(newsize) - VM_ACCT(oldsize));
@@ -206,7 +206,7 @@ static inline int shmem_reacct_size(unsigned long flags,
  */
 static inline int shmem_acct_blocks(unsigned long flags, long pages)
 {
-	if (!(flags & VM_NORESERVE))
+	if (!(flags & SHMEM_F_NORESERVE))
 		return 0;
 
 	return security_vm_enough_memory_mm(current->mm,
@@ -215,7 +215,7 @@ static inline int shmem_acct_blocks(unsigned long flags, long pages)
 
 static inline void shmem_unacct_blocks(unsigned long flags, long pages)
 {
-	if (flags & VM_NORESERVE)
+	if (flags & SHMEM_F_NORESERVE)
 		vm_unacct_memory(pages * VM_ACCT(PAGE_SIZE));
 }
 
@@ -1588,7 +1588,7 @@ int shmem_writeout(struct folio *folio, struct swap_iocb **plug,
 	int nr_pages;
 	bool split = false;
 
-	if ((info->flags & VM_LOCKED) || sbinfo->noswap)
+	if ((info->flags & SHMEM_F_LOCKED) || sbinfo->noswap)
 		goto redirty;
 
 	if (!total_swap_pages)
@@ -2971,15 +2971,15 @@ int shmem_lock(struct file *file, int lock, struct ucounts *ucounts)
 	 * ipc_lock_object() when called from shmctl_do_lock(),
 	 * no serialization needed when called from shm_destroy().
 	 */
-	if (lock && !(info->flags & VM_LOCKED)) {
+	if (lock && !(info->flags & SHMEM_F_LOCKED)) {
 		if (!user_shm_lock(inode->i_size, ucounts))
 			goto out_nomem;
-		info->flags |= VM_LOCKED;
+		info->flags |= SHMEM_F_LOCKED;
 		mapping_set_unevictable(file->f_mapping);
 	}
-	if (!lock && (info->flags & VM_LOCKED) && ucounts) {
+	if (!lock && (info->flags & SHMEM_F_LOCKED) && ucounts) {
 		user_shm_unlock(inode->i_size, ucounts);
-		info->flags &= ~VM_LOCKED;
+		info->flags &= ~SHMEM_F_LOCKED;
 		mapping_clear_unevictable(file->f_mapping);
 	}
 	retval = 0;
@@ -3123,7 +3123,9 @@ static struct inode *__shmem_get_inode(struct mnt_idmap *idmap,
 	spin_lock_init(&info->lock);
 	atomic_set(&info->stop_eviction, 0);
 	info->seals = F_SEAL_SEAL;
-	info->flags = flags & VM_NORESERVE;
+	info->flags = 0;
+	if (flags & VM_NORESERVE)
+		info->flags |= SHMEM_F_NORESERVE;
 	info->i_crtime = inode_get_mtime(inode);
 	info->fsflags = (dir == NULL) ? 0 :
 		SHMEM_I(dir)->fsflags & SHMEM_FL_INHERITED;
@@ -5862,8 +5864,10 @@ static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
 /* common code */
 
 static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
-			loff_t size, unsigned long flags, unsigned int i_flags)
+				       loff_t size, unsigned long vm_flags,
+				       unsigned int i_flags)
 {
+	unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
 	struct inode *inode;
 	struct file *res;
 
@@ -5880,7 +5884,7 @@ static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
-				S_IFREG | S_IRWXUGO, 0, flags);
+				S_IFREG | S_IRWXUGO, 0, vm_flags);
 	if (IS_ERR(inode)) {
 		shmem_unacct_size(flags, size);
 		return ERR_CAST(inode);
-- 
2.50.1.565.gc32cd1483b-goog

