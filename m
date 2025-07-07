Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014D28A726
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875049; cv=none; b=V1DtXF4/OKG5Q+EEpai6P2sXhoGIaEVaa+2LBbWCMpEqTUyWxzHXmA0fV6GZGsvivgN7zVV9lVf0wMnwkGqfMLoBTIis0565xLpoQ5rJ93Sn5r4vQOYL6UfHBahn33uWDgm7ch9CTbENxuTPqboppMTfnG5ZW4O1QtQe9kIdtsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875049; c=relaxed/simple;
	bh=P8HQ9uJ3XyqukKDyIYQMPHz+6q2ZpiD7QwsLElWeJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0wiqmY6eYWYPQ90SpWbzwYE298ZHxsa05l6dd0SdLUrTmnamWsE51WpXgAPEDWkkUpU1HDuTZq0s3zGn3OCRIdR7gP1OhCOm5dtCdLpbT87ImrDj4XJCxY61bYG+Fp+g/+OADqR2dwQOwInvthTYdVAsT9sLtJGZ/byLrQatiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=CYU0OuXS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="CYU0OuXS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2349f096605so39983365ad.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875047; x=1752479847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=CYU0OuXS7sZTck4Vw69mzo5jZxgSuCTp51tA9iVnbwG3Yldh7hZNJBbibb2y7w6Bwe
         OBm/b1S/fVLAMdu3qbJzZT/HjhKvVnUZiVpO+imUcYBRWOA8IXUPsusiV4WF9Fx5KeZg
         AC6XiX9kj9MUrszurds/RwEraCqYxUEXxuR6sTmocdpEOV9z9CXT+jS/PSjt/WuSRP35
         A4xae0c6OvCjoY/mBe73NusDUsU57Ka9Jwcjj64kbpyCA4EpMXbE7nsNe0uczZ8WdOzL
         b4dl5Z+GEl+rHZVeVcoN1pSQM0BxsiQiHd3kxzIfxyEJ6DCZlOjBS9bdyaxhh8VuYdHn
         0i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875047; x=1752479847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=eTPJGyKh8F1xqE3um6WHcp/sDFRt+3EV62TcADbeHF0QqtEkJhSF5BgTFlUyf6drvY
         DBj2gQ8O1Sft0ViirjlDCpYo48oCRsMHxB2UwX7H98LR4pAot8FuaDqnsq+9rz/vxHBX
         joompZUdctTrcr1mbqrXZAh+efBH6wX6oTL7aDqoiQc+KnsrrLvR8OchdmygB/Ins+Em
         H1j28LjMmjsfR67G0KGh9L6gDXnAlh9uRmyFBA2QZfYQ6cx1Xxib6ZapyvCbBUMYdIko
         heNPqwjN2whC3g3AXSgirnvfV6EbSOSSm+QM1p7fJg812eCrf4c2uP06w1VtraqN7Wq7
         z79w==
X-Forwarded-Encrypted: i=1; AJvYcCWbyCfWaSKnBXX4QXrTd1WmOHq2hG5RUphqXm5CpHvYB8f+Vz9ZQwywXNX4ihj7M4RvsIsh1qYZOzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzOXh9bpF3XU83jhdQWoIX1qng3wtSynfx/JKJ6XSm6rTOq4j
	z1nx/nvEfzvn0ownR2/gB4L4Odf11Dzq9LzSv+z/uWriaawi9iDPHAAk6B0K4CixaJJd8xPGrJE
	0oWjuQdOJBw==
X-Gm-Gg: ASbGncsLcuNwgyVwJVwP7AUeQ+VPyR2RR2TLHHMj6ypMBVzF8eMErY8J/GjgnUQFSHW
	vgqsElKXv/uzYg2ySRardzDSA1LRuzbMHBb++UxESqUU6mt1DE3wxUL8xDIK40uXzRQg2l2Ictv
	/v6EKbCBnRtQz4oi9L18bFUAGZpbxy65WEVfUHUhPEzhR1cn3wcd8EayFuc+RlZCWg6xoyE1Seb
	7U1W3dnjDg6zm8+UiQ/yYQRvHuw5+OEzro1V2DbGhaVLvjTp29tY6nTY6FF4h7AIxAq5TmQYMgX
	mATi6c32K5ok210yic7o3gR40dGDFuU0lOvk+3ZEidkqqU0rajPgGo5yY1SKBozKoev3Jss0gVJ
	1uNzsaMbj5OrmqU+Vkg==
X-Google-Smtp-Source: AGHT+IH3zTssQXlW4e9+S6k2Gnh2tBpqiBPmGMJFWBwXftXzY2NmSu5YHWb2cBRXSypKAiCuAwySvg==
X-Received: by 2002:a17:902:f792:b0:223:619e:71da with SMTP id d9443c01a7336-23c875da391mr150368325ad.49.1751875047455;
        Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:26 -0700 (PDT)
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
Subject: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
Date: Mon,  7 Jul 2025 01:56:56 -0600
Message-ID: <20250707075659.75810-2-me@brighamcampbell.com>
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

Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
mipi_dsi_generic_write_seq_multi().

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between calls to
mipi_dsi_generic_write_seq_multi() in order to preserve the exact
behavior implemented using the non-multi variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..777a8ab3a397 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 
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
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
-- 
2.49.0

