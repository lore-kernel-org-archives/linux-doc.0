Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E186C001DF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 16:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbjHCQy3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 12:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbjHCQy0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 12:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500A42685
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691081589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=BhACfoXOLr58HYuvDZx52U1zxqr+dNxVNEqA7CFFlZNGwrJ7ZR4EkirM0tzyJ28eHD+cfm
        SfuvGFacUtXLOqo12xpXA5eBLcOI1KDhrR7catvBrYV7Q9miDt9pok1pSzN8haddA7d00P
        PcJ4q2HaHeUlvVhXQmLVGbihDOfSC1I=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-ZGi7BueqOXyKzdmpL6AWWw-1; Thu, 03 Aug 2023 12:53:08 -0400
X-MC-Unique: ZGi7BueqOXyKzdmpL6AWWw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fe356c71d6so1285206e87.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 09:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081587; x=1691686387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=FpBOtWKgWViNc/m9I3ksR2ZRxj+j6nGc0rzPeMRACONt22ajOSEGBOaZnUgRm1cxIw
         KtTN2PqaQubB7N0RX0IWdIpuX/yqoV3D6QrhuT/iGd6L9auaAmmx2cjFnj8bNbThFF6w
         ETNKLPsfW9yRNDKSEpv0WoUradxCpBqVl0z6vACCp3Vhk2IN8RvfpSndbE/xPSXtSsW3
         mUkiz2b/AvMVZdcjoLJ6tpu2kKvStlBLiXYiHF6P/3Y3S3OBKF3mG03AMhfHqJsuFGru
         KcU96FfElHYvwEkkPr5/GslnT6rAIfYUsODu2ypFYGX7Iocle+i6hOP2AnFv+LKJt6YZ
         iUlA==
X-Gm-Message-State: ABy/qLZxbxCdT33Dr6E7NZ7fqp5Y3W49UOP+ftpDntXm/k7CX0qKRUlh
        f7HDtJ/FEVkQVnEKyPfwbFNxStaoQATeWdVagkax2TOdoSf0w2MmdNFWv7SUulfvzVCK+pTLV6l
        qZn08/aDygjIY0QeOeh1a
X-Received: by 2002:a19:711a:0:b0:4fd:fad6:5495 with SMTP id m26-20020a19711a000000b004fdfad65495mr7235999lfc.18.1691081586837;
        Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXIQ5nuEebS6pFgxdZ4ILhQ7gtJ6jmUdOaptyWQGI79utid5mNk79IJm44KXkVJNzRHhSXKg==
X-Received: by 2002:a19:711a:0:b0:4fd:fad6:5495 with SMTP id m26-20020a19711a000000b004fdfad65495mr7235974lfc.18.1691081586341;
        Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id z22-20020aa7c656000000b0052302c27de2sm36537edr.10.2023.08.03.09.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:53:06 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v9 04/11] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Thu,  3 Aug 2023 18:52:23 +0200
Message-ID: <20230803165238.8798-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..057bc995f19b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,11 +215,14 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	/* This is confusing, and doesn't actually mean we want an uncached
 	 * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translated
 	 * into in nouveau_gem_new().
-- 
2.41.0

