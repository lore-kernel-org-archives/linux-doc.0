Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E3AC001E0
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 17:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjGMRGM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 13:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjGMRGH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 13:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681CC2D4E
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689267906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=FJ5UULOH422tP/0ZB/UlTS08v/f5yvx8SY4OCRMZTEeg6E0Qr8f4uxLTP1bhlgXOZ9ZWVt
        IJ+spYxeLBzEAO2s7a2UNrJIP/ZfVk6ckwrSVqRQj8hnlyaqyibxbFUomCqdIFG/EXy3f9
        9zltKQlie+MbtzX0Q+WC8cXFSK/hRhA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-Tzo99O8aM3OfG8hggQ3Oqg-1; Thu, 13 Jul 2023 13:05:05 -0400
X-MC-Unique: Tzo99O8aM3OfG8hggQ3Oqg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31437f02985so675394f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267904; x=1691859904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=LIcEyvqOAeXdBamF8Ka1Rvwbd2f/m5cYRoigk/L0nTSV6/nDTn5NygyMobwNTg3ajx
         L7Rs1JFfTJjSuLDdqiqXteP9KRmJpgghwShTiL/hR0EystyqOuvxxJCjpNEDwDAqkhpf
         49NF0aZzB8gmP+rZ/taK2I0LzbjzReaBcepQFyNY4l3GzjxpsenKdlK8NklIZO1+ZFoO
         oQ8X5qb+KXt39+ohJHC0lyAl8J40W9cq6EkVp4vEDCgY16pKSMEON2dVIi3Z5S/tgS49
         /mswfS8GTHOizyqoYE19BlIZSiZmiO/33YVTxzKp5eCEp/zYYwC566r7zrSOoygw0PDO
         /2YQ==
X-Gm-Message-State: ABy/qLbu6MtFPqCYCme8fnBKTyt+FrDGXBJGkXaKETfVCw9qZ5GXV+h8
        qyeCbQhDQ8bHDbFpnkGSpQU8sszsBq5/KDnhpwRNBH6HHHCeuoIg4IZEgvSKGiMk2sA+OlLcqBd
        jGPvsEr5HwLlBi2lCtQ3b
X-Received: by 2002:a5d:500f:0:b0:314:37a:4d2 with SMTP id e15-20020a5d500f000000b00314037a04d2mr1881497wrt.60.1689267904113;
        Thu, 13 Jul 2023 10:05:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF056mkLn94E+lKHndYR5EU4ydy3QCAICJDC86xIw557hHcn4RjCQJ4RaRlRWXwLJY/mxbcrA==
X-Received: by 2002:a5d:500f:0:b0:314:37a:4d2 with SMTP id e15-20020a5d500f000000b00314037a04d2mr1881473wrt.60.1689267903898;
        Thu, 13 Jul 2023 10:05:03 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id r11-20020a1709067fcb00b009929d998abcsm4194749ejs.209.2023.07.13.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:05:03 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v7 07/13] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Thu, 13 Jul 2023 19:04:02 +0200
Message-ID: <20230713170429.2964-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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
index 45ca4eb98f54..a48f42aaeab9 100644
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
2.41.0

