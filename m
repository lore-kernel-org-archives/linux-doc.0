Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DD8C001DE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjHDSZe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjHDSZK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D702749D7
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NfuUlvOtQCcgIWDDGRTDaO97w4Wpv+IQfrkVs47IV0U=;
        b=LGn0YbsKiXH3qYOKga0YXHC9gqvW0Dji/6+Isv/OSlhKiGg55ZbZmbj7msanbp8esOJKEn
        3QqaDdW0epGekl4dlgvxKJCVuqiV8SotCz9VIUVX3DpvmcxkhkoRG2K7akefnotu0Z6gjt
        GZ7S4V2cI4W6TttQ716TlSX1EBCGnho=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-KyGIhEVOMoC5BHsNMM9NfQ-1; Fri, 04 Aug 2023 14:24:17 -0400
X-MC-Unique: KyGIhEVOMoC5BHsNMM9NfQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-522e6bcde75so1568431a12.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173456; x=1691778256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfuUlvOtQCcgIWDDGRTDaO97w4Wpv+IQfrkVs47IV0U=;
        b=kDck98OBjBSHFIR6kLeHwd/qh3uW9MSwlz6E0TjsljmwXQAIQLUG2MYrHoDhJvZCa6
         Pv8UaFotFOPhh8Neh/S6jJ4bu8QoH3aDRHnfI/6bW6V0VjaED0CWL4GMrvH3Iv2glRFF
         pRLVSoTJH0s0/4USY7LPh1S6QrrB4LRDDBPDm57I76c7FB4VEl04v2YyM8xw97hOsw/z
         xsu/ZPne56O4cykHNmEDLqmX8+HNHzBvWlxFH+1XZ8fXEc+rD1raYKNxn9ZpxrMbSIm0
         wEejYC6j2WxSaL26JHK84TqcYf/8GiJsVG1lpuYz2EEmXa5ww878Uq3/0Bb9ojl0F/mA
         Jg7g==
X-Gm-Message-State: AOJu0YzKaNpMy0VjcXwmO06XdSNiy7I3XxfAP3ADch1o+9CuO4QnMZDv
        W/wP/uYyXg4LQxcDPXsL5bZs2AKobR1Q/bH9QNQhbamhrbxI08a5mEZmQM00Oqa0DKz4rzJJFGL
        QZ4yi7PY4yQmpTuDWqorZ
X-Received: by 2002:aa7:db44:0:b0:522:3c32:fd2e with SMTP id n4-20020aa7db44000000b005223c32fd2emr2223758edt.24.1691173456652;
        Fri, 04 Aug 2023 11:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErEoSmaKF2uBw7h8HGFFtQ5MjUTz4y59jFR/tNHUs5hU8wStuPrUAj1j93cdqJV0DWvKhGwg==
X-Received: by 2002:aa7:db44:0:b0:522:3c32:fd2e with SMTP id n4-20020aa7db44000000b005223c32fd2emr2223746edt.24.1691173456342;
        Fri, 04 Aug 2023 11:24:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id d12-20020aa7ce0c000000b005230724b2b1sm1581545edv.45.2023.08.04.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:15 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v10 01/12] drm/gem: fix lockdep check for dma-resv lock
Date:   Fri,  4 Aug 2023 20:23:41 +0200
Message-ID: <20230804182406.5222-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
should fall back to the GEM objects dma-resv lock. With the current
implementation we're setting the lock_dep_map of the GEM objects 'resv'
pointer (in case no custom lock_dep_map is set yet) on
drm_gem_private_object_init().

However, the GEM objects 'resv' pointer might still change after
drm_gem_private_object_init() is called, e.g. through
ttm_bo_init_reserved(). This can result in the wrong lock being tracked.

To fix this, call dma_resv_held() directly from
drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
pointer only if an actual custom lock is set.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/drm/drm_gem.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index c0b13c43b459..bc9f6aa2f3fe 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * @lock: the lock used to protect the gpuva list. The locking primitive
  * must contain a dep_map field.
  *
- * Call this if you're not proctecting access to the gpuva list
- * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
- * of initializing lock_dep_map for you.
+ * Call this if you're not proctecting access to the gpuva list with the
+ * dma-resv lock, but with a custom lock.
  */
 #define drm_gem_gpuva_set_lock(obj, lock) \
-	if (!(obj)->gpuva.lock_dep_map) \
+	if (!WARN((obj)->gpuva.lock_dep_map, \
+		  "GEM GPUVA lock should be set only once.")) \
 		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
 #define drm_gem_gpuva_assert_lock_held(obj) \
-	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
+	lockdep_assert((obj)->gpuva.lock_dep_map ? \
+		       lock_is_held((obj)->gpuva.lock_dep_map) : \
+		       dma_resv_held((obj)->resv))
 #else
 #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
 #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
@@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
+ *
+ * See also drm_gem_gpuva_set_lock().
  */
 static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 {
 	INIT_LIST_HEAD(&obj->gpuva.list);
-	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
 }
 
 /**
-- 
2.41.0

