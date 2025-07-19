Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C02367D4
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913630; cv=none; b=IbElktCBP94HqB7LfLDUiu3nTqgVSkjeX2SYZnsfS4Bbxiki2c4AYHLAsqUZ3pD/zNwEMPFsYhKrhrxEVzVKKUOBKirs/YMyJ/8sLL6y0lCZzZKZVOWiJQ1rP7NWgWjArgech0BoFja6guPRdybd7YNd/bAUcjj+N4b3UOuyNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913630; c=relaxed/simple;
	bh=bd+E0gQII7XeyGUMZUuFdsAUXKc9B1flbUYFWuIacjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taSoW91gCXWcPSvB1TuS4PvyuQzLOOU+EEaQRVwGkz1J1Hq3CDgV7eiquTW9RxYmL3uBddPy7V9PtUKxYX9qM68hHvmvv8GfApNhXnqaRvauTPyZQItw3+viKR5b5YLzSHogfYIRUH4wEbkK5sYGxuRzllUxEwxFkWyndd8iRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=kQrcP5Pz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="kQrcP5Pz"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-749248d06faso2492135b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913628; x=1753518428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
        b=kQrcP5PzF9yNRxyA50oYb8ITE4TRgWb3mxoimeatCjz4djJevLOsQ2jpG4S6RVJfC6
         2p+RYhiLKjFHke7wcYK8fHR13d2oasOrQky/z/bCx6fRr4II/6KnvUn+8Zoc6muVQKwk
         xZqt2RpEOgtUvS4f6L9MdnpURvjt5Ie4ocJvG3BInfvOt25tVp3Dv72WbXtHWye9geNp
         7nVecNACOdNB2BohhM0cXnRZh06uAO0aSolVxdQMtEOjV7R7La9hAAziUH70jTBzVmY7
         HYqt2j+hBD5bHWyPTtZqz7AoZ4fpIxz8A4OrKXNzRazSUWsMxRuGSg71wjpOYLdRW5fu
         GuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913628; x=1753518428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
        b=SqsV+jeH4cNKGB9CHkuiDdkgTdspDo4ie5up0lPWXcuk+njxIRF8ecKprxEAoKRxue
         mxYnmuHLUMRBLc5JJyHd8dkLwBsGoOu96mYRcAdtLAnp2eKckYuy4rCEuIKRhtF8FQ5I
         pIgrcLW0RGldXPnrhScHXfpaAkH9+ZdW/FwLxxCnzG46OlvqMUElzsMYt8Ur9rtCySOY
         MoVTG9QH+41G+33sDU/jlxRtf71n28E5A2TJc8iSyhFkAdVXdEASBUUEjReW2ar2ABEe
         ZhcSV1krGnbu225iLdvHDEeI2NIP1Rhsje3XKkqNbpvvQaT8UlZYf6aHow+rBsLiN6wr
         AowQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTMcf7nlnskOTO/KY+spyzN21bOKT1mTvGeTMfyb+PvAn+ouTbHBPVrClK1vW/77W2d4BoR8IJAjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFRj80xBKqwJj1VrYtAHl6dYC8aE9BM5b4T+k/lPA8bt7chv6
	vN62SDkL90tu92VdLjWuMpzVnjseTKb+64kaDlTXOwpKMYu/HhzcyMpHTlvEZ+A3B2E=
X-Gm-Gg: ASbGncvBDyfjYTmw4h6prx1FtWHhTfkWwI89lz0sKlJzvSen1K9lZj0LsUystCLN1Yn
	3ZTzljOn69LlgKDiEKDlSTkAupWssh9FeR1gsGHaWZO/Dc2HqlWibCN840hwgCn7A0uV5UwqPLv
	5WbsrjHKKUnTDCz2LfGpAYt08kk/HV5KO70ZCBh9dk2E+B1iPVn+jDnjPh++prg2awKcM3x3uuY
	ELGg7gnLrxGQFIUsF/lwXI27BwvfVF1kZsmg1veF32ovPWPdLHGkOHIIrbecklcg9f7d/6hFpSV
	2ivGuO7Ijv6U6+2+vIINOEEBm8AxHqCCNp+pAQzDV4qlDWtPLGrt51fpQmc6MzraFzcZpKJdmgu
	eeu9p6IxL7GMsTkfMRChP04LSSvgXVfKPZGjrQadaIHOlfbZK8A==
X-Google-Smtp-Source: AGHT+IEtGHThs3c5zaWTIBYa9eDjBCvzdPq04CWI3MnLdXSZNpbYivBg67p870OLCeNcYRQCUXTizw==
X-Received: by 2002:a05:6a20:729b:b0:235:d4a:1318 with SMTP id adf61e73a8af0-2390dc6512emr16725964637.38.1752913628137;
        Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:07 -0700 (PDT)
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
Subject: [PATCH v5 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Sat, 19 Jul 2025 02:26:37 -0600
Message-ID: <20250719082639.307545-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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
index 4a7ca1261105..dff00d725236 100644
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
index ffdfcb57cbd4..528b5979ab8b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
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

