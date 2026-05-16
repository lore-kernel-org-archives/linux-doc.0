Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A483D524D
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929612; cv=none; b=TUUhQTxHJV2KYnyeZgRFN0fVVNNKSs6ex677/VcAtekBHtMezBsVpZ3NHIogstRVQ/2QEuyF9lm272wSPAcywsWaQhOIACK0qSkUjb1MNb4ZNJrzykgRvd58zNGEXiAng2otMuLlKliQRmbLy4jnEm4w8WH6ZWgwUuFTyma102k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929612; c=relaxed/simple;
	bh=a9lG2nbpvJpNBTclhiNFI8DwaJzMN3KTgSfTJHOAb6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVLtdf8ZnT2kyBaKrm4KgObAYgHgORXH3N7piUWRDzwKxZUWu47RHZf8GQuxxXfLqQA98t2QK8oM15f+ElP0xiNLlGXvHU81NeSF+TcLjGYIO+mB2Z+qdBTxyJU/Rnqwh7HXRI8sx1TLpjmf4Xsny8nrJdlzk3Q9juB+ETiqUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRzi+gYJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRzi+gYJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so3681845e9.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929607; x=1779534407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZXH6WE6NwIFHcNfcXNqTsh8pXC1vp/igAOE1DEZDoU=;
        b=IRzi+gYJyMO5o2NZUM+RehkR/HJ08f344RqnHLVYG2/9Iz3cy5ibqu8aF5zN/wgWEP
         PF6zyLu/DZ+hy2uPZwNr+mhvQSCakvW3MeNnS1qcsC4Snxjnk4bB7O5E8qZrWpTXUQxF
         8R7c26ac/Kt89KnKOcUMsxc6CBnw995C032mwIodYOB0v9/KNTnldRKdsuTTuBCwUcxD
         Poe6KvBK72ZF+9VdOsTTiookNK34fB6PTa7dWT1+gtGKhddXpavyA/OXY2NxWiG4Yo99
         CzOrI5keDG7nP6tT+DMT0vNOuKAN9xwyTpvYrEgDJrUFlNxb3u1q9l7vNFcSSlxYZZyK
         Yk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929607; x=1779534407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZXH6WE6NwIFHcNfcXNqTsh8pXC1vp/igAOE1DEZDoU=;
        b=BMWvLiHrcUsYmgSumrcK0KMcvFBNNORolnr7MSvGcRPa/tZbuYaXxyxlW9S8jhamRn
         j/WQmxAns1kMgXhzs6YBhuLbrzJ7iDkESOXyNIwm5aOLtAr/9+dimhAT+vdbvNqUwaW4
         P4pizAazKhZpGltnuUqgBCVWMZZ2+f1x4K4cKM6BKmxGzJ6knLa3YQNhT8XFb2XWTRx8
         z9/frmto8Ct4FvV+ngPeoVzD+A4tvcEpMOBh+YhJnrugUfaMPaOPwqGCVFI/A4O3toQ6
         HXiGkSd7KH+ZbGEAGAasGZHEF6FyTch+UYITNC9BaJcd4ITLVEaHd24TCFrS4wnchO3N
         NNng==
X-Forwarded-Encrypted: i=1; AFNElJ/+gffJ3JzQnzZCy5YbHRY2xRKeNiudpcAc3Rvijr1oGSCzbwH7XTiiD0k1orlX1f9s1tW3cXSbgps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygt52yHxCYllcME/EQOAzT/+nbeCgxmzBOiw7CUT9WBrhvqQ3q
	8TS42KB5nYv4xGMjcLaP4ZWgwPdRHYR3DUBKZzRNS4ozz/oUjWFL25bQ
X-Gm-Gg: Acq92OFYOriDKmqWOakxHefiAAuY5qDdilqO+xXnWus/ASFUBtMbMtjRJNl9LQfx4uo
	8kcOjsJ6U10zhnIzw/b1JmQo+5gvT7hLOTWXhBfVXgOXu366j/T7oTXHDYc3WFdAhMAJGwMxt0q
	KRydn39SLtu1NVGdr9U6TP2AXAOh3kYJIxWVPmpywl9TCQyXH+xLWqxg7tA4/NbpCC7tvyflpPu
	QrsoTuq+5MHH6RjH5agDsoKMuMStp1aggb9Z2J2GsJXD4sMOJLI+RZR/2oBaxns/aZqXhlgFIHI
	aWNHFhy0O6SXGg6LuGa9gJ6QnYS/PxO10mH0I9R7ijSU88EY5P2s3FCzPYa88yHGdrYQyCinCXS
	nV7Qi+zHlN+KAv2DcYBF3VPVOdZCz5+5dTlp4d0pIBIdMOQie9kuCgfAOodz95qyGpHHveGdFvu
	a/flt4zwNg9/BzuunkrLuHJXKH61VcXoN9nLiJ13DL5uxIWEBEpt0H2ZJd0XiYlayU3MCuX4F3C
	xT0EkPfCXYzomj5tA==
X-Received: by 2002:a05:600c:4692:b0:48f:d835:e104 with SMTP id 5b1f17b1804b1-48fe6325391mr108240075e9.16.1778929606890;
        Sat, 16 May 2026 04:06:46 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:46 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:05 +0200
Subject: [PATCH 02/12] drm/syncobj: add drm_syncobj_fence_lookup
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-2-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3464;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=a9lG2nbpvJpNBTclhiNFI8DwaJzMN3KTgSfTJHOAb6U=;
 b=07+mwlPAmGj35N8dMENXh6PCoPSv2aMD6VxpSxRkS+KDubuwjlGqM09oILAMtWVMbSAEmf3Bp
 UZUi9wH3NLuA1L+LQNH3MdycdnESgn7NfT46epz4KcBbp+qwZvxkBy9
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This makes the logic from drm_syncobj_find_fence available to callers
that have a drm_syncobj instead of a drm_file/handle pair.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 34 ++++++++++++++++++++++++++++------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index d992aa082ace..8df438fe0807 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -427,7 +427,7 @@ static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
  * @fence: out parameter for the fence
  *
  * This is just a convenience function that combines drm_syncobj_find() and
- * drm_syncobj_fence_get().
+ * drm_syncobj_fence_lookup().
  *
  * Returns 0 on success or a negative error value on failure. On success @fence
  * contains a reference to the fence, which must be released by calling
@@ -438,8 +438,6 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 			   struct dma_fence **fence)
 {
 	struct drm_syncobj *syncobj = drm_syncobj_find(file_private, handle);
-	struct syncobj_wait_entry wait;
-	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
 	int ret;
 
 	if (flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
@@ -448,6 +446,32 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	if (!syncobj)
 		return -ENOENT;
 
+	ret = drm_syncobj_fence_lookup(syncobj, point, flags, fence);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_syncobj_find_fence);
+
+/**
+ * drm_syncobj_fence_lookup - lookup and reference the fence in a sync object
+ * @syncobj: sync object to lookup.
+ * @point: timeline point
+ * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not
+ * @fence: out parameter for the fence
+ *
+ * Returns 0 on success or a negative error value on failure. On success @fence
+ * contains a reference to the fence, which must be released by calling
+ * dma_fence_put().
+ */
+int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
+			     u64 flags, struct dma_fence **fence)
+{
+	struct syncobj_wait_entry wait;
+	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
+	int ret;
+
 	/* Waiting for userspace with locks help is illegal cause that can
 	 * trivial deadlock with page faults for example. Make lockdep complain
 	 * about it early on.
@@ -511,11 +535,9 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 		drm_syncobj_remove_wait(syncobj, &wait);
 
 out:
-	drm_syncobj_put(syncobj);
-
 	return ret;
 }
-EXPORT_SYMBOL(drm_syncobj_find_fence);
+EXPORT_SYMBOL(drm_syncobj_fence_lookup);
 
 /**
  * drm_syncobj_free - free a sync object.
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 5da9988834b5..580a967ae364 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -124,6 +124,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 			   uint64_t point);
 void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
 			       struct dma_fence *fence);
+int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
+			     u64 flags, struct dma_fence **fence);
 int drm_syncobj_find_fence(struct drm_file *file_private,
 			   u32 handle, u64 point, u64 flags,
 			   struct dma_fence **fence);

-- 
2.54.0

