Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB3EC38159
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjARGei (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjARGZM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1DE530C1
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022435;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
        b=hqzMpjgnIMquDJ7e2qOhkgJcYdwwP+Ab+xgn1MlCtAu5r4+x5wkyvyVKUrQfhanZrY9GAd
        IhAijlEOR4okMGqsuDoQx0TNjWXDJ8b1eS0P/GZityrmfR1NEcwigezt/Dy0BGaglwSPJn
        Qh72WabQDRpTgKcmt2cNLlK6Zw4Pxcs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-DpmDcx2gPSOP2z_eLN4ZQQ-1; Wed, 18 Jan 2023 01:13:54 -0500
X-MC-Unique: DpmDcx2gPSOP2z_eLN4ZQQ-1
Received: by mail-ej1-f72.google.com with SMTP id qb2-20020a1709077e8200b00842b790008fso23513451ejc.21
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
        b=nR6aIY8pADVRhDHhC0EDTuvLAc5pwDZ1UGyMqTr/VlMyqIh6RCk21YxH6EETHcgHGV
         KyNNrYYu8Gi6txkgmGkCZbi5xQu96b7X5Z7Pz7ModgUtxsi48/wk20fe1Y2Ai8AEXxUL
         qXjtrG/olxTdWY/xuyyUbTFdptLmpaJmC704LC5kmKnb8ubTSbjlI+4cgHN/7LyPEZ2f
         3zO63qqXjCxNSFehc6+Oii5hkVxpyLrKPjMaBsgTVBVen+2J4Z3IhsW1kNcjFTHxJDiO
         kVfnjb3+M4wmtDNOdsPpuv2CHynHB8lYPceeKrXCAubxBELGcDlKIDyoSll3nbkqgccb
         IrqQ==
X-Gm-Message-State: AFqh2krdmVl5aaIowKXM0KlmFRxlhdhXm2/gJYaQLQj6t3EHudLj/FqF
        42rnI8kikvQIZNhRm99xsUyrG1NksTd2N+eOnFXVLMyoN6I01VAU8B75CjHPsqvW6R3LXjlbNzK
        8PQYCKoO0b7YeFO6egxFb
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id d29-20020a056402401d00b0049b5a1c9cb5mr6136310eda.16.1674022433101;
        Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMRQNeLN0f7U0iSpRPj/7pTZ3JgTXp3PTis3EaCSPjKRlhbStTsVCJPYygyXG1jLnP6DuINw==
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id d29-20020a056402401d00b0049b5a1c9cb5mr6136300eda.16.1674022432934;
        Tue, 17 Jan 2023 22:13:52 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p11-20020a05640243cb00b0049e19136c22sm3039222edc.95.2023.01.17.22.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:13:52 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 07/14] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Wed, 18 Jan 2023 07:12:49 +0100
Message-Id: <20230118061256.2689-8-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
index d2b32a47e480..4cdeda7fe2df 100644
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
2.39.0

