Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B753D75A5
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929625; cv=none; b=qTo+bsVqj0f6YQGuhyv+RKlVrFiD752rHDyaSKeCxIFUgI0Hzr+I54zvue5V2LVUU9SafIcWpUsGffu/GdVFwn90LXkgMCzpodh+fzlEM9riqC9KIf3pGsfYHNDS6dAtrU487iGHX1qHL1YwXbp3ulxAoeNIRfOv2fB9H9O/bjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929625; c=relaxed/simple;
	bh=gccEkxb9Fgxq3kICRGFzS2yuH2T+EBoB3hEcASoUfk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zv6gFIrf7TELSiDB57zvkwkEGAwShHx7F1ilLsLYarjjg8yfYLf2u/U9c0BuVizjZplSC4BS/AAm57D5RIXV6Y3By0DuZmql0BKDtdUq+6L/tyGJPAgES2sFTmuJbBqXM2L6E1qrsHr9couit32Nrb4FHBXJjSq9wRCOhFrCVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZEVIFNy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZEVIFNy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48d102471a4so4671375e9.2
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929618; x=1779534418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZxaw3u6g9gSQgxhivb/aQTd6ZH6WM8J0IbrlUd06os=;
        b=GZEVIFNyXzBrJZH8agXuIgpikeppwWAlOjbWAop6q2/OCcKQ2pInJjZb5VyghaXLFw
         8at78ujSh/yhjy8e/2kBfbJ8/9p5sMbnVKitoVsjBKkj2VtjSVSolS5QzR11CL+ttgfI
         xxcMmJ6hxkQSnQxUJQDDKvl08c8tzKrDBV5sqVuL2VbVgRYcOTKig6HJigQXMbNwGppz
         MeiCETWq9exFIn0sCv3TiQDtuCeNStwHST0vREwJo6rPyTnKSJpmkCiffZi5VRfPZR7r
         vMAtyKPoRLylB7JOfZGXLV7TlJveAd/EDW4AbweEcN4TZnR9fBM4CXUmHCeNNXon8ReW
         UNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929618; x=1779534418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZxaw3u6g9gSQgxhivb/aQTd6ZH6WM8J0IbrlUd06os=;
        b=SOOyOHwtKOj0Mjah1OgfKL8OE1W0Mjq0UmDWFL6CYvADplrFfJ9avXjjDN+R4o270f
         HAAU+irTcsDz+2oT7A8JAqkV3Y18TfpGYMhmCmFX2mgNXnV23nTM9ZdV+k0cM0BnxQ3i
         9DLUJy6EjApsaFt4FbxiNCmxJbk85TycqlX+QIeZvcrKN896oMgzvlF3TFsOH/AAygPW
         5EE2LffJ0c6szFCmaiwE5MHmDvPCzt933uV/hsQj4+qnkxfM3Wg2T1WJY8eYtKZfzAL2
         w5GgZbM+wLnv6aBH0f1hPWnR3OWKGiWiALS/O+lGbBxS6Q7VbMa0A3RxURIwTgYsvolc
         Z7wA==
X-Forwarded-Encrypted: i=1; AFNElJ/I4zMmS7a2+p5vsrdEsGXLRwQ046z6UCYrhFoiD4yseNfCS33E7NXMzqTHd1etNOvMli6PnUyX1YA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNH69TtVWawb1STvnew5sujZowUC/mPBidhMFH/v8DgtzjxEyN
	QyQFVUGLUEDFpLnVhMQ9EehJed4/UkOWn2Q/GgkO7NTM42U7sivaA8z3
X-Gm-Gg: Acq92OHny4ynPwtw4/VzcMzSkaQXVWwHeP8SnaMetmxTwL373PqCZZsNx8jTqotj4fv
	LGJ6h/Ufg9EOspera/zds5rTN5USO3I6vUi/iq5kHCLa1P2ZqbNOv3wSrRWXddUpAO5lzKSFYbM
	p10WzigtVUrw+J3pL/Tg+PHNke4IS67mlxyegrOTA8Vm1zW1LT/syCzskC5VE7sVIWUlScgM4eG
	x1yqhRRvRgAm1NyncoKSxbwmqWrAuzR90Y9TjJ0oaXC8jrfGXA4Nze19d59RKm7Mv6qh8QA1OVV
	CFEyIxcf5IzQiKuUP6dXQOPwXmmcR1b0u+wvIV9JxRhqVd/xcmac1H1QmtM/MBJjgZLgER9qon8
	fZeRaapJFbag46NViVc1dzd3XWqQpg/LQx7qSY5OsNfXfDBEdqisk7GIYHfMWH1ad9oErdlXoRI
	qPZWCD0+5FkanuUEZOEQ0A7wvzBwG2zLrF3XOAsuhEwy8lWaV6GB/l9iWV2AgYuUuxxOOGNp9ke
	RDVjP4l6k9i5QHF4Q==
X-Received: by 2002:a05:600c:2d09:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-48fe61f2bcemr60030905e9.20.1778929617614;
        Sat, 16 May 2026 04:06:57 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:57 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:13 +0200
Subject: [PATCH 10/12] drm/syncobj: add drm_syncobj_import_sync_file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-10-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2792;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=gccEkxb9Fgxq3kICRGFzS2yuH2T+EBoB3hEcASoUfk4=;
 b=LfciDdq+01NiK3gXOUbCymlEM3K+nuuGo3VhuhjLND4T9QDwYUXe2UHMMsjDrtokyTzc+edKE
 S+PE8qGatMuDQ8hyiPBhAhZK6ObHL0ljbFX8Do8xYlPgTokSZvXJnCB
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This makes the logic from drm_syncobj_import_sync_file_fence available
to callers that have a drm_syncobj instead of a drm_file/handle pair.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 35 ++++++++++++++++++++++++++---------
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 1da96e23dfc0..4c1667c67cb7 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -765,19 +765,37 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 					      int fd, int handle, u64 point)
 {
-	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
 	int ret = 0;
 
+	syncobj = drm_syncobj_find(file_private, handle);
+	if (!syncobj)
+		return -ENOENT;
+
+	ret = drm_syncobj_import_sync_file(syncobj, fd, point);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_import_sync_file - import a sync_file fd into a syncobj
+ * @syncobj: syncobj to import into
+ * @fd: sync_file file descriptor
+ * @point: timeline point or 0
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
+				 int fd, u64 point)
+{
+	struct dma_fence *fence = sync_file_get_fence(fd);
+	int ret = 0;
+
 	if (!fence)
 		return -EINVAL;
 
-	syncobj = drm_syncobj_find(file_private, handle);
-	if (!syncobj) {
-		ret = -ENOENT;
-		goto err_syncobj;
-	}
-
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
@@ -792,11 +810,10 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	}
 
 err:
-	drm_syncobj_put(syncobj);
-err_syncobj:
 	dma_fence_put(fence);
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_import_sync_file);
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 					int handle, u64 point, int *p_fd)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index da237ca3e61f..1571ffa12a5c 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -143,6 +143,8 @@ int drm_syncobj_timeline_signal(struct drm_syncobj **syncobjs,
 				u64 user_points, u32 count);
 int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
 		      u32 count, u32 flags);
+int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
+				 int sync_file_fd, u64 point);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0

