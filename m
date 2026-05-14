Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2A3D348B
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797602; cv=none; b=l0fvHd21ndrACTIWbY1axiy4veZ561FsgrT1s2yIFkt3U6bJEysFBUb97TK4ndswcGemALliAmUr/DcE6fLkW3wtZNDEzCdTNQY/iGkkqQAFcfgM0T5IDEAvKx/nfg2oYNvKAybcukE1Ew2thPX9Z3JXPjzM2D8QbK6c3hlrSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797602; c=relaxed/simple;
	bh=a0VHFJPCyhL3TbqKc1uvHP9e7w/9wd3KOhTGNjyl+S4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NV0BBaT4ixsaYBBu8R+FLCqEOobqIrK7CFmf0U1SgvVFSeBTwiFLFBCq8yRA4NAyu1sHlY0CAMHxeHKT9p708sVufXnTfwVP+j4kqQc8pHlLO9ClMdMnk0XFpS1OljhTetjeiAv8iUJO13oYHfNOGVHJ300RG2rvS0sBxxkZDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fGTGlgpx; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fGTGlgpx"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50fbd79350dso77721121cf.3
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797600; x=1779402400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eb8o2KCzs8bbwuZWDFPZ38APTKPTdJK2DFY1v5TRs6Q=;
        b=fGTGlgpxN8bQJqB7vk9M8MrSRxSL2RoHVCU+Wkz9n4fhx5bWSYMZruscI5tT//K+Uv
         ZZgCC05c9sb1lqmi7Dgh4hJlYgv7FVaceoPGd5UmQg9Ioq+XjlXiSt49fqGSOlHVjlCq
         7VzkD4K0ZUh0c8aqcALpHRNH2wfrSKxQloL1ubA7WWR4PojGCGDxGwnKD1xQPkNbjgGM
         UJBmXpiIwvfFTKEnaiDWtYAIkert8XJo7piOqjWq203oUCVi/REG6M/4HfvmABbe5GEg
         fc9qxPvy+rg4dIQAy1tKqeF4tufZd+Se9rvxt9sh0r6wSQCULuJUJAeygS0rwpdHIUds
         VRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797600; x=1779402400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eb8o2KCzs8bbwuZWDFPZ38APTKPTdJK2DFY1v5TRs6Q=;
        b=Pb3gEPGdoy04J3udkmfj7AxJHIqFJetrM+D+Z00YGyCEZj0SXP1imux+rrRb8w3vSr
         ePeij6Fez6FwcEiBFI/8N2adxtvW9J4AmfTEj4+E23HbijfiQqrwf7oBkdKC5mf2KTWl
         Gkbdp99Z3DXmQ3OjmURoU0O/QFP2dNP8jw8ZSQn0TYqfrzaoZrb6wDXQLjSYZJCXVDRO
         u77CHBsx+uxU6n9+GdRfuMNOyejAHd7rW8Adgkywx4WOP8DWbvriN+ps07ZfC+GqC3g3
         a4Y2Ctc05gCE589nVP2k9g8I8idSQxUh5S5hRjnaUGAEf+dBFYHCgnCP9UOFDAOUsq9b
         I+Kg==
X-Forwarded-Encrypted: i=1; AFNElJ9r/CRyC5WoFupg8AmRC3+IgMDtonnZS/BnQ0TwjZZb72q5uRjfSXcnDXDydIsf4fMWHkOGrqLGj/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6s3kb5l8ORwuFuOcEHAGWCG2gNqCJWu/a3NFVixkTywcD3t7c
	2GQCK7c8BclMDf1hkJzEYBkyQF8QPb6AY/gwQufCnCZ5NBjTbYQcgmzzcc60Qu/CzrU=
X-Gm-Gg: Acq92OEd5BrQ9LWlTRTAmNuW0zaj57jfgAQ/sUGgThvk8ABH+UoFGn/wgqiQoZqsJR4
	z8aGeRRfdMe4EMoUMN/WknjkjIajY63QgVwVf5EpBD9GUUohxIOT4q0515ltMLJN5+gEcr3tpOp
	Hpx1WFeZyXpclguHJqj1h0ouzL7R3QaJBSsc109xLW/uRd3XL5itaCyJjCiaGrA/sZBNG4ld+dh
	xpNqcOl7SatvX8nVyuX4RlYZ+ypilkndtFEK7kAxjU+LQDZMUWZ1Q0MVUMivYt2jgOz+xGnTPhu
	Cnz+Tnbi7nrle2QAm747JIEtaVRjM72P+MOwEasdK5PRv4iYU6KI0nS/H6JoMA+GsvQ9GJ1wxVn
	hR35l6gZZGhAvmxP369JjW9apgYaCWBFLa/bIJ2Juze3Ezw2essy+9IdF6+EYSrdPtigfiND/P9
	yaatGzOwb8mKcDnoUqH0txSzKapd1EJv+KNxX+0aNvFkYgHZA6m+Y=
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr19672381cf.25.1778797599975;
        Thu, 14 May 2026 15:26:39 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:39 -0700 (PDT)
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
Subject: [PATCH v2 05/10] liveupdate: defer session block allocation and PA setting
Date: Thu, 14 May 2026 22:26:23 +0000
Message-ID: <20260514222628.931312-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
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

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_core.c     |  4 +-
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
 3 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 9bd649b22029..5dd7f1e7dddb 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -189,9 +189,7 @@ static int __init luo_fdt_setup(void)
 	if (err)
 		goto exit_free_luo_ser;
 
-	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
-	if (err)
-		goto exit_free_luo_ser;
+	luo_session_setup_outgoing(&luo_ser->sessions_pa);
 
 	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
 	if (err)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 04f31319ccdf..090078ad771c 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -126,7 +126,7 @@ extern struct rw_semaphore luo_register_rwlock;
 
 int luo_session_create(const char *name, struct file **filep);
 int luo_session_retrieve(const char *name, struct file **filep);
-int __init luo_session_setup_outgoing(u64 *sessions_pa);
+void __init luo_session_setup_outgoing(u64 *sessions_pa);
 int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index c08733a328bc..339514e8122c 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -77,15 +77,16 @@
 
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
@@ -93,6 +94,7 @@ struct luo_session_header {
 	struct rw_semaphore rwsem;
 	struct luo_session_header_ser *header_ser;
 	struct luo_session_ser *ser;
+	u64 *sessions_pa;
 	bool active;
 };
 
@@ -140,10 +142,30 @@ static void luo_session_free(struct luo_session *session)
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
 
@@ -152,8 +174,9 @@ static int luo_session_insert(struct luo_session_header *sh,
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
@@ -458,21 +481,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
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
@@ -573,6 +585,8 @@ int luo_session_serialize(void)
 	int err;
 
 	guard(rwsem_write)(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -582,7 +596,11 @@ int luo_session_serialize(void)
 			sizeof(sh->ser[i].name));
 		i++;
 	}
-	sh->header_ser->count = sh->count;
+
+	if (sh->header_ser && sh->count > 0) {
+		sh->header_ser->count = sh->count;
+		*sh->sessions_pa = virt_to_phys(sh->header_ser);
+	}
 
 	return 0;
 
-- 
2.53.0

