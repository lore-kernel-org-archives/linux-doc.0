Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C5AC004D4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjARGen (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjARGYP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C456354235
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
        b=Kbs/8mRqG6zZCS7a82RVg0LN3MlTxIyaRggF7O/D76V/1aQhUwhLcpLgiQPBTSHnXpSFos
        8+4je7oN+9mUYAu5k8Q9rXhm/n9tTYHwo8wRXLGJ2OtUFbFNY5l2xwY2kFItkNN4X1qchn
        dVI89HRop4dt2dHwl22Iuf50A2U32nM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-9PUTHVyxPUC3ajdbKpg7og-1; Wed, 18 Jan 2023 01:13:32 -0500
X-MC-Unique: 9PUTHVyxPUC3ajdbKpg7og-1
Received: by mail-ed1-f69.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso22961039edd.10
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
        b=xVjZYVYSdRHdkJTpXyFnxGdKIC4+2Oex+sas9gT6MDUplV4TQ3RJW0JOLC/QqHPmVH
         DZooU4EXxP2ZnXAMJy2JDgqDBin0ItHkWRrgdUUk4JCEZp1OBmMsKZ8Qc8U5rClJ4OZl
         2+YvPq+KIli4wgAutfe28Cp2wpPKes4fIPPugP7ihOu8/j98eHAlmRZWDseaMMJ2NT/x
         JvwOm8PyzDl2RcvQBC2xPGoAAOQVDw1h9/j1WGWpHplUzaoJD8WGKfo78gPPkN6CaLEW
         c8tc1m0PK2qzFjorWhPP2Ee8bK3ptAx1FgJzCR+NjUOyUJvvuoH4EUQB25zNmRB8YrCo
         857w==
X-Gm-Message-State: AFqh2krcHGMYVlF0BTG4F/0XC8oCVfMV+W465CxohKOhKzgCGegK7iE0
        0gfS8NkGBmVvu/x1vJ6DqbKRccw/h4DXbz2jLq1yvHwXrC0xSP3zsMoKZIGg/a6XRDM7NpoU1h2
        bPqpSdMp6sI9jiZtMdCox
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id j20-20020aa7c0d4000000b0049d9bd86253mr6311448edp.17.1674022411762;
        Tue, 17 Jan 2023 22:13:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjvWeO5BcMo55Z0OQiMRRnw0jtETl53EDUmTCOZ9HyMXZACKq57o1DdaU9DHq6GmVA9kdq0w==
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id j20-20020aa7c0d4000000b0049d9bd86253mr6311429edp.17.1674022411580;
        Tue, 17 Jan 2023 22:13:31 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id y11-20020aa7c24b000000b004954c90c94bsm13745667edo.6.2023.01.17.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:13:31 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 02/14] drm/exec: fix memory leak in drm_exec_prepare_obj()
Date:   Wed, 18 Jan 2023 07:12:44 +0100
Message-Id: <20230118061256.2689-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Don't call drm_gem_object_get() unconditionally.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ed2106c22786..5713a589a6a3 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			goto error_unlock;
 	}
 
-	drm_gem_object_get(obj);
 	return 0;
 
 error_unlock:
-- 
2.39.0

