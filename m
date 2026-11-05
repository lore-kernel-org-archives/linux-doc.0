Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854864;
	b=Qlp7fq/86Ykm6XxpcjxZt73Ad3YtJqf/3otjGHpPES7M/jY6o7LRWKxfsDrZhfYd8jX5
	 a5QGyHRQ9mXkDF2RWMCiBTE/ZL3FwC192SkLIQ7e+VLF4j+El17uf2eiV0/nbv95RPG1j
	 F6oBs2uLYZJ8Ge93bjlQNwfkxktGeFpUcNBrCqK8Mfnm/fhhwMsnP+YIFA0VmMB0SVkvZ
	 hi6poqBPeZTS4yBMnIS9z1vDoE3+H2eyZJilx6Hw2mO0OPDsuBv8e0w29FMlKdlzWAy/l
	 dhl+jO2n+6oye4lEEt7LIeKnFNgTcw2rYdciLVZ5+wq4uZvWltPXOAoVIqEVmqwZfsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x15wonZx4YKLKAV2h6RvhaJYvivDTh63oWX01b1gV+8=;
	b=PTCd6Nph2vJ8d69KdFPFD41+PAmGi0uJxrCrbFC+GJ5FmTuzFZBqmorFyI65vonMLfk+
	 7HEvdf3uYjfQRStx7O35+EP13Ym3+CgNrky1r67/kJQS9aFHEhwgQ8dnjsBY3Dx6KbqJb
	 uKuvz5rda/6oDJAy1T0iwUumgvj/tjvSjdbWMWnSjxpb00G87RSymSP96K6sc+Vhunajv
	 t9w7tcZrPRqEcB1mXaBKLmYeF0cMOzRtVzCM4SbMCafQhI+ro6TTklaJ63SvrOVVL1rEo
	 ijKaImGFc7MBRXs/1gpCJs4GgUKB+w9hJbssLD35A6kdCNB+XGnxjKDGqC0D+ZTN2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=G75ONDXs;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79F606A33D
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 05:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA79F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=G75ONDXs
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c19c6721a3so876116137.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 21:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854863; x=1794459663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x15wonZx4YKLKAV2h6RvhaJYvivDTh63oWX01b1gV+8=;
        b=G75ONDXsv/eEWwPFXwlro70CoWELO+PrmJWeBsLjpaRoM03+wkTfuOKR6QopIlPxqT
         EqEI4bjM8LOSeSaEq6BxGDw0dbaXaokQvmZH9zf3e9jkqQCT0TCzcrTohg+9dwOVuHYj
         SDk160SMUVyqam6S3qbcgmuJukOt5Ue7y5OSEBnPOs4BCF26PlxSHTQWvAGqDwFJT0KM
         3z8CPRPTB1vKdrLRnuEvCyZfFyl/ZnpwyIQNH3YlJuV6ol1/ExQ1a5w3lBmMfGTqCqlM
         qUAugDQk6yXUR+LwyqVBFFLK8BmoF9vsS5rKAdS/LFiRVg4nWw/jWrGdTFkAVjSF2nBz
         dx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854863; x=1794459663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x15wonZx4YKLKAV2h6RvhaJYvivDTh63oWX01b1gV+8=;
        b=EFNQOVmYR3A9OWDei5hqf0cp0ese0NcJXkXd1kRUnvKJF91g4C536g3LYEkxZ+hZVm
         8bFK90tu6o6DhfH8FLOq8sQM0WemwLNCtL92zB/nBK9qlCXdkGeMN6jREzQjZOHjxjpj
         1XlxSEoE7Gb49TiPDnE6GtSKEmQdNDIKioFJAaalT6QjDOuxWYH009VlMdlvny5lu5PE
         6FzF02rm+jwXgMJHu1uv7O9r+xw4xVgP5YmX1HdVg09wH7TRHySH4Amzc/k3uYxpokSG
         RLQamQzeOewzE06ExYUHhhXFvZ8qhHMKRoZ8hjsp2rAyUaIZm0IJdhwo3h9aL003LqvB
         uARQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqzPpL7gbEG+qdc0WuAY7mCt5rYe1UFXidcQPS+LOyNGkkVfv37fRTHWloLSk3gOwLIO2DDjkSu3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yv/hVlc968Q7hff5YwMHz4ItakWPKDSddNRW/o9SI8QOTo3hD
	b8my0/I51Xap9py4uQ7yab9MWpeHHfooDyn4CD6qki1da8Eexdp/KwK6BiJxpzJxg7UggiwdakM
	Vs7wi
X-Gm-Gg: AYBFou0GOXQeZlovarMmfL75cmA+7jbaRWAwhhVWr+2KmeEgb7HbwfoXOdH8rIOPdvj
	FLSEM3gzeo1tcNMV11dp4njdu16f+E3Z+aa56hRPfKE+zzd53kYOl+JTDwp6h0Xu6WsDYbgHdPs
	sleQu66dObE6D3Oo/4rccSrLbQ8w+0yM9heycowXpTvvN+G1pzJIJsbkGtAm9DdZh2h6vwxVLft
	xYDaqpT7cFZSMlIkO1P8q9Shp26btcSFBNdAFvzYZyvP/5xiO50ayGGiOa7e0iTl/fGYOs84iXh
	Yh+R8vkLojRQfuBuScmvoespO4HIaKYTZzg3x6UWPpfcTKN7YBk+zi6XT99K13V1PwtLQyl4bcz
	eU57zFP9KIr6sXOWgvAOG4imJrwjmxWybA6v8j/vC2odJ38gY2HtY6zkKyPCRZmmJqoJoFqzlXJ
	w06poB/Hri9NSDe93Y+6mRvUiXhcXjCPcxej1Xbhep63CPOat5iN5S49fZ43yzbopE4PRi7MCYv
	mw70HK6tX2lfIvuzQtYwQ5v6nSxVzCsnVq0HnnN9XS+UWZzME4JkNX5V/kj2tmKIxCT79ZuJo8l
	wH2dKO2E5ietTYWig+aqA3GjFpRh4qPETkvu1yGVAZj6syh+1EIN6fLthOenVaTdsz+UuMquj5o
	z3/YP/AnMAaRnSuZLlbySaFqLXTj1wPcOvQx++v+1l+5PV2m3qw==
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr8278473137.1.1793854862693;
        Wed, 04 Nov 2026 21:01:02 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:02 -0800 (PST)
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
Subject: [PATCH v5 4/6] liveupdate: luo_flb: support incremental outgoing FLB publication
Date: Thu,  5 Nov 2026 00:00:50 -0500
Message-ID: <20261105050053.3063001-5-pasha.tatashin@soleen.com>
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

When a session is published to KHO via luo_session_publish_one() ahead
of reboot, any FLBs that its preserved files depend on must already be
present in the outgoing KHO FLB array so the KHO tree remains
self-consistent.

Currently, outgoing FLB metadata in luo_ser->flbs_pa is populated only
during reboot by luo_flb_serialize(), leaving luo_ser->flbs_pa empty
when sessions are published earlier.

Publish outgoing FLBs from luo_session_publish_one() via
luo_file_publish_flbs() -> luo_flb_file_publish() ->
luo_flb_ser_publish_one(), and drop the now-redundant
luo_flb_serialize() pass from liveupdate_reboot(). For each published
file, luo_flb_ser_publish_one() either appends a new luo_flb_ser entry
with count = 1 using smp_store_release() on header_ser->count or
increments the existing entry's count in place, keeping the serialized
count equal to the exact number of published files in KHO without
including uncommitted sessions or transient
liveupdate_flb_get_outgoing() references.

FLB publication is one-way and never needs to unpublish: before reboot
it runs only when a session is committed, and a committed session never
unpreserves its files, keeping private->outgoing.count >= 1 until
reboot so flb->ops->unpreserve() is never called on a published FLB.
If more FDs using an already-published FLB are preserved later,
flb->ops->preserve() is not called again; file handlers update the
shared live object via liveupdate_flb_get_outgoing(). Consequently, FLB
handlers must:
- return a stable root KHO handle in argp->data from .preserve() whose
  address does not change as FDs are added later;
- synchronize concurrent mutations to outgoing.obj with their own lock;
- support per-FD rollback when uncommitted sessions close without
  disturbing already-committed entries.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_core.c     |  10 +--
 kernel/liveupdate/luo_file.c     |  16 +++++
 kernel/liveupdate/luo_flb.c      | 111 ++++++++++++++++++++-----------
 kernel/liveupdate/luo_internal.h |   3 +-
 kernel/liveupdate/luo_session.c  |   2 +
 5 files changed, 95 insertions(+), 47 deletions(-)

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
index 988eb313a135..611b9967a3a9 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -380,6 +380,22 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 	kho_block_set_destroy(&file_set->block_set);
 }
 
+/**
+ * luo_file_publish_flbs - Publish FLBs for all preserved files in a file_set.
+ * @file_set: The file_set being published to the outgoing KHO subtree.
+ *
+ * Iterates through all preserved files in @file_set and ensures their
+ * associated FLB metadata is published in the outgoing KHO FLB array before
+ * the session itself becomes visible in KHO.
+ */
+void luo_file_publish_flbs(struct luo_file_set *file_set)
+{
+	struct luo_file *luo_file;
+
+	list_for_each_entry(luo_file, &file_set->files_list, list)
+		luo_flb_file_publish(luo_file->fh);
+}
+
 static int luo_file_freeze_one(struct luo_file_set *file_set,
 			       struct luo_file *luo_file)
 {
diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
index cd715a7c1d99..6cd87a9f8307 100644
--- a/kernel/liveupdate/luo_flb.c
+++ b/kernel/liveupdate/luo_flb.c
@@ -34,6 +34,15 @@
  * This reference-counted approach ensures that shared state is saved exactly
  * once and restored exactly once, regardless of how many files depend on it,
  * and that its lifecycle is correctly managed across the kexec transition.
+ *
+ * Serialization: Outgoing FLB metadata is published into the KHO FLB array
+ * incrementally as sessions are published to KHO (when committed early via
+ * LIVEUPDATE_SESSION_FREEZE_COMMIT or during reboot). Because a committed
+ * session never unpreserves its files, FLB publication is one-way: once
+ * published, the FLB's .unpreserve() callback is never invoked and its root
+ * KHO handle from .preserve() remains immutable in KHO, while later sessions
+ * may still add or remove per-FD state in the shared live object under the FLB
+ * handler's own synchronization.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -72,6 +81,13 @@ static struct luo_flb_global luo_flb_global = {
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
@@ -104,6 +120,36 @@ static struct luo_flb_private *luo_flb_get_private(struct liveupdate_flb *flb)
 	return private;
 }
 
+static void luo_flb_ser_publish_one(const struct liveupdate_flb *flb, u64 data)
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
+			WRITE_ONCE(fh->ser[i].count, fh->ser[i].count + 1);
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
+	/*
+	 * Ensure the serialized FLB entry is visible before exposing the
+	 * incremented count to concurrent KHO readers.
+	 */
+	smp_store_release(&fh->header_ser->count, nr + 1);
+}
+
 static int luo_flb_file_preserve_one(struct liveupdate_flb *flb)
 {
 	struct luo_flb_private *private = luo_flb_get_private(flb);
@@ -296,6 +342,34 @@ void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh)
 		liveupdate_flb_put_outgoing(iter->flb);
 }
 
+/**
+ * luo_flb_file_publish - Publish FLB metadata for a preserved file's handler.
+ * @fh: The file handler of the preserved file being published into KHO.
+ *
+ * Publishes each FLB associated with @fh into the outgoing KHO FLB array on
+ * first publication, or increments its serialized file reference count by one.
+ *
+ * Context: Called when a session containing preserved files is published into
+ *          the outgoing KHO subtree.
+ */
+void luo_flb_file_publish(struct liveupdate_file_handler *fh)
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
+			luo_flb_ser_publish_one(iter->flb,
+						private->outgoing.data);
+		}
+	}
+}
+
 /**
  * luo_flb_file_finish - Notifies FLBs that a dependent file has been finished.
  * @fh: The file handler for the finished file.
@@ -587,40 +661,3 @@ void __init luo_flb_setup_incoming(u64 flbs_pa)
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
index 01a172cd9d7a..a7253b48df80 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -103,6 +103,7 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
+void luo_file_publish_flbs(struct luo_file_set *file_set);
 int luo_file_freeze(struct luo_file_set *file_set);
 void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
@@ -115,11 +116,11 @@ void luo_file_set_destroy(struct luo_file_set *file_set);
 
 int luo_flb_file_preserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
+void luo_flb_file_publish(struct liveupdate_file_handler *fh);
 void luo_flb_file_finish(struct liveupdate_file_handler *fh);
 void luo_flb_unregister_all(struct liveupdate_file_handler *fh);
 int __init luo_flb_setup_outgoing(u64 *flbs_pa);
 void __init luo_flb_setup_incoming(u64 flbs_pa);
-void luo_flb_serialize(void);
 
 #ifdef CONFIG_LIVEUPDATE_TEST
 void liveupdate_test_register(struct liveupdate_file_handler *fh);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index caf0e85081e8..713b9b400f07 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -233,6 +233,8 @@ static void luo_session_publish_one(struct luo_session *session)
 	if (!sh->published_count)
 		kho_block_set_it_init(&sh->it, &sh->block_set);
 
+	luo_file_publish_flbs(&session->file_set);
+
 	strscpy(entry.name, session->name, sizeof(entry.name));
 	entry.file_set_ser.count = session->file_set.count;
 	entry.file_set_ser.files =
-- 
2.56.0.398.g882cbad275-goog

