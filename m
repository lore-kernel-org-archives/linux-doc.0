Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24A2FEE34
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282072; cv=none; b=TsYSOHT0dhTXPnZX+2wPwAsMorYRNaRty3+vH+Bt6NZJkaauYbB7KeALK42i3Tqd2tv98xtWzuBWx09qeyKAfE1ZG3tf6D4luh1rB59dAw4Kw2il2NIEyNab5CV5B/ZT18vc9WzlBHvE9hY0WyIJ5m+ZXkRPjat+zXes3iq129Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282072; c=relaxed/simple;
	bh=rSRqE8vgQhxsoLI9oMtT0uX+yqw4oNSPUrkN3zwErJM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r72NKrX8iQIpIwNPeSbJq5j1C7wDEcTCay+eh2qBz/X4hBpCJ2496xIXxA/FOXvSH/0PZIistd90gKqS2PjBPvqE0kk604vO63TiJUcrQxCq4rFBpBufT2ItQO0CE4me3EDyT1IEqhMmnzqNA7XPr9vbx3LSULc4fzPeAA7hbzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=I1LApViz; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="I1LApViz"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-717b580ff2aso60416487b3.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282066; x=1753886866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4VVvtVDYrPoMJ5697caghWAOTwp7h+e9BDkNCujjMk=;
        b=I1LApViz9hS+FH/Jp6eP9+T3S1WDdoIOAy5KK+sJI+HeSptcbQCVQImhtENJzYOic2
         9K1Ove/gWwckvuOcRBLRpnnb2FBhvVzyMAeHDCnO2eUuwVq0CcMQdFuAMYlCEZpztxCU
         YTXNVHs7apQdnFq3J0VaZcTOK5O58PXF14MbxOvJIstlsTqc2kkjV1PAarl2cnUxPM2o
         Ra6aRiXcLlToT198V29kPIiLbPl1uou8Xb8TxlnC4WcjLHdMvO9KS2RLnbA9E4Pbtxaz
         ZCQeY1gQJKQvWtLBn399ZXi65NoFzYVTguJELpueMghw5QrdcFtvUoHYOytLZr3RgSKq
         4J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282066; x=1753886866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4VVvtVDYrPoMJ5697caghWAOTwp7h+e9BDkNCujjMk=;
        b=YWAJT1Q/Dq9H2C8vzQuVMkm9+idmSkAiGn98O9N9Xd47+Ige4NpQv//1Fz8H+mka0T
         uzlXsyzDtJ+5n5VDD+kX4WVKE4164gkRXLNcmsG4XaUycAkWYKkLY03JaKCdnda5ykcd
         adbaynZU6mQYBm3YLHp/1wVRSSRLp3BPdQUyB1Kq2m2Hh878Rz+0t9N6+5e++vFBt3B8
         tMrTiYsuJFdWa6X/ouXRa4JIzJBNsxBQwcArAy/QN0/8kbYck9W7LROm3y334wzopZrf
         glFTWGBUnWybPP9aYSfDiswHcSs0sczRwCdUpoej/u2GUegK2KEaOU+LDNkiyoJnpdVL
         l3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVFU1P+NpIKeK+yiOks9FkkQ91JJB0j5usve74zyExPrxTnfRkN3Bm1sk/wHttBN6k9mwY5F4Zbi7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypai7kCiSpjZE1+yCWfrh3l4gR+/RluYBmVdMT4+0EHxCxYWnj
	NHIMkHdNwOThDfMa+sWIMcMZWf1VwzcavsZ8COnJgQJD4bEM70czaEXNVeRhRlTFXuk=
X-Gm-Gg: ASbGnctyB7p/OfvmM9lhJQT3P4VJ5+pvjU4IvXQzYZIE3dFRB+tRQ3zAnVR3rDjDIn1
	gauEC7J/7P3t4C6SSkSQWqDWqY+PZ7wYhuxK4Cctuq0a+152QL8VZD19mxtz/xLlsGRFihPNyPp
	jkrj7JCaZ5a+aTzBmjxY7zgiBAm7eNK4gKpb1PV3fvx/qL9Scx2Y4zqNp6XzzJDCxJ1NAQqP7sL
	+1oYoL8T0dNMfbpRIZ4UlwkWqtrNRgXQmbA/oSQG+Dp6L9/lO/ht73mzwaslBqly5DQ8oGVFDu6
	XR0KHZpGJgR11A++NTmymMPx4hT+rFelb3QInrQElFrckCCK7E1BhErqsmlQ3Db6fYGDt7sE7WT
	oZGzazqiNPWLNbYrswFZfnqFNtFxpCPRLad8WzRW7N7UL+OiTmkU5wIH+6iCzLq7Rkw6FQsqW+2
	OiNE303jOCU0LoXbmWkjISATkb
X-Google-Smtp-Source: AGHT+IElamuRa8AIfKQOvI7xwmAtMtuuPebAeCpy0BgVpmPLxZTObJATbGExKCbAoZbplohPzmoJHw==
X-Received: by 2002:a05:690c:25c1:b0:718:85f1:76d with SMTP id 00721157ae682-719b42932damr39674127b3.26.1753282065581;
        Wed, 23 Jul 2025 07:47:45 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:45 -0700 (PDT)
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
Subject: [PATCH v2 25/32] mm: shmem: use SHMEM_F_* flags instead of VM_* flags
Date: Wed, 23 Jul 2025 14:46:38 +0000
Message-ID: <20250723144649.1696299-26-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
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
index 5f03a39a26f7..578a5f3d1935 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -10,6 +10,7 @@
 #include <linux/xattr.h>
 #include <linux/fs_parser.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/bits.h>
 
 /* inode in-kernel data */
 
@@ -17,6 +18,11 @@
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
index 3a5a65b1f41a..6eded368d17a 100644
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
 
@@ -1557,7 +1557,7 @@ int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
 	if (WARN_ON_ONCE(!wbc->for_reclaim))
 		goto redirty;
 
-	if ((info->flags & VM_LOCKED) || sbinfo->noswap)
+	if ((info->flags & SHMEM_F_LOCKED) || sbinfo->noswap)
 		goto redirty;
 
 	if (!total_swap_pages)
@@ -2910,15 +2910,15 @@ int shmem_lock(struct file *file, int lock, struct ucounts *ucounts)
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
@@ -3062,7 +3062,9 @@ static struct inode *__shmem_get_inode(struct mnt_idmap *idmap,
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
@@ -5801,8 +5803,10 @@ static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
 /* common code */
 
 static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
-			loff_t size, unsigned long flags, unsigned int i_flags)
+				       loff_t size, unsigned long vm_flags,
+				       unsigned int i_flags)
 {
+	unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
 	struct inode *inode;
 	struct file *res;
 
@@ -5819,7 +5823,7 @@ static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
-				S_IFREG | S_IRWXUGO, 0, flags);
+				S_IFREG | S_IRWXUGO, 0, vm_flags);
 	if (IS_ERR(inode)) {
 		shmem_unacct_size(flags, size);
 		return ERR_CAST(inode);
-- 
2.50.0.727.gbf7dc18ff4-goog

