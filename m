Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6F9EB64DA
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjFTAno (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjFTAnm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B210CF
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687221781;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
        b=Jxf/rqP7DF1uwzUDV95lE+uUpfeiRmbYXuq/IdkoTjKB/FzEapoljy3q8zcE0kMCBwgpRR
        EM+Wjj4Ad9rCWcMAAS+2cpWGVKF+BGOqMu8tDs9+zKAFxRFWyuKXfJqgJggw1UaqVH1+hy
        J0VfZgpUQGWUSPzTGA2HklAohJF/lVs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-a6AIHwa1OqKl676RyaDTzg-1; Mon, 19 Jun 2023 20:43:00 -0400
X-MC-Unique: a6AIHwa1OqKl676RyaDTzg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5187cc1768dso1946072a12.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687221779; x=1689813779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
        b=NKZMybPiv1c5EYywRyS8xJrmB7TWMYokA76CSiaL8moSuG4+ne1WrLTjJjCVANKdc3
         kkecUFHS0kWS6zSHtHk7iLwFgYDbRb3NC/a+YduQZnamkF7qsfSIK/g7WFgBSPHW0+m+
         qJGamAmlkBirJ32pIqcKQHKNKPdKlmhxzPCYErb7KcHP5JalPRNmyRbOW5XZXOqC6VcV
         OomQ/TvARvJ3L4cDb+Bzrxj2Vdi2YFnuaOxgSYaC8AgU4b82HbQcNIOH1g+1kWv7Jpey
         q6u7fXw1cyva6RcnpK3LvmX+vIZSlHPka5zATKhJncNDywbVRXnSwMzGz1kWn5ihl9QY
         1T3g==
X-Gm-Message-State: AC+VfDxG1RvPW8nkFkkaVKLkfZ418K7ZW4zraAAMGfLokA1mnsKSFP5/
        m8MRnoJaFIPdrl/A+49UjXGZt1TP9PiZ8xiII6T8q2j8H3LVgPhWXNoKAShrazZnOBHrkH8F3Vp
        tjmtK3BlMRgjfereaGRBk
X-Received: by 2002:aa7:cd45:0:b0:514:994c:2982 with SMTP id v5-20020aa7cd45000000b00514994c2982mr6151181edw.40.1687221779429;
        Mon, 19 Jun 2023 17:42:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65FSvnjaoggF9h58zTqyT2DOkL9H5Vbq5o8fo2niPqP1lOxX39BSK0TAWF98v1OjzcZEYMlQ==
X-Received: by 2002:aa7:cd45:0:b0:514:994c:2982 with SMTP id v5-20020aa7cd45000000b00514994c2982mr6151166edw.40.1687221779253;
        Mon, 19 Jun 2023 17:42:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id d8-20020a056402078800b005187a42b44fsm310743edy.58.2023.06.19.17.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:42:58 -0700 (PDT)
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
Subject: [PATCH drm-next v5 07/14] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Tue, 20 Jun 2023 02:42:10 +0200
Message-Id: <20230620004217.4700-8-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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
2.40.1

