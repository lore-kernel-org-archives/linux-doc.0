Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB0BEB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjF2W3N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjF2W25 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5808735AA
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=cQ2zgzvuDeDulqjeNjCXZ9RAQhFqbi9UavggY4SYd7hyCXPZaumZEJan5fKEZwFT3L4Py3
        TCZeWo3XMRS79Dd3dsIxzdfxjhq4/7nLvp+UP5xFVdvxs4GS8XUq24970oxeAC8JwoOMvx
        uH98XZxEkETLs0rFBWDCtLcl3ojT1ec=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-aMTCaxsgPdyDxlK-rEBHCg-1; Thu, 29 Jun 2023 18:27:28 -0400
X-MC-Unique: aMTCaxsgPdyDxlK-rEBHCg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fa8d203eccso5402295e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077648; x=1690669648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=biLuH0xutvwXB5akwvxDdMrtrsfD/ULuVMoEFb+rZqpQNwbRIEo4fEiXG67AzbOaeo
         3a6/hRrY8Gss6wsKrRG8b1HIF4j51+SiL3v5x6HXDT4Q90x61ZCO34cwA/hZapdsTxJd
         LX6asMxo3vomgw6QQ+x1zFNvPua2eio/Nrc1jW+d0Ds0JfAQOJrrohZpCgzGzebqXujv
         +BWqDVmg53qsZhuUN3t0ZAlbeemNzvwCe1R9tywKSBVMNtGVPqz9tFjuk/YP3MiHAWau
         YybbxTw3q+RIH9gSCgVQU0rwNJfXn0AJWIKK7DngA/eMfND8+cQAaNxwtgRS+nTPIDv3
         GApg==
X-Gm-Message-State: AC+VfDwIZ7suY0oO6JVo0q9Acwfq5lNOeUP9/e/k1axy4EXk+XhEqDo1
        4BRr7JShX31P2nZrbjoEIvoopzGXxzvl17Re405M6bEGSnVAiWAZ4K1QCCslkqlV/oGTvTjI9k2
        a8lIuM6VQQhIArO/0O5fZ
X-Received: by 2002:a05:600c:4f8a:b0:3fa:821e:1fb5 with SMTP id n10-20020a05600c4f8a00b003fa821e1fb5mr6128648wmq.5.1688077647921;
        Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wpnqgs/z7hJJmbtz3VdpkoRY4cAoYdS0461hyKBm1gdSunV5Xsq2eBMdCyeRdOWG5WL3RWw==
X-Received: by 2002:a05:600c:4f8a:b0:3fa:821e:1fb5 with SMTP id n10-20020a05600c4f8a00b003fa821e1fb5mr6128628wmq.5.1688077647669;
        Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id i3-20020adfdec3000000b0031411e46af3sm3704409wrn.97.2023.06.29.15.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v6 07/13] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Fri, 30 Jun 2023 00:25:23 +0200
Message-ID: <20230629222651.3196-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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

