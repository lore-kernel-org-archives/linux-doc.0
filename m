Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FCCEB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjF2W3H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjF2W2v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFB5359C
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=itVS9kKswsZozTIJSiCxUrJCjNUzyOZjtY59wPxgv849BVdMFEEcyXgjUSi++hgPOf2GZW
        +fiEFz3ZNeU9DkwBX154PdvYIqIwVAV5NUyOD6mM/YwYyd9zMVfURrVOouooADHDfgszPe
        cKew5guGtaGTEV8hUg3X1u7NXDantRQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-pzwADm1ZPcq_7SzY1A4Lmw-1; Thu, 29 Jun 2023 18:27:25 -0400
X-MC-Unique: pzwADm1ZPcq_7SzY1A4Lmw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31400956ce8so607246f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077644; x=1690669644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=Q7klxTBkYLNCTvZketonQbKBu/DFkDbieA4izVPH66Y9y9Vv0pquFjCCHTIXYNbpvY
         rPywxRk8PoV1F4uyTT06Yh0c5NMG/XkFy6LEaHMJ/eDJuTlDEJH3fQhm+wVjlM978fZl
         jmYR17deNaN/tp+gjqk25g/+Vl9Xl3/2O9bWnhpAXvADJ3hRdIXTTO+RfJoLCOtd0/Nl
         GB+fD5KDiyAjQ1APb7LkiDeCMf7BFYXEsU2tTdYCTaclF3ZslT316M6XwxJmzTxsBuaG
         2IV354XmVD60uUw4hLeS0Qah41eBmQLX5AgHIsTQokPEbzwBFEZ2QZRzP6s4Drd+FX5x
         0BJA==
X-Gm-Message-State: ABy/qLZ6L0MUfyz1MaDvCZNJufHrXzqzn94Wy5QPSnb6OLtDz1+H2+TD
        lCDiHFPNWoEus0Hr7ZAjbLCdhjtpwI64CLuy7qkT2UORBpNsyrQJjh4ubG6D5hqD7BMq9LcwO9h
        y/aCMwNErfTJroFsEA9fK
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id y4-20020adfdf04000000b00313eeb3c57amr712058wrl.15.1688077643960;
        Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7GyWmtfFzWGI2T6+X0GNR2UPFhGUrcAEJPnjYpUD/fKQGW/GRkOsPdyF5/34TvCU73KOwJQ==
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id y4-20020adfdf04000000b00313eeb3c57amr712036wrl.15.1688077643775;
        Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b0030e56a9ff25sm16660739wrt.31.2023.06.29.15.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
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
Subject: [PATCH drm-next v6 06/13] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Fri, 30 Jun 2023 00:25:22 +0200
Message-ID: <20230629222651.3196-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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

