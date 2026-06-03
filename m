Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E60A3D813D
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501570; cv=none; b=VjIfisbkeqhtkp1TYEt8fABzYpHddZ+jqr9PjUFYrZs9y/XKKFKu3uvsZ+JuqiVrXDNtwAr43ceupzrFwWfr+BlrIonMhWtJ1dIogqFwH4l7zVPsqvTLBPdEFUpxz9gl3Htmqfj47s6jRb+RNp6AI1LwjTrEiJbzR7bUIgzsOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501570; c=relaxed/simple;
	bh=ZRfdPsLnxtNJ9B9lC8QrfK+48ouchkFgHKpkmfHzPJY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReQ85J7luCJTgPMRD+Uxjs5W1ileu9bXbPXGWeWsEh/66bli0pRdxHME6/4TU3u+DT78w6jzRPIFbkgqMhBDo70500b+KlZUrkRU7FYuKwSndtlkHHHXpF+S12Ga43QTPUsDGOdFe25eI91KaOqO8tqHugdb+ItfkmQ6Z4W3YL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MmrWcE/x; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MmrWcE/x"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cbe69b122bso124194766d6.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501563; x=1781106363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7RY0aQRmzwpMQlV2C0KvIb/sAJhNYK+jOGgyIc3BtM=;
        b=MmrWcE/xnl4X2Em94iROuhSxb4cNV8c3uEgoLDq08IdF8Wg50ehX1nfDstDNoy02z/
         mvKU0jaLgymH/8OB/GapzaLsd/Fo+oiMYeZN/liNqdcqdh6RVyB2J71ZReQWO6+mpDXl
         zsFpVqSCo8cllJA1wyl4H/impUQB5VlS7gR/Ppewj2vGe8BGPh+0Iq91Uuwzm2p1sUJT
         2tnqc6ehJmx4jZnFgVqfgm48OulUpSr4DXDAywDODZvIxViNV4FO2o1qCMwcSUJvldge
         WBTFqVx/6s+nBGqUsIfdPOieNF8diBgo2Amrc7r5IKtbLAmL1FTMOKt50rNKJU/givE+
         5sMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501563; x=1781106363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I7RY0aQRmzwpMQlV2C0KvIb/sAJhNYK+jOGgyIc3BtM=;
        b=mIg0qVwDHhTqABPX40Odn6x169UglRiXkiuT/8Oq+VBWuhmlShQjg9//iiOzKLUUle
         XCY8JseNj2mnUS28m8yJzcYnQFLN6y+OsDiOw51WXVuQF4GYAp5zEW32voOOEQc0ZPEi
         R2NJZ7IMMjzyYcsbU6SRF3nFRaYBSuaZYD+ezahdNfyzojIfvmYcEx1ZEu2GW+iaRbMO
         LwPrjQHPEUJCq/HC/uYPuSTuCfw1oYvr73fU6PAKCQ6UTRBpU28gt5uDbXBWafKPvn4c
         PQss4RXvXdJDE/3AF1FUvszvBdTEOzxYSwDu+kulFY4Q8whTaKd3JJ9NOTbBXtEELdyh
         Z7/A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZPLcqENNn1bg1Q3oezdHMhzUAvNCCl+xLbN44ZKd70s29Ul/UD1suq+bu6dOdpDT7Bu2rJiinKOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNIjjkOmONMkpsqwqo4KJAOB0DHfYVtjT9no9K874Lcq4B9Ga
	XmJQQ+MNNuEg0cvdU8AkhIZMgOxsZDy4vTUvFmx5LcNTn0dEUWFRbh+cyADfZAMBLJ8=
X-Gm-Gg: Acq92OHqzM/6MvkBRj2FS+KrZ6APMn6TC46o60ypoK89rG+IUQe8WhA3/vyT2tjyv0x
	vwTZD4697tpG++1Bo3sw/GkktrAlfOo1qQ4evkdnH75rH7n/DkDuE8beuzzLzcX7xbzWhqfguVF
	02pSFGc0EBCnD78iZ8ICUp2DyvPUYf7DSp6ylJPU2HQELUlCwVwYtkDZyXuHXqxNg5kaReAh/gO
	Kcbd9jCbh/j1MXIFD8jxDS/Z10GPsFNuxD4ir91W7/qckvuB+dOHQPM4iTn5a14cH/FDOuDR6mb
	MOZtZSOictaExhzMo1cmh0w6P321hSeLh8rhiFMhb9+lBM42OigjLzPyzABx8c7PQ/uaC1pzQi3
	F4yRYty6GsoUY3IqtGp6IzVesEEGjiZZRFGUPxyjUDPTlnSo5S+1WhtMHPn3VXV19MGkY+uKxEV
	Eu+MO2heUjTTeIAHjoo8HxIfcTHFWn31WiCM6kJdew17n16HelEjyWUOcCYQ/SCg==
X-Received: by 2002:a05:6214:c68:b0:8ce:ba04:7bfe with SMTP id 6a1803df08f44-8cece1668a1mr51109436d6.46.1780501562561;
        Wed, 03 Jun 2026 08:46:02 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9dfc1sm23450476d6.4.2026.06.03.08.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:46:02 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 10/13] liveupdate: Remove limit on the number of files per session
Date: Wed,  3 Jun 2026 15:43:59 +0000
Message-ID: <20260603154402.468928-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To remove the fixed limit on the number of preserved files per session,
transition the file metadata serialization from a single contiguous
memory block to a chain of linked blocks.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h      |  13 +--
 kernel/liveupdate/luo_file.c     | 138 ++++++++++++++-----------------
 kernel/liveupdate/luo_internal.h |   6 +-
 3 files changed, 74 insertions(+), 83 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 03d940d0f9bb..288076de6d4a 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -35,8 +35,8 @@
  *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
- *     to another preserved memory block containing an array of
- *     `struct luo_file_ser` for all files in that session.
+ *     to the first `struct kho_block_header_ser` for all files in that session.
+ *     Multiple blocks are linked via the `next` field in the header.
  *
  *   - struct luo_file_ser:
  *     Metadata for a single preserved file. Contains the `compatible` string to
@@ -65,7 +65,7 @@
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v4"
+#define LUO_ABI_COMPATIBLE	"luo-v5"
 #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
 
 /**
@@ -102,9 +102,10 @@ struct luo_file_ser {
 
 /**
  * struct luo_file_set_ser - Represents the serialized metadata for file set
- * @files:   The physical address of a contiguous memory block that holds
- *           the serialized state of files (array of luo_file_ser) in this file
- *           set.
+ * @files:   The physical address of the first `struct kho_block_header_ser`.
+ *           This structure is the header for a block of memory containing
+ *           an array of `struct luo_file_ser` entries. Multiple blocks are
+ *           linked via the `next` field in the header.
  * @count:   The total number of files that were part of this session during
  *           serialization. Used for iteration and validation during
  *           restoration.
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 9eec07a9e9fc..c39f96961a85 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -118,11 +118,6 @@ static LIST_HEAD(luo_file_handler_list);
 /* Keep track of files being preserved by LUO */
 static DEFINE_XARRAY(luo_preserved_files);
 
-/* 2 4K pages, give space for 128 files per file_set */
-#define LUO_FILE_PGCNT		2ul
-#define LUO_FILE_MAX							\
-	((LUO_FILE_PGCNT << PAGE_SHIFT) / sizeof(struct luo_file_ser))
-
 /**
  * struct luo_file - Represents a single preserved file instance.
  * @fh:            Pointer to the &struct liveupdate_file_handler that manages
@@ -174,39 +169,6 @@ struct luo_file {
 	u64 token;
 };
 
-static int luo_alloc_files_mem(struct luo_file_set *file_set)
-{
-	size_t size;
-	void *mem;
-
-	if (file_set->files)
-		return 0;
-
-	WARN_ON_ONCE(file_set->count);
-
-	size = LUO_FILE_PGCNT << PAGE_SHIFT;
-	mem = kho_alloc_preserve(size);
-	if (IS_ERR(mem))
-		return PTR_ERR(mem);
-
-	file_set->files = mem;
-
-	return 0;
-}
-
-static void luo_free_files_mem(struct luo_file_set *file_set)
-{
-	/* If file_set has files, no need to free preservation memory */
-	if (file_set->count)
-		return;
-
-	if (!file_set->files)
-		return;
-
-	kho_unpreserve_free(file_set->files);
-	file_set->files = NULL;
-}
-
 static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 				struct file *file)
 {
@@ -276,16 +238,15 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (luo_token_is_used(file_set, token))
 		return -EEXIST;
 
-	if (file_set->count == LUO_FILE_MAX)
-		return -ENOSPC;
+	err = kho_block_set_grow(&file_set->block_set, file_set->count + 1);
+	if (err)
+		return err;
 
 	file = fget(fd);
-	if (!file)
-		return -EBADF;
-
-	err = luo_alloc_files_mem(file_set);
-	if (err)
-		goto  err_fput;
+	if (!file) {
+		err = -EBADF;
+		goto err_shrink;
+	}
 
 	err = -ENOENT;
 	down_read(&luo_register_rwlock);
@@ -300,7 +261,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 	/* err is still -ENOENT if no handler was found */
 	if (err)
-		goto err_free_files_mem;
+		goto err_fput;
 
 	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
 			file, GFP_KERNEL);
@@ -343,10 +304,10 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
 err_module_put:
 	module_put(fh->ops->owner);
-err_free_files_mem:
-	luo_free_files_mem(file_set);
 err_fput:
 	fput(file);
+err_shrink:
+	kho_block_set_shrink(&file_set->block_set, file_set->count);
 
 	return err;
 }
@@ -392,13 +353,14 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 
 		list_del(&luo_file->list);
 		file_set->count--;
+		kho_block_set_shrink(&file_set->block_set, file_set->count);
 
 		fput(luo_file->file);
 		mutex_destroy(&luo_file->mutex);
 		kfree(luo_file);
 	}
 
-	luo_free_files_mem(file_set);
+	kho_block_set_destroy(&file_set->block_set);
 }
 
 static int luo_file_freeze_one(struct luo_file_set *file_set,
@@ -454,7 +416,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 		luo_file_unfreeze_one(file_set, luo_file);
 	}
 
-	memset(file_set->files, 0, LUO_FILE_PGCNT << PAGE_SHIFT);
+	kho_block_set_clear(&file_set->block_set);
 }
 
 /**
@@ -493,19 +455,24 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 int luo_file_freeze(struct luo_file_set *file_set,
 		    struct luo_file_set_ser *file_set_ser)
 {
-	struct luo_file_ser *file_ser = file_set->files;
 	struct luo_file *luo_file;
+	struct kho_block_set_it it;
 	int err;
-	int i;
 
 	if (!file_set->count)
 		return 0;
 
-	if (WARN_ON(!file_ser))
-		return -EINVAL;
+	kho_block_set_it_init(&it, &file_set->block_set);
 
-	i = 0;
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
+		struct luo_file_ser *file_ser = kho_block_set_it_reserve_entry(&it);
+
+		/* This should not fail normally as blocks were pre-allocated */
+		if (WARN_ON_ONCE(!file_ser)) {
+			err = -ENOSPC;
+			goto err_unfreeze;
+		}
+
 		err = luo_file_freeze_one(file_set, luo_file);
 		if (err < 0) {
 			pr_warn("Freeze failed for token[%#0llx] handler[%s] err[%pe]\n",
@@ -514,16 +481,14 @@ int luo_file_freeze(struct luo_file_set *file_set,
 			goto err_unfreeze;
 		}
 
-		strscpy(file_ser[i].compatible, luo_file->fh->compatible,
-			sizeof(file_ser[i].compatible));
-		file_ser[i].data = luo_file->serialized_data;
-		file_ser[i].token = luo_file->token;
-		i++;
+		strscpy(file_ser->compatible, luo_file->fh->compatible,
+			sizeof(file_ser->compatible));
+		file_ser->data = luo_file->serialized_data;
+		file_ser->token = luo_file->token;
 	}
 
 	file_set_ser->count = file_set->count;
-	if (file_set->files)
-		file_set_ser->files = virt_to_phys(file_set->files);
+	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
 
 	return 0;
 
@@ -741,14 +706,12 @@ int luo_file_finish(struct luo_file_set *file_set)
 		module_put(luo_file->fh->ops->owner);
 		list_del(&luo_file->list);
 		file_set->count--;
+		kho_block_set_shrink(&file_set->block_set, file_set->count);
 		mutex_destroy(&luo_file->mutex);
 		kfree(luo_file);
 	}
 
-	if (file_set->files) {
-		kho_restore_free(file_set->files);
-		file_set->files = NULL;
-	}
+	kho_block_set_destroy(&file_set->block_set);
 
 	return 0;
 }
@@ -822,16 +785,18 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	struct kho_block_set_it it;
 	int err;
-	u64 i;
 
 	if (!file_set_ser->files) {
 		WARN_ON(file_set_ser->count);
 		return 0;
 	}
 
-	file_set->count = file_set_ser->count;
-	file_set->files = phys_to_virt(file_set_ser->files);
+	file_set->count = 0;
+	err = kho_block_set_restore(&file_set->block_set, file_set_ser->files);
+	if (err)
+		return err;
 
 	/*
 	 * Note on error handling:
@@ -848,25 +813,50 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	file_ser = file_set->files;
-	for (i = 0; i < file_set->count; i++) {
-		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+	kho_block_set_it_init(&it, &file_set->block_set);
+	while ((file_ser = kho_block_set_it_read_entry(&it))) {
+		err = luo_file_deserialize_one(file_set, file_ser);
 		if (err)
-			return err;
+			goto err_destroy_blocks;
+		file_set->count++;
+	}
+
+	if (file_set->count != file_set_ser->count) {
+		pr_warn("File count mismatch: expected %llu, found %llu\n",
+			file_set_ser->count, file_set->count);
+		err = -EINVAL;
+		goto err_destroy_blocks;
 	}
 
 	return 0;
+
+err_destroy_blocks:
+	while (!list_empty(&file_set->files_list)) {
+		struct luo_file *luo_file;
+
+		luo_file = list_first_entry(&file_set->files_list,
+					    struct luo_file, list);
+		list_del(&luo_file->list);
+		module_put(luo_file->fh->ops->owner);
+		mutex_destroy(&luo_file->mutex);
+		kfree(luo_file);
+	}
+	file_set->count = 0;
+	kho_block_set_destroy(&file_set->block_set);
+	return err;
 }
 
 void luo_file_set_init(struct luo_file_set *file_set)
 {
 	INIT_LIST_HEAD(&file_set->files_list);
+	kho_block_set_init(&file_set->block_set, sizeof(struct luo_file_ser));
 }
 
 void luo_file_set_destroy(struct luo_file_set *file_set)
 {
 	WARN_ON(file_set->count);
 	WARN_ON(!list_empty(&file_set->files_list));
+	WARN_ON(!kho_block_set_is_empty(&file_set->block_set));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index ee18f9a11b91..64879ffe7378 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -10,6 +10,7 @@
 
 #include <linux/liveupdate.h>
 #include <linux/uaccess.h>
+#include <linux/kho_block.h>
 
 struct luo_ucmd {
 	void __user *ubuffer;
@@ -44,14 +45,13 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
  * struct luo_file_set - A set of files that belong to the same sessions.
  * @files_list: An ordered list of files associated with this session, it is
  *              ordered by preservation time.
- * @files:      The physically contiguous memory block that holds the serialized
- *              state of files.
+ * @block_set:  The set of serialization blocks.
  * @count:      A counter tracking the number of files currently stored in the
  *              @files_list for this session.
  */
 struct luo_file_set {
 	struct list_head files_list;
-	struct luo_file_ser *files;
+	struct kho_block_set block_set;
 	u64 count;
 };
 
-- 
2.53.0

