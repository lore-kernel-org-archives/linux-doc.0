Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF336F433
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024880; cv=none; b=WHIVLygOP1dvizkXTwArDqVCEL8tj1HvTIorXjCBOc62hq7QSPOzmf+671rYc5I/K7NoSXBXuMSTK+5qj6kOOJYQoRn8JvBwg69o1YdiAa8c9EY6ISGe9ckVDi+/+dgydb9U1oLtuVANJNWK4VMLIAO/otLRjlu5f7p4s/AmIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024880; c=relaxed/simple;
	bh=lI9O4QlWa29m1gAOidbZ7ftnaJeUa0UFB+lkjwhczVA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbJ5PeZs6IT6+qcgLOM+nwThe/IVVYqtI/pWr5YQDcjr9O0VpnXHCpGspGNJHPr2yIndCljH4DL8rtYxWH5ZGNHfSszOcZZLxggNQtobLVRRRWx8wzoWCuRQvsTFGS1dCQ+vW4r+AAyooVEdiGiojIReThYoxaAMjVQ080QmQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZPUDPQkx; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZPUDPQkx"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8be236ce888so129806896d6.3
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 20:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024878; x=1780629678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+twxrCgMPmxRUfCoAO2rR744nXbCirg1fWRSm/fo6E=;
        b=ZPUDPQkxs4tCk3EVSsE0zCRqg+ejNjTlLNna27kj/9hmLOCoaqloJ2kf2l0PVGrlZt
         jXcWiyGKsUo0mo22dZwJNvQPhy0EQaLrObLWutgOed0WlmmJkhA2nFkN0aB3nMZ9uD1B
         3oB9kLFKW1feBvO84L8dkD7+LIApYtcf1wX+pNXjBTQOwks3hnHMgZfw2UGJC9AvKJqT
         +XS2j1RsA/Si0iUwkA80ed3E827khDjoZ2eEdsvv/YN1aLWU9EXT4GeFRewC/S1t2WCP
         x2RT5IbpCV39yoDHgliMDuCjF1gIolqyc6oBS2ODnR0Ajo4wxaOvLhsqBmTc8AaIYcWV
         Oc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024878; x=1780629678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+twxrCgMPmxRUfCoAO2rR744nXbCirg1fWRSm/fo6E=;
        b=RBI51z3WCP6moVJM4GUs3bJYC+9/n0o6yRCYowhk3JuJ9Jd7ok/XBXaOe4pN6WTTDa
         0DzdlUBya9O0cqejMvoHZKLQuW0fzBw7vAVkoyOhhdx5EzUmMp5mA2S9maYy62DIZzWI
         a+Of1DA4mS/o/S0KbuLjAcU8DSvwMnwkfQXI1LhZ6u129v7j9l8+trnvltxVNsPKoP2N
         LsdQgBWXPvfDdHib4HhyVfRKAjJnVGgiPtZlSmkAegvNo14QsU/ctRw0mqgQy8ZqToFf
         SZxFyyYOwZg1TsJihrleU4kAgclk2Uo2txMAW0lJdBCIj24ClSovvZDvelnEhJkswCEY
         gaYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+udisSgkh3dXFif76R1buaIC6bTaUn5LNNrv7mzUiICgqG4naHs0f5SDMkyfJOhsQpX0cW4E+qYTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSN3eMwo96BR1ZCtt1UO/rAhg0qxQs/YMrXo2+17pX5+au5hVH
	wCVDZ3jdq6NdwEzbYopRHXPyZK1sTC6Njo64liid7u0r7rtOx54XH/SAEPMX8LJvnqY=
X-Gm-Gg: Acq92OGJiYqqUrjr5XZESJvUcF5l56AcheDsk/RgnfrgfD87pfMJcIi4lOhRP8HfVLH
	KVgI3I5aA7lvHo/RHSO+5Zh6kkZIMEhD3BYDqktxnjfooRkxQGUtcR2yrrgUeKR1+4Hzmk6ZYSD
	1wmJ3n1OnzLI9Ms4a4bB+9cdxHkAaIIIuREtEEM57nVYy29fWWB7APXylmL4Sp3IqQzFkbTmAB1
	GM8CUOuAO/eZGA2tJRPtnquwcvRbCRRw8yLu7n4nUy4RW1jfhk8xaG9jGxluxhE/JO2WCtluFLq
	dY8RiMUqU0I845h0walvTS0iEVLjxhdJew3MOFFom65ngQlksqvkmM7W4DfKGxSsIR5EaqscTe7
	jgcPKg5aNOLzFw+zXWpMgOkZdR6xcziQGgpvd6WjT8x0jD20pcgFNCSLMvHsxsgJnO2chxyVhu9
	8UYAHTdAryL7b1vPyiwifT7OgHlnf22bCIPUJWLOgtSz3Zhnwol4SJn1udN99lTmbiolfFG1VF
X-Received: by 2002:a05:6214:238f:b0:8cc:3546:2630 with SMTP id 6a1803df08f44-8cce7fd38d8mr11874636d6.9.1780024878004;
        Thu, 28 May 2026 20:21:18 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:17 -0700 (PDT)
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
Subject: [PATCH v3 07/11] liveupdate: Remove limit on the number of sessions
Date: Fri, 29 May 2026 03:21:02 +0000
Message-ID: <20260529032106.1505796-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the number of LUO sessions is limited by a fixed number of
pre-allocated pages for serialization (16 pages, allowing for ~819
sessions).

This limitation is problematic if LUO is used to support things such as
systemd file descriptor store, and would be used not just as VM memory
but to save other states on the machine.

Remove this limit by transitioning to a linked-block approach for
session metadata serialization. Instead of a single contiguous block,
session metadata is now stored in a chain of 16-page blocks. Each block
starts with a header containing the physical address of the next block
and the number of session entries in the current block.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h     |  24 +------
 kernel/liveupdate/luo_session.c | 114 +++++++++++++++-----------------
 2 files changed, 56 insertions(+), 82 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 9a4fe491812b..79758d92ed5f 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -33,11 +33,6 @@
  *     It includes the compatibility string, the liveupdate-number, and pointers
  *     to sessions and FLBs.
  *
- *   - struct luo_session_header_ser:
- *     Header for the session array. Contains the total page count of the
- *     preserved memory block and the number of `struct luo_session_ser`
- *     entries that follow.
- *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
  *     to another preserved memory block containing an array of
@@ -63,13 +58,15 @@
 #define _LINUX_KHO_ABI_LUO_H
 
 #include <linux/align.h>
+#include <linux/kho/abi/block.h>
 #include <uapi/linux/liveupdate.h>
 
 /*
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v3"
+#define LUO_COMPAT_BASE		"luo-v3"
+#define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE
 #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
 
 /**
@@ -118,21 +115,6 @@ struct luo_file_set_ser {
 	u64 count;
 } __packed;
 
-/**
- * struct luo_session_header_ser - Header for the serialized session data block.
- * @count: The number of `struct luo_session_ser` entries that immediately
- *         follow this header in the memory block.
- *
- * This structure is located at the beginning of a contiguous block of
- * physical memory preserved across the kexec. It provides the necessary
- * metadata to interpret the array of session entries that follow.
- *
- * If this structure is modified, `LUO_ABI_COMPATIBLE` must be updated.
- */
-struct luo_session_header_ser {
-	u64 count;
-} __packed;
-
 /**
  * struct luo_session_ser - Represents the serialized metadata for a LUO session.
  * @name:         The unique name of the session, provided by the userspace at
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index ec72f16185f3..c340ae4bf743 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -24,9 +24,10 @@
  *   ioctls on /dev/liveupdate.
  *
  * - Serialization: Session metadata is preserved using the KHO framework. When
- *   a live update is triggered via kexec, an array of `struct luo_session_ser`
- *   is populated and placed in a preserved memory region. The physical address
- *   of this array is stored in the centralized `struct luo_ser` structure.
+ *   a live update is triggered via kexec, session metadata is serialized into
+ *   a chain of linked-blocks and placed in a preserved memory region. The
+ *   physical address of the first block header is stored in the centralized
+ *   `struct luo_ser` structure.
  *
  * Session Lifecycle:
  *
@@ -89,6 +90,7 @@
 #include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
+#include <linux/kho_block.h>
 #include <linux/kho/abi/luo.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
@@ -98,23 +100,14 @@
 #include <uapi/linux/liveupdate.h>
 #include "luo_internal.h"
 
-/* 16 4K pages, give space for 744 sessions */
-#define LUO_SESSION_PGCNT	16ul
-#define LUO_SESSION_MAX		(((LUO_SESSION_PGCNT << PAGE_SHIFT) -	\
-		sizeof(struct luo_session_header_ser)) /		\
-		sizeof(struct luo_session_ser))
-
 static DECLARE_RWSEM(luo_session_serialize_rwsem);
-
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
  * @count:       The number of sessions currently tracked in the @list.
  * @list:        The head of the linked list of `struct luo_session` instances.
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
- * @header_ser:  The header data of serialization array.
- * @ser:         The serialized session data (an array of
- *               `struct luo_session_ser`).
+ * @block_set:   The set of serialization blocks.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
@@ -123,8 +116,7 @@ struct luo_session_header {
 	long count;
 	struct list_head list;
 	struct rw_semaphore rwsem;
-	struct luo_session_header_ser *header_ser;
-	struct luo_session_ser *ser;
+	struct kho_block_set block_set;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -143,10 +135,14 @@ static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
+		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
+		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 };
 
@@ -173,25 +169,6 @@ static void luo_session_free(struct luo_session *session)
 	kfree(session);
 }
 
-static int luo_session_grow_ser(struct luo_session_header *sh)
-{
-	struct luo_session_header_ser *header_ser;
-
-	if (sh->count == LUO_SESSION_MAX)
-		return -ENOMEM;
-
-	if (sh->header_ser)
-		return 0;
-
-	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
-	if (IS_ERR(header_ser))
-		return PTR_ERR(header_ser);
-
-	sh->header_ser = header_ser;
-	sh->ser = (void *)(header_ser + 1);
-	return 0;
-}
-
 static int luo_session_insert(struct luo_session_header *sh,
 			      struct luo_session *session)
 {
@@ -205,7 +182,7 @@ static int luo_session_insert(struct luo_session_header *sh,
 	 * for new session.
 	 */
 	if (sh == &luo_session_global.outgoing) {
-		err = luo_session_grow_ser(sh);
+		err = kho_block_grow(&sh->block_set, sh->count);
 		if (err)
 			return err;
 	}
@@ -232,6 +209,8 @@ static void luo_session_remove(struct luo_session_header *sh,
 	guard(rwsem_write)(&sh->rwsem);
 	list_del(&session->list);
 	sh->count--;
+	if (sh == &luo_session_global.outgoing)
+		kho_block_shrink(&sh->block_set, sh->count);
 }
 
 static int luo_session_finish_one(struct luo_session *session)
@@ -526,15 +505,17 @@ void __init luo_session_setup_outgoing(u64 *sessions_pa)
 
 int __init luo_session_setup_incoming(u64 sessions_pa)
 {
-	struct luo_session_header_ser *header_ser;
+	struct luo_session_header *sh = &luo_session_global.incoming;
+	int err;
 
-	if (sessions_pa) {
-		header_ser = phys_to_virt(sessions_pa);
-		luo_session_global.incoming.header_ser = header_ser;
-		luo_session_global.incoming.ser = (void *)(header_ser + 1);
-		luo_session_global.incoming.active = true;
-	}
+	if (!sessions_pa)
+		return 0;
 
+	err = kho_block_restore(&sh->block_set, sessions_pa);
+	if (err)
+		return err;
+
+	sh->active = true;
 	return 0;
 }
 
@@ -576,6 +557,8 @@ int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
 	static bool is_deserialized;
+	struct luo_session_ser *ser;
+	struct kho_block_it it;
 	static int err;
 
 	/* If has been deserialized, always return the same error code */
@@ -601,53 +584,62 @@ int luo_session_deserialize(void)
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	for (int i = 0; i < sh->header_ser->count; i++) {
-		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+	kho_block_it_init(&it, &sh->block_set);
+	while ((ser = kho_block_it_read(&it))) {
+		err = luo_session_deserialize_one(sh, ser);
 		if (err)
-			return err;
+			goto err_destroy_blocks;
 	}
 
-	kho_restore_free(sh->header_ser);
-	sh->header_ser = NULL;
-	sh->ser = NULL;
+err_destroy_blocks:
+	kho_block_destroy(&sh->block_set);
 
-	return 0;
+	return err;
 }
 
 int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
 	struct luo_session *session;
-	int i = 0;
+	struct kho_block_it it;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
 	*sh->sessions_pa = 0;
 
+	kho_block_it_init(&it, &sh->block_set);
+
 	list_for_each_entry(session, &sh->list, list) {
-		err = luo_session_freeze_one(session, &sh->ser[i]);
+		struct luo_session_ser *ser = kho_block_it_next(&it);
+
+		if (!ser) {
+			err = -ENOSPC;
+			goto err_undo;
+		}
+
+		err = luo_session_freeze_one(session, ser);
 		if (err)
 			goto err_undo;
 
-		strscpy(sh->ser[i].name, session->name,
-			sizeof(sh->ser[i].name));
-		i++;
+		strscpy(ser->name, session->name, sizeof(ser->name));
 	}
 
-	if (sh->header_ser && sh->count > 0) {
-		sh->header_ser->count = sh->count;
-		*sh->sessions_pa = virt_to_phys(sh->header_ser);
-	}
+	kho_block_it_finalize(&it);
+
+	if (sh->sessions_pa && sh->count > 0)
+		*sh->sessions_pa = sh->block_set.head_pa;
 	up_write(&sh->rwsem);
 
 	return 0;
 
 err_undo:
+	kho_block_it_prev(&it);
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		i--;
-		luo_session_unfreeze_one(session, &sh->ser[i]);
-		memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
+		struct luo_session_ser *ser = kho_block_it_prev(&it);
+
+		luo_session_unfreeze_one(session, ser);
+		memset(ser->name, 0, sizeof(ser->name));
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.53.0

