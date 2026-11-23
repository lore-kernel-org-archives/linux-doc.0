Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477180;
	b=Mu+58sxF3OqaTd2EqX0jnWirozrdFbtqRyfyBAPvLgpeLFXqd/WBDzaGkxs81NG3ihHr
	 3k1/FcO1N3CUeiizIWPavaUk1jLq7x184J6DTKwsB1l+3B1AFUjCmaSUAGou3LbZ2+Mif
	 W6pknX87EFM/Gmx3+Mv/5N6vPIUGUTxB6k2/TNcl7P74Vfgi9Ky6/EAsyf1GIwXPJFGDE
	 qpN0nb4/S63VhDEwnDEQ5mLqaoGMdnSCmk1lKjgZ9eXTeexErm0MTXn8RGvBhmEV0G6Tt
	 NIdXFqU9LuZqlFMP1CaT9OJsCFPjevsFnXLaRQUDJ96QxDVTpEQJgcr9oEeH/zeD/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
	b=E6STJ58u/jYv3HhIdf93vxXfI1/QWBvbKrsuevy4G7OaS2OathnnJ4mk22ZI+ST22HKB
	 sKPZAOb15TfKKCFXt+y62D6MUdNXpBeBCpNNsquYK9LpaHjBLcFYxCAyfAczGEGmPKP0L
	 ZxD7LjOwHwJJFAIB6WiYYrFH6Xo2nXNwVSc0eRQx5w/V/P5ggtm5gzI4VQ+CfWoMeE4hq
	 L5iohR0KnqwAyQ/ibN4Pyq9qGB3c/XtgUSDb7rAVxFCD41JQs6c008wcay9Atq64n9beQ
	 cuVlc6jyLPtG4jcuscsZiVxHBiiQYpuvftq/JEaCx1MDrhAOyjgpUQX+bjckoctOuHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCDrUpQw;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42484606A685
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42484606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCDrUpQw
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8634b4bb1f7so789974a34.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477179; x=1796081979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
        b=WCDrUpQw4KJhHcdJiYxKeYAhc3EQtTDCanAzb9KhDmQ4KMlW9CFOInrIq3rHkY/rf3
         qsLT/dIKBM3mDKz1q09xH4QbdsFwyEyAkCO0w/HwOHCgo60mv+cRPSsR2uD/WSXBks+R
         EEiFkxVtpXXmfo6CwTp7/Utri18E/qzyJ7y+lRWW5NVCtFEeWJ7fSQKvmOq+tA7kqQO8
         ko0Atg3xLk92yWrgmT8n+h+PuV4LQvQWUP8zXy4mhUQUIZjbefCfE4GmrPXixO01fZB3
         FOhJMjlos86mfIO6roqSLPbPiVMPIPlEzc3ulcF7V6OAmZKAqt/XzDvqZqQFQImgWg38
         LtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477179; x=1796081979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
        b=g+TBYe2ekq0P3n22xQyyHP/21Pk5rovf/AbIE0ZOTjAkp2mgYAyqs17l8lRRoURXbw
         amJDn/cyHmhAhdOrUH7eLUhNUpI2sXGOkFvtR5N+CfmMnegN+VBFJDK86acfGGEu9W+2
         Eh67Xuj9UuseW0+qzaSYQyffiF89oBznmLV95TJtVhQPPypn4IY6dyPYoE7Ws0DwDLXq
         K2MWmLfShRvQd0yR0ngHQZoT8PJt7HeAlYt+RuXaIaj+QKKYl9ZHHa6mASS99u5N4e6x
         +l50kcmz4xXpGukxyTy2gU1N3bB3DvzsJdUBdDCpCrltojfKT0we551N6rYWQTgodSlf
         Ly7g==
X-Forwarded-Encrypted: i=1; AL+hErGfxKxnTRfQ71iD5WtDgwwI7ceB6fnyTAYUm9GcPSp/tmvLbeIcS77FZKfIqf3TTPqHUjni4TX09x8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ny24CtUG33urdfv0Ff+XN7IqUuQOTkCwPrN96HIfX4ipDwJIE
	ELZO8H08y948lE839K9d3sAV9p+eDFBy5KfEdgzuKAG4zjaKKSDw0ixMNEKnLwYVxk+9ODIrrhd
	rc8WiPALqndhO9g==
X-Received: from ioi10-n2.prod.google.com ([2002:a05:6602:c64a:20b0:9c7:7dbd:f35a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fc9:b0:573:4ad5:7e4d with SMTP id 5614622812f47-57a0ac2fa3bmr15601210b6e.35.1795477179082;
 Mon, 23 Nov 2026 15:39:39 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:12 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-8-dmatlack@google.com>
Subject: [PATCH v5 07/18] liveupdate: Add helpers to track the files that LUO manages
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add luo_track_file() and luo_untrack_file(), which add a file to and
remove it from luo_preserved_files, and use them instead of open-coding
xa_insert() and xa_erase() with luo_get_id() for preserved and retrieved
files.

The next commit lets file handlers make LUO track the file they retrieve
into, which adds more users. The helpers keep the key and the -EBUSY
behavior in one place.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 0755a6478aec..d51bd75723fa 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -192,6 +192,19 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
 }
 
+/* Make LUO manage @file, or fail with -EBUSY if it already does. */
+static int luo_track_file(struct liveupdate_file_handler *fh, struct file *file)
+{
+	return xa_insert(&luo_preserved_files, luo_get_id(fh, file), file,
+			 GFP_KERNEL);
+}
+
+static void luo_untrack_file(struct liveupdate_file_handler *fh,
+			     struct file *file)
+{
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -312,14 +325,13 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	if (err)
 		goto err_module_put;
 
-	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
-			file, GFP_KERNEL);
+	err = luo_track_file(fh, file);
 	if (err)
 		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_erase_xa;
+		goto err_untrack;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -351,8 +363,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
-err_erase_xa:
-	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_untrack:
+	luo_untrack_file(fh, file);
 err_free_arg:
 	kfree(args.arg);
 err_module_put:
@@ -401,8 +413,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
-		xa_erase(&luo_preserved_files,
-			 luo_get_id(luo_file->fh, luo_file->file));
+		luo_untrack_file(luo_file->fh, luo_file->file);
 		module_put(luo_file->fh->ops->owner);
 
 		list_del(&luo_file->list);
@@ -675,9 +686,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
-	err = xa_insert(&luo_preserved_files,
-			luo_get_id(luo_file->fh, args.file), args.file,
-			GFP_KERNEL);
+	err = luo_track_file(luo_file->fh, args.file);
 	if (err) {
 		/* A retrieved file is new, so it can't be tracked already. */
 		WARN_ON_ONCE(err == -EBUSY);
@@ -796,8 +805,7 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		/* Only a successfully retrieved file was tracked. */
 		if (luo_file->retrieve_status > 0)
-			xa_erase(&luo_preserved_files,
-				 luo_get_id(luo_file->fh, luo_file->file));
+			luo_untrack_file(luo_file->fh, luo_file->file);
 		if (luo_file->file)
 			fput(luo_file->file);
 		module_put(luo_file->fh->ops->owner);
-- 
2.56.1.809.ga0b61035b5-goog

