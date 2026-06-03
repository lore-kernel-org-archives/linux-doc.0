Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76693F929E
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457362; cv=none; b=PXqGbTncKzUhND/vFRx93/4pnDpMomZ1Q3C8A9cVFZHlbhZGR7yaFRoS/sqYm46JCyBhPlHfskqS+BAQ8LcjSmY7uYLWE9a6tqd3nELo7goUzmDc118S41I/9w8bqyNhZtEY9M109y3rgVLM5qqaYkCfaKuVXYTX+mTtkWzg7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457362; c=relaxed/simple;
	bh=BUqck5wg4D12YPrDF5xhx84BkumRp2TDeBPRt9od/wk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2icOeSiHbPxigEwCXBbDPPQyWhXO5n+sOtOkAiuSwa4rzYtwZ/GDaTuGGfMIkSvPABM7o3B+zY/2Xw0ntOfM2pq4kolPXG0AHYMaNZgQpROUqjgiMxgpHGI9oIDJxzt18jKz6lfu5LXssrEicWPg/kTjOvnQlPJHVeZ4iqO8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MZTEqwd3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MZTEqwd3"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf887de87so44618326d6.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457359; x=1781062159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9xWUzUEP3GatCDCPhqDCyXoyiDq9Ol5847oPRS2f7E=;
        b=MZTEqwd3BaM3Nm5TsFpYhnpu20vfcoQgFQAMDX/3uFWru8apOVrfTji39qs0GEyazY
         AQ97WmniGonIzsxnFGiKeUA3ad27yMYRwkXkI7Sx3oIbgVy99HO4J3gMpzZvWzepPmzA
         MEtAoR6DBPwQTtOWXiADSa79obChZCNUkIYu+g94PPVmxswaFu/CDX3ciwsOhv1Ms69n
         oeq/XE/uMUsUZs6QBwRGlxOn5HgCnZaj1rEdu45gHy/6+oJWc5PWVwdK+2TrP/PqY2sD
         IQsvr8Sk4tikEcBw43olCvbha4xKEutMf3r6EsjtgPCZCa3BC8hNQZxLcSzEmW+o1Ie0
         pUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457359; x=1781062159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9xWUzUEP3GatCDCPhqDCyXoyiDq9Ol5847oPRS2f7E=;
        b=kNf+xqFMGgZGvkx7Ewj/uw26zSscvih84d4g6jwMh31tmb/6IG+4R4zDVK/4OBa5bW
         uU3sdx/GcIWi4hXGA4MSWER2q/nhmvLvYIBcfuRO5qsGO/ezdcbUyvujaL+AfxkxxPiy
         BenEpqVgVZSw7yg6qThrERYwv8qGg+eLdFR24icVB4knowvsAd89jBSsiEBg65iSPJDz
         MhVeam12fo7PPvqOzFVDuGOLz3ieuYy63rsL7a5hG+vbqc3MefzytxDOOnhwrCgUPtYa
         2c7YWa+/oXonvKv//X6Gp/b+L35+xZltlFB8b41IijRAR86RoCg/GQSytIelkJ6AvmSS
         6zXg==
X-Forwarded-Encrypted: i=1; AFNElJ9wsiqqWH8tBl3gondqU95LoSzUmxF2hzxupK7RsKbPP+k63q6Its+bQ7+B7Kj+fCGlS1prwXJpmyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbAifRjHnuI1SLD922Z29/B76wpbL8O6/XP6ZXirj2C+d1b/Y
	I6OngF5Mo5h7ly3FXF0whw26Um2ihuXhilG8VF5k6K1AUVBtZVDQ9l1rNft3WsV/CZo=
X-Gm-Gg: Acq92OEJ0PdHZJZk+/r2gGs402PCc3bTGpObFsog81cD6eKBi+tW1rZa4sWhS5x3Wez
	JWvDXd/cWaXfXJURp6R5l/GojBF5Xv0xLWshFCH7GTl/tGx0k88fG0Pc+SXP7Qz45vvIQrHBw4y
	QENa+DuGHg9f/V/RN0jGE0f6UUNjcjb/ULndBRDkY+uoaJkg9iz3fJsZKG5uBvTRQSy0veR6nId
	BNcauV6BWnnZ85nAvLEqFO47KhfeaZwwkHi2/b3rSjRAe4B6chitl5fo8YDOH1vEk0lc9IPUbxV
	0SBaXUwKKBH2UWe+BjX4m2b2uYV/nMBzh64C2YCcdBzBCvUFjOGT2sgddfXvCCmpFvvbQ23W7oC
	2rKptLa3pjNM/MPtYus7vcZzzDM0XMcw0ogz9zwBdXr6vJstihy04DIcDUXPkJo9nnCMJ0rh8H4
	RuZFuFX+yghXTY4QcW/F3DvYP3VJoEQF/CIYQ5QjV3Ixky74Hwx00CjGge328Fbw==
X-Received: by 2002:a05:6214:c24:b0:8ca:10c9:845d with SMTP id 6a1803df08f44-8cecdf0ca03mr21814626d6.31.1780457358504;
        Tue, 02 Jun 2026 20:29:18 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:17 -0700 (PDT)
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
Subject: [PATCH v6 08/13] liveupdate: defer session block allocation and physical address setting
Date: Wed,  3 Jun 2026 03:28:59 +0000
Message-ID: <20260603032905.344462-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
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
 kernel/liveupdate/luo_core.c     |  4 +-
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
 3 files changed, 45 insertions(+), 29 deletions(-)

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
index 1cd315e0f6de..2411849a34e3 100644
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
@@ -524,21 +547,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
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
@@ -644,6 +656,8 @@ int luo_session_serialize(void)
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -653,7 +667,11 @@ int luo_session_serialize(void)
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

