Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBB5C001DF
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjHDS00 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjHDSZc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE0F4EED
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
        b=cqrCIuN9WrqKmQzuqf8/N+1GCEgNJWvPj1CF3QOWTcHlv9G5LIL8BL6Ux+yyK5lN4jTsk+
        7MmSWIcg4IBJcORNIrZiSjawKuINVNG7qo9hOGAGMXT6HvGwDl6+gHTEqVUMJzCfMDZhbB
        T7xW/y1gSjnQ9DPz2xPkGJMQ17Ey6K8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-0Q0F2v6WPhCqVmXIwb5eCA-1; Fri, 04 Aug 2023 14:24:35 -0400
X-MC-Unique: 0Q0F2v6WPhCqVmXIwb5eCA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99c8bbc902eso90240466b.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173474; x=1691778274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
        b=gq9it0mvs6I/lpXtBCxuGcCd7p03vfBYygaDvCu0xHSk7Yd5M9krXd+UrQHXRr6kjR
         pdLG710l/9cmZdsFWmKVCwJCW4rjAMaoQNMUv8Gb6zO5PkHTvLoZoUWLasrScGZkf9/7
         85quo0nuvyJAOnrDxQuVHG7Y2Wx86vGk4Y4KQIzrB1h4FT6GPkqOueFK0SwwTYbVX5ct
         AyLHdof8si9iLMXcSA3oe8/Gp7xQ7WeSrWR2twRqIgU2SP3hb9fiC7WrWzZbePBpFzsm
         OROB188PyZhBb6pUPAtivCUDlrpF+giq3e95Fr54RtOgjF03sQNabHHMfsNL1KDCgTdo
         zgSA==
X-Gm-Message-State: AOJu0YwNJ7tIzTSK1kBy5ROZSoTvh64/EvlPf6jQS78WR+VHgWi7QfjC
        DvTZEl8C4Db2LCGuDVLzQbbwRB8MHVHhXONM7+e6/3cd/BPB+RbB17nXtQzctVRZMbMShCjhhHx
        CzJv2Z9ehCXJrwZekOu0a
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id my28-20020a1709065a5c00b0099b65fae30fmr2089704ejc.1.1691173474210;
        Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEryZP9aoJVNn8MC19nvMnlJKcLY3kuJDlB/w4c0Aec7ZI6lMZWBxZ3bUEK2krqN5p5MUOQw==
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id my28-20020a1709065a5c00b0099b65fae30fmr2089692ejc.1.1691173474066;
        Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id gs2-20020a170906f18200b00992b71d8f19sm1643966ejb.133.2023.08.04.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:33 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v10 05/12] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Fri,  4 Aug 2023 20:23:45 +0200
Message-ID: <20230804182406.5222-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..6130c99b6b2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,6 +215,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
@@ -339,6 +340,11 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	dma_resv_init(&nvbo->bo.base._resv);
 	drm_vma_node_reset(&nvbo->bo.base.vma_node);
 
+	/* This must be called before ttm_bo_init_reserved(). Subsequent
+	 * bo_move() callbacks might already iterate the GEMs GPUVA list.
+	 */
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
 	if (ret)
 		return ret;
-- 
2.41.0

