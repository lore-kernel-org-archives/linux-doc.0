Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6522AC77B62
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 01:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbjDDB30 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 21:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjDDB3X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A98210D
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
        b=ZDjx9ncI8ASj3W0+uqJNehFXxm9dR3x4iOl+ZYJKY53y8145N5TTeIXiVKFpp9L7cp71LW
        I3Ycv2n4Uxx12WfGqio7wNgeoCzMJa4vwo6/rAUzyn5J3A35VGmGpzWIe4GNy0wrkjzJSs
        FA3EkqJdbja0p+kR/cE2ZJDbfQO64L4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-qLQ0pgwFNC6iu71KLjlAxA-1; Mon, 03 Apr 2023 21:28:18 -0400
X-MC-Unique: qLQ0pgwFNC6iu71KLjlAxA-1
Received: by mail-ed1-f72.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso43743360edb.19
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
        b=X4xsYoCUv/D2+eP9Zyq1PbzRnB06Yjn17IVqFT6ljKlvWMcXtzAtW/pXpK46K6xEJN
         kAdqqdo84uL5OBNGSv0o6zmeDD5RXA894syMRA5b7/wpVlHLTJzzqBjwFTmCD/WfRJl2
         2/+8Lfa1bUrFqJkAEhtY7dfpfguKh2aaU/Y+xsaf0+VSP6fZCilvEFxPVGIDD9WPbUMM
         Ggsw2ccW7ZBSLc/24ASSpZvBW8vXorntMFYiNZz6Xc9ivLb+OFT9eu80G2Yy0W+j/JHh
         yUxllZydPAeQ5UFrnHV3njapvD+t+50mCi8c0pYtuY5/porCVCyYmy+4L+b0BvK4rSyg
         2h/g==
X-Gm-Message-State: AAQBX9cAitOzPHvXYpiBfMIGyIRrDrgvNVd2jYRz2NCgMyrWoKTzLnWj
        P9Qa87NF+/iE3FPJ5NcgEsDzNWNZgUV7g1w6+uNHOQN/6Np8RbcxEIkXF2TJhzc+vx2F8Cf+rlu
        gTKCR/Cq+nlKkL3HUtE3wxyv5k2hg
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id h18-20020a1709070b1200b008c3343924d9mr549204ejl.24.1680571697342;
        Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bOuZVfqTuVyFepzGmLZe0Dusjy763ib39Sg1Hu3aDle0xx1it+4Dx6IGT3ClEiv+jGPdjVUA==
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id h18-20020a1709070b1200b008c3343924d9mr549180ejl.24.1680571697206;
        Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906384e00b00932fa67b48fsm5210797ejc.183.2023.04.03.18.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:28:16 -0700 (PDT)
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
Subject: [PATCH drm-next v3 08/15] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Tue,  4 Apr 2023 03:27:34 +0200
Message-Id: <20230404012741.116502-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
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
2.39.2

