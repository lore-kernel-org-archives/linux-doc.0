Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0336C001DB
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjHDS0a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjHDSZe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EC34C34
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
        b=EfTrG7fUH0Cx+H0Mgx+2C8stlvzpU8awrgnRmY1HUu4dtSuPh4eSLUlqK+E2MYjatZwKc+
        tj55+ZwsHkeb/wLofDpJ18kBMS0DcajFoF4Br8my5rf5BA3rG3qRRJYuXG2OkFOdLZQomk
        FVSksCF/gB/h+rL0ebG+rmlTF81VE4Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-U6Y3NooAPU2L0QHXpyORjA-1; Fri, 04 Aug 2023 14:24:39 -0400
X-MC-Unique: U6Y3NooAPU2L0QHXpyORjA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-521a38098faso1574947a12.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173478; x=1691778278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sILSYR0gnJ8A9dpqcei0GUdx0191p3j7ECPYiYKPGLY=;
        b=d//thKQZKY7XmIoejJH/09/5btme8XEnJapwIVG9q1cGAvtS1r7Ae/2OXPoxOevt/J
         L2DYowlKZVvNceUKBucafcKNqxv0QXgYW27ozr4KmAqxWvRSvOSnEvf8dNS12CXsQi3j
         I8B7qCWaT2rwcs9KwU6f06NWmnE1K82LXn6+yMt2dvkid0DoJXmyRHZReWTosg1/8Zxd
         ZXccoLpgs/d2tSXk+N+5wQyaHreAniGCG68AF8FjFI7Q3hH3mc2gqWKBIl98noIarDBh
         8YERIDsbzGJSewTTbh167VQJJmwdIew3lkzkm0mpuXatrumH5kno+ZaZ0XPHsCW7IwrD
         T1qA==
X-Gm-Message-State: AOJu0YyFXMJS8vdOjITzfJ7JWKCYpdS62fiUzG9rz0FISH9RcP1ea23c
        zPsOb8J/BGj5Get9D3IeHqp7zPdm8ryvo7kaH0VgYUR8/tNWqW0jNe/u9aD1prBpoj4B22d4w7l
        8pK3TJ6NyCG3uC+m73qSw
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id p8-20020a056402044800b0051dd390143fmr2168714edw.5.1691173478709;
        Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAdtc3GjLhkVTBVp4UpZhrnZWEfIc0NqlSy8j8ZyVB3ZFGvxmr6W4of3EQqVmArV7n8nDbEA==
X-Received: by 2002:a05:6402:448:b0:51d:d390:143f with SMTP id p8-20020a056402044800b0051dd390143fmr2168702edw.5.1691173478516;
        Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id r6-20020aa7c146000000b0051e2670d599sm1570383edp.4.2023.08.04.11.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:38 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Dave Airlie <airlied@redhat.com>
Subject: [PATCH drm-misc-next v10 06/12] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Fri,  4 Aug 2023 20:23:46 +0200
Message-ID: <20230804182406.5222-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the usercopy helpers to a common driver header file to make it
usable for the new API added in subsequent commits.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 81350e685b50..d28236021971 100644
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
+u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
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

