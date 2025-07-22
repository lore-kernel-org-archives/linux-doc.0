Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5381DDA32
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753149208; cv=none; b=ItZ6FEcbrMv+lzIUjENggjeJgtHYOrjsh038xmn33S8WpVILVtCMsQWZEA8PH112x88tgKs0PhYjjqxclD1g/rJDz79c+WDvcaFxDKpz90P2ovxwwd8tr2YgyX4W8fnAZL3TIy3dZn2VeXhLfMRQ29zm3kXBYeri3gbSUlFqR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753149208; c=relaxed/simple;
	bh=UGjriME1ipcli1o9i6srAJ2jQYa/wzdVFweQP30jMJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oowb1RMeaUQTluSMXkTZGlltoY8kUNhvaEo1cikB2GJ0PGS36v494bjHY0oA74qlxC3rnrHIusckQfZs3w4EHdj44ySME6ybhRLxbQ6BU2128Rx8x9RUzoBDN/1mX7nn7h4undGdeKXj7wr8XD2CUasBzN86bU572eXc1GOMWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=YHDfZls4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="YHDfZls4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-75ce780af03so1334529b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753149206; x=1753754006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
        b=YHDfZls4GDtf0mn6lHnkGZ+FzQbFUGrF2AML+cK7f6Lxe6Pf3jNcA8Gdf+Gi/jBkR7
         2AJEqoBcYX2oGdcaal4cFhAykVy/qqSQSQjQrunmNfEv2W5gODvrw06OkjMKvK7OaiW9
         dFIm3jdk7YP+vNpp9uECVHS15P6guWcLDPuaVjnhxLZKQiLasF9/Kaz4Q67Vb1/YO/PS
         ElmrdO/2Ku6ZSdbXn1540rEy+MfIQWwXCyRoOd1CQ0/bXEswl6fPD1OgYQqY0EnlXeGw
         k/28TWJ9xT2FPq3L+rPsP8gxUDqIi4V3qP5V1aQh3ull9kamikXGm/lj//jxq5twvGZq
         IpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149206; x=1753754006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
        b=e7DGmBqLso0S350oPRW8+U0uyCWeXuEGZqDOWApko/qqxVJN3XZe5e+kKyBiJ0qz7e
         2X9HJq+EUd5rM7MaQmQmp48yDm68PROMFL8Lvw+GKGkNNLaxc+O83dyQE55YIEpvFJ2m
         60A6ysjtkTA7ZCt2Kowz2d+HUxS1Cx2GH4SSvKumhDS0iwLAUblD/0vGqc0GqSOk2ti2
         y14j2199mc3W1zvsvMp+23/PsaCfN+7HAk5VixRmkety2Gk6Jf9FBVg/G/h+Z9AJnSwv
         9uEYGtxaU9ldRrDIFEOUbWHZr4ZBiXitnDu3b4W4wmZ2s2v+DGOXmAOMEjYPc3wF10vs
         1MkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAJIe/PsV0QUxiXnqOTAnaJpXP54mnXRQtiAp/MuSuTVZ6Hh0tv+BZpJu424gO+Ew5/6HtersyWBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9wSKd7Y8Zkt1SEjBek4VDClAkhO7B+LS+TuSZlKcjM5p/C1F
	TyHwS7e3PBA1elVuEAo197xjg3ErpAI8jR8viwqtXylyGklBDRZ++8BY1g8VTDnWAv0=
X-Gm-Gg: ASbGncvsbjlyldscmDXpmE7XUDliTM69i2HhBWCzT+3ywAfFR/oWYsquD7c03BSn1yp
	YKuKWqr8b4o7MptMzErKYLON7iE4SgDdV75TcxNwFOMcIV+2SxEqfayFFTNjTAzgCziG7I4Ap+s
	HWzvKy+IusVJjUmIjjx9ar3PjrATq2oAKAP8RsWgwY13UyLu6pX9fdaeDQfCmylDuyfgT7CaogT
	nUWM+WMZGWx/Qgq7MOvuxDjOt65picfFD5n7+gZ7XEPRYq+nO10665hwDFY1ru0sp2imDFMz/M1
	fzj4D6ZPSanPEQe+7BlyoEDG6ReuI3BAcEi/fngkuGIaJU7ft7PxPT0abJe7kz4PgsyQ/ecBDc0
	Xx7AwTbPMM9waZJ/kTvktOdp0x4yiebIOqehEXDJAHGRwCZALOw==
X-Google-Smtp-Source: AGHT+IG6tNXplzhOlO9KMayA+8YKZtftV5rzHK8TvneHGceF0dD/1zLLjMy0L2fZ+upC9WT9XqLSug==
X-Received: by 2002:a05:6a00:1945:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-75722771f31mr32750586b3a.3.1753149205584;
        Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
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
Subject: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Mon, 21 Jul 2025 19:53:10 -0600
Message-ID: <20250722015313.561966-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
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
index 5b387543de28..ca77f152404a 100644
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
index f1dc822f69d6..ea523eb35b08 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_multi_context *ctx,
@@ -387,27 +385,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
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
2.50.1

