Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D8371056
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179596; cv=none; b=fi5LPdWblUMlhkPWR5lQfGTrIxdIwjcuP9ayc1KNs6nbyJCiXyohhzmwGCd+jHzVB4w/V3/dG1mT+uHaips+mB8hVrcvpYJqBPQuLVj/xOMY/fh0m0RE/q1pX8Jc/IDxcHdwCeFQTivVWiMSZArqXZFXpil33fiKboon3gWnwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179596; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uosDtpryf4NFfKCLmlMLdcXl3fFaje3gxkL/KCmFS6lTu9iVzcNPWStXhXoNSpMuHGMjchPX/59S+I/EMDIf1SFHNoQdUN1WDqKkdgyYBqqn1t5xInzb8x7Kaha9jmRoF6kuX3FPjqBbSkdB+n2FC8ohrOz1CMsqoQ8v5zdfayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=B+cCay2m; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="B+cCay2m"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9154ca1aa1dso53041585a.0
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179593; x=1780784393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=B+cCay2mH6PBBLqoGu+xg01ymvomz2Tj48fXNn2ZFptH6Hz6gjg8MbSHIq+BP0zId0
         KCyh/Kyo7Rw+K1FDSyjtY/wd3O3hOSWYkpu/aXVpq7hkiFd+zCcVEexRSQZOFH2rda4X
         9hx8eZNKmLyafLJdjgfsZv328I0B9a7TGlHwcMZ2pcrgB4cgDpfkdexSzxmzFVxoXo2s
         2pHmWf3oeGdOcbUZtTC2ERFXKMWbJ8OqbSGVKSfISoRQDYiRWXTRYMU/UO2L39FEGyrK
         xPvDA8pKtVH7NfuZXAeQU/oJ5ZwPn56y7NQVyUSZUUcySWgdLv/SUDNs8USLS4scofKg
         gAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179593; x=1780784393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=FCr5jLD9q16IVrXl5J+fx5fQaIw9+Uqs4TLQ3Fn0EtDa2fWVGCddJbOaHGn48Artnm
         FDKvRTbf6fQXjhkoxcMeOTaKlVoUFgZCnbCtVM64r5kUODvxYF5DlkFiG1JBd+fyjDaq
         uGv9jV4z9gg4ZdLJx1iy8F/PjgzVglzijFxahBpPbxsCh6lwrGPOa/e5Ilqp+Y8cKTJc
         /UHI2s01rSwKGtnKSIqQ2l42zTQiUBrtL19O2oIKd+aJSlC/CEgfv6OLQVgNBH6cxiz3
         nEXh2ItVqZpGiaxwL0po1KifIbPvTQBL65Gf3Bwy7ZGPUPoCZeI3LqhO7vZ86/R1CZKH
         CYOw==
X-Forwarded-Encrypted: i=1; AFNElJ+mMOd5kuPfSinmFPprgOdOrTLycu1/yL3QbjMg9BPvNkNDczdtA6ybZ4PmvyE/r3kSNiuSAVuPlac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0akHHDPu9qApW7rQlcrxar21TVSnrElYCCOPKQz6dFLUOnx9
	BIzt7AmdjnuVntqlqYd7GUlmHleO+vU3NFupZPJcfegt4Mj16/HtOAt2SHD0IhZSjIA=
X-Gm-Gg: Acq92OG2xybDA9sab6qs/i/3HJraeu0H5kD57kw8Yo71ZAQoY5kRO3HGwL7+q/AhZCy
	ps7zLawzvr2zAuU8PrWFNrmbAgDDu+Jw/RVqdCuv5yFfFbFVs+iXzJKrt98cYPyOn94i8NwQj0E
	AVCEYwzg1wCLfjOLJmDOL/HnQmgcrrBH2GY2py4bUNESqwg12Ww1POkLguqF5Polk8nEpbMFXqN
	fPAO9ULwHg5tJe7YclB0umjUqwoyEnhd0maDtzGIJ6xpdwyUYxqcRN1JENfMzDiUTihNb56m6v7
	knpvhN2e4Y/Y9MU2e6rGP5q5EKktJEM64BsFJQXREKZIRStdgqoXsPKj5UD0P6M8tr+rQU47QPy
	94ttnT2ulk5IeMGMKvTHF4LKCPYfNM2gQPr0GnCaANhVf8qwmc3pkwFcazfu2OUVS2xIieGmb0I
	dCk08GLSKNaV6XxBau0nSmWtwQ5yQbYzL85RX4erihkHs6Eyd2PujKrQFRBOFWryHSyFTASnnq
X-Received: by 2002:a05:620a:2697:b0:914:b4c3:997b with SMTP id af79cd13be357-9153decd84bmr587250885a.1.1780179593182;
        Sat, 30 May 2026 15:19:53 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:52 -0700 (PDT)
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
Subject: [PATCH v4 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Sat, 30 May 2026 22:19:30 +0000
Message-ID: <20260530221938.115978-6-pasha.tatashin@soleen.com>
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

