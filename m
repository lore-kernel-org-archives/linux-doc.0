Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E933D6CDD
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501555; cv=none; b=LAfz5Ctrd+2DBVaHQtckh6r47mUMPFtDfY3cwkx3kqb6MXVMJS/9DcUlJVMJXftWQax9HIE8opfrSZdWhlINHnBM/YXPOijUqkKx4uqqZ9agKP/uPZUoIhPZIkXLL8wM9S8eDP/pAyzKNUlXNmb7xEfVIQn+4eB+DlggLqhP4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501555; c=relaxed/simple;
	bh=BUqck5wg4D12YPrDF5xhx84BkumRp2TDeBPRt9od/wk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUMF0yPQpJTeKidES1ueWASC7i7x0iThQNjGST/dwUVuUuhWo5l/RuZzQdiwGIwkg63M+Koiko2XZPAS+qh8adR+VptI2U6s1dWHq8SbWHNPP+UJs5ZUWIptDAFlr1zeC7zyeLmbJ5f/XFh4i/tq+pK0LDzJfbfl7ClfWj3dHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=I4YDE9wI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="I4YDE9wI"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-91574384cc2so312475785a.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501550; x=1781106350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9xWUzUEP3GatCDCPhqDCyXoyiDq9Ol5847oPRS2f7E=;
        b=I4YDE9wI9iukxF1Ud3R0+jl3JtmXaczftHC59RZZfaSXuM3zrXPdhfTD3IOhtnik4s
         FkgH506gp/tbSvRsAT0rf+oH2kp+a4U3OPrTL1Da75hvIEYNb3YxUNAMLVRvLFnHerLU
         3Q1bRJSO8LWWNjRfsZN0qHHFW/zlJTWfuzXpf/1LIaZvFnucwkT1m34nGX8oPfyAQUI+
         LADPzqj6iV7mj2O/DoWwNNNjcSRp7EDE7hqU+eP2H8ub++CacRtQ6ymDZlIQN5LTLDf8
         BWba5WuHBgfS3sHmoA2GbL40cF6UybKukar9wNZKat1Di6HiHGYQIQnBqOnHnyflbZMN
         5eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501550; x=1781106350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9xWUzUEP3GatCDCPhqDCyXoyiDq9Ol5847oPRS2f7E=;
        b=Agpmr0gSzAyyOsSnKAO5lFH6mvI589IVLgUEXV9wKENwLjC2HG9Ufc0W8XSw4miSyt
         APP5MWaCSBzkALWSGR8DPB3OZS9pcd1HMh0GCPPqZRQJP1IrAeGJWi+H1is0Afthakd9
         Xz5Y3oXq/mdZHtCaKvoyvmLIFv45fTp72j+gKnRKlMgHqdpCWhlLZW8o1omzzpkvqqCT
         FIFQl/Ro/9qk8YqObDNIlpcsTCVVzyXha7e2pLApZ5vFjtajrJfnRn27fRXt3iKgCtJ8
         azUQFygnYnmDHBfZSnUYrO7p2yqOEZlj1GfhDo0Uo2mYaBjrJePlnTxOu463ClFRjWxW
         5Tlw==
X-Forwarded-Encrypted: i=1; AFNElJ+ORD9C7xhiPUusMfe22VN9noXZ8P8COMr9jywaRklqTL8CP7zjL7IfoCIqsaZuoUvsruyvNicqs98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJvHJMqUD6KsIgu33JGqXva8kaILywDH9vj/YnT2FE4Urd5cfi
	ckZ7q93fyxXeUodXz99s+MRovlmD9yV2CiW3kDfAMbbYqnJp8/Hr2gF3a2RlQVz++r4=
X-Gm-Gg: Acq92OGBtp5PFJLUJF1E2w/Dnu5n6pTEwk3xJNyfPCaH1hT9TnZMNr5EskcJQgixvIC
	88m0FHsNLAjssXqD2Vper/uR8AYhclWId/ZqkMVBy7xZjIFkBkvEqIuU53qz7dGrmDt0/7qkgfE
	1NUoiyaVpwjK8/O8mX6SlVYInfxfaOzLThrlo9NjHXlXJWlyYcstEySMe6/84GPPLIJSdL9RY40
	el9f9ylSYZk8L6EyEqsFccRSxi8ACncb6cqXBL7LiQKeAR8CN0d4N3Z3gjljDBojZkxV7dFqZMj
	4fJhDLodPGLnWjQCrCUdeVMQWkH31IDOamPAbZfPsaG+6Ffv7HZhf3f9K+6U1jLqFjzNQQLl99J
	WYHiY+bFEE8gVE6pBdE3hn3/qUPabV70ZppqL+uluvYBqn83Kb2V40PhcrwyA4wRUYDFYtOou3r
	YXaJ0CPmGYfHh+O24d4Sg/rCKK74P/Hxk2VX3wZKCOGWsNdjFK2/71Bz0okpRwVA==
X-Received: by 2002:a05:620a:25cf:b0:90d:b6b7:caa2 with SMTP id af79cd13be357-9158a64528cmr652914085a.11.1780501538664;
        Wed, 03 Jun 2026 08:45:38 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00ba04sm272435585a.7.2026.06.03.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:45:38 -0700 (PDT)
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
Subject: [PATCH v7 08/13] liveupdate: defer session block allocation and physical address setting
Date: Wed,  3 Jun 2026 15:43:57 +0000
Message-ID: <20260603154402.468928-9-pasha.tatashin@soleen.com>
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

