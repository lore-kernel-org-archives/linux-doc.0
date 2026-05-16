Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E93D45FE
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929618; cv=none; b=Qabl1lo5kuoDfAWlMucukSh/03CZcdjiwEdISlMGFSYsRxikseb5OyKu2nHFbb3sq4QnqkJfXkkZOm9bGw1nSy4fBAF8lohOUqvnMncdJLKIT47J5vHusR0rSxc+b27HSCRowWvPGiJ0byGSI80ZckaXgQhGBFSIT7L3TZO8/D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929618; c=relaxed/simple;
	bh=Mb8lX2KhvsBJbZLZbGjpbAUq1f7hQxcuF5oQ0+pOVFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gN4C35yFDpF6F6TzIq73k0/1gVtIYywxp8EVpyjNoU1IIFgl1+z7mmQOZw+yjuRmRqDtM8XSVBBUU8ACgyZqTOtTehsUAvfaUsWn9yNCuBcxpwRSEeRgPa0ML3nDvDo71u+O2qE1oRniECRqpTZPCrz5CmmgYSeDLWDMsEj5MVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjCmLvR7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjCmLvR7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so2709225e9.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929611; x=1779534411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2kX0D85vKgrMTrfAaShnpioKYHS8IrhnFr9X3CmECA=;
        b=gjCmLvR7NUvdNlhUexikzVfYE5dvmDWQ8MDD2okU6SlPW/Y9rIulFIsqWjS20DP0ZP
         s6/R69DL0ezBfveFZKEXeOF30ZMpVqKC/mBKefNoHRn9DoFNxSqJ4VBTzMeN1b5ryv2T
         T5NH8EOigk1mpCKOMaHgwpUU1rswUSqv0yvaf2LwHqUr6CPA96QvaygkRvaXsSMzCn3d
         cElDHEISD5xaEEONpV2PfjiOHkrByKSMQasG9r/QsP9E6wH8LOSoq/Bl2R0p1Fa4jFH1
         P+WlbAfYfC/WVDwS40DM4dUTNa/uJerXBsCDIt7LmagBi0u5A8k5o5rM6ZPwmsR639z5
         apOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929611; x=1779534411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2kX0D85vKgrMTrfAaShnpioKYHS8IrhnFr9X3CmECA=;
        b=GF/6ytWmMYchOwt7ScTz5zKa6j4mZzYYe1vRLwF6UuMu27BtygKiVEWqmsGHIWqizO
         ER0ST8hOLwE7+rK6ybxXJ04yvT5UrU89YrS1pNNSOZxPzAkOlhVekZ66STA9+tacODd+
         AmsMv4qWVd6JD5mdfBKb4iM4/b4gTbjuUDn0GH4jdeWJK3eNyCMqgcXch38xH1ssM4AN
         AmXmjtDYsJTLFrST7KE2YRFDN93uksa5lFAUrvD/dstkYZcgSN/Gt+ss2IOZhTCM37XG
         /slyS8iJ2lLGYcwtC2AcRa3vJpXt+H8f1ysQzRr+y4UDnMUJSa6O7U8zwqyzmyelOOdJ
         nr1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/azGfG95iDTuIDwIZlpIPoR+8Nu7y2S0Oly6ZliXyrWcw3KCuth4mm60xYIgM+xj0y9bX7AfyFPuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq06553YIhvIVzzgyRJQlmEKPRREgbMkfMsXqgfAgG8nUCVKwV
	UPwa920A1Nakfe0QJgyqoUMDvbtjnKB1prtLFpszAfNkov7SjJn9j6aU
X-Gm-Gg: Acq92OE2UrHwgq+kmF4zTrgOcPKQp8se40Q5U6xHWL8Fr/RwEheJhbbZTfNi4FK35Sb
	JB7PK1Cjly9lrGn6RLECffxnRCxUUP+fXoRx8z24wjPPV5IwvhIuHi220saIur/EYPdK/dJYgmb
	LmEye7qj6hv1+bo0UiSGD3LDb7pekYPtFdtm1wZKK4s3Y0NZqy7J/c3Y9wvhKAvUQZr8QwPSZSL
	PEUf3u5NYueJ0qc3iX7LHyra6V2DEfA/EdL3Zjud+iKyrYr1ld5NyZO762evebuEpG8e3j4IY49
	Wsi9MYkK4nNs+fcpSOzd87DDq03YhwLieR30lTHywNdJxlJuJek/KfFLSJDJu/7j48nF9/yANap
	BneO++lgqWfoESbg+sEEWDo4d5VNs5GPbu7WE7sTo37JuGPVvEXvJybsZ+hoKu+mScnM+hE+3b+
	7DrtpQrG0tJMcOs8dBW7zS80Mk9zU9DC4mdqxdDQ9I/NEFn25vfUjdgdIdM1rQZOaL/9LhSyBJd
	IVA0UzpckWQmMjbDQ==
X-Received: by 2002:a05:600c:1512:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-48fe60ecd67mr61949075e9.9.1778929610832;
        Sat, 16 May 2026 04:06:50 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:50 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:08 +0200
Subject: [PATCH 05/12] drm/syncobj: have transfer functions accept
 drm_syncobj directly
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-5-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3982;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=Mb8lX2KhvsBJbZLZbGjpbAUq1f7hQxcuF5oQ0+pOVFk=;
 b=BeGkMWuyeX/aZRp2H0hfoW2AxnZOC2lzk8MPd8PsvJlWTvAKosg1c1JQKJEBD/6j1xtsYYLN2
 hnZSkrLB1TOAJz2SwH4GedXgfD0gdUZ4ygDmsn2lzPUAFQlwflz007b
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This removes the implicit flags check from drm_syncobj_find_fence. The
check is moved to the only caller drm_syncobj_transfer_ioctl.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 62 ++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 3e8fb7e0cace..a746e787882d 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -955,29 +955,23 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 					&args->handle);
 }
 
-static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
-					    struct drm_syncobj_transfer *args)
+static int drm_syncobj_transfer_to_timeline(struct drm_syncobj *src, u64 src_point,
+					    struct drm_syncobj *dst, u64 dst_point,
+					    u32 flags)
 {
-	struct drm_syncobj *timeline_syncobj = NULL;
 	struct dma_fence *fence, *tmp;
 	struct dma_fence_chain *chain;
 	int ret;
 
-	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
-	if (!timeline_syncobj) {
-		return -ENOENT;
-	}
-	ret = drm_syncobj_find_fence(file_private, args->src_handle,
-				     args->src_point, args->flags,
-				     &tmp);
+	ret = drm_syncobj_fence_lookup(src, src_point, flags, &tmp);
 	if (ret)
-		goto err_put_timeline;
+		goto out;
 
 	fence = dma_fence_unwrap_merge(tmp);
 	dma_fence_put(tmp);
 	if (!fence) {
 		ret = -ENOMEM;
-		goto err_put_timeline;
+		goto out;
 	}
 
 	chain = dma_fence_chain_alloc();
@@ -986,34 +980,27 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 		goto err_free_fence;
 	}
 
-	drm_syncobj_add_point(timeline_syncobj, chain, fence, args->dst_point);
+	drm_syncobj_add_point(dst, chain, fence, dst_point);
 err_free_fence:
 	dma_fence_put(fence);
-err_put_timeline:
-	drm_syncobj_put(timeline_syncobj);
+out:
 
 	return ret;
 }
 
 static int
-drm_syncobj_transfer_to_binary(struct drm_file *file_private,
-			       struct drm_syncobj_transfer *args)
+drm_syncobj_transfer_to_binary(struct drm_syncobj *src, u64 src_point,
+			       struct drm_syncobj *dst, u32 flags)
 {
-	struct drm_syncobj *binary_syncobj = NULL;
 	struct dma_fence *fence;
 	int ret;
 
-	binary_syncobj = drm_syncobj_find(file_private, args->dst_handle);
-	if (!binary_syncobj)
-		return -ENOENT;
-	ret = drm_syncobj_find_fence(file_private, args->src_handle,
-				     args->src_point, args->flags, &fence);
+	ret = drm_syncobj_fence_lookup(src, src_point, flags, &fence);
 	if (ret)
 		goto err;
-	drm_syncobj_replace_fence(binary_syncobj, fence);
+	drm_syncobj_replace_fence(dst, fence);
 	dma_fence_put(fence);
 err:
-	drm_syncobj_put(binary_syncobj);
 
 	return ret;
 }
@@ -1022,18 +1009,39 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file_private)
 {
 	struct drm_syncobj_transfer *args = data;
+	struct drm_syncobj *src, *dst;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
 
+	if (args->flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
+		return -EINVAL;
+
 	if (args->pad)
 		return -EINVAL;
 
+	src = drm_syncobj_find(file_private, args->src_handle);
+	if (!src)
+		return -ENOENT;
+
+	dst = drm_syncobj_find(file_private, args->dst_handle);
+	if (!dst) {
+		ret = -ENOENT;
+		goto err_dst;
+	}
+
 	if (args->dst_point)
-		ret = drm_syncobj_transfer_to_timeline(file_private, args);
+		ret = drm_syncobj_transfer_to_timeline(src, args->src_point,
+						       dst, args->dst_point,
+						       args->flags);
 	else
-		ret = drm_syncobj_transfer_to_binary(file_private, args);
+		ret = drm_syncobj_transfer_to_binary(src, args->src_point,
+						     dst, args->flags);
+
+	drm_syncobj_put(dst);
+err_dst:
+	drm_syncobj_put(src);
 
 	return ret;
 }

-- 
2.54.0

