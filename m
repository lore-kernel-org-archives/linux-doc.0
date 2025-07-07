Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93828BA81
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875053; cv=none; b=alfa3Y3NEZEtxfumvUlBFSYVACc5WEH+l9nnVKza5vcIbB5IsXauO0UJKxqiycKI1GmHg1lCaJtgoRHNY2ZCD26wbRfvsnAy0zXYeb2T9fqbHOii+fN6g9UDfb5uwk7pxnloZAiDybuXo8I3PYXib6bs+6hqirErwPhFvUW5Sjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875053; c=relaxed/simple;
	bh=ShU8yklGcE2Nn5vs6gIvPaLoQyjIaXH2iJ09CEBsak8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDnzJ+61+xaurEk1Dqg7i3g0APtlSwIq1kIkVPCGOiXJKKmav9XcLPGRDD11HSxdpVlAWJ13pePlgkwbd8rlx/che/7pdczIQXgQ7ZqPWPaoAfysZr2f8yLdE0ARWO9RkRG0k+2Z2iwtveHcYzcKCjZJhvwCnDYdlwj62PVSYAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=MXOBNNIi; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MXOBNNIi"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1580263b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875051; x=1752479851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
        b=MXOBNNIiGX3tcEZR3ljDT/YHyMsWetdTtixqq0kB+WncRBQXJEmZxMW6uBfzx7C7n6
         S8cHEiNKqdfgog89Z8PLPqo+rCQ2aZTBdGA911dBO8UbQc7Quc2ncyx/aPZ99NEMCNK/
         Ci2R6o+aSQoh3uFGRIc/6cmA40jX3EOF1pmjMstq+jl2WKoTxC8+XeREPp3WQ5XFnEiH
         ymSszx5IFur1y31nJPPX1So8BM+4L5yMjzgVBxyVYU0pXilu+Mubh46wCvO3tDMSxk9R
         mq0j8o3lmaEYmWWmb2b+MFM98BATqlR3JgBZ/B4q7nS997Ilzl0Ij2aFg+1MBmrgly6S
         pvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875051; x=1752479851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
        b=F7zpkdHRD1xengYSGdSnerS8pPsFKADp30y/6m2+8DOYd4HOcJOQEjGQzTsApJbjRm
         CO/37CWQQcf59rbb0aJh6FDH6wryf6aLvhWPeM7SgG7eNr+nUaxj9IW99yr8KRO1CZA6
         Hq1KpQl32KIMUkGynA0s2dV3h3Zuq/+T2DFmndveU4/RI3xlebFILQL6fi/m6O91vngt
         M0wYl13c56PflUAkvMy8StrxklPv1/yqSbEAiOKuED6LjXEKeVh4ip7J/Fk7EA8cTcK4
         XPxhtacGB3ccSqcFprcYEc1sgnbMLuYH1sgWFYQ6jyMe/37hntICR0HtRq7kIoxRbw1u
         ZwPg==
X-Forwarded-Encrypted: i=1; AJvYcCXuJ3S7Ygf3/ALcVKBiJQTonI+s0yo+t9H7KHDlt1ABbuLkPSL/wxBRgDmZg91wDSvQUWqoqz/AYZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlXcderlyX3doE7VQlR6PfjX4oGNL40Ti7m+ci9H7mvoxwCrl
	M/1ej0x9dYjM4QNSzwGkU2SnBkYGMUWGeLJTGFgoMYifbKxZKn/ZpnWrjKW6geucXZk=
X-Gm-Gg: ASbGncsAtFn4u3btONfu165cYmzard52PLf0zGU9CsQ98jakszJHk90ymo6lE1/RaP8
	OMJ7sMinapbz3z20MAXjoJy7qg6if5V9E+ATo+xDpYuxN3bLp71e5c4LDEn9wfjSH99S1J1p+Du
	QqOowPizaMQ5RhchLLxWqYlzFzFeKCUSxUMeA5IfLppXSGWjJCaLZDLRY7GYWBRBmhLBrvWeD0F
	vISYsSlOCOGgt5pAztEYGY+HuRhOQZBYRrCYmEZ/k7x2tnrN1bSWwhaAeM6sRwfwOHBdKm97JKK
	VaefR0sJ/1IeazBoRSUioHmXcltaNOkD5HXFSsi+Yzx4JSZ7UCuhhQad9vCRjyozUqduRQhlEI9
	Q9HaEUb4St8dA9NADpA==
X-Google-Smtp-Source: AGHT+IEItjQ5pli2AJ0rBOKHmZ7rfFk3/t/CL1j/RMQ2Bp4Fe+1XZFqzMaA4o2gCpzZkugK6AWVtuQ==
X-Received: by 2002:a05:6a00:2195:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74cf6fd0ad9mr11173295b3a.19.1751875051077;
        Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:30 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
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
Subject: [PATCH 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Mon,  7 Jul 2025 01:56:57 -0600
Message-ID: <20250707075659.75810-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the deprecated mipi_dsi_generic_write_seq() macro and
mipi_dsi_generic_write_chatty() function now that they are no longer
used.

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
index 369b0d8830c3..f9cc106c8eb6 100644
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

