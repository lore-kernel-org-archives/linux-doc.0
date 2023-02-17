Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A889BC05027
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 13:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjBQNuM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 08:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjBQNty (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 08:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1856C012
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676641719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s63r6ewLpHy8dX6pfqzPL7Kskgx+EPYod2Ty9Ts4erk=;
        b=gmOGNouJuIR1YvO5H/bsds32Cl4TgmIpjJr9527PefFMq+tVL8E+aPEcFp+nYNPpfCNNWS
        CJesaA223aI958D2ldpURde1ibn+PyFW0pqJwS/AiZPKJRsqcw3YuVqPfb8Iyx/RB4+BEv
        UCdrntiXBRPvN560dEohEPh7RUkLS4U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-aX-94pspMemAgZ0ZWKOshw-1; Fri, 17 Feb 2023 08:48:38 -0500
X-MC-Unique: aX-94pspMemAgZ0ZWKOshw-1
Received: by mail-ed1-f72.google.com with SMTP id cz5-20020a0564021ca500b004a6c2f6a226so1245924edb.15
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s63r6ewLpHy8dX6pfqzPL7Kskgx+EPYod2Ty9Ts4erk=;
        b=yj0X9kgeU3HCYYeVIC43hGfzePaM68QVnHzXUe8HzzsH8YBJNs3ZQgX6H766D3QjFD
         0/iGZMzn42I6RFMlBECofOuhXPWCVbVXn3v97R1WlTOBCxZRUJx/fhOoWWix6jE8basA
         yPZ6Pgu18K21CAsLqR0wbZxHNPodjwr6lS0jl3i8W5d74oMYKzRavFoOI8gBd55DtX18
         ZfUQj9JW31XJxFpS8fRSvYN6hTSn3ZcJ3PiSffygRufzE/p2D+jFxMhfSCQYLljy4FM2
         wFEXazM33ZEfhzo4SPbBax3PzDv8dcOxYlCx/OUct25Rnakl6jS5XnMe2t2ypXsR76kt
         UL/Q==
X-Gm-Message-State: AO0yUKUKbtwAEHHqSjNqORzW0hghTOc61SsoHKneIkqaDW0MNSjbQR6U
        tlyQn5eN6LxfHEvE7cRxlPzrbqbnq0RnUHNFiv0p3UhegSJxTXYntk8SRlwCZHG/8FcLGTygiHu
        UjSGHDzrreLidPVTW41gM
X-Received: by 2002:a17:906:9750:b0:8b3:946d:51c8 with SMTP id o16-20020a170906975000b008b3946d51c8mr1973092ejy.29.1676641717138;
        Fri, 17 Feb 2023 05:48:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8Vb+Eh70SMrWH0gbi9pDuylvuAxYJRJaM1j4o+Rm2VHpNfcVf+Ka0ZZS+k/kpmT6aZ0ke53A==
X-Received: by 2002:a17:906:9750:b0:8b3:946d:51c8 with SMTP id o16-20020a170906975000b008b3946d51c8mr1973082ejy.29.1676641717002;
        Fri, 17 Feb 2023 05:48:37 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id a15-20020a509b4f000000b004acc7202074sm2288777edj.16.2023.02.17.05.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:48:36 -0800 (PST)
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
Subject: [PATCH drm-next v2 09/16] drm/nouveau: bo: initialize GEM GPU VA interface
Date:   Fri, 17 Feb 2023 14:48:13 +0100
Message-Id: <20230217134820.14672-4-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
index f3039c1f87c9..bf6984c8754c 100644
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
2.39.1

