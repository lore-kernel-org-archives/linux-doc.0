Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A07EB64DA
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjFTAoE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjFTAnu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A588910D4
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687221786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
        b=XSYBPXPyS1ot1a+3nDML6j77G2uiPFcTB7jzrjg+JFO7I8u0QUfnPchSnflA0TSC4vdVEM
        OV4ZX7DRKToAecyD+5MEO4Nz3sgegexYxtTJrLD8Nib74aI6dTO+0YbTw+OBHVu3Br+d7k
        XN9/rHzeVoZ35GHzkrBV/8Okr9MqmL8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-1i9NhLlHMEeU-hAImIlMdQ-1; Mon, 19 Jun 2023 20:43:05 -0400
X-MC-Unique: 1i9NhLlHMEeU-hAImIlMdQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a348facbbso320059766b.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687221784; x=1689813784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15bsZMHgn8HdtpEj/sQfVUEhkE1KgujwGvKHw17TRpw=;
        b=aDeAwl82pYa/edwZkofuTScKpu2keLPm8vgCsm2wicO+Q/oFhSPLsWOGDBYwFOjTY/
         D5hv87pj4p4yv7660wO0mRzhjftF7d4xuBHSJH2bcy1VBrX/Jso9Qw75fgvqox6ksdsx
         dcmiC/HkRqEqrZy4Y1W++LU6Fc7I3+ZQhDeot7U63lDQu8tLAOEzQjXyMpKksKfRl+1z
         kLzCAbPsPXK5pX98UwVfqSlJbGMftzl7TCAdSjO26HWAa/3KAbl3Se+wkLMSEvIyNuGy
         LzGGYbpM6vJ2uo2DgixQGbEQmfc4HFctCGPAYCZTZ88lnAGIgyLOodkakvhKD7n90v+f
         3E3w==
X-Gm-Message-State: AC+VfDy2XtPceweLZlMfLOcrMpYFRKnxTvtdV9eI7xrUxmtpXJHDDygm
        xyAKvsKqneZNOFwfTpDCfiWAiOIFxGmNPsAgmMbJA16iQo60yfwoImcx9y7+VnIS6cXNYLhJ2nm
        fl5XeqRG/+iA3nxi/vW3D
X-Received: by 2002:a17:907:94c6:b0:97a:588f:766 with SMTP id dn6-20020a17090794c600b0097a588f0766mr10489579ejc.42.1687221784471;
        Mon, 19 Jun 2023 17:43:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c9FPA9PfjnZ4NBX+L5X8JmjHfzdjLxD7tdsztb6oh+Z4IO34dObfIqPL2WWN4l2JkXpNgzg==
X-Received: by 2002:a17:907:94c6:b0:97a:588f:766 with SMTP id dn6-20020a17090794c600b0097a588f0766mr10489556ejc.42.1687221784330;
        Mon, 19 Jun 2023 17:43:04 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id me16-20020a170906aed000b0098669cc16b2sm389552ejb.83.2023.06.19.17.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:43:03 -0700 (PDT)
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
Subject: [PATCH drm-next v5 08/14] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Tue, 20 Jun 2023 02:42:11 +0200
Message-Id: <20230620004217.4700-9-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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

