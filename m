Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BFDC001DE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 00:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjGTAQh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 20:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjGTAQf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29592103
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=bebTL+LQn6NdxVsaPjHtslOSjvxvew8ovTj01tzovgodbWTmVc/kuVp5JW88XQ9aP94RDP
        R+WABUV5DgA7zlfra91eUIAtairESZdvjwO80MZoOpjXsDFqkheQFqJkP0/NafL3ROCJWZ
        jXv2SCgFWP6LRKxY3m8l/CjZfrWxbmI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-tmZZutPUMV-jV9SWRDpM4g-1; Wed, 19 Jul 2023 20:15:19 -0400
X-MC-Unique: tmZZutPUMV-jV9SWRDpM4g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9928b4f1612so14508866b.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812118; x=1692404118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=VdwYhb+ydF2o3+3oSh+++DvvqvA89dzK/LunUjH3g2o5270/m+C3yYLHIyTxdVT0Gu
         yOYLWw6qTRi33axv+ZH6N1DQDcdV5B4bybv3TklsN5uolQLip9MaODxEaBMNi1SpjGHS
         FpbT9yPgWCYZEpVQtsnIKb32eIZaiydjnEd92dKr/0lddv/+UomX45kJpncziAc0kTQJ
         an0okcExDrKPcGr1Q7HJNmhxXv07/3xUUJ2GGL+hz/6UCVOK3nGGbU/I6fyfLIm7o+Bw
         InM2XgqUIYb3DHQwSJFg9/CIavvavNPczEVLEfQdzhuoZq6F2fcmSfJyUfo+DZ+C6igU
         b8iA==
X-Gm-Message-State: ABy/qLZJT0o7+4SAjN5gsMC/ZdvI12Q/2nCddQe87W0imR6QWQnjrmJQ
        krydtoBakpYZ4zTVYU51V08Xd3E4LERx2rzkBbwx6MSuQQ2rPcT0P6zOKoOyjGZvbnkYn17x1LH
        LWPpxXsysn1v3Lu4cY9ai
X-Received: by 2002:a17:907:da6:b0:992:b928:adb3 with SMTP id go38-20020a1709070da600b00992b928adb3mr901050ejc.54.1689812118002;
        Wed, 19 Jul 2023 17:15:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHa8q78eRCT9mzZQfSzXoKE/kSwuJuwQ3ITBz9WxHl26tCWAX/ns/AgxlMnhDJjuuJMUh0tUQ==
X-Received: by 2002:a17:907:da6:b0:992:b928:adb3 with SMTP id go38-20020a1709070da600b00992b928adb3mr901023ejc.54.1689812117799;
        Wed, 19 Jul 2023 17:15:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id gz5-20020a170906f2c500b0099b48ad487asm718119ejb.93.2023.07.19.17.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:17 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v8 05/12] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Thu, 20 Jul 2023 02:14:26 +0200
Message-ID: <20230720001443.2380-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

