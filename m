Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0F37104A
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370253; cv=none; b=UOmNtAeEZFId5rkPBpoiFO/0xIgrOtUnov+NFfFEVm2GnNPIMh6U0tRVImdjFyTxCc4ttNkj9WlMdRAUCIAKNsWBNNTu1isJzlzgTUQFv4x1sRn/TEWuiTt3EKRWj+ZFBWQFYkI+T+9IBx8xECoSFla3nwd8aofyqH0Ri2LJ8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370253; c=relaxed/simple;
	bh=1tmcKRKeJNlGl1ez8Uj1XzZR+fABELP1WtoTLiwpQUE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCSH0Um/YKkC6xOz9W0pMdQmM22HfEwUlldiwfkLkaymvoR/otknLZJGR/djSYjFF7MImLVsZj21AvytteXIfCxyzVKzkgo0szCGbCAgGfPc5JrwP9WJcFyHngiolFPizFrA/v3z46S8ud4Mf3g3ykNuRmt5KjgUuqpAcP8Xx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Z5LIAicL; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Z5LIAicL"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce9df31840so16817516d6.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370250; x=1780975050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdKgJAMVKXqPuW+WtYwvlJP92RZZBzScgK8DeOU2nzc=;
        b=Z5LIAicLX3idgTg7jDABR+GM/6jnRCNDOT3VPF49qMUsqISVkxdcZvHquSkVAO4sT9
         tArldutCUefrCrx5XzAgcxFDM68n1uTa7iLMsaNxPevWV2ABcmvuZnGZV0AruvtC0MBF
         wivXUmrKT1Gm+jZkk1/+jikAwV8O5x+SCKTNiPizYf0cp8lxhYqWeVvIuUVlCkV7AVwE
         bn/t90DSmrVL2t/Ee6tCvscKB+9TeKtNLOyOwr2GgmKjYelUM/qGRoGg6A5bjJ8ywSBs
         z4P6qwjXwNryxpysrLoINk+84eW7kGIrASgeepbpFyZnasuGPBZdBmyBwuZXG8estEG6
         riYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370250; x=1780975050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QdKgJAMVKXqPuW+WtYwvlJP92RZZBzScgK8DeOU2nzc=;
        b=gCRQfNFxV1Eiuv465phqWidNkmuDigNVvJ+MoRsBAQpit5G4psl8BL2/7LYY6Z27Ac
         Aa4sWsiQFDo4+CF7ottUQJ7tTqZ4yQNvXDDRGlhA0hv7a2xSL3v9wDWBdRhdaEMdCHhe
         1O52dpomd+Ip0BOTWuQcqC2T7+M3VPmeSYOFzVlQXRXOWAtcdz6WdGH139t881V41+44
         e9fpX8pQ0Pt0XljLCAPvocSwRuOXt1UvhDOoPiJw68OkGTHVCZLoCCpIA5LKXQBoMv+O
         nRCK89Nx7QvKnD4htzKu+LM8PZDvviVLs0/dfbCRUkeQrnffo7gIMlipRW9v59Hf6LwD
         VgRA==
X-Forwarded-Encrypted: i=1; AFNElJ9wlEcjunJgbo1whP7f+xg/JED1Iccj9pK/avHOQFNodzPtdDLHxWv1x82JL7MGpeh1FK2r+mZRdJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9BfDjAu6pcFEbYX56haqjOZu+kFFF+eHtpHNh6tTiumXmR6a
	NzDA0Zec/JDXT1Yz8p1lm9ocZxknG5g21ku8kGsZkuTMjNqDGgx1EWdhv5Xj4sCi4xg=
X-Gm-Gg: Acq92OF1/waJHNIdaNikCrzHrC1+3SxK2+oTtR6Z2+nG7wC+bPujs6WBvi4padEGpOo
	7dXzGyMaxSZUfSV7bf3oPKGVaYg919RdmBpBbWdUwYBDeEop1wgcy2CCoUMNcVa/uOWEhlLFbtl
	00Fr1TUaXWgiiplxwL56qtwEmU1cOIqa3bD06bI5tcG2XOaYt2GXMevt2/GJ8pRErb8OK5zLCB1
	JI7Bhw9Mtk5QA8+ll7aLh58DBOpZCPW0eQWOP+ECX/RwF8vJBMtEV3NiPAG07+/UkMe6wYT00DL
	T8nKIpms0cVkecCrzFMBsy9ljGCmSi4wEr+EOm6zoFX59Dn4Y/OEtn4WovaavOoMvhEpI6Pb7iG
	IJlKQFOkSKtApA5I/HqvlTiWsF6PGT+rpU9Bg/fzFDQQXFTKMleRKbsz289ow1ry1UVy4ynxckg
	dOSTro7Fx4SBW6LpBGyu3sNfUJge+no3Rfzg+sKMX8fdFYTnHPxca5ybZXHaVL458a0t5XezCX
X-Received: by 2002:a05:622a:a6c2:b0:516:dcbd:aaae with SMTP id d75a77b69052e-5173a89dda5mr159389971cf.52.1780370250181;
        Mon, 01 Jun 2026 20:17:30 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:29 -0700 (PDT)
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
Subject: [PATCH v5 08/13] liveupdate: defer session block allocation and PA setting
Date: Tue,  2 Jun 2026 03:17:12 +0000
Message-ID: <20260602031717.197696-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, luo_session_setup_outgoing() allocates the session block and
sets its physical address in the header immediately. With upcoming
dynamic block-based session management, this makes the first block
different from the rest. Move the allocation to where it is first needed.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho_block.h        | 22 +++++++++++
 kernel/liveupdate/luo_core.c     |  4 +-
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
 4 files changed, 67 insertions(+), 29 deletions(-)

diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
index 505bf78409f2..0a8cda2cbfb5 100644
--- a/include/linux/kho_block.h
+++ b/include/linux/kho_block.h
@@ -70,6 +70,28 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa);
 void kho_block_set_destroy(struct kho_block_set *bs);
 void kho_block_set_clear(struct kho_block_set *bs);
 
+/**
+ * kho_block_set_head_pa - Get the physical address of the first block header.
+ * @bs: The block set.
+ *
+ * Return: The physical address of the first block header, or 0 if empty.
+ */
+static inline u64 kho_block_set_head_pa(struct kho_block_set *bs)
+{
+	return bs->head_pa;
+}
+
+/**
+ * kho_block_set_is_empty - Check if the block set has no allocated blocks.
+ * @bs: The block set.
+ *
+ * Return: True if there are no blocks in the set, false otherwise.
+ */
+static inline bool kho_block_set_is_empty(struct kho_block_set *bs)
+{
+	return list_empty(&bs->blocks);
+}
+
 void kho_block_it_init(struct kho_block_it *it, struct kho_block_set *bs);
 void *kho_block_it_reserve_entry(struct kho_block_it *it);
 void *kho_block_it_read_entry(struct kho_block_it *it);
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 69b00e7d0f8f..1b2bda22902d 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -165,9 +165,7 @@ static int __init luo_state_setup(void)
 	strscpy(luo_ser->compatible, LUO_ABI_COMPATIBLE, sizeof(luo_ser->compatible));
 	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
 
-	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
-	if (err)
-		goto exit_free_luo_ser;
+	luo_session_setup_outgoing(&luo_ser->sessions_pa);
 
 	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
 	if (err)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index fe22086bfbeb..ee18f9a11b91 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -79,7 +79,7 @@ extern struct rw_semaphore luo_register_rwlock;
 
 int luo_session_create(const char *name, struct file **filep);
 int luo_session_retrieve(const char *name, struct file **filep);
-int __init luo_session_setup_outgoing(u64 *sessions_pa);
+void __init luo_session_setup_outgoing(u64 *sessions_pa);
 int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 9f72a8b0a9a8..43342916d314 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -108,15 +108,16 @@ static DECLARE_RWSEM(luo_session_serialize_rwsem);
 
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
- * @count:      The number of sessions currently tracked in the @list.
- * @list:       The head of the linked list of `struct luo_session` instances.
- * @rwsem:      A read-write semaphore providing synchronized access to the
- *              session list and other fields in this structure.
- * @header_ser: The header data of serialization array.
- * @ser:        The serialized session data (an array of
- *              `struct luo_session_ser`).
- * @active:     Set to true when first initialized. If previous kernel did not
- *              send session data, active stays false for incoming.
+ * @count:       The number of sessions currently tracked in the @list.
+ * @list:        The head of the linked list of `struct luo_session` instances.
+ * @rwsem:       A read-write semaphore providing synchronized access to the
+ *               session list and other fields in this structure.
+ * @header_ser:  The header data of serialization array.
+ * @ser:         The serialized session data (an array of
+ *               `struct luo_session_ser`).
+ * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
+ * @active:      Set to true when first initialized. If previous kernel did not
+ *               send session data, active stays false for incoming.
  */
 struct luo_session_header {
 	long count;
@@ -124,6 +125,7 @@ struct luo_session_header {
 	struct rw_semaphore rwsem;
 	struct luo_session_header_ser *header_ser;
 	struct luo_session_ser *ser;
+	u64 *sessions_pa;
 	bool active;
 };
 
@@ -171,10 +173,30 @@ static void luo_session_free(struct luo_session *session)
 	kfree(session);
 }
 
+static int luo_session_grow_ser(struct luo_session_header *sh)
+{
+	struct luo_session_header_ser *header_ser;
+
+	if (sh->count == LUO_SESSION_MAX)
+		return -ENOMEM;
+
+	if (sh->header_ser)
+		return 0;
+
+	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
+	if (IS_ERR(header_ser))
+		return PTR_ERR(header_ser);
+
+	sh->header_ser = header_ser;
+	sh->ser = (void *)(header_ser + 1);
+	return 0;
+}
+
 static int luo_session_insert(struct luo_session_header *sh,
 			      struct luo_session *session)
 {
 	struct luo_session *it;
+	int err;
 
 	guard(rwsem_write)(&sh->rwsem);
 
@@ -183,8 +205,9 @@ static int luo_session_insert(struct luo_session_header *sh,
 	 * for new session.
 	 */
 	if (sh == &luo_session_global.outgoing) {
-		if (sh->count == LUO_SESSION_MAX)
-			return -ENOMEM;
+		err = luo_session_grow_ser(sh);
+		if (err)
+			return err;
 	}
 
 	/*
@@ -522,21 +545,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
 	return err;
 }
 
-int __init luo_session_setup_outgoing(u64 *sessions_pa)
+void __init luo_session_setup_outgoing(u64 *sessions_pa)
 {
-	struct luo_session_header_ser *header_ser;
-
-	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
-	if (IS_ERR(header_ser))
-		return PTR_ERR(header_ser);
-
-	*sessions_pa = virt_to_phys(header_ser);
-
-	luo_session_global.outgoing.header_ser = header_ser;
-	luo_session_global.outgoing.ser = (void *)(header_ser + 1);
+	luo_session_global.outgoing.sessions_pa = sessions_pa;
 	luo_session_global.outgoing.active = true;
-
-	return 0;
 }
 
 int __init luo_session_setup_incoming(u64 sessions_pa)
@@ -642,6 +654,8 @@ int luo_session_serialize(void)
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -651,7 +665,11 @@ int luo_session_serialize(void)
 			sizeof(sh->ser[i].name));
 		i++;
 	}
-	sh->header_ser->count = sh->count;
+
+	if (sh->header_ser && sh->count > 0) {
+		sh->header_ser->count = sh->count;
+		*sh->sessions_pa = virt_to_phys(sh->header_ser);
+	}
 	up_write(&sh->rwsem);
 
 	return 0;
-- 
2.53.0

