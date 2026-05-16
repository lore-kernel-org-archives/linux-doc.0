Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB53D5C05
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929613; cv=none; b=d5VBldCoR6yOJLUrmW7jJV3Nkqq0SUG9vEXkHe678+ZxNIp4A0TKzf3zrr+YBWNMgPgZtqwX20ky8D7vctnrzZhLhMINCr2W0mBLFc6pjlCwRl967036ki1LV2G/jLq8MVuyQFxOWFbPz1j+3G4x4yUTvic8OuNOc7960K+5EZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929613; c=relaxed/simple;
	bh=NwwauNPJiO1PfXNWR0Tt78KBCxqLRi4CSj0dLIMDu4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjV5bbjzf2RFMYRh6cy7LVKXTNr1e8jKBfRALXpM58zpraX8/hbKR6MUO1ngpUWt+9sMTJS6w6eMjDRI0fAxQFn1n0RepeZoBTo1BYPFbSdO5aaPFb6/qxAjBEDOmy9zWT4DZhsfkFfRVpI8e6Ucb9klySYJkMg8CJQpIF+Yq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfOoZtxt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfOoZtxt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso6845345e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929608; x=1779534408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLr2U6KkG2Uu+VOL8E6/tXdIBWCkFd/7X9q/HfFlgP8=;
        b=LfOoZtxtPM/FPmrOmUdQgwCcwUTSPJN9NDqbq45pssSl7LLRPTv9kBv+20UbiURiDu
         fx5oJJ6GIpbkVURbsGj3w5R9GzGFw9wSA19/OSEcpBneWzQSbovrGCkWTv498DmQqXRT
         bZ8xwZ3QCFB5iNOzklGUq0pIDQdSaycyvXcRis4AEYKGLij/1lGkuI15xkiHv5VHx0bV
         JHCS6y7cOnvhjSIahri3Qd6RKa5rQGBmhCGwfKiBdSPKTtb47WjrbNLn+fMDUlrwYOJ4
         pSUzpvJ1/zop8wtXghhba1YBA2uCALUQR3lLDzy4qE3S+XbYvF9PeC9NSmLyvq0Ks/QK
         cMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929608; x=1779534408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLr2U6KkG2Uu+VOL8E6/tXdIBWCkFd/7X9q/HfFlgP8=;
        b=Zx8oljxGzhqLbvzYM8SpQUSj0akVGBFdhPwbeevkOks9uCMQ3RYYLjoCUwjpxnanEf
         EVqX2lV28IzjBi+cAj5jWb931wD7ZkgwlCqRpI30gYsGHftAVvtIMOdcibwtDs0vHxE9
         /K0wqwQXmd/CRR+hkCsN7JjVp9g+UGA7YkRywqGdhQ8xrhLmDl7nYDCpznjpy9Lxiy8w
         TuQOhORbU+fFQy1f0pj/j0EPZQ+wjRy5O23cd9wPJaWXXvkbzov651TDWGLFgJRe75QD
         lMTcawlQnHPxgl2ssWcwoUEWTq9IV9wleToYYovfTbQzRTkWCU43BOdZpxIt3V9uq1B2
         Gveg==
X-Forwarded-Encrypted: i=1; AFNElJ/RXT1QF1yIvXhP5gyHLlJveTSk5BlETchF6jqNMFzHQ6P8ywBY0WzUgGiZv2ya6bpYrDsWzs8caDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5H4mzqq835fDr9YCQ/8y3n5rbgVy9RdT169dhkoIFzxNeV5kw
	U2JbGiY9RTB2a9ZMxguSh9SE4Jt/Txwdh4uKBO46LS+3iMKpOLfh2Ab7
X-Gm-Gg: Acq92OFqwfPEwPkS1o0ARfKiOjCigaBZKZmsGcphuDiSjS15FFSXlR75v4QwYAA9a9p
	9hPAirFO4d7z6JUSPZWWuoXKpgTL8D3ZketeQoVDoYntkgjzb2M9UkS78mK9fg2hx/+1WEK84/H
	Uj290XHsPZw5xm3vLzoGisRYdri6E9MIJTdClidE5q43wjf9insLxcMQuW6Ju7wsW/OXSS/bc7f
	GuIyl8/jJxGyGuHbJiKyMYWgNxxScUPfSI9f1Ror01INzrQhmUqrq896mdSD00H4x5wET0VC9vr
	1Vw4NeaWV0YutVtBDdc0G/r4LMoLhIOgYaPxKNJ8Zuib20J2G7AjWHxFt2cRJ0Zv+PnAIxMO7I1
	amDlaBOXpxI4vWvBatMHvlQcgJyLSCZXQd7v467Hqqd7RGPPYH5WppvVtF8j60OTLS6WWR6MZgu
	nYlGZv4XDqb3jvanXOMP7HVcwiGW0EoIGpxcgnAPWN4iSNHkOK34gdweW/9R+edH5K85/OzZPYR
	uSEKiw=
X-Received: by 2002:a05:600c:13ca:b0:48f:eb8b:9988 with SMTP id 5b1f17b1804b1-48feb8b9a84mr53458715e9.23.1778929608240;
        Sat, 16 May 2026 04:06:48 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:47 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:06 +0200
Subject: [PATCH 03/12] drm/syncobj: make drm_syncobj_array_wait_timeout
 public
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-3-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2220;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=NwwauNPJiO1PfXNWR0Tt78KBCxqLRi4CSj0dLIMDu4c=;
 b=L70W+WfFJyxFbr6yV3GcY0+dLZ8/RrrjQI0perIlwa2ryxcj58Yc3uwASbkpuihDpL+gB9Dvu
 iClDpDWu5qLAvShl4cuWM8lV4UGkRD1RQm8k8xpOhVcZK9uExSKR7MT
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

For use by the upcoming misc/syncobj module.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 15 ++++++++-------
 include/drm/drm_syncobj.h     |  5 +++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8df438fe0807..648afd1f4fdd 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1069,13 +1069,13 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 	list_del_init(&wait->node);
 }
 
-static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
-						  void __user *user_points,
-						  uint32_t count,
-						  uint32_t flags,
-						  signed long timeout,
-						  uint32_t *idx,
-						  ktime_t *deadline)
+signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
+					   void __user *user_points,
+					   uint32_t count,
+					   uint32_t flags,
+					   signed long timeout,
+					   uint32_t *idx,
+					   ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
@@ -1229,6 +1229,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 
 	return timeout;
 }
+EXPORT_SYMBOL(drm_syncobj_array_wait_timeout);
 
 /**
  * drm_timeout_abs_to_jiffies - calculate jiffies timeout from absolute value
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 580a967ae364..7677fd995be0 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -129,6 +129,11 @@ int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
 int drm_syncobj_find_fence(struct drm_file *file_private,
 			   u32 handle, u64 point, u64 flags,
 			   struct dma_fence **fence);
+signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
+					   void __user *user_points,
+					   uint32_t count, uint32_t flags,
+					   signed long timeout, uint32_t *idx,
+					   ktime_t *deadline);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0

