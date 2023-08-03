Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462C9EB64DD
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 16:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjHCQy1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 12:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbjHCQyZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 12:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C25B3C16
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691081593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eLzavWF6HUG+3GGQgH2DTq7sDOog3ykOR8e7MsGbNA4=;
        b=iOzUTQVQfawBYLlyvNVHHGIs7bxIv6Gk+twELaKFRRM0SCzecp3LWDwsbPd0myhl/ZuKZy
        zuYprgh/mmNVSeYctxBKoZYCHOTanpfgU43WsjdMcw4FrDw5Kc8zfFbFATbszsxfEVitOE
        BPeuKnuJajBinBWPL1fqMHtOzTwjfGg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-pjGNHO6sOX-OqYAJXIlAAw-1; Thu, 03 Aug 2023 12:53:12 -0400
X-MC-Unique: pjGNHO6sOX-OqYAJXIlAAw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993d41cbc31so78315166b.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 09:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081591; x=1691686391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLzavWF6HUG+3GGQgH2DTq7sDOog3ykOR8e7MsGbNA4=;
        b=Gl/EqzT9h1/oiJWO2AmE3DMCgT06yX211Yql/pvTlEbsdJO6kFGGwjUKCDDmxFocwp
         YKz/gqhNa64XX6Cku0XzHKZUFwqH9TBoyWC5KELpbUtvjfRmIsIj8wEXwlTmcc7Q8xFo
         azq9ZmYuD7llvcXs6IkdQI9ouWyrBxZDxj+YovpXXerwU1g8Q6bU3Xn8xY0Q0Iut+hZ/
         sAe/LzV8K1ZwLFMXxa2S2kfiO4xpdgeilJfl65lF3LCfmcXruXICo6TdEqiex2s8uoWm
         D7Pw6IhqClC7oTbfFj4UL6cyEHa+H5GSWcd9KUK16Q30kjV9meR2Vf+Ic5xCgLo1+IY8
         UstQ==
X-Gm-Message-State: ABy/qLZ98PQZwQqt/kNoD+qruKbheCZnpvtDlKg18LWE+uCQalcaQwyN
        ukN8GhCzJ41T3kzkHycTvm7QpQve8H2HG0TgYWIZtl3ac3u/YXMowXIN5T6yNae82FWEkK6JFTu
        qwWr4Tlt49WSu34vH3eXH
X-Received: by 2002:a17:906:73d8:b0:99b:de2a:d9a6 with SMTP id n24-20020a17090673d800b0099bde2ad9a6mr8157549ejl.41.1691081591074;
        Thu, 03 Aug 2023 09:53:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH88VVUyeljJh/RTuLjx6dMZVKmwPisfXTau5q9VkuIQhzKoeDHKmSMdudiTm0zRh3+A0gk6w==
X-Received: by 2002:a17:906:73d8:b0:99b:de2a:d9a6 with SMTP id n24-20020a17090673d800b0099bde2ad9a6mr8157534ejl.41.1691081590887;
        Thu, 03 Aug 2023 09:53:10 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id l7-20020a17090612c700b009937dbabbdasm61145ejb.217.2023.08.03.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:53:10 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v9 05/11] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Thu,  3 Aug 2023 18:52:24 +0200
Message-ID: <20230803165238.8798-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
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

