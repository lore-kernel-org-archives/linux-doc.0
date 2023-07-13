Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22232C001B0
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 17:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjGMRGK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 13:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjGMRGF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 13:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306DE2D48
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689267902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=SWk0VgTvONjbHwh3NfOAylFxt/c4IncztS3jxsmVfMROo7q2PsDpaCvN90bcG9NgwdPlWN
        PLbruWSZXnPIPIMzh4BWjYgl5ShRXg4scH8TavVqIFqhMAi5uMXzj+T1kh9Ne41hTnWflj
        a5WqvK0oNCurMedG/a7HBbRDptIvk3w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-w2wRRye-OcOHFUkPH9jhsQ-1; Thu, 13 Jul 2023 13:05:01 -0400
X-MC-Unique: w2wRRye-OcOHFUkPH9jhsQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993d41cbc31so57468866b.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267900; x=1691859900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
        b=GhQ4UWl6pfw6+mq44w9gJodKI4VxCYk0i88cHRRNwTpI9P7ibEe5RZX1FobvXl2bIQ
         AjYDX13ZBevAoeV4t/UlN0G0Vpx0F+c8I6IEXbQ/iyIkOZMX/BVskblLl6AjH29O7DP7
         UMs8xTWjK0A69HSxb2g9/2/ILKLuqMhFehaA23SYBfebq6VZ7fdE7Gp3Ey68KTrMI3o2
         kkLAffaMVJHTWO6+TLNxaz52jTWWzdYdJ2T+1J3gEcEbdp3YojNL2x5U0CnubMk4lbuQ
         qS4us0mKSnLg0pbD4LfT8wSmnk1E8axDD70qvW7x1zYNOQa4QLNG8qCbeYzzxvxXki8w
         QvQg==
X-Gm-Message-State: ABy/qLb2Ar3SUvL5iOQ+qB0+drTLp2Zj/NN7OYhI6NKKDinL+Gzq66wL
        rSVwMU3k2nk3Mr2dJNbjmmCOTSjiIYcvL1USkgjyBNlbAUwr2Cl93J1yhXajh1iQCOqc3sF+cwX
        1VBkGjwuqDi5ieSN/iZfD
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id 19-20020a170906011300b00987fe181c56mr2115240eje.47.1689267899910;
        Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGCyQeuogsjgxDVJKFBZEg08N1OVXBkYa73JHbS/zCbYQKSeo62Zql1FBRS0FoBHej2bCLIA==
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id 19-20020a170906011300b00987fe181c56mr2115221eje.47.1689267899743;
        Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709064f0900b00992a8a54f32sm4244576eju.139.2023.07.13.10.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
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
Subject: [PATCH drm-next v7 06/13] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Thu, 13 Jul 2023 19:04:01 +0200
Message-ID: <20230713170429.2964-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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

