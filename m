Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F013CC004D4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjARGed (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjARGZU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:25:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD7530F3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
        b=KFCCyAuUkROg6JOn/rb0Qt/gLpoJ2PE5a/REgAGDSuMNYSo6Jf2zyY72Pky1/LaVtPZKTA
        IKBuNt6WnBlewpU6/qCQzmiyaTq5hoQ+UeI+25Md6cgtRcJQEF7ZI1iCNctgYZQybuz9cN
        g5bzGaQcLq182QaT7IsGOsCpgWWzHG4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-BDW7GVqqNqSupcmnVONA8A-1; Wed, 18 Jan 2023 01:13:58 -0500
X-MC-Unique: BDW7GVqqNqSupcmnVONA8A-1
Received: by mail-ed1-f72.google.com with SMTP id m7-20020a056402510700b00488d1fcdaebso22654408edd.9
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuIA/967bi8fJ2s/oMp21AWFew5v50JdzBzuNFK8Osw=;
        b=etlrqW9JwZXN3Olbqf1eykOakiPyoLwY8Beb5lyEYu46jAAMnVkc5fiLkWwRCJn32P
         aWxws5PC/V88Pideafg008S0j6ecIUQvxJ2texhLu2+MWGRABtnR/A3DjpquhvUWwLYE
         MQY7lzhbce5vftzHyHd2m2gjCZipvKS0iqnvMlbaB3oZXwfzgc2BTpP1u67AfGqmIxSJ
         Wx2PMPNsZozjkvT8fwi8ao6OcNacspjRryapFMzbQDSa7OjA2STXXdb75sjd7HbEV99E
         sI//JrQhjJd4c89FkVWYc3cO+jDuQfTmP4Kn2dUgVH3rma6zf3Dk0oy5gg2tVXQYK/TK
         WKKQ==
X-Gm-Message-State: AFqh2kpf0uGJNn8hkNrKK1mI8BMWSO1ZBADCtZiTwQ1Sbypx7POdSxcI
        0YhA8HZAoIhgwIP2VvX+E46ZsjzqyhGEWvgLZY9sigVuKLUELiyb7MdlAIxugFqZhhje+cgu5O9
        ifxnubSSMHKSTVXBo5PKx
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id k9-20020a170906054900b0084d3822a14emr5532740eja.64.1674022437316;
        Tue, 17 Jan 2023 22:13:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv86GpSfYd+wwTGTqkBFiIhaFIdaUkZl6RvjU2Bnz8b7FM4BmyUqqqu3yOGXwZAwyOl/axmZQ==
X-Received: by 2002:a17:906:549:b0:84d:3822:a14e with SMTP id k9-20020a170906054900b0084d3822a14emr5532728eja.64.1674022437107;
        Tue, 17 Jan 2023 22:13:57 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906300b00b008675df83251sm7184811ejz.34.2023.01.17.22.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:13:56 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 08/14] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Wed, 18 Jan 2023 07:12:50 +0100
Message-Id: <20230118061256.2689-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
index 48e6ba00ec27..5dad2d0dd5cb 100644
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
2.39.0

