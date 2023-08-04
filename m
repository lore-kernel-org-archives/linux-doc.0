Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A601FC41513
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjHDSZh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjHDSZN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A4F4C01
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vYr3+FrZbnstJX6FCxlFaxYgyvWfpTU29Ge9cFia7wg=;
        b=aBEaN1MNUdAm0KIMVh4aseYGPkKdzP8kPM3p9SNmGbGvWNsOO2ZwKOGEl6iRIyfI+2R93Q
        +1E7S38xnHGL+hW2QRksDO1914JQPbUEKrrDfidLhwL1h66yrqxf/0Sz4TJJ1BulI/fT5F
        JCMWhUI7wMrj16I1SMjJglZWcZsjR0I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-hnv503oLO-a18HjWsUVBEw-1; Fri, 04 Aug 2023 14:24:22 -0400
X-MC-Unique: hnv503oLO-a18HjWsUVBEw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5223854ef71so1574990a12.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173461; x=1691778261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYr3+FrZbnstJX6FCxlFaxYgyvWfpTU29Ge9cFia7wg=;
        b=APBamuuuKVvvCI33faCJIn7wsiA6YtZdk1mlMFB69eZYfMNI0LehhBIFPZSftRD9h8
         An8sFDgm5jFfitNsdsF3h8Kd2QMboErylXip58t5pXYS9Mv7rKtXQOdtQ2kkV5WlYI6F
         inN1cfBNtNxTW+yJJWeq92i6ACnFVEFalwxEK8j5+h52XxMmv6WJwrTCB9qKDJfeOE7Z
         97hv7rottrjYWihxgvbtGWj9Hoc27qkLILPiWLyxwko08RkCBj8XrIIMpCk4yCStP2bn
         E3dLgxBoNyoTVCWyambeqe7rN0m3Pv4d7sxX+Lgo3CKQTFAIFAyNwp2706MNBoUPoObM
         z0vA==
X-Gm-Message-State: AOJu0YyBVDO/jIY1KQw9JQs4ZvUTsiBCNU1k4tdCSY1hkpzAPNishK9X
        n+2v2dIF9KHsLWHLbxPLZK1pHtlgV/NbEGjnzLVTixKp7EAv8TOZxZUAB/IAUoWq+2zEuJx+pec
        AbbtuXxwLoDfA3k3U5VXi
X-Received: by 2002:aa7:c7cf:0:b0:522:cc6c:e25e with SMTP id o15-20020aa7c7cf000000b00522cc6ce25emr2173068eds.3.1691173460978;
        Fri, 04 Aug 2023 11:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYwqoyfpXcrYR9IMcAg0lOW6P6JfwYfmJygD6Vz4g0MxSOiUeQmHphbK1k+ilBMnmDS9mG+w==
X-Received: by 2002:aa7:c7cf:0:b0:522:cc6c:e25e with SMTP id o15-20020aa7c7cf000000b00522cc6ce25emr2173047eds.3.1691173460822;
        Fri, 04 Aug 2023 11:24:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id d13-20020a50fe8d000000b0051e1660a34esm1557805edt.51.2023.08.04.11.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:20 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dave Airlie <airlied@redhat.com>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-misc-next v10 02/12] drm/nouveau: fixup the uapi header file.
Date:   Fri,  4 Aug 2023 20:23:42 +0200
Message-ID: <20230804182406.5222-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Dave Airlie <airlied@redhat.com>

nouveau > 10 years ago had a plan for new multiplexer inside a multiplexer
API using nvif. It never fully reached fruition, fast forward 10 years,
and the new vulkan driver is avoiding libdrm and calling ioctls, and
these 3 ioctls, getparam, channel alloc + free don't seem to be things
we'd want to use nvif for.

Undeprecate and put them into the uapi header so we can just copy it
into mesa later.

v2: use uapi types.

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
 include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 27eae85f33e6..d5d80d0d9011 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void *data, u32 size);
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
 
-struct drm_nouveau_channel_alloc {
-	uint32_t     fb_ctxdma_handle;
-	uint32_t     tt_ctxdma_handle;
-
-	int          channel;
-	uint32_t     pushbuf_domains;
-
-	/* Notifier memory */
-	uint32_t     notifier_handle;
-
-	/* DRM-enforced subchannel assignments */
-	struct {
-		uint32_t handle;
-		uint32_t grclass;
-	} subchan[8];
-	uint32_t nr_subchan;
-};
-
-struct drm_nouveau_channel_free {
-	int channel;
-};
-
 struct drm_nouveau_grobj_alloc {
 	int      channel;
 	uint32_t handle;
@@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
 	uint32_t handle;
 };
 
-#define NOUVEAU_GETPARAM_PCI_VENDOR      3
-#define NOUVEAU_GETPARAM_PCI_DEVICE      4
-#define NOUVEAU_GETPARAM_BUS_TYPE        5
-#define NOUVEAU_GETPARAM_FB_SIZE         8
-#define NOUVEAU_GETPARAM_AGP_SIZE        9
-#define NOUVEAU_GETPARAM_CHIPSET_ID      11
-#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
-#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
-#define NOUVEAU_GETPARAM_PTIMER_TIME     14
-#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
-#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
-struct drm_nouveau_getparam {
-	uint64_t param;
-	uint64_t value;
-};
-
 struct drm_nouveau_setparam {
 	uint64_t param;
 	uint64_t value;
 };
 
-#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
 #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
-#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
-#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
 #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
 #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
 #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..ca917e55b38f 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -33,6 +33,44 @@
 extern "C" {
 #endif
 
+#define NOUVEAU_GETPARAM_PCI_VENDOR      3
+#define NOUVEAU_GETPARAM_PCI_DEVICE      4
+#define NOUVEAU_GETPARAM_BUS_TYPE        5
+#define NOUVEAU_GETPARAM_FB_SIZE         8
+#define NOUVEAU_GETPARAM_AGP_SIZE        9
+#define NOUVEAU_GETPARAM_CHIPSET_ID      11
+#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
+#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
+#define NOUVEAU_GETPARAM_PTIMER_TIME     14
+#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
+#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
+struct drm_nouveau_getparam {
+	__u64 param;
+	__u64 value;
+};
+
+struct drm_nouveau_channel_alloc {
+	__u32     fb_ctxdma_handle;
+	__u32     tt_ctxdma_handle;
+
+	__s32     channel;
+	__u32     pushbuf_domains;
+
+	/* Notifier memory */
+	__u32     notifier_handle;
+
+	/* DRM-enforced subchannel assignments */
+	struct {
+		__u32 handle;
+		__u32 grclass;
+	} subchan[8];
+	__u32 nr_subchan;
+};
+
+struct drm_nouveau_channel_free {
+	__s32 channel;
+};
+
 #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
@@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
 	__u32 handle;
 };
 
-#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
+#define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
-#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
-#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
+#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
+#define DRM_NOUVEAU_CHANNEL_FREE       0x03
 #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
 #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
 #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
@@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
 #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
 
 
+#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
+#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
+#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
+
 #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
 #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
 
-- 
2.41.0

