Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5718137C52
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758479950; cv=none; b=npMaw7GcJe2j3G9mnMLazTplcVSTvA+QcpqNFKZ6/vB6OR8Eos/JZRkDuyN9a2SRL7ZQf9sqko5zaarf6jTjqljjvxzKvAl/1jbPhvIgatfXXquz8+uw1/T5MGjdtM/EfR4c9f3OFi1BlmivUY/xds90ibCKackZF/qJTg01puk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758479950; c=relaxed/simple;
	bh=LdcCRqz3KtQXSXoTHb+8mA2gEpy9f2TJgfnQhNHNteA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lA2mJ7HUD3+29picsaD429MJk6gVejeGFo9lMdKKLfK5CyMc+47o5v1yIBcoMszEqwDkkve9Po+uWzjARHwnNO49xIylpfDUpVsVu8PN5EGE0vqjoB7DuM7phEtept7o7CkZa8FeHUIhQSLIRGmeeXGyiP71yU2/KCGmdsIhvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vfg2YKrH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vfg2YKrH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b54a74f9150so2723832a12.0
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758479948; x=1759084748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq6jXGXLG3JigntJa3VtN4WdTvDP+hByOjJ1Pi4yPUY=;
        b=Vfg2YKrHaVbn+0gOmc+C4h7ftRMzmYRT7Q5eaFoE4eAEuaKszB2UTVKK8tVRaWDXT7
         hk7dQ65KvpC1x2pD8HDH45bD30YdIcXwMkAD3mzMHlXoGWU6TYGMtAbM90YmLT7GzFpo
         033tFrgOYrHx7O9nTWaSREyCDsTyaafm2we5psQxuCKkBJlBw5E1hSN2v4IuiFeATEES
         Q8gjlM7ToqHt9PgXiQDWN/iqKXnT2djEriPmxU5XC1BPuzmmZSU6nfleDHjSlD3YeHLM
         gSXzj6L5t7QBYYAAig//zNrtPWdKPdKAtnt7HHcOM5+Uf4Snv4x564JeCrOFcwf0fXtt
         PE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758479948; x=1759084748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq6jXGXLG3JigntJa3VtN4WdTvDP+hByOjJ1Pi4yPUY=;
        b=g8MFM04TNwXJXUUjOrBz1TZEwI2MfcTr+Wrv2QT8WxsPALlVu0yX72Ptf9dFhN/Q0E
         Crg8jV7r6Tb3WeCCs2clpwfPTwDPYULiKloMD8IoBWjtrON84XEUHKNP45TQsuoE4b+w
         skWQNwH/sO7Zdl1pgkwq1ANjpmSZe2T3eXI8x9kYsyQpzP2SBG22dY7M8zNVB+6Rt8R3
         1a7SH6GQCEQXo14S2+NC/+1RRc/HxtQyxQjIqTvLh2jIz7ZF2beEs+WlijtWh6vXVzka
         QJm0yY5tsofdUaxiZn1SgjKzjXVZrGZTtq3jM0IIWpUS8Ilhcj3DWVRh2XHOy7Y5kWF3
         x+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUTEAS1NKeKAWyYKucmRJcVHxCJC8FsgkzM2ZgJ4aS/zTYJP+TJpJLcDGAFhh/aF6oetRWL6iaiFMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK9CYsGBcqIAiT26wS8kuPi5keN8R6WeoDu0vVTvIxKoAS8+r
	EzzHpTm9vvswm0shezAP8Tao/tEigfMeRAlnLJMyJK70ptMALwecqclo
X-Gm-Gg: ASbGncvuMHZEwFTdUzX2WZWJ6Ob8U5gEhJRy1SD0ZeUnZrTjB7aOs3ZgN9Z35H56JE8
	2D3scOhW0u1JcDzaiavD7Z4maV1EZmm10Rc+1DwwalP6mCcQxhJAnO/ucDdtda30hTnbMFyOS2M
	U8i/cvgYyO52pAgu4lB7xeSeduPQemWsDzLrlzA8KRhnn9bfsVKp7U+Cx9LdqVUyzGeOEDtDWK1
	SqEKIvO6O4cY8Y81Dvc5EZQjD6gSH0Txz8CCz1ppeIibF9GXMbg2qY4JPBt+5yKrDEMtaP1qVP9
	EK5XjxhfSmj2PQmXzygoROhrqCS4pmnYt2PiKdXP5+t6pb319xH+FPpzvIHafAAz5IkwEbcIy9k
	P13rZB4VH0EYeCzZfgA==
X-Google-Smtp-Source: AGHT+IG/tBXYTLYsn0XwDsfXDr3GxHXFm/OCmsG97SH6xg+8qlRPLcBgWhtCsUeNNJUVJ4KN1b1Ujw==
X-Received: by 2002:a17:903:2347:b0:270:b1f7:2e5e with SMTP id d9443c01a7336-270b1f730b2mr82568485ad.22.1758479948106;
        Sun, 21 Sep 2025 11:39:08 -0700 (PDT)
Received: from fedora ([45.116.149.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 11:39:07 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jessica.zhang@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 2/4] drm/mipi-dsi: remove deprecated write_seq macro and chatty helper
Date: Mon, 22 Sep 2025 00:07:20 +0530
Message-ID: <20250921183720.237761-4-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
References: <20250921183720.237761-2-rtapadia730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeev Tapadia <rtapadia730@gmail.com>

The mipi_dsi_generic_write_seq() macro is non-intuitive because it
returns out of the caller on error, leading to subtle bugs in panel
drivers. Similarly, mipi_dsi_generic_write_chatty() is redundant.

Both are removed in favour of mipi_dsi_generic_write_multi(), which
provides proper error accumulation for multiple DSI writes and is safer
for panel drivers.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 32 +++-----------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3a9b3278a6e3..bc847ab5c822 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -773,42 +773,16 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
+ * mipi_dsi_generic_write_multi()
+ * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
  * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
+ * call for you.
  *
  * Return: 0 on success or a negative error code on failure.
  */
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
- * @ctx: Context for multiple DSI transactions
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
 {
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 57a869a6f6e8..e4d26ed7a62a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -288,8 +288,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
@@ -382,27 +380,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
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
2.51.0


Test message
