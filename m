Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB443299AAF
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960351; cv=none; b=B73JP+akEsiBg2yPpoQnxgoH1M8lh0IrIFZgDrcA5wNuBY1TFprra0mYV/XtYUKntLuI4rsg982wk4yrK/9KuQPfTjQbCBwSK1ametsWIJfJ+vIzgnLd/wpf9Pi1JixZlOCH7J0nxaGMzSCK7RqavKSqWmplzW+Jyd+Hwkt6mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960351; c=relaxed/simple;
	bh=Ci1N7Dwuf85dZbfJ4gM0FO7/K/9m4JSgEXVJKoKi3Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTO/B9S7eL7wx1tQNgzDmsKtqOmPeieEJmVepX/ulbiqEMa4UGxSI8MmbvonkF0D04RhFtQM4phNhP7mBQjcEj1yxzrsgjfzTNLrz4dv92VlyWgmcRpMe243/5lI3HDJfh0hONAF0eq62NwYcbEqYVRpJDckj8DoJDatOHaFwuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=QP6XP51I; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="QP6XP51I"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4733114b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960349; x=1752565149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJltklMaBQd1uonax5ZyjgM8LqOkZCVtDNyE9v7JUsU=;
        b=QP6XP51If163mCyvYP+Npx4jvb/75/BSlvq3dShkzNaDPCrGFQp8xWfHSwaM9atPZa
         iaI0jKL/JeiH7M1OKqOjyLlFwzWEx2uffkAGdz0SPQkDCqpUnlpcBGf8F1OPt/Z2OISY
         8N68X3VoZALZXdfJoF98FjoFHnDDjM53PNv5erPzohd3KnfuW878RObh7fjKaziCSwsP
         WLiBUNf3eXsxaFVEcWwPNVpCvLR+r/wOMywHJYhud30B3/z6rgLCwlg8gbUVfnrmwFQX
         9+Z1NiblJjF+gsaMTLoUI7nerzf/yYGi3IWpPgoPJkNT6kRVAL8RGrwQJuJaVsUmR3SY
         OAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960349; x=1752565149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJltklMaBQd1uonax5ZyjgM8LqOkZCVtDNyE9v7JUsU=;
        b=C6/7hHV/l8h2CDDXIC4pRDC3IEfV88zGfNpqq3SeMx7Tnh63oWyP3VO1Z9B3Slf060
         X/jA/dIhgGpJuQPIZk/nObUmLxbC6VqW6iEFoMLIv6ZQSwQ1pSGVdWz9FwjhTbAWRqCY
         XbQGlA8QvqwJu65lQ4xNO+Pwc6xRGagZO40kPRZjsJkIyqPEBKm9/9uFruGSVxWrjcm5
         obWPFAjbP9XxsBQflq7kdvFVgpydzYby9JNBlLgi1yCd7b3MdOaul8sBr5XfktkAblPU
         wjxl6urGKU3FrR/7uuTkavKN3UqekqnOJwtJm56tHuWf2k5wlFni/p4cCidmV5ohaVJF
         ecpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0uW9lIeU3gUDsHav7RDY9m+Muj7tvDIJg5e3/MjxPg7AEQQ8ZaBA5fyWUo0sq4zz9Y6cXkMthjCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOYz75ecwz+e+VEkmrhQQ399gQl7hstgNbTqOR/cv1s124Blb0
	9gt6NkJhg9CF67JKYCV0KROUg2dpbKokv0IwjLFvJ/MWvrptv6KI6DvDHkfNI1KeEg0=
X-Gm-Gg: ASbGncsgk49LXB1GE+KqGxo2JVkECXGimTP6YEHCFtAIfM42qpeM502pOSzWTIUkSpX
	kqHbyjqLOxDMkgXbj+xo0P44Dpkk+6vxogCOknBEasRjDt/MsdctUuoPBohFY7gn73R+b9IQ9Cr
	Thv88MNpSbPOseSSgEV8H/qtvCNy4WvHPcgGqd9LOCL2iTUHHBZDSyWJQJHFKosc8JDogAiYfAu
	HecFdOUj4gNP5EcCq7bdOelnU/2F8+NSV7Px6+dyfhFBslhYxCT/FzO2BNb8f+oFgl6oQu4ABgy
	G9FxFTQUPoGUxrfuv6wI1FMrE03g3FjzkwsJGg5af/vcGkiJ+oAPs9kMw+HsADX06QZYK28GhxF
	UJWY8+txcDwaMzkP6nw==
X-Google-Smtp-Source: AGHT+IHqUANsx8EsCJUxSKG4kP9NMyIVzSoN04mrpiatlzPSJx49O9nENQOctY2sHFDwZ4RpAEfzug==
X-Received: by 2002:a05:6a00:14c9:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74ce6669b0emr19597687b3a.13.1751960349086;
        Tue, 08 Jul 2025 00:39:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI function calls
Date: Tue,  8 Jul 2025 01:38:58 -0600
Message-ID: <20250708073901.90027-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
functions in order to facilitate improved error handling and remove the
panel's dependency on deprecated MIPI functions.

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between MIPI function calls in
order to preserve the exact behavior implemented using the non-multi
variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
 1 file changed, 59 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..5001bea1798f 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel)
 static int jdi_panel_unprepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx;
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
-
-	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	/* Specified by JDI @ 50ms, subject to change */
 	msleep(50);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* Specified by JDI @ 150ms, subject to change */
 	msleep(150);
@@ -123,72 +118,64 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	/* Specified by JDI @ 20ms, subject to change */
 	msleep(20);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 				       struct mipi_dsi_device *right,
 				       const struct drm_display_mode *mode)
 {
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx;
 
-	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
+	dsi_ctx.dsi = left;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, mode->hdisplay / 2 - 1);
+	dsi_ctx.dsi = right;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, mode->hdisplay / 2 - 1);
 
-	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
+	dsi_ctx.dsi = left;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, mode->vdisplay - 1);
+	dsi_ctx.dsi = right;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, mode->vdisplay - 1);
 
-	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx;
+
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
+				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+				   MCS_PWR_CTRL_PARAM1_DEFAULT,
+				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+				   MCS_PWR_CTRL_PARAM2_DEFAULT);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct mipi_dsi_multi_context dsi_ctx;
 	int err;
 
 	/* Disable backlight to avoid showing random pixels
@@ -239,57 +226,32 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,
 					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,
 					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT);
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
 
 	err = jdi_write_dcdc_registers(jdi);
 	if (err < 0) {
@@ -302,17 +264,13 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	 */
 	msleep(150);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.49.0

