Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854863;
	b=ewnc5BtK10ofHM8UnWZdYe+38CbgGZye2//gnJzf9Qd1EXx2k3q5OJZ6hD4pVxVMKvDi
	 jK+Tkgagz6i49UKzPod+TxnvWoCr1sc6YWqGGAUSCmLBJgxIdMNQw6miGAmwMWplUg+Oh
	 PCYKQ5cUvLI1C0PjUehXdVgWP1G8oVd6G+yzrQUohTXLMCrcsQ5Ll4TNWdU72qVztgxQ7
	 iFp2lqKSCMObnKfVFBWbYbpSPCHScmMVVoqiUKvXxm/WupctDH6o8zuWW5NDfPHRvxgNg
	 M0594ctIJWwzZ37mWkAhOpqk9oXWzy1xmdYzkZb36VrXS1pjmZuC68PXHDiioVgWiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
	b=AQuqpF1HLp76aK5f0gf99XzpRkE+9lUUPW7dQrJBswBc53lLq2QfbttSQ03qPGlmM+Na
	 8kiCupwzO+46uLIcn5qeGx8phBcbCt390M4AFXvxXRae7m8MNku3lyhC6AWBmj9wtvu1b
	 GzeHiYxEeByvp1XY89C6vpjRH2j7gG5UEhs5MCwrsVtPkRn1uwPP9hXvQX9HEdpXHTwFP
	 QuKhQxUdf4wuyzo1ICHWMhTG87fX5Ac02A6YqbpeF9ZlTVG5RBbJ1lZ/tuiYmSjb2OCGq
	 8X/Ll/wgZ9yerJqUFXiBH6BPkZeEmtnhAGnCewi5pcPf49mP32hL32rA/UdWlb72lNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA86606D813
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 05:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA86606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e948e56af3so520028e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854862; x=1794459662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=bVWrYH5l5854+NhczsUhYu3xmfCoWRgcjOfjUMuXKuNr7w549b6w7jSfDM4cZ+BLxc
         619ViqeDZP/4H+pKutBapgf9vnTHOJgr4iLyKC29hsoHEmPxzODxf6p6qVq+FnD/aO5C
         dSr3NrVNXAc5hPLr7y9ZK3YpmVIlQc8OuHIv2Xk5kxRIpoWuAtZZRkkv7z0w2Qf7COky
         trKVLTK5NyhF26inZjCCM6NZ+D/A1s/AGe8pqg6vUgo52a8UMgy5dNRFS6hme2vIVbG/
         NRbWBZWYj5b7v0eHB45bozBI2N0IJ6mK0jwx0iswaci8djlHuk/n//wL4FoPtwQMjcHY
         ONeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854862; x=1794459662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=ZCKVeP5RITNOYz2LXn4fFaaYLX3is12wimWDhDrjJhiCKyI/Ar2DuCRISeo/s/d+Lt
         vfaC1KBsNxLVSJpjbZ8RacCfGqPKhUcrOcuYdlVulWzeoUGrmCmVR0bWNtaWl3oXt2Pz
         gF9jQpg92/us8I/R+9AAD+YkzHEY4bSSLdN+FNM7c5ysep7hfjf3AXu3CmuWYGxAoYs0
         FQOEDWc99muSrhsxO3h3Z8wRn8EMyaw6xAyQaaRAp7/moOZe+aFRCPJwCsiMc3RgvBxo
         2lOlUZ75oENVhi64KCLXH9akS2Mbk7+X0g5FvRjijicpQII81eUP9tpzOEomPUGgEmyk
         mCgA==
X-Forwarded-Encrypted: i=1; AKwUvBwXJgXoALdFlNc3FRKohCJE7oe2yh+NNW5qJZRQa+Pd1iHCMNF2YUlbIPi+dAOBuY2DRWJDuPRRl2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iKIhCyYfwlc+kiCkiYwehOH4Swl1+d10BbUhtDJwkjZ/+UJwV
	6CFWmat4emu2PaDZZp1SjVqXiqxyGa56K0bijxfRLiJlBCM0We8/F4L9w25C2dk5+fg=
X-Gm-Gg: AYBFou18Ql+0N7n8Kk6cnBa6Su9Mc2n8IiFSOnyqhwtjqRJ5KHzzGsjl/odgBTZRS7f
	vQUPA1TrRVQ7f2pqWXDgjUw4BNnDQMzho1iEJWi4wvnLjTthFd8HmNe/BvsA2HTDNvwy0IQaZai
	rXkl47CNhGm385Ap/ILNt1HXKknrtimutEnDZmUDYcKOEN5B8jiORiVydXrk7fCUeDMDWbcCmSD
	XOX5UG/WmPZ1pIt8DwOyPrGeD9i6H82WAsfEcqsPkzs+pB/fdp3DD6OGdVeAByO2STKnCERJOsD
	CNTR3Ps0e3XkH19zcTtjZkEQz7ih/MSqfuBMeOxcokS1z6rJxgbS5jpd1NevEuOd3x+++N2nSFA
	5KV80V2X79zUEq5kewLKRsnp5BoA5k4BoN0tSjuX1Wga0773Icw5vJTjvZeBd4X4i4EtmpCYxiF
	e4eCdElXZs/7fngxcp9rYv5piyxp5zYnsBUWailasY6zy+VabecN2Rr9t8hRbqJDkSDOWAPY9Fh
	Wzcu8gLzceUnuw3n4SiPVVtJ4OUqnQM7Vmpj/niHCHiY8kcTAGYIkUDnheZSp4dPgFVzhFsTksi
	Brw/skeTsJQ34uYNBf1ub80ktemr8nltvZZ+jT1Dqu/mq6ErRANUXTAGhrFMHNjlcrq5Q/Nees8
	3Nh2nRO8OGd7oTBGp2FFdCC+CV9tyrK+YAOL5rW4R0Sy8KIJxkQ==
X-Received: by 2002:a05:6122:468d:b0:5ec:4a13:8aae with SMTP id 71dfb90a1353d-5ec689801b4mr8447981e0c.17.1793854861885;
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 3/6] liveupdate: luo: serialize sessions via per-session publish helper
Date: Thu,  5 Nov 2026 00:00:49 -0500
Message-ID: <20261105050053.3063001-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With incremental kho_block publication in place, LUO sessions can be
published into sh->block_set individually as they are committed, rather
than rebuilding the entire session serialization chain during reboot.

Currently, luo_session_serialize() resets *sh->sessions_pa and
serializes all outgoing sessions from scratch in a single pass at reboot
time.

Introduce luo_session_publish_one() to append a session's
luo_session_ser entry via kho_block_set_it_append() and move the session
onto sh->published_list. Update luo_session_serialize() to freeze all
remaining unpublished sessions first (rolling back via
luo_session_unfreeze_one() on failure) and then publish them in a second
pass.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 92 ++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 6dea35911181..caf0e85081e8 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -103,20 +103,30 @@
 static DECLARE_RWSEM(luo_session_serialize_rwsem);
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
- * @count:       The number of sessions currently tracked in the @list.
+ * @count:       The number of sessions currently tracked in the header.
+ * @published_count: The number of outgoing sessions currently published in
+ *                   @block_set.
  * @list:        The head of the linked list of `struct luo_session` instances.
+ * @published_list:  The head of the linked list of published outgoing
+ *                   sessions, ordered identically to their entries in
+ *                   @block_set.
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
  * @block_set:   The set of serialization blocks.
+ * @it:          Iterator tracking the next slot in @block_set for outgoing
+ *               session serialization.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
  */
 struct luo_session_header {
 	long count;
+	long published_count;
 	struct list_head list;
+	struct list_head published_list;
 	struct rw_semaphore rwsem;
 	struct kho_block_set block_set;
+	struct kho_block_set_it it;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -134,12 +144,14 @@ struct luo_session_global {
 static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.incoming.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
 						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.outgoing.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
 						sizeof(struct luo_session_ser)),
@@ -186,6 +198,10 @@ static int luo_session_insert(struct luo_session_header *sh,
 		if (!strncmp(it->name, session->name, sizeof(it->name)))
 			return -EEXIST;
 	}
+	list_for_each_entry(it, &sh->published_list, list) {
+		if (!strncmp(it->name, session->name, sizeof(it->name)))
+			return -EEXIST;
+	}
 
 	/*
 	 * For outgoing we should make sure there is room in serialization array
@@ -203,6 +219,42 @@ static int luo_session_insert(struct luo_session_header *sh,
 	return 0;
 }
 
+static void luo_session_publish_one(struct luo_session *session)
+{
+	struct luo_session_header *sh = &luo_session_global.outgoing;
+	struct luo_session_ser entry = {};
+
+	lockdep_assert_held_write(&sh->rwsem);
+	lockdep_assert_held(&session->mutex);
+
+	if (!sh->active || !sh->sessions_pa)
+		return;
+
+	if (!sh->published_count)
+		kho_block_set_it_init(&sh->it, &sh->block_set);
+
+	strscpy(entry.name, session->name, sizeof(entry.name));
+	entry.file_set_ser.count = session->file_set.count;
+	entry.file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	/* This should not fail normally as blocks were pre-allocated */
+	if (WARN_ON_ONCE(!kho_block_set_it_append(&sh->it, &entry)))
+		return;
+
+	if (!sh->published_count) {
+		/*
+		 * Ensure the first block header and entry are visible before
+		 * publishing sessions_pa to concurrent KHO readers.
+		 */
+		smp_store_release(sh->sessions_pa,
+				  kho_block_set_head_pa(&sh->block_set));
+	}
+
+	list_move_tail(&session->list, &sh->published_list);
+	sh->published_count++;
+}
+
 static void luo_session_remove(struct luo_session_header *sh,
 			       struct luo_session *session)
 {
@@ -636,50 +688,32 @@ int luo_session_deserialize(void)
 int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
-	struct luo_session *session;
-	struct kho_block_set_it it;
+	struct luo_session *session, *tmp;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
-	*sh->sessions_pa = 0;
-
-	kho_block_set_it_init(&it, &sh->block_set);
 
 	list_for_each_entry(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_reserve_entry(&it);
-
-		/* This should not fail normally as blocks were pre-allocated */
-		if (WARN_ON_ONCE(!ser)) {
-			err = -ENOSPC;
-			goto err_undo;
-		}
-
 		err = luo_session_freeze_one(session);
 		if (err) {
-			kho_block_set_it_prev(&it);
-			goto err_undo;
+			list_for_each_entry_continue_reverse(session, &sh->list, list)
+				luo_session_unfreeze_one(session);
+			goto err_unlock;
 		}
+	}
 
-		strscpy(ser->name, session->name, sizeof(ser->name));
-		ser->file_set_ser.count = session->file_set.count;
-		ser->file_set_ser.files =
-			kho_block_set_head_pa(&session->file_set.block_set);
+	list_for_each_entry_safe(session, tmp, &sh->list, list) {
+		mutex_lock(&session->mutex);
+		luo_session_publish_one(session);
+		mutex_unlock(&session->mutex);
 	}
 
-	if (sh->count > 0)
-		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
-err_undo:
-	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
-
-		luo_session_unfreeze_one(session);
-		memset(ser, 0, sizeof(*ser));
-	}
+err_unlock:
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
 
-- 
2.56.0.398.g882cbad275-goog

