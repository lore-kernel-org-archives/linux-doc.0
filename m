Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2D3793CC
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179605; cv=none; b=gQHICBVUMEatm6MW/evZjvTyx1PRqidMO9cNmyq4sOefyz77pwGR6Pd1lzXK3PibELITO2C1Hyq65cHmTdExFsoRKSBaCXT9xAl25LIi9bAGf3+8SMyDYIrRcylkIDG/qnXU1jz1kp7Yx4JLeiWTyin4ohzt3WqCngnCX0qv36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179605; c=relaxed/simple;
	bh=DhsdXZAIsYS+PKBWOqtIaOAZNzKcM4TBtkEe9giYrf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz0LXCI8el/tlh7pdub/fFbr/Jcf3chboRsQBRpdN3y4Lk67vZDOnR1Qa/KHrkTFlZu3UjlbSy9iO32Nv0Wd9hgIh5Kz5U0OpUswjkGN7j2goIUiT4bL/jRZ6bn07gmIfnkLBBbCLwo+1pDQkOATYZJ5xlXSwa/i6eOPxuITtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aaIDTUR7; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aaIDTUR7"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91550d518c0so16695985a.0
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179598; x=1780784398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ssXPv2DRhDSGHaylMjR7rg2Io0bTsFx1rhCfXPl0Sk=;
        b=aaIDTUR7js6QH5ujnaXO28/RzUaN1AMy80q2HR5JoPT5hkCU9x3pIbUDDXXdISFv2d
         81SBqgHmc27pXvQI/zcEFP1a60qGt/vcI2u3T5OHuNbliqmuKwFery1MfdCj0+M+ijY6
         TQHQVuh+n2NL322WXnkMsCkonawC6nxAe7V1uluyTVfd1410jloHRuGmDLyW4oc9Jiqk
         rXYshjmVztGqhAaZM+Buz+jCgpZjVKjCh8UENzd/G48ngs8VX2ybUQwrKNedJcmV0iS2
         HcEnrNgbVLQkmdA35wc03M5qI53iKaIk8bxRwp2k9LtDIuIFK2RlnlIg78BKZR86j66y
         FfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179598; x=1780784398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ssXPv2DRhDSGHaylMjR7rg2Io0bTsFx1rhCfXPl0Sk=;
        b=h3WTW6Id/pyYlAE0HjzE9+v8peKHYVhsiT/PTvsoqP5AH/GcTjWX+Gd6YIqF4YQ8Tj
         DQS38T9i9IsFKQHxjZA//Amq0RhGbKchq2K6qqdSbuVdAuSVysMc/N0pzSpqFEBsLol+
         mKowKOWxm7IU4rtRkfsDx5ZZo5HZlm5DnIHskcO8GD5C9t+CpTKNeu1EAM35hfUsiAO2
         YrQmUirjfvydOXuwLgOqfmGp8sgZBaM5qB+IVo7IHotFOMg3i8V2pkgiU5B0RTBgrzzr
         dwpp0VUd53lEjcBQP38Q/V4IT3qiLna1lUyngfcIfQ8kZSavT2VBSbZKqx8R1QKybEk7
         wi8g==
X-Forwarded-Encrypted: i=1; AFNElJ/lEyh/sUWx2SYsb1REeat3A5ZS5RpU3t/EgkSvRj685OV5cgwSQgnlwPVoeMT0nJFOnWur3BRMeSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrG9ospjT4B/QYquxwMQmLXtA2Cd2Y9LhZsv9tm1pPTUwx4p7X
	3NCLNy4c5OCOc+vmg8Vp8MK4PMPxE8bDDYH9/fHRQ7y3/pNJUbhmn9JSDmyENC47SYE=
X-Gm-Gg: Acq92OESuvhxQdD1Quq9sKcf1woHQ0bZgL3V5xDNYBEw+UXY0z7dYVuN6tpTiJenkwF
	l88ga9a255k44mQ/G9NjGnD8tpyfxPloFqtsA1tKW84rhhZ9S2B1KHIfPkxCDoxSqRCHCHPEk0l
	gUQj/kskitzh5GQXasN/dN5dV+ct3WFPsTURDIx4mvX40U4rXHL6W7eoATQ+FMcZvESpt1slsmB
	kVEPLrPadw3O7h44B9+XzQfXvmTZ5WII/GI8DxWcuOjmfbRbz5SlPHtIC152IDwrURFIvEsfZdP
	IJ6mb8yAwVkwzWcr4T1aAbfYHXAVR/9lKGZsabJSJfoRvUOnhZrf1nIDf3AFkg8zmn/GpbLMTi+
	kcBXWuMvKWyq/DJ0L5z6k2327vd67rkRvOilVot+HNihGVAC/TQ5/6Ln+ClQQeQ0hc4VsatDzWY
	Xmf0vPY3KKsSRkfkbd3fWtVOyMPa+5cNLDgJ5x50bIkqo5wJQnJL1UWyigVnuYnQ==
X-Received: by 2002:a05:620a:a19c:10b0:914:c01e:6f92 with SMTP id af79cd13be357-9153d9709f3mr614876885a.18.1780179598221;
        Sat, 30 May 2026 15:19:58 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:57 -0700 (PDT)
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
Subject: [PATCH v4 08/13] liveupdate: defer session block allocation and PA setting
Date: Sat, 30 May 2026 22:19:33 +0000
Message-ID: <20260530221938.115978-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_core.c     |  4 +-
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
 3 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index e261a03a1b47..fef7fc6765e3 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -161,9 +161,7 @@ static int __init luo_state_setup(void)
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
index b728fd9e3ed2..0548d48bb014 100644
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
@@ -494,21 +517,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
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
@@ -610,6 +622,8 @@ int luo_session_serialize(void)
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -619,7 +633,11 @@ int luo_session_serialize(void)
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

