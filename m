Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8D3D669A
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929621; cv=none; b=ZePAHHunf78e89loCcksTPWZqYlD23sXoxqATKWUdR+JGg6g1Tj+b++lWspBGoDmSclykGFQEbExbc2nfwdt7v8tkKjb3zoFBqNR/dy5u3A0Jn2ajZBRucWqLy4ppemeC7ZHq/se+CknTt4DDcO90gcM2VREYcXlUoV1I0a0NeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929621; c=relaxed/simple;
	bh=u/7AwpljxtH4IVP0O+P5dyfoAPoN+qqc7x1nJCbL2qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4dTH3i8Ip+O9859zgi5GxliPO0E0rbVkOnXGWMDF7K92uplgRHKDdaMwGttU9Yi0Xbyjzjws3rMv/6crIReW2dr2p0AAKB5DjNhW5Lm6fBre3cK65UKobvdOGcV/94hEqmDZYWbhQEMYVojxJpXT0VQK7kvVJePV/sh1LKfm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/i84IdG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/i84IdG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48e82c23840so4329385e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929615; x=1779534415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30Q99PLuQeVhsFXIYdjo6aYJwvFzoWXm4HGv+NrFQtM=;
        b=A/i84IdGUjfKOCoV7FiEqAb0+LVUFgSqJhVp/neJ9xpaj6UprD28zFUmUrNClhl0ii
         ELvZOWOAZ6cp119udCwGGOyGFnW0yL1gER7VQFz7onXcU5CAV7VFsSkjcZXmr1AzjqhO
         JvCLMtcTgLERQniAfNC0Y28EccZA4D+BGxLnVwp26HmcyjnVCETZZTvlcb0g4L3VOCtS
         kYEs/ADp7NiCYdlhUEu6NjqdoNkU8nk/rcU8Lck4GzXdqc5WAw2uTqLArCUBW9GWbVWI
         376WNv8TzX40UWEZadTfXf5DJvCtPpX+ikjzs87bK5m3bDXM2nIwYMFAw6CfR0wyj3ym
         uxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929615; x=1779534415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30Q99PLuQeVhsFXIYdjo6aYJwvFzoWXm4HGv+NrFQtM=;
        b=RFUHD2an7gAixdUVQ6XDTn49Mt7u8f1O40oC3GCx16mMrqMSGpTkUixEXxa4eLsyr+
         UA7tiBG12pBl0LSrVlUd2F3reZ/GyYF3PwEg70X2hiGEQYSubwMNElsm3+nFmzqBGMPj
         wuPKbLChraHkegy7ngactnZpeM9cauxRmZO0rYUEa2qLpnHsJvFpUvR4jhngDvWz4L3H
         oKbWrc/yCwMZ6OAG2JhdbvZHaqcUrKhN/lk3L7dDeSTYDlVoOAqYZVGG8jnFepvs3neo
         YiJV4HGpAsUhYN1YJVWCStmjvs3rXxbFzYOZ1L5gw9bWzav4qIbF3XVRbDHQCJJQ5uy5
         1izQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E2KLoKiSHbI3AkBVBj97kdPIPez6oq+nGHgxgj4/gopb42gsFPGWAc5BjjI4TtW9aR7fsu5ZuWrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzldGqKYosq5zAfss6rjTC/GG3iPDbC480WOTEWYgxSksszk4+E
	IcHifl8xdM6Z+CM+TLsYW4LQ/oNyR3L9hR7OkZEPMPytbZ0LUYynOCV9
X-Gm-Gg: Acq92OFhmmDLRGLBDx+34VVUiyLYt3TZx1S8bPNLOQLXShmahY1x6YsxP5WvM234W5t
	tOh8nolvJboXBk/JO/P0GTFUZOMaFLrY10duGuKhEP5Q34fbMDGeJImwPfhUAD2j+33tO7N8DH+
	02Tw+S+Ysqjpvx6v2520QyNb/yg/ZeRmJ+RO9ROGp5XssWYTglnllIfkON2LcMOzrJhi4QhXlAp
	N77sGuixU8tyCGR4Q3cNeCspyqEO+G6WCMRS2O1dDsqcI0C0L9pPKj+S909R4Ouz+VwhAYZWFMt
	UJbfZU1cJj7/N4FTHwrXigkuXrloE6wZZ+geuVsNPnahiRbtk2ve35nm1bCrx9zC3TR3vVYVScC
	jEahg0kazJDb0KfSa2wVkRCOgA96aY5u/50XorXoj8wuMTKWee+TzK9ucnP6WWvz05aqVZcO/fC
	olXEarFagD21+lQ7BsOrNv23uV7sRx5yCoU8Dgtc5dw1sJ4uGi/eay7JbMh74w/m6Fs0IL8mNVk
	u5YvxI=
X-Received: by 2002:a05:600c:8189:b0:48e:89f9:9408 with SMTP id 5b1f17b1804b1-48fe632374fmr115018775e9.20.1778929614964;
        Sat, 16 May 2026 04:06:54 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:54 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:11 +0200
Subject: [PATCH 08/12] drm/syncobj: add drm_syncobj_query
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-8-88ede9d98a81@gmail.com>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3038;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=u/7AwpljxtH4IVP0O+P5dyfoAPoN+qqc7x1nJCbL2qA=;
 b=Z99DZxu195EeP3vO6X1kysFQ8YqTJJCA0BtkhBQFSClYANqqlJRzUiJ2Mte4dsbxSoaJ7uZfc
 SeQCmRzeltDByjvV1yhoKMIXpDXzFzH7PGzJ6lguaIs7JV/fN5LYMoH
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This makes the logic from drm_syncobj_query_ioctl available to callers
that already have an array of drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 32 +++++++++++++++++++++++++++-----
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 948084f56c32..9b7ecc2978f5 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1773,8 +1773,6 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
-	uint64_t __user *points = u64_to_user_ptr(args->points);
-	uint32_t i;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1793,7 +1791,31 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < args->count_handles; i++) {
+	ret = drm_syncobj_query(syncobjs, args->points,
+				args->count_handles, args->flags);
+
+	drm_syncobj_array_free(syncobjs, args->count_handles);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_query - query timeline points of syncobjs
+ * @syncobjs: array of syncobjs
+ * @user_points: user pointer to array of timeline points
+ * @count: number of syncobjs
+ * @flags: DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED or 0
+ *
+ * Queries the timeline point of each syncobj and writes it to @points.
+ */
+int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
+		      u32 count, u32 flags)
+{
+	uint64_t __user *points = u64_to_user_ptr(user_points);
+	uint32_t i;
+	int ret = 0;
+
+	for (i = 0; i < count; i++) {
 		struct dma_fence_chain *chain;
 		struct dma_fence *fence;
 		uint64_t point;
@@ -1804,7 +1826,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			struct dma_fence *iter, *last_signaled =
 				dma_fence_get(fence);
 
-			if (args->flags &
+			if (flags &
 			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
 				point = fence->seqno;
 			} else {
@@ -1832,7 +1854,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 		if (ret)
 			break;
 	}
-	drm_syncobj_array_free(syncobjs, args->count_handles);
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_query);
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index a9216ea07946..da237ca3e61f 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -141,6 +141,8 @@ int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
 			 u32 flags);
 int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
 				u64 user_points, u32 count);
+int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
+		      u32 count, u32 flags);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0

