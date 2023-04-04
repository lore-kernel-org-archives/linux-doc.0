Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E707AC761AF
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 01:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjDDB3X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 21:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjDDB3W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CAB2117
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LKPAKixRboWIVKksjdDd3XWLOGimpIv4cn51ku79o4E=;
        b=hL8BzSEEr9vCGsD6ptm/Ycc/PzCaMWKVPHF7uOPkzlQCjYGo/h7PWYhRQqUxnN5UVly0OT
        izRkqWQrAm4+xYqrh5zbtdbu2YM/qxeXvjmB0XGrK0JP8FCjcMA/nhLq+Yv4aTXmUcNM90
        lbGk7KRUPRbX0cWyflHU2ok2z4hhIlo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-tBW_426ENdeQWroI_Olq-w-1; Mon, 03 Apr 2023 21:28:22 -0400
X-MC-Unique: tBW_426ENdeQWroI_Olq-w-1
Received: by mail-ed1-f71.google.com with SMTP id y35-20020a50bb26000000b005029d37a3ffso7229478ede.6
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKPAKixRboWIVKksjdDd3XWLOGimpIv4cn51ku79o4E=;
        b=t2a4MPS/qdGBLKmTKqO0v4T437uk7Z+cOHhYuHQ2YKbGlJFxzWjdcK9dWiIItGXzIA
         8818vqo9Tw86TqRmXwBFA0dKOu6GTkKz8dALLqA2Jn2JcUUFWk7nGF9TEn4HVvZJ3J3x
         cwm3iiv9iatCUVyOijO09PXyWG7ZX2Ss/o5I9viFhHInJ3NC3L4ObjxaeKCC4Lk4oJq0
         dxxJq3Wv6i24B7V3pc/cYhr/3onisMV5OE8Ih5+SeVTQsI5GdnV0lTBbzX6gMkub4ilI
         zXj/LGbbMD7pEN7zU26cRAmeH8xCv8FzlD/nHssOfqQttEAzFepKJPZCpb7pGcKJRFLu
         b8TA==
X-Gm-Message-State: AAQBX9e2mNDxzW/m39BfAoiLidyktfsmCC6shKcvpLKFUOmlIEf5VqwS
        FkCSU4AxnCu3h5RDsXuwTSEc+gQGDVKiBJDgTpClAQQnkZSSs+KF4hZipmvM4mMBKQbH3e347S5
        88YnMv6m6YpyDafGMipVz
X-Received: by 2002:a17:906:7c53:b0:8b1:7de3:cfaa with SMTP id g19-20020a1709067c5300b008b17de3cfaamr521675ejp.3.1680571701403;
        Mon, 03 Apr 2023 18:28:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bKXBvsLQ358FMlkWLT8DWUxHFmzB6npPtP7ouGx4sEp9lwAApjiFx7erZVjm6I+QFHrVymVw==
X-Received: by 2002:a17:906:7c53:b0:8b1:7de3:cfaa with SMTP id g19-20020a1709067c5300b008b17de3cfaamr521648ejp.3.1680571701165;
        Mon, 03 Apr 2023 18:28:21 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090643ca00b0092f38a6d082sm5159990ejn.209.2023.04.03.18.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:28:20 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v3 09/15] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Tue,  4 Apr 2023 03:27:35 +0200
Message-Id: <20230404012741.116502-10-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..20a7f31b9082 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -130,6 +130,32 @@ nouveau_cli(struct drm_file *fpriv)
 	return fpriv ? fpriv->driver_priv : NULL;
 }
 
+static inline void
+u_free(void *addr)
+{
+	kvfree(addr);
+}
+
+static inline void *
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
+{
+	void *mem;
+	void __user *userptr = (void __force __user *)(uintptr_t)user;
+
+	size *= nmemb;
+
+	mem = kvmalloc(size, GFP_KERNEL);
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(mem, userptr, size)) {
+		u_free(mem);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return mem;
+}
+
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 08689ced4f6a..4369c8dc8b5b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -613,32 +613,6 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	return 0;
 }
 
-static inline void
-u_free(void *addr)
-{
-	kvfree(addr);
-}
-
-static inline void *
-u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
-{
-	void *mem;
-	void __user *userptr = (void __force __user *)(uintptr_t)user;
-
-	size *= nmemb;
-
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return mem;
-}
-
 static int
 nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf *req,
-- 
2.39.2

