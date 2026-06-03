Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A63F39EC
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457357; cv=none; b=BkmSg2v+btZok4HOxTJDeV4ddvXBEOkR9/CMVnKag4xOhO0X++lK5t5Gd1PLKGQzu0jhpO/In2vlQPtGAqpDLnFLDxCgHnRzobmrz1Oo8su6nJvf5ebS3XoOEXKMEWFYOc/Xffm7axjwt5LBhN/RCoWWn+K6QKPynR/qGh3NL0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457357; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuBBwveaCHmOFzvEzuL+xz6Sufnt6XeJiiHj7UkM4H2548a9U68uK9wyMfAOlux34+iRCif7gH4ejP+L2vp5ARGIbtuFWRKN+U/kRoyEgKDPb7JM/m6F2mtup/rt/ztBj4DjuZCZNCJG+uzBcaqFueNSU30p8Iu7Eiy2nfcLyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b0UihE1q; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b0UihE1q"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so159335436d6.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457354; x=1781062154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=b0UihE1qbydPBT3aAxZax/HNmDv6aVh/BfpF5M6dC/MZAOl0zPU0b7mtwrkgiPUINa
         faI354ziYU+ZOk5Hu0LwV3ePqC7XGQgwYhI/Vz247YkT2x1xhIaK55Esp+a3dIUyfaE9
         rQkgQR3GWxiyMnVxodlg1jaao+k4lWM3HlNIZiK8JAKIG8x3b5Y1Etnz2lBEi+RWimDV
         WD9fMfzeVvUawywEpwZzOXVaJBduWQtYvtr3H1OMTYIkFysJ3PrEckrVrAtXMuK2sa/j
         w1ytAYnYMvRJufAdGWI8oJFv6owf0QBWAmsOhdjo7iOuQxPKWKnS0BGiA3ZhsT0ko9x8
         PJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457354; x=1781062154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=slXD0o/7WhZ/D4X8oNNmizDti6inQGKDsf21HUNObgnhoX3pnYAMpYifon66rJ0cxN
         TzjLGk2mVX/WwacgjMuV0E2WXh6NGU99MniMpIDce8peL6SitYMZqw3e32JigAaLUn+g
         JxAOgKYsy+J14fMEkD8KcIN1G4PO9NZLQHCLdyNJ+kwwpXUPoPGMPg3cefDgh/76guNl
         A0AeeQkuVYPfQgzg2GGQFXrbhcLkS6xH5yQONFrCmBtzh7gc4Wqonh/DuTVzTzF9IMij
         3s+OuWH+pitJgKoZG5cF5k3RJjN/fvRKlxO71TyJ4QLGV+dZgrwlghMY9jQEl4x0SUwH
         YOaw==
X-Forwarded-Encrypted: i=1; AFNElJ+HZj4CfpzcPBrlmgmkTMyePuRu4pfdCrviTs0W6NxNzym5PaVt8oJ3pBfXt+ikA9C6WnXuCb7tx5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9fqb36hWF+wsQjLLiRx5t/ONYdCq5DEvZdLaFSex79NNBs/3d
	oufYyYgsYQAVQjXZ2fB9udOK3+nn9yBww3MSL5usXZ3amDKudPgk+ieL2r+RYB0KzZc=
X-Gm-Gg: Acq92OF1dXDL50qnB9/j7Xkp7X4v/gn/5dltfEyzACzA/876nWfvu/vUmIjF9x0NQFI
	yYmbQ4lYGo1O8mQt4FhUojcj0w+V2CJQjRM3Cwqw43xnILpjSoMN3kvp0aI0qfYJo+reaERiwRa
	nlSo6/jcpGofJz6g9NZB0Ib5a1/2iCaPOaMBTHkmpVm7wFmelEtYk25dPepuNm1Af9/gf2EyA5X
	MgPJBs5QrRclNlho9bHMzH2Xl/cVWL+8Mc33K+v1f5kHCfKXZPr0TjYOWzTt3OjxBahKeVNknNm
	epTjy1KCRfRpvCsuNh5ahYOnSg82unG1wlajVOINibGOm5MxaHbYsRjF21V3z5zkYxZ8WJEIj5Y
	nyhcTAU6whX8D3Omt4ReqbSD2metPuRbUdloQzOa/C2InyevHHFZ7zFyOMJOlvOnC26tpIhv3R6
	csYBq2w4IZ2VhddyyzS+4iyIt/Q7p/owrs8mQhCTPcH0AhmYH1Q+Ut+/bkN7LwYw==
X-Received: by 2002:ad4:5be8:0:b0:8ac:b4d5:50ec with SMTP id 6a1803df08f44-8cecdcc5dd2mr23007136d6.38.1780457354509;
        Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
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
Subject: [PATCH v6 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Wed,  3 Jun 2026 03:28:56 +0000
Message-ID: <20260603032905.344462-6-pasha.tatashin@soleen.com>
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

