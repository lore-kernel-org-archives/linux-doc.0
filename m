Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9221CC58
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735497; cv=none; b=knY1laxLLtxYzcTxjjTRp/mF/dth+TvEZdAUDvsabo6DPYqIUyElxoli+KlvtAQAIyZdMvTo9AFHHzB7PQZIsrH3aCm4A4x715g3Z4ONMZMD0YCQ0D9kfhtJEb7iWWODmfrVySy5Mxi/pa/V2ONiX/la0A/tFSVbtskIanDTzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735497; c=relaxed/simple;
	bh=x5tLs/vytXfpBM/X8/ZZ8tUWpkDQaZkbiuvJuIXmb/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3BQEGSEvw3f1tpu/wzEnUCi71i0W7Lqgj4+WciotTnx/rxxWx5oSk5XrA04LGvuQ6l4tIQyYc9qio3274FCHUzh4zRFXvSc1lNE41eEHrANkhBv6wKGuXoJynXRC8r3q1fa1+J2R3AmEQR2VcUUXOAEFO2rsUp9s10iNssHUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=mTfG6zlj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="mTfG6zlj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74924255af4so611848b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735495; x=1753340295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
        b=mTfG6zlj/09Mpu3ycSk4JTmMthedUHfPWxbrojFMj7Vpo5djN8woj8mP8JyX+ha9gA
         WC6HT8aEtkDwx9/pJHVG2lNpV+IFFslvxAn61zDhzXXurCZsxrspgk7ILPC7lp2U4208
         qvSVMnl0MPvekl21+XpBjvqQI2ufZw41+6/Po8moI9deMIXc+IbZ68gr0Iatp2ljhKYi
         7ZG9UqJwNDTj7GX1Kh7rYBKmYiz/arI8RjrNDRRdlqYikJ9nxm/xRhKCXPHOq/3EIW4F
         0AiQPBy7buKdKs1Z6PFvMkDuoMsnu+OLaj3P9OV0itcpPt9IyYXtSgmt2OMA5leJ02EX
         WS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735495; x=1753340295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
        b=btaGN1yW+HtrErziJ97bjfatBZDqE8j8C5W9dw6pD0X/IdbFnvrj2H/vFFRhp+h8A8
         In2BeMZL0A637Sy53bNZ7p9FHDvttXIkyw6MmCZvygt/F9WQhPAPQ4PjkQsWgdcCS81Y
         2SISH4juVb7kK3qiMRyjNARbm59aZb6haFPyMHyP5DicraYi5O5CtupBQlXdnEauujjX
         QLZaQe1cpe/1J7v1mCQ3caNGYimKViXq0U71XvZIYB9f0ikyhD8tCc+w/GzY5jcaLJNm
         Lio7bMEivnZh0YquamhWztyzVeYgDonSUvqEUYS4sbrMQ9PNxYbX8nQDrCNm17OnvFs6
         oOrw==
X-Forwarded-Encrypted: i=1; AJvYcCXlzQ854vBpCj3iMFkd3FHoaWAoVXuolfL0So/98gqrFbPTEpeVN30ypERGr1oD2o/cH0IhzaszadA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7316ssfICg0juery5nROJ86Dq3BurWkbbIodlZl6wYb3otQtK
	RifRkGRZ2p+H7e/jgxav2PsA7B2JZdz2VyC80iFQIyLzMTHYBBlu3rmRdIrQYn72TK4=
X-Gm-Gg: ASbGnctobjKpGDAT+CMAeczfIVdvlH6gNDKmly0YzTCk6WoOhVuBfY5UGOXG/OYCJjO
	FnV2ltRtkqW45XZdI+WiYa1PSsQy4ITMfGjINzFdAl0iIUmtE77Q7cgJcUV9nMqHjj0YeLqlhqi
	16YCDrQJfTdvpXIizphWXT2LPwGpAOQzYaxv568Y7DOap5tk04eFZlcO3KTHhyS2GqOBa1ae6HQ
	z8qwAve+glulYRo4IGmWc0L31Ix6SC3LbHZK/QolgRE/Pqa16gCEwQRDappcLu66BqsdgiOPAhW
	VAN63UH/0qPsMB69shMki4IgSaHtk9OucSBOpyEEr8pCDwdy1Lr8TL7hXP056pReS6wEVyS+rjQ
	8rb596rAN5O/S5JaxOSazPqCydBcgfT19is3vnulBgfY5qs8V1cxs6g==
X-Google-Smtp-Source: AGHT+IHtXjv1j8/b35hlWwb7zAfmQUs+V6Fqss1rT4O/h1FVsmO78slSmyNXzYvHuFstjqrEM2uOFg==
X-Received: by 2002:a05:6a00:188f:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-75725589c70mr7614496b3a.18.1752735494900;
        Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Thu, 17 Jul 2025 00:57:55 -0600
Message-ID: <20250717065757.246122-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the deprecated mipi_dsi_generic_write_seq() and
mipi_dsi_generic_write_chatty() functions now that they are no longer
used.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..3b8ff24980b4 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -772,41 +772,13 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_generic_write(dsi, payload, size);
-	if (ret < 0) {
-		dev_err(dev, "sending generic data %*ph failed: %zd\n",
-			(int)size, payload, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
-
-/**
- * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
+ * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write() w/ accum_err
  * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
+ * A wrapper around mipi_dsi_generic_write() that deals with errors in a way
+ * that makes it convenient to make several calls in a row.
  */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 32da8861f9de..526308e24f6c 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
@@ -379,27 +377,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
-/**
- * mipi_dsi_generic_write_seq - transmit data using a generic write packet
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @seq: buffer containing the payload
- */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
  *
-- 
2.49.0

