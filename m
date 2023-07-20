Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BBBC0015E
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 00:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjGTAQn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 20:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjGTAQm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748962109
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=FZQfR15xcxP+zi1nKdxQP+4lxWV30MWNPusGuSFjoYQPFcjaJgwzBerMNdL+OipnBjiNso
        RQsEY8nf4pFlh7QBv0ZWXq7nWtZxBhtr5wBiRFnT4GjzTHQJkA1cP0Rt7ezOcX2/G1frbd
        1mIXskUdDSxi6cDrJchZwpeRBmOTE94=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-1Z0u4wKWMleITWQ31zNmvQ-1; Wed, 19 Jul 2023 20:15:23 -0400
X-MC-Unique: 1Z0u4wKWMleITWQ31zNmvQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993d41cbc31so17264766b.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812122; x=1692404122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEv7G0CEYOPGW2iDjZ4bQ7xPP+mjrUkHdLemyMCnVvw=;
        b=bzn1H7Pd4TkePXd0J48LvDAPUx96ZYjxIreLdkuhMOj7mpUFaMiPZY69cc5QckaUtn
         DsGBhiZb+UJjV7mk0/+iF+5KR8oRsSkk2rzJfwxvR6CQrmQMlWnpFhYqxTog5QbZ69Do
         u6LYsbBV4X34RGxiFlV/A0JNItREg0Nepy7g7/P+OurcMAroU7S7nL2rLraSIxhkyIDh
         Ywb+ylIHZMpv6xzDmQlOL6iNoupasQRI/itCklAXcBQU5j/lhusat2ozJSWZMOvMVdVq
         VGe7Ymw4T3he+OV9WzBiknTa8lLMiSCsFqzDSKbIPmz7X188PMilXYi1HdIoj3HOCsyd
         hKOw==
X-Gm-Message-State: ABy/qLZQmrP6PR6dtIFI6y+dfzZyugil6kosb6kgBOiYNZ/DDWqOrk70
        N5nRorEHaOq7d5MC4L8nWJ+mynM6bPSGRN1+TwOY/KVMiukUN0mnAXv4hCEjZtuCGivFhfsD+fQ
        qIr2ffH4TFSKhtAhjP/dZ
X-Received: by 2002:a17:906:5352:b0:98e:3b89:5dc6 with SMTP id j18-20020a170906535200b0098e3b895dc6mr3910222ejo.48.1689812122312;
        Wed, 19 Jul 2023 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHxaasfKFWWON1nzNJ4kzWElBpJTi1OMBEArQvRE1Im2F4zN50mka71pGSvPS5ohPVp2XGgNA==
X-Received: by 2002:a17:906:5352:b0:98e:3b89:5dc6 with SMTP id j18-20020a170906535200b0098e3b895dc6mr3910200ejo.48.1689812122115;
        Wed, 19 Jul 2023 17:15:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906694800b0098d2261d189sm3028814ejs.19.2023.07.19.17.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:21 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v8 06/12] drm/nouveau: move usercopy helpers to nouveau_drv.h
Date:   Thu, 20 Jul 2023 02:14:27 +0200
Message-ID: <20230720001443.2380-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

