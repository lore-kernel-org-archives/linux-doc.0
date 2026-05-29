Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C7D36BCDD
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 03:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024874; cv=none; b=VnPyt0uUTqrSHA10F2TvOKGGDhrFlG3652MVhaWJypfDqCHbr5fkN3ouXyIrpMc7XPCmwGVB3zj8/EA06c0VfagK98VARK7jjk47rGupT5864oCqC+SLQIzyzyPqFffYUWUVWz9TVf4M0UemwBaq0Z3npLWd+k3rzjDwtjlmdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024874; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtTWaAgcaVoisebzvXIOzZtk8kY2/0gRf5gMlUSrvfqbt8TjF142F6OdU1pabR/HYyP9WbzE/jVsMztb6S8egyfFgQq4rkMIbhr9u2BqupUffhMMX3i19KA0dpMMu3ky6OiFc5TllXeZ5LyZ6R/xieHlkQmDhLGlFKfBgiYXKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RSUdtj1i; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RSUdtj1i"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-516d65a15f6so70242761cf.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 20:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024872; x=1780629672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=RSUdtj1iv4ikZk0d6urv7HtstgD6B8wERnFfiYZdQj+MW1MUqPbhlN60CyKycnMKuQ
         3DYkcwQFoLw33eD8Cm5w7PMQkM0FvarG4eaht7ZOrD1sDLavojIDMUvYHe3ovvgH/CS+
         +R1WpGBLOCujcJ3iEv3QFy3anm7ggl2G4V26yQ+gs36S+z6nyigN5PZG35+jNFfRbfor
         C6jYT4IMaxNvy0kD0Ayur4QSy06Ujq8mfBRwp02M6oBG2+zcRdKezBIBUoy2jEmMxBgv
         oVm6Xm3ndYcsGllHUhhrPQ55bqzep9mBHSTorDQVlg4MW0F4JSIlUM+fZcZZI266fb0t
         VOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024872; x=1780629672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=qBErlysqMGbSoWFFPfIXYIz++C9a8WV+Qe0J1SLG0m7sl7oGR6F2qymeM3LKOcVWCI
         vNmi+q19f89vOAZNEXSU2aT4VTrPvu1bWcn5VwFWl511yH4KiLYyiC6oQYdOQXmcarAL
         JGifSRKaW0mqsdwKUsCrtc2DfeE3Uh+JshU+ZbDUrRlyqnlDbu4bAqtb+GrdYUOiQL1a
         MpVkvcXlNkDwGcuu/DFUKOg9MsXpU2kGJJe5WbvDiEkon6hLXtiEVdhKPeERUkMx1I5T
         yuTTGkqiYxmr0M9eDI50iGX0cL7Rp8gIsW9ZE50KeVwRNuyUBS6/T95QzqDqz64XOxb4
         Rw6A==
X-Forwarded-Encrypted: i=1; AFNElJ86u+v+IAZX+mjda/V9WBfLMlBHWuobZhcbU1cUFvW0vYaMriD68CF4rp0epAruehL0H+wJhMqo2c4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PzuqWUW5cIcC5mZa2DJBfMkpBcpXhpqrObmmLlw3DyZX5x1a
	W1aVy8EX49K6GNYYsX1924/0ad3swn8WL7hVyjM8XJALxIWYQQLn/cAmEcSd6ufMLRE=
X-Gm-Gg: Acq92OHMG+ZtqAb71abkJFTN9Hsgo7U+hqZ4W4Kr1kShqm8/gP80shUZ5SSQT1Byjc+
	8DPmtVTqLRblJRpOGSTz2dtud9AdRT58JjDavyTZduSorWnbL8tyNv2XIpRVBSG+pudodHj91qW
	qK4aEUENcc6Ju9vxAilEbhRDGe66cAXYcwRuxmuPmfQH3xOpWR5S6hBvq4HxoSva5HIX5cvdpZs
	PsxJl079PxW1q1RSRofgcZE2pL+I4jz/mRaELs8iHZ19/Avn/coNJNcy3BoaeCHkW1FxlmLXF4K
	PIwJQZqfkWx/nFcrSazZVEQmXl/zMEqOst38+W08WRjZqFpObZeK78UDOubjdGNHp07OpPx8gas
	Q3GjHfQtfVmDZJNo8E1mgKwORd2orbzdEaqZYrSoX0bfiE2I3PvYw9iud7qPZoumsRQ1XfbZdF7
	5JSZ9IZGWRmzYOYdRBekf1RNr11hQkeH1b8W+4LL9QX9ONyfPtnTHPLmygLrvDmoG7TJIdvShs
X-Received: by 2002:a05:622a:1b9f:b0:516:9b30:f025 with SMTP id d75a77b69052e-5172dbbc5e5mr13902181cf.15.1780024871947;
        Thu, 28 May 2026 20:21:11 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:11 -0700 (PDT)
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
Subject: [PATCH v3 03/11] liveupdate: Extract luo_file_deserialize_one helper
Date: Fri, 29 May 2026 03:20:58 +0000
Message-ID: <20260529032106.1505796-4-pasha.tatashin@soleen.com>
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

Extract the logic for deserializing single entries for files into
separate helper functions. In preparation to a linked-block
serialization for files.

This is a pure code movement, no other changes intended.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 208987502f73..9eec07a9e9fc 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -753,6 +753,46 @@ int luo_file_finish(struct luo_file_set *file_set)
 	return 0;
 }
 
+static int luo_file_deserialize_one(struct luo_file_set *file_set,
+				    struct luo_file_ser *ser)
+{
+	struct liveupdate_file_handler *fh;
+	bool handler_found = false;
+	struct luo_file *luo_file;
+
+	down_read(&luo_register_rwlock);
+	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
+		if (!strcmp(fh->compatible, ser->compatible)) {
+			if (try_module_get(fh->ops->owner))
+				handler_found = true;
+			break;
+		}
+	}
+	up_read(&luo_register_rwlock);
+
+	if (!handler_found) {
+		pr_warn("No registered handler for compatible '%.*s'\n",
+			(int)sizeof(ser->compatible),
+			ser->compatible);
+		return -ENOENT;
+	}
+
+	luo_file = kzalloc_obj(*luo_file);
+	if (!luo_file) {
+		module_put(fh->ops->owner);
+		return -ENOMEM;
+	}
+
+	luo_file->fh = fh;
+	luo_file->file = NULL;
+	luo_file->serialized_data = ser->data;
+	luo_file->token = ser->token;
+	mutex_init(&luo_file->mutex);
+	list_add_tail(&luo_file->list, &file_set->files_list);
+
+	return 0;
+}
+
 /**
  * luo_file_deserialize - Reconstructs the list of preserved files in the new kernel.
  * @file_set:     The incoming file_set to fill with deserialized data.
@@ -782,6 +822,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	int err;
 	u64 i;
 
 	if (!file_set_ser->files) {
@@ -809,39 +850,9 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 */
 	file_ser = file_set->files;
 	for (i = 0; i < file_set->count; i++) {
-		struct liveupdate_file_handler *fh;
-		bool handler_found = false;
-		struct luo_file *luo_file;
-
-		down_read(&luo_register_rwlock);
-		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
-			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
-				if (try_module_get(fh->ops->owner))
-					handler_found = true;
-				break;
-			}
-		}
-		up_read(&luo_register_rwlock);
-
-		if (!handler_found) {
-			pr_warn("No registered handler for compatible '%.*s'\n",
-				(int)sizeof(file_ser[i].compatible),
-				file_ser[i].compatible);
-			return -ENOENT;
-		}
-
-		luo_file = kzalloc_obj(*luo_file);
-		if (!luo_file) {
-			module_put(fh->ops->owner);
-			return -ENOMEM;
-		}
-
-		luo_file->fh = fh;
-		luo_file->file = NULL;
-		luo_file->serialized_data = file_ser[i].data;
-		luo_file->token = file_ser[i].token;
-		mutex_init(&luo_file->mutex);
-		list_add_tail(&luo_file->list, &file_set->files_list);
+		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.53.0

