Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7313D646A
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929623; cv=none; b=fla/Bg5Z0LqM21RmYsX4E7TEZY+PsKBXDiT6bqe6OEVeMTViqtiYNKE3RT6OeBB2eleVFRE3LVFtfM3/IDZhDrpM/ypcLhz88DTTmgKUnrZNS5/Kox2Ek73IeEEptMT5F9MW6nvAY7WfQXZAJ5VjPTJIlE881NMLR9oFRupK+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929623; c=relaxed/simple;
	bh=5APNMtl2NCstrrwoxtWKTvFVItf0IqBmltZkdCTjBxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzWHJgWnRGEHXsBKv/s12eQ6NFadIu40gbUhRyLtSch7LHEeeO96E7b/Cb+rt5k6l//98PWtxT3Y9493eP4jRJeLCs1j+dtF9+HQHg/pxgGMsiergARDfJc71mpipnuh597Zvy17rQLX6qdphYM4uAkXNxHA7OyNkBLpstSPtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoL64YiQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoL64YiQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso6846075e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929616; x=1779534416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUzK0JUispp8nMHz/jfrYyUsKO3YYZqffLIW7XXNsp8=;
        b=AoL64YiQVahJ8Xq7A3slMhWKv+Qt4lDYANxRnhdwcXqknCwjXGt5dxsJZZCgllYP+Q
         NfDZB5Z6sldo6/fwJQNwbAwXcwq8/1xHqW5TPUCsXyxlDMS5mmRmvLvntNlm/THnxcrC
         ehd1TwMWi+HbF+f41BQ0oRe0zxs0IwTr3iKTd3//HdSzgmjz4RplkbbqanE+SFEVjejo
         EgHvqDuuw2Ro0vp342ClO0d0wiAUw16ZRf4xwvCLu1nfNbXdXWSRyyON60SnZhNRyZL/
         B8Gn2kfuJT37z1YsgQJW8xFA/1X/8UKF2WPj77bXf25Kqdi52dX9tV83/rYZNjp5HeDv
         wePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929616; x=1779534416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUzK0JUispp8nMHz/jfrYyUsKO3YYZqffLIW7XXNsp8=;
        b=MywKeoc4ahSkEVzonHq9Vc5EOlEZgLvyoQgPF7CiAxM84k2TI2+CysmYEgkOt8eaRA
         /NjJMnsRfugehOKTlcVxTEU08H2aeoy0l9GlqO3vGUOh139Lb0XO6tvX5jQZkwqDp4ld
         ZvFapGxqZ4hZHn5+hfYsyV+5bNBxEdWUtyz+Ptc5tqudfwRtnUSAXWbIPa/nwE2khQzb
         Z7VOBy6B3U8OybDp2HM8ZoRy5yHmZFA0LyHna2uSC0CndShwaEhnvO5pxljsLFh/khxZ
         82AI0ufW9TuSqhyyZ8ZLqTRG1EuoX0Al+RzqykeMSFITxBNB9AWJhjeev3TUYSHITZCJ
         CaDA==
X-Forwarded-Encrypted: i=1; AFNElJ/3o/JDHfj8JEOANe2XquGxcErd8LnBB9e0FdC2J5ImKt+DXVolsmWKaxur0bQ+r7ufXiMzsUrpzcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2UVQYCmNXvAp7p9+yAFyXrGVOffPTZn5r/VCdulTCy5cX3tT
	50ov2P5NogoP+34cpuDHa9uABQxk832O3ZYuB3l+9O23cOiKQpRVsNp/
X-Gm-Gg: Acq92OE1L3giHytst6zMgNapHV/TIL7LNUJz/QRjT7Zw9DoUQVJSSOCi8QYFx+7PiCn
	EIS7gBgI5oX9syfD9aPd2ASRzIWSr5BrxDageo9jp/Du6/tfwiHD/kupC2JdMo6yRUTmw5BeHHI
	CPteT0B/bhj8/VkF9+wM+IhkYFodzUTuuPE/C/wj3oiLPArVIX25kfjnBmnnE8E7WrNEtdXttfX
	R5B8x/ZER7og8Us4gv+x4T087D/3k25ySzwAbMaBFHAd41+li01rpPucIlfsGnU6kk3H6LHq3+P
	NnGUwTj1N2eQMwKJr+87nj8AbsXcuR6IV9FfaSmSjtiX/ErK/E1P+y0up58uOZn21BbIzPJR5Ym
	SmqaWiPH0PsagSTvAgT1FmFoLZKxZKN9hRIbhJx1OJJPDUMcMxUmbUw1+zl+mZQS+9muMFe1SA6
	EkfLaCeHQwe1p2Vo2myc5iSb8sy3QmUTdeaFTqmSBOS8VkJshwLEuK9Ynyr9vgVJW1xTQSxMEZB
	bzpXSg=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr88176225e9.0.1778929616265;
        Sat, 16 May 2026 04:06:56 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:55 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:12 +0200
Subject: [PATCH 09/12] drm/syncobj: fix resource leak in
 drm_syncobj_import_sync_file_fence
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=1383;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=5APNMtl2NCstrrwoxtWKTvFVItf0IqBmltZkdCTjBxU=;
 b=uBiahrAmREDZy7Fj07y8SVauSH9GmZFa2clMwUB1MLOYdGIifgpx+NgONorTf5/6Z4hk84rCI
 KXcKOq9bDW9D2GMf5/UEmHT+/8WQoDxsc8BjwHF2qniEf5cY8txk1A8
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

Previously, if dma_fence_chain_alloc() failed, the syncobj and fence
would be leaked.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 9b7ecc2978f5..1da96e23dfc0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -767,30 +767,35 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
 
 	syncobj = drm_syncobj_find(file_private, handle);
 	if (!syncobj) {
-		dma_fence_put(fence);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto err_syncobj;
 	}
 
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
 		drm_syncobj_replace_fence(syncobj, fence);
 	}
 
-	dma_fence_put(fence);
+err:
 	drm_syncobj_put(syncobj);
-	return 0;
+err_syncobj:
+	dma_fence_put(fence);
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,

-- 
2.54.0

