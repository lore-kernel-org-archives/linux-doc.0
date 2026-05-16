Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F5C2DECDF
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929611; cv=none; b=pnEuCawd3vtvG4hXMe9SgTee2xxS1o4gAeyfdyHtYGbSZeJ2uxatMV74OKW1xum96dS7EChjCR+mq6nx3PeUNIB6AIufQ/h1+T0PgvxsMMcuxZwdByGkTftxdFkqWpxBIBXXqmlEmRW/g84UV0HotzqCZdRCbhmoEEYrMN1mTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929611; c=relaxed/simple;
	bh=Xxs8inG7yNnVnqsTeDmsro1fFz3EEPayoUW9RCB58oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhHOJYT+lj/AdJYcVwn/+RtnuZU4yLRadtK4T0Rnyk5TOzxQVej1aRNfqEAjdbDeCfea8Be3dUMrMpKoqH7hh4CrtPZWj9X5agV5PTnmysc/oR5qUAqC4vrrCDhS3shNWfgVFLTX+mJLGKirj4vPsk82AEzA79iKvj/4kBSnKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgodxZ/j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgodxZ/j"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so3182385e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929606; x=1779534406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYlLPOH4yVQW/c+VIhwYHIXyYVIQiO3ciiQAaKF6Jpo=;
        b=jgodxZ/jxYCIXxZ0DWvuYV4eOdWbBJb/DIvMH4xAruNdnoRxmVwmJSLrEDx33sG10m
         8EtR9V/DxPSuA09hOri+Q0z+0LZOV0xewWB8W4iiFd41RGWqQZUdKG0eroVi+Z2Fxnt5
         KhK6r3BFhXEodPXtMeytke3mabM8zy1XjiK/Pil1aHgmT2JTL8tVEAeq+4Xxd8o6L40I
         1apc1QPKFwvVgHI46ZtWK7sRT89JwiGzKlC0ALU4d4H6QDakr3QXeA6khYJ5HhlkKBsn
         AyGrBRhm78PmFwc1Vpi37/Jjjp44FiTuTQip3nMyRwLzFor4Vbl5vO66TEQE6rdwTs7D
         WlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929606; x=1779534406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lYlLPOH4yVQW/c+VIhwYHIXyYVIQiO3ciiQAaKF6Jpo=;
        b=k2LsRy0bZe0JwFALfif+gnUgZN/ItWQfzHJWX0u1PI+qumA3Lg1hjX0j+mGWga67JV
         CRXbHNJ4Pfq+UsJEKk+KBo4EFC61OykImHEvpVuNQXCTf0wSuDl1T4KG92AxaJ618wWf
         P0MTbXu32K4xkxnx0QGgzLpIUJXDgb88fTwjVJHegrNz5+SzOEGNAk+D9GUMgtSgTKfg
         DM3otilVO237q6DPSbHgZS0/GrE/n8J41vt8fk238HKqrqZ/9qaNSPUB90LKjAYJFDlo
         zN17qrFMqTRrjGU8eoDivywcgPP8pISQvIz+0pQU5pUP6oDUy+ebKrIesaSeCLRRkII4
         5Xog==
X-Forwarded-Encrypted: i=1; AFNElJ+uWmlDD8I0iQUK5SKJMmikda1QgvqlaNupu9fxQ1GoWIjaYI9q2BQlEx87mbMix+qdMM5dUMuTGpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJExE/ORdn9RIGaTqHpjfQoDWzPmnjCbWMDed0PAombkWNYtuJ
	FDKy2JM0zVC7C/h8M4lb0Ef+f+iqzsds9RyP6q+AkfU6MjTZOQ2wrwiM
X-Gm-Gg: Acq92OGwu8OyBwJDsrhnhKXi74m7rt+WEdv7gFyactDQDFD67VFo+URv7uAH081T0t6
	zE9wkysoXhoXl8arQXmy6wUiATTOatnIJ8SNL3QL6qE3DyrtQ53ZqeyIDum84YtCmSb0LfZIkkY
	+nH8MDqlDPvLHVbIky0hzqQ73VAc1qkK6ZEwLIkTK9eDfUlkxDCDg2zByluy5k32muK5ddpEVli
	s4c0VZFQNprMlOHPbRphIJfpdV/jEotPwLZTDpkHhWOYRKU2FPVOBpPSbgcCKSN5z/K9pQui0zF
	OsnpWhpdQt+xDLwUt+sDBkTvV6vATaKTpy+MW7ulhUNy4Tg0L1FtHuILB6sdnuct5skbbpBu1bo
	r7+QRR1W2F4cK4SOyKThAld6Wo6y/1iSWg27mHjAAV/uCs1V+DJ3cHuxukUyGp/vcx6qzAcXFZ0
	MGG+bEW4Ig1e1+KGnFiyQzfGlxjBayTePJ1VT4GoBeT1wh2cTlbjYWrT4dHmasCoCSQGm/FcJQo
	FRoF1A=
X-Received: by 2002:a05:600c:4e43:b0:48f:e230:8cad with SMTP id 5b1f17b1804b1-48fe6632135mr98825375e9.33.1778929605528;
        Sat, 16 May 2026 04:06:45 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:45 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:04 +0200
Subject: [PATCH 01/12] drm/syncobj: add drm_syncobj_from_fd
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-1-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2530;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=Xxs8inG7yNnVnqsTeDmsro1fFz3EEPayoUW9RCB58oE=;
 b=+8Ntp4CeTenAuSVPrMlJyQQ3aZauaK6+QLTjIL8uRDHdQOin3LlpX/RlNsbP4/cmzUNFxQZTX
 jdMvakZq1vTDS+YTjld0PyK5yiRyPU+nmJ9Cooj8Tm+KOPLpLdSvCEH
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

Given a syncobj FD, returns the underlying drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 37 +++++++++++++++++++++++++++----------
 include/drm/drm_syncobj.h     |  1 +
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8d9fd1917c6e..d992aa082ace 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -684,6 +684,31 @@ int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd)
 }
 EXPORT_SYMBOL(drm_syncobj_get_fd);
 
+/**
+ * drm_syncobj_from_fd - lookup and reference a syncobj.
+ * @fd: syncobj file descriptor
+ *
+ * Returns a reference to the syncobj pointed to by @fd or NULL. The
+ * reference must be released by calling drm_syncobj_put().
+ */
+struct drm_syncobj *drm_syncobj_from_fd(int fd)
+{
+	struct drm_syncobj *syncobj;
+
+	CLASS(fd, f)(fd);
+
+	if (fd_empty(f))
+		return NULL;
+
+	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
+		return NULL;
+
+	syncobj = fd_file(f)->private_data;
+	drm_syncobj_get(syncobj);
+	return syncobj;
+}
+EXPORT_SYMBOL(drm_syncobj_from_fd);
+
 static int drm_syncobj_handle_to_fd(struct drm_file *file_private,
 				    u32 handle, int *p_fd)
 {
@@ -701,20 +726,12 @@ static int drm_syncobj_handle_to_fd(struct drm_file *file_private,
 static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 				    int fd, u32 *handle)
 {
-	struct drm_syncobj *syncobj;
-	CLASS(fd, f)(fd);
+	struct drm_syncobj *syncobj = drm_syncobj_from_fd(fd);
 	int ret;
 
-	if (fd_empty(f))
-		return -EINVAL;
-
-	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
+	if (!syncobj)
 		return -EINVAL;
 
-	/* take a reference to put in the xarray */
-	syncobj = fd_file(f)->private_data;
-	drm_syncobj_get(syncobj);
-
 	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
 		       GFP_KERNEL);
 	if (ret)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index b40052132e52..5da9988834b5 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -117,6 +117,7 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
 
 struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
 				     u32 handle);
+struct drm_syncobj *drm_syncobj_from_fd(int fd);
 void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 			   struct dma_fence_chain *chain,
 			   struct dma_fence *fence,

-- 
2.54.0

