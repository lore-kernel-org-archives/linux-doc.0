Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD6FC7EE2F
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 22:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240006AbjFFWdY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239947AbjFFWdC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 18:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BD91730
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686090734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
        b=S0uPZFGIvR7b+Nu0noyNpwlfdiBn5QHFD5087kXnbJ0wsjuSMk7B8FYjHccqet/2A8TU9s
        h10e7mbDuX8BhHWdCdpUMgiqzFGbFVd7GtlVUKzZRjEF/82+lSj6SYmcQNRpPo9k67kHPN
        753mK7skSfX50Tp8TAgCaKf9t6JAp2Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-gO3w97YpMYmrzYyo0fzIPA-1; Tue, 06 Jun 2023 18:32:13 -0400
X-MC-Unique: gO3w97YpMYmrzYyo0fzIPA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a356c74e0so491907066b.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 15:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090732; x=1688682732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
        b=Mpc/XreyUFCbIInj0VI8PdiwxmNWcHlMnnT0k+L/UxbZ1eqHIzi5IdhqLGj5qkcpvv
         MNAsoac5pDQTXvgjRD5OCB+qpE39Scstd19c+DrZaNrGUenbz0URPFuFZiYpm92QUFcu
         DaG9vf8lVQXYj9ktLwBtB8u1o9RekYBkkFozfQ3LUe0O3uUvcCioEGNvkGeaYsCdK5LV
         /z2vh3wibJrE0/WC+RBs5rNc/hnBEf9ISQbkm1ltVox6L4s3NMhp4ECWgDSLYtuFMid6
         1+cDRug4HZXJWnQ3oyfxfPvpTfpRVp4glhJiLgMg9tSCAFu2w+WZAtO+E9HEZNdlF3QL
         ROkw==
X-Gm-Message-State: AC+VfDyaCzDQKwhV0u3hbJzBkh7C4OYfHHcEg0CMinUgqGYFcFWWK1tF
        zhiLfAOsA53/neE+vz6F6Dc5qyTpM1Qc33z5T8Ted5ICaWCiTOCf6Pbeien+pyiYNYYX4w2qn02
        ECenTpa5e1nh/vOp14jX3
X-Received: by 2002:a17:907:16a2:b0:971:eb29:a082 with SMTP id hc34-20020a17090716a200b00971eb29a082mr4378747ejc.49.1686090731979;
        Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77wuF5laRMd8UauVtSJvlbhuOhAjTpsroGVkxnZ20HQdV9jjMT18xE+CzMmaMjweOX7gL+XQ==
X-Received: by 2002:a17:907:16a2:b0:971:eb29:a082 with SMTP id hc34-20020a17090716a200b00971eb29a082mr4378734ejc.49.1686090731833;
        Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709062cc900b009787062d21csm1186055ejr.77.2023.06.06.15.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:32:11 -0700 (PDT)
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
Subject: [PATCH drm-next v4 08/14] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Wed,  7 Jun 2023 00:31:24 +0200
Message-Id: <20230606223130.6132-9-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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
2.40.1

