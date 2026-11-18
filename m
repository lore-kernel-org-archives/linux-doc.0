Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037334;
	b=bQMcXy6vErjYIgieri1dxS3+1A05aA6O5k3RQZ6/M4D/VHCpUod8fSy13yVAsMYdVGds
	 QpfBHS8bX91WrfP0FLb4XNSEVvg8ZP8+7guyvdIIBhEgQiHVvv6MegsFmdIoNdmCW23tc
	 uiELlU6MCfaQ1xmP0oqRjSvG9eN9uaeQhF2C+jN3aDs5o63k2+UYQoLzCSx35eAIq9I8r
	 ofRCZI8AsbR5lkmhVSvzKERAyj0SOhD6f6JDY+htC/BdlZwItaGaaZ5rP/7u9nCA034kM
	 pbfuMHmg2UZ92yF/8dVCcpMhK4BrcbSrrQcJCVwiwfF/3kJzTbQURdSOMF85J0Nv0xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N1YtoeDwdmtEaztn3lsHUvSs0nnXrghWj9Y62uQyguw=;
	b=I1bKNHAJ0gagpKeDYfv6ECYFB5nVw97SH+NLDoaPjMl49zW2D7+yUMk2sp3oBh+eCRN3
	 qBIxviwmaupZT2YevotZ6QhxVzObvhxTX6AEykKETAP2jFgZcv/PgVM9sosJVx0rLPZ90
	 YkCmqK1ye1O7KnDexqCXs//o+3G/kbHWF+Cvz/he0k5AQ3TlQiHRQd3WdtdVpSyJ6Z2Eq
	 MHEynxqEHRdTiletfhK7pm+jIYcM5HBjs90zHgH0PIFFacuuxkXAGzL06Vw6yzJjGPBPF
	 bUQLfyAAoSUqcEpMlLspcg40rkBfycuUYsTsHRhIKkGLeCOhGKTF4jFkBhOrSjNFuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=MCFSVXED;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7360A380B
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A7360A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=MCFSVXED
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1017291137.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037333; x=1795642133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N1YtoeDwdmtEaztn3lsHUvSs0nnXrghWj9Y62uQyguw=;
        b=MCFSVXEDUJ0c/7Kl9q0Khw8cFiJnXzZ3/JzLH7SBuEL2sHMCx0cSPbsdczwhmimQSg
         UUhnBJmsWPp04y9QBvAfKXtbO50oW38rXCYFTa+L8pAJIz5+L7MUtqPEvA0GQ4XGXE/T
         o+5Mfrz017L4ZnASQncN0Gsi/OR/yrvF49Fppqumt4p0mXSI4x5IFuHVMoctArVfVcNk
         sKMP8ZpfmMwTmFWsTqF7qBNEZgXXaLu3ItRDGal5JxLFC1gd7kL2zazQpoIeFZDxb1Gq
         UXhWq7587+bg2ghcc2nTY5sECAlDJ5huN/6xd6XmqJDD0FvGEpaWb0DJvIvRBZAsMtK3
         hGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037333; x=1795642133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N1YtoeDwdmtEaztn3lsHUvSs0nnXrghWj9Y62uQyguw=;
        b=HQZcmX2yAVwBFYtO9SopThIRrbynHDd0K4XovvMlt/ADzYUquB8H09MoNGZsLJfSe3
         qC+zdWPLwl3oMVo2nJquGp7S3G6agOyUn5OIXIVv3xheOUqAq6QMUr25Z7jgI0f0KLda
         ElfwzYYH956qf8phk00f6sAW9O5OOvEF0k2rZO7lFXvRr78xdF4RbCcdp9vldBtqk893
         lZQd7IBN/+TZunAKnV1MCmKKLMvkYLHrEGEvrbUbGGVqhQ/qXawkq/umP5EtXTLzxhda
         EMwIWzbnUZyNg/e9qCBLN22OS6pgSGtRLEv+JDVlnLktK9ItYUNYuXxqknGGPNgCZq2G
         HSOQ==
X-Forwarded-Encrypted: i=1; AL+hErE8gCPxxTz1fEYyrQw33zwfYorTh9snvabQfgAj8GBIdijbM4CEElmkUByLUbVNg4zKeTILQIdUfLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mmq8xknFDtzpB7ha3m3tBSeOMYRR9hSh67jhBZkaa3MghYG4d
	Rc8UWihGIezj+bzTe6cl67joTdTHD7ZtKk7KaLFCSF3mHxpDcbRNAy4LqItl3BI2idM=
X-Gm-Gg: AYBFou2WUceUSydhz/Np/tN2pI4vjcratvBB+Lhsip0vJOCVESeUy8Soek51RzjD7tK
	D53WJjnzyIr1DFFVft8Za+XWhLzdsuCdwlNIPWHzD0+M8ayB8Hd3YnSdObqw28xEAnDAcE/CZ9I
	wFI1kmqzqrUhUSygqbH+J4RMGRxi5zxA/GlzzRMA0gxq7hejylvVs4RbOnhPqKMRTCOrjK+SkEN
	sWLkWJpKUORqB95f2K+XBdCmHak6XhIFdbgHBaSTOEcZCCEha7aCDzp3raL76FeK8xyIKlkepjX
	1cqWv8vO3xASbb9Wukq4ASYhwBWMd4nodGew290n8AfRjlTRakuP6uqEY/CO60CLu/VL/HtKnIj
	PYBc7J2xfK67YGuFZqhqfTQXEp3j0XuuxHUP9JCl0G/isu8c2MH1xP0Qjwvdq4jt4BvvYjfG43k
	j5C6IjJL6xfUelyXP18zzbdKjFWy2rfx0m+ZSK4fzvWipScS15nOZcNEtw/74dsJcPypRIfQnXR
	RfJSzoNWoad+bxfoAYJvgwwioMZQ+tFt8SppGIREJRDyvh8osoYvlMSueNmVM88huqTcuI/CKLr
	oX8C0rYbvjcQkib0Qj1NEwz/BRKvdYbkljDvPwCaTf5LYprzyDCqp1j9RMisqwo16I+A9W18ViF
	icbqalwJI3WmkGxHiKNp/8Qhjqs4/6SK/YFYMpm2GUVCqDTtbbf6WqKyJFZhKb4M7WZvJYPo9jA
	==
X-Received: by 2002:a05:6102:943:b0:7cc:174b:f7c3 with SMTP id ada2fe7eead31-7d6ba465cadmr1768828137.30.1795037332845;
        Wed, 18 Nov 2026 13:28:52 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:51 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 4/7] liveupdate: luo_flb: serialize outgoing FLBs incrementally
Date: Wed, 18 Nov 2026 16:28:39 -0500
Message-ID: <20261118212845.2855249-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
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

Currently, outgoing FLB metadata is written in a single pass by
luo_flb_serialize() during liveupdate_reboot(). When sessions are
serialized ahead of reboot, any FLBs their files depend on must also
be serialized at that time so the outgoing KHO state stays consistent.

Serialize each file's FLB dependencies from luo_session_serialize_one(),
appending new FLB entries or incrementing the serialized file count in
place. Since every serialized session now updates its FLBs as it is
serialized, drop the separate luo_flb_serialize() pass from
liveupdate_reboot().

Because serialized sessions never unpreserve their files, FLB
serialization is one-way: once an FLB is serialized, its .unpreserve()
callback will not run and its root handle from .preserve() remains
fixed for the rest of the boot.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_core.c     |  10 +--
 kernel/liveupdate/luo_file.c     |  15 +++++
 kernel/liveupdate/luo_flb.c      | 102 ++++++++++++++++++++-----------
 kernel/liveupdate/luo_internal.h |   3 +-
 kernel/liveupdate/luo_session.c  |   2 +
 5 files changed, 85 insertions(+), 47 deletions(-)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 1b2bda22902d..9fef5161a1f3 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -219,18 +219,10 @@ late_initcall(luo_late_startup);
  */
 int liveupdate_reboot(void)
 {
-	int err;
-
 	if (!liveupdate_enabled())
 		return 0;
 
-	err = luo_session_serialize();
-	if (err)
-		return err;
-
-	luo_flb_serialize();
-
-	return 0;
+	return luo_session_serialize();
 }
 
 /**
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 988eb313a135..cdd3c466e5ac 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -380,6 +380,21 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 	kho_block_set_destroy(&file_set->block_set);
 }
 
+/**
+ * luo_file_serialize_flbs - Serialize FLBs for all preserved files in a file_set.
+ * @file_set: The file_set being serialized.
+ *
+ * Iterates through all preserved files in @file_set and serializes their
+ * associated FLB metadata into the outgoing KHO FLB array.
+ */
+void luo_file_serialize_flbs(struct luo_file_set *file_set)
+{
+	struct luo_file *luo_file;
+
+	list_for_each_entry(luo_file, &file_set->files_list, list)
+		luo_flb_file_serialize(luo_file->fh);
+}
+
 static int luo_file_freeze_one(struct luo_file_set *file_set,
 			       struct luo_file *luo_file)
 {
diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
index cd715a7c1d99..4ac534171d42 100644
--- a/kernel/liveupdate/luo_flb.c
+++ b/kernel/liveupdate/luo_flb.c
@@ -34,6 +34,12 @@
  * This reference-counted approach ensures that shared state is saved exactly
  * once and restored exactly once, regardless of how many files depend on it,
  * and that its lifecycle is correctly managed across the kexec transition.
+ *
+ * Serialization: Outgoing FLB metadata is serialized into the KHO FLB array
+ * incrementally as sessions are serialized. Once serialized, the FLB's
+ * .unpreserve() callback is never invoked and its root KHO handle from
+ * .preserve() remains fixed, while later sessions may still update per-FD
+ * state in the shared live object under the FLB handler's own locking.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -72,6 +78,13 @@ static struct luo_flb_global luo_flb_global = {
 	.list = LIST_HEAD_INIT(luo_flb_global.list),
 };
 
+/*
+ * Serializes updates to luo_flb_global.outgoing.header_ser and .ser[].
+ * Lock hierarchy:
+ *   luo_register_rwlock -> private->outgoing.lock -> luo_flb_ser_lock
+ */
+static DEFINE_MUTEX(luo_flb_ser_lock);
+
 /*
  * struct luo_flb_link - Links an FLB definition to a file handler's internal
  * list of dependencies.
@@ -104,6 +117,32 @@ static struct luo_flb_private *luo_flb_get_private(struct liveupdate_flb *flb)
 	return private;
 }
 
+static void luo_flb_serialize_one(const struct liveupdate_flb *flb, u64 data)
+{
+	struct luo_flb_header *fh = &luo_flb_global.outgoing;
+	u64 nr;
+
+	guard(mutex)(&luo_flb_ser_lock);
+	if (!fh->active)
+		return;
+
+	nr = fh->header_ser->count;
+	for (u64 i = 0; i < nr; i++) {
+		if (!strcmp(fh->ser[i].name, flb->compatible)) {
+			fh->ser[i].count++;
+			return;
+		}
+	}
+
+	if (WARN_ON_ONCE(nr >= LUO_FLB_MAX))
+		return;
+
+	strscpy(fh->ser[nr].name, flb->compatible, sizeof(fh->ser[nr].name));
+	fh->ser[nr].data = data;
+	fh->ser[nr].count = 1;
+	fh->header_ser->count = nr + 1;
+}
+
 static int luo_flb_file_preserve_one(struct liveupdate_flb *flb)
 {
 	struct luo_flb_private *private = luo_flb_get_private(flb);
@@ -296,6 +335,32 @@ void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh)
 		liveupdate_flb_put_outgoing(iter->flb);
 }
 
+/**
+ * luo_flb_file_serialize - Serialize FLB metadata for a preserved file's handler.
+ * @fh: The file handler of the preserved file being serialized.
+ *
+ * Adds each FLB associated with @fh to the outgoing KHO FLB array on first
+ * use, or increments its serialized file reference count by one.
+ *
+ * Context: Called when a session containing preserved files is serialized.
+ */
+void luo_flb_file_serialize(struct liveupdate_file_handler *fh)
+{
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *iter;
+
+	guard(rwsem_read)(&luo_register_rwlock);
+	list_for_each_entry(iter, flb_list, list) {
+		struct luo_flb_private *private = luo_flb_get_private(iter->flb);
+
+		scoped_guard(mutex, &private->outgoing.lock) {
+			if (WARN_ON_ONCE(!refcount_read(&private->outgoing.count)))
+				continue;
+			luo_flb_serialize_one(iter->flb, private->outgoing.data);
+		}
+	}
+}
+
 /**
  * luo_flb_file_finish - Notifies FLBs that a dependent file has been finished.
  * @fh: The file handler for the finished file.
@@ -587,40 +652,3 @@ void __init luo_flb_setup_incoming(u64 flbs_pa)
 	luo_flb_global.incoming.ser = (void *)(header_ser + 1);
 	luo_flb_global.incoming.active = true;
 }
-
-/**
- * luo_flb_serialize - Serializes all active FLB objects for KHO.
- *
- * This function is called from the reboot path. It iterates through all
- * registered File-Lifecycle-Bound (FLB) objects. For each FLB that has been
- * preserved (i.e., its reference count is greater than zero), it writes its
- * metadata into the memory region designated for Kexec Handover.
- *
- * The serialized data includes the FLB's compatibility string, its opaque
- * data handle, and the final reference count. This allows the new kernel to
- * find the appropriate handler and reconstruct the FLB's state.
- *
- * Context: Called from liveupdate_reboot() just before kho_finalize().
- */
-void luo_flb_serialize(void)
-{
-	struct luo_flb_header *fh = &luo_flb_global.outgoing;
-	struct liveupdate_flb *gflb;
-	int i = 0;
-
-	guard(rwsem_read)(&luo_register_rwlock);
-	list_private_for_each_entry(gflb, &luo_flb_global.list, private.list) {
-		struct luo_flb_private *private = luo_flb_get_private(gflb);
-		long count = refcount_read(&private->outgoing.count);
-
-		if (count > 0) {
-			strscpy(fh->ser[i].name, gflb->compatible,
-				sizeof(fh->ser[i].name));
-			fh->ser[i].data = private->outgoing.data;
-			fh->ser[i].count = count;
-			i++;
-		}
-	}
-
-	fh->header_ser->count = i;
-}
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 77dac2742877..3d948279f018 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -106,6 +106,7 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
+void luo_file_serialize_flbs(struct luo_file_set *file_set);
 int luo_file_freeze(struct luo_file_set *file_set);
 void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
@@ -118,11 +119,11 @@ void luo_file_set_destroy(struct luo_file_set *file_set);
 
 int luo_flb_file_preserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
+void luo_flb_file_serialize(struct liveupdate_file_handler *fh);
 void luo_flb_file_finish(struct liveupdate_file_handler *fh);
 void luo_flb_unregister_all(struct liveupdate_file_handler *fh);
 int __init luo_flb_setup_outgoing(u64 *flbs_pa);
 void __init luo_flb_setup_incoming(u64 flbs_pa);
-void luo_flb_serialize(void);
 
 #ifdef CONFIG_LIVEUPDATE_TEST
 void liveupdate_test_register(struct liveupdate_file_handler *fh);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 56d7f76c0282..013386534b69 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -222,6 +222,8 @@ static void luo_session_serialize_one(struct luo_session *session)
 	if (WARN_ON_ONCE(!ser))
 		return;
 
+	luo_file_serialize_flbs(&session->file_set);
+
 	strscpy(ser->name, session->name, sizeof(ser->name));
 	ser->file_set_ser.count = session->file_set.count;
 	ser->file_set_ser.files =
-- 
2.56.1.708.g77570a6a1d-goog

