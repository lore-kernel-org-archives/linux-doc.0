Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43213D6688
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929621; cv=none; b=jvIS/K4UA1KJP4CL7NxgvMvi5W3O26eFrgwTE5q2rYGnTmaBzBLFmCROhKLcqVc9qE2Zg9rEZHxok8UPOHkRsJbRLWEYDPh4H7g/P7OJH07Xh6erE501aV+eBmiQAn72ohb1d4TrOvq4KvYKlQdzOiDLBB/t0PXCxK+sHGn9kqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929621; c=relaxed/simple;
	bh=GBWZLpTSQKwI1OU9IPw5ePXafftNdAo847uKMqv9qQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvslPXVCFJIuuskQSAbSUojBCuuu3I4H+u4FtSmDNsPQIHxeqxEf5BmRgOsUgG0ZF/T7x5y1rP6keIecN9EhzS++UYhFpmJF+gdY9szrh1BgY3eklJ+NgucqIxaXDn7QwFYKl9RF8lW8lmgqY2vmf/xLDumxIYhEmKm+szuEQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSZoa9Td; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSZoa9Td"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so5483425e9.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929614; x=1779534414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GkkTkJJ4gPDTN90NOOy2Oe9JOnAG88gTd5YGKnZHEk=;
        b=sSZoa9TdQUh3lhyzwArreADQRar9CsjKLdwyj9PO2v/sfbotz7HzwYIWAb/p5Vo4SW
         kRKsLlz4JoQ43nlrS2j8Ol8i92S8kz4SdgM8Ccy9dAUZs8SRhrrX+41iVYSxpS1CuPNI
         6zK+uBNX5Yt44/xkY5KF8bey3KGyEfLd5HUeWaed1z4IRWjNddFAt+c+doNvA7sjQkkv
         ZJE1l/F+BUpRz4q6zYZ3EBfkIXn1M6qQuWIHwP8AAh8t54MqqxtJVJVeiSWaVvaP79o8
         GWvjrhjQN1CPkEfrQPPqpY9mF8b8Ww7DDBlqpeUqXRFo5j6PiqO45YE41Pu80Q1x87CJ
         /UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929614; x=1779534414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GkkTkJJ4gPDTN90NOOy2Oe9JOnAG88gTd5YGKnZHEk=;
        b=MSQeWz7oIz7J4LE7n+hfpSLNQSoyyDMWUPLa8kkLJLEcI2Tf6u4tIiSCM8Agfb/Sz7
         aMd4eH2ebj2CF6DEyhaWfAjEMs0y8wd8smvgXN9hK9Uz0uPhpx772TY095XahD9xDVdB
         eLdHVt3j68fSVOI5AFBkem7hwtLC3/Pz4Tuel63I0bq6g8MPinjL6jnEGgoCUw56701H
         xEl4zfzjWaelHv2jZfmRwOSfRbK+XxfUpfhTE390PWfCmXfRmJ+siPHdz5k7YHM9+qzF
         VrX5dJ1HXrx+TRQGTnyIkAfEnb1/uRIbleudfk8cBkI2RPHwifxQoJL8zYqQlzHLN36b
         JfXg==
X-Forwarded-Encrypted: i=1; AFNElJ/X+liHWGHE0EDJWmtyee7bj3/pu+9g+OEFHn1oGnD5GBE5+Jp5Q2FJe7SyL4+7JBNURPqP4lqib1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YztDJOCcULjrgAnnrJz3db8kE9+zQlQoD3AaKqpVD/wBF1SUUia
	H+KrbsjfxCuqSxrEswcBUos497GZyylryhcNSBYc8X1zkyzFvPZKtauf
X-Gm-Gg: Acq92OFmyt6Dh40COQYmUjvZM0uNDcqDoFYENEfPcxqauivo3ol9gUgmH8MJD3kUbeO
	SoQYXkfZX4/BKMI+i+D1yzZEOcHWt9PMTdVE+/c7+uSQXPHxZNwuQDxnRMoKXEUwJoeccAN9P/3
	t70Lfw4wCxQQ6fMtInPlpcYAjbj/sryynzKwoFqWmLDExpa5WpZCZWIZKl8YZVZfDTIDga3W/8o
	nAHOG83wLvH840eYtTE2uTCFGH/eXH1m18/IlAYwJAEB6mOu0YhQnHbSsBNL8UlSuZNmhe3uPlW
	NkqpCaCBYRNU6qqcYl4xvrCmecx0eO/DiCRahWkWoyAIseDe73VQSFRR0SQApWcjkBylowT6GKZ
	MtFIESTKU1ru+4BH1bIg67R46wR6RMnshvTi/KBV60gW3Cc/R6VYvS+Ihjk6Z4K3q2v46Ofd5ep
	VCFIprIS2kutnwncHiScGG88TdgKZAdTcImUvbsz1ddrue54RR70/DYtVJIobMCeiH+MjSB0DrA
	8laGZjDHi0R73ttFQ==
X-Received: by 2002:a05:600c:8b18:b0:48f:e230:1d13 with SMTP id 5b1f17b1804b1-48fe632a17cmr113820945e9.32.1778929613501;
        Sat, 16 May 2026 04:06:53 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:53 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:10 +0200
Subject: [PATCH 07/12] drm/syncobj: add drm_syncobj_timeline_signal
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-7-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=4123;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=GBWZLpTSQKwI1OU9IPw5ePXafftNdAo847uKMqv9qQs=;
 b=0gZo9A/tA5EbfMN54peF660OcWHUpqWJdekS7fQjA+fGOVO86M7bIbAQu7ODFDJVVH0bdcsvX
 oBVYQt/E6R0BsJf+sfH3PTEAIAKrD2RH29Jg6VWUMm3yc+y9LG9cMif
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This makes the logic from drm_syncobj_timeline_signal_ioctl available to
callers that already have an array of drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 50 ++++++++++++++++++++++++++++++++-----------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8ccfbd972191..948084f56c32 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1675,9 +1675,6 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
-	struct dma_fence_chain **chains;
-	uint64_t *points;
-	uint32_t i, j;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1696,26 +1693,55 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	points = kmalloc_array(args->count_handles, sizeof(*points),
+	ret = drm_syncobj_timeline_signal(syncobjs, args->points, args->count_handles);
+
+	drm_syncobj_array_free(syncobjs, args->count_handles);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_timeline_signal - signal timeline points on syncobjs
+ * @syncobjs: array of syncobjs
+ * @user_points: user pointer to array of timeline points
+ * @count: number of syncobjs
+ *
+ * Signals each syncobj at the corresponding timeline point.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int
+drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
+			    u64 user_points, u32 count)
+{
+	struct dma_fence_chain **chains;
+	uint64_t *points;
+	uint32_t i, j;
+	int ret = 0;
+
+	if (count == 0)
+		return -EINVAL;
+
+	points = kmalloc_array(count, sizeof(*points),
 			       GFP_KERNEL);
 	if (!points) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	if (!u64_to_user_ptr(args->points)) {
-		memset(points, 0, args->count_handles * sizeof(uint64_t));
-	} else if (copy_from_user(points, u64_to_user_ptr(args->points),
-				  sizeof(uint64_t) * args->count_handles)) {
+	if (!u64_to_user_ptr(user_points)) {
+		memset(points, 0, count * sizeof(uint64_t));
+	} else if (copy_from_user(points, u64_to_user_ptr(user_points),
+				  sizeof(uint64_t) * count)) {
 		ret = -EFAULT;
 		goto err_points;
 	}
 
-	chains = kmalloc_array(args->count_handles, sizeof(void *), GFP_KERNEL);
+	chains = kmalloc_array(count, sizeof(void *), GFP_KERNEL);
 	if (!chains) {
 		ret = -ENOMEM;
 		goto err_points;
 	}
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		chains[i] = dma_fence_chain_alloc();
 		if (!chains[i]) {
 			for (j = 0; j < i; j++)
@@ -1725,7 +1751,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		struct dma_fence *fence = dma_fence_get_stub();
 
 		drm_syncobj_add_point(syncobjs[i], chains[i],
@@ -1737,10 +1763,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_points:
 	kfree(points);
 out:
-	drm_syncobj_array_free(syncobjs, args->count_handles);
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_timeline_signal);
 
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index ec8042d61466..a9216ea07946 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -139,6 +139,8 @@ int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
 int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
 			 struct drm_syncobj *dst, u64 dst_point,
 			 u32 flags);
+int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
+				u64 user_points, u32 count);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0

