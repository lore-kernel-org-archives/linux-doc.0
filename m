Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD643D667E
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929622; cv=none; b=XYUiiR30VkzP5XaOta47NZ5I12c08IMB8m0Ty26eZgg7/C3p0PV3DwMwrPCpKxHEn7Q0f/LTpm4YHDbgt15Fc8bgu8EYZVJUFtbHxiLOmt5cJ4bipZ1ruAm3EOKJPOOG7yK88GFW0bB/zMiG10H+vmr6tlOE+ijedi0PQlsb5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929622; c=relaxed/simple;
	bh=crfpaYowwqJxJnvwODKb3NMb9L0ciSXP5LaWzS0yZzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JWqjmquRo70qjw6aEaamMpEP7EFpry2WORqC0eo0FVnBWaLNYKfHLMpO7XkMxxI3Ty/DnLIHUNx5Gp4XezPpUuYFqMSre9Z54bLsrZeC1nV3iweuxKWvBot7ipRxnOa5D+Gnvg5Tm5o70SCJd7pg/OegMU87S+hzF/G9iroihEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sV0QlIC4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sV0QlIC4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48909558b3aso6968765e9.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929612; x=1779534412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfXCZmKhXGPb19F0Jw5wedNIT6lbmZvd88iLNzyg/OY=;
        b=sV0QlIC4zerZT0HPz89g/CWmE6SL4C9oXjqyqSZsu03uwHinsRhNb0nEw+clEg/uRH
         KDV0uXUpBXev/BosWAnX3utT1HU3G6z5bi9lU2vFlnveVjG6792bhHNkXpUHYm0FnlZ0
         fNldmqMN7pNMOjqNiBe4c75tFoTKw7bIbf5VdQi3PbWgbV4dUJKttdmw0uriSyP+M1r/
         0wJ/+VWxCc/52xom4aOk9CC5l5TkKR35WXFDsUL3Jsmk8vRLpXihrd0ZqyhsvypxG5BH
         kX5dw+LfuhnJjiFIRxY8vETGOBnAxhLT908JRoZmlAEwb7cn6uUbFOWRXDfAE0R6gHbH
         YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929612; x=1779534412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lfXCZmKhXGPb19F0Jw5wedNIT6lbmZvd88iLNzyg/OY=;
        b=NpVLpJAZg20i+0F3hT40Onp6e7Bdj+FwfGeUdQagvsgNZQPnrnjr+jJaEHNibB61b5
         zbrh3uN+WcwSS95jHDI41/e7cHH9FXg6JoCXE5OSpgdHUSdDT/Vwwy3EhMLu4ZiEW6Pg
         Pb68RV1QQSk+iZbUgsjKLp18yE6bW5kQbHf+DOhhrYYd2lKQ12Dt3KvrLibpQ6LPzmHa
         2odGO5ipEAczs/qgd9OUqMfCtwMTbc7HUm5VSPxCFEWsDAVthTY/2MH9xCTE1c9G/Mz1
         mC4ZaDmU3zUBqMb9TvGFpILcCfkbHiGQIUuVGXF8riZn7c+dTxmp/nO7aQulnsRLbLMK
         q9RQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nGg/vOn1VBgmQgUhnZVvymACZSYihJfeoffvgf7nDqPlJMnzHCaAWgVCbco0EEw53OXHkF4sdGNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgA6Ldhn4ma/qk12geBiaHvDuJjI/k1CfCt39/0cXu1oQmjbi
	01JTyPah4mABoCgn54gjTtElHqmwhpX5mC/HKxTUr491pFcaZ8omQwZu
X-Gm-Gg: Acq92OHCdAyXNHzCJVulIJmT7HXDrphz8F2k4uQW6epL/Fc0hBPLkqG1fdbbuBe+e4H
	gvOva9I2EJZakyEsdP1JbF5kZjgiCi7cwhNMswPXd/d07Am/3FkoLGsWHKyO4K/MAh0wqVeZzLV
	1kWdjKQN/NklSa+PhBHPJmf2ZCAJeE1/djCK2o76v5BXIHbtnKyQC3LHYWJn3BcIcG8gF9zXsq/
	PJToIRMsyKQJMEdtG2tWibixFQa0yHnrtkCdLIfO8ZOsUuyCO3jS80GLW+cXxFNqVnmF375Y7vO
	ju7kF49CBpJqASmASHt6e5h65x47U3GSxh2KWHrCSJC2fInsO1Tv59Lx72vMSbXC5kBcdHV5cBO
	9zK31qu7gmm03RpnVQkkEzTkLCUivKinjsfW6HuwVnfLRpHO5FVVOg4E4mBQnephf/+skkhDW2H
	rpFmRDlAmhjyJa0GHav5I1TbdduZqyTpRUKtZLvm9uX1xIJ2/xiOODPBsUE0bs7WPapIQrBZnkC
	hrobcc=
X-Received: by 2002:a05:600c:c494:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48fe60ed839mr106842125e9.11.1778929612138;
        Sat, 16 May 2026 04:06:52 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:51 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:09 +0200
Subject: [PATCH 06/12] drm/syncobj: add drm_syncobj_transfer
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-6-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2747;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=crfpaYowwqJxJnvwODKb3NMb9L0ciSXP5LaWzS0yZzY=;
 b=4LnJkSRcgHTRmc5hqP/RVVAq8z7NN5hqbrYXKUhKI6Ju4If09ezCwoSL5J4pmggyrT/r6k6gL
 MSWHYqto26NBUeuZWgCz0Yq5OF0t6VAVcTQcC9DTxb9GREciFiuCzd0
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This makes the logic from drm_syncobj_transfer_ioctl available to
callers that already have two drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 36 +++++++++++++++++++++++++++++-------
 include/drm/drm_syncobj.h     |  3 +++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index a746e787882d..8ccfbd972191 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1031,13 +1031,9 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 		goto err_dst;
 	}
 
-	if (args->dst_point)
-		ret = drm_syncobj_transfer_to_timeline(src, args->src_point,
-						       dst, args->dst_point,
-						       args->flags);
-	else
-		ret = drm_syncobj_transfer_to_binary(src, args->src_point,
-						     dst, args->flags);
+	ret = drm_syncobj_transfer(src, args->src_point,
+				   dst, args->dst_point,
+				   args->flags);
 
 	drm_syncobj_put(dst);
 err_dst:
@@ -1046,6 +1042,32 @@ drm_syncobj_transfer_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_syncobj_transfer - transfer a fence between syncobjs
+ * @src: source syncobj
+ * @src_point: source point
+ * @dst: destination syncobj
+ * @dst_point: destination point
+ * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or 0
+ *
+ * Copies the fence at @src_point in @src to @dst_point in @dst.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
+			 struct drm_syncobj *dst, u64 dst_point,
+			 u32 flags)
+{
+	if (dst_point)
+		return drm_syncobj_transfer_to_timeline(src, src_point,
+							dst, dst_point,
+							flags);
+	else
+		return drm_syncobj_transfer_to_binary(src, src_point,
+						      dst, flags);
+}
+EXPORT_SYMBOL(drm_syncobj_transfer);
+
 static void syncobj_wait_fence_func(struct dma_fence *fence,
 				    struct dma_fence_cb *cb)
 {
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 85e7ca7f7896..ec8042d61466 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -136,6 +136,9 @@ signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 					   ktime_t *deadline);
 int drm_syncobj_register_eventfd(struct drm_syncobj *syncobj,
 				 int ev_fd, u64 point, u32 flags);
+int drm_syncobj_transfer(struct drm_syncobj *src, u64 src_point,
+			 struct drm_syncobj *dst, u64 dst_point,
+			 u32 flags);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0

