Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2719CC37
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758479909; cv=none; b=V7VznlX9hdpsshZ4E8EVUqrOQ3YTAxbZMvtSxl8H/4R7J4TaHJkm5tZBYSRKSXPtpD24KXWi0ah0UsYqxqROgtbsSXU+i+dk/pq2IDS5YLEvhbKOnZBA4cn51vgXsKTTOrU7XPXvc3n18C9R/PAlvqHV3Tt4Hq62yhNurdMlW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758479909; c=relaxed/simple;
	bh=1dTtzDC6tZE567amj3+s+yhSP+wPAp0a8+47DgV7k8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vnu/mPwAftfI4HoUrJyXkxCTeYEytfn6AQI7gn/uCIXzgdL67CJap9Df+RsG2cmtMpaAAbnTfvlYdbZcymGT5kjMOjo5Ip5WAzQ5ls8JR0LwvIB/fX6bh8jB9o2K+IPXQ45MI9iosIeN7QXKIc/mHzksmLevNRRy7Ku14INdqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqAlOYID; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqAlOYID"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-268107d8662so38929385ad.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758479908; x=1759084708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FG8Bt7npKalhz1su7W/I5V9S/1CafpuEGaa5DL+2Qi0=;
        b=PqAlOYID7AAaB8eh5BKe3kI67+nj0k49XsBlf0bEztj809nbEcDa+hMTgb2LbZ55w3
         XswIoZ4JnBqZBMk+dl+ZZjUBB3AImK16EyiA3SW+2/mADFYo/Ar7VJPOk0fU6pubJcqx
         YyHUk45Ky708RpB36UdrnrWZFLwMdFO5VBRc+/mEaLeuKdlcQsq/+0pk78F6g0iDImNB
         GozMxsnPS1Y79lfOLOY8rgV85O7TCP5gY2MipeRUOrhUtf4u6rcBVCR3fzlBl0VbfF76
         0XbLlzgvyqpC48H5V+Jh5amy3X74zs1iIVNpRwRLIkjzZ1t9S8VruFcQlWBXP2HHuvQW
         hJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758479908; x=1759084708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FG8Bt7npKalhz1su7W/I5V9S/1CafpuEGaa5DL+2Qi0=;
        b=YjGM8NqunmMI3tI67DOHneYuoVj7d+1qlsCVf7i3UeYXROof6UiJzxeZVwTp37jQOW
         Wv3TJevHKLZSrNLS6+GZn5WWxqq1dh622bm24Bf+G3ARYqvZ2Pk5/pN+w2Oeizu5P59z
         K/RPnN0ea+L6uR0mFs3u66swuRII9LQmHYCzHOrQpm1pfxewDcQuLFV8a8SMqY1Rjd+R
         0L/zJe+fon0OHwk5PINxim92bG6EN+ewBdfSIZL11Chh5w9xeEIKgbcNFve5Al1WwGzZ
         2K3H4YLbB0z3J4s8rmwT9CYz8wSA2iBsTWuAEpiJ7pU3m00fdF30nVj07uUQq17k8iG+
         36LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgaHZ2M8th5nBHU0ADfangoGMHqChQR6EPj9F5XymnpBQtxYHODmAyHK1Mnmj4quNBXT0bF1iJZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6p8Tcv4Q/rONvS6loEtUF+gn4uOSlqcLKlMS96MD7nbPo+9jS
	Xd+fHyxnbDNb0AHObdRd2bMbZWfubO3NVAzG/budKoSV40sMEdfYjhcG
X-Gm-Gg: ASbGncvNmPliQ8SAfuzBy3t1eqKCfGR3j8wUKRiuzqUVbrr2rveEP68i3uqrImk7GBv
	Ee0re59vMSw8H2s7E189QNrEWrs1cKxuk/ZtrIC8GopkzTiwMItNW9mwlMapZeiBpwKJz+zIPCl
	c/A8O4VRuTbpLwkSd0djzW2y/Iy33InqcOI8FxnUjX5rLnBOIYh4ddFSmnjlalTNjFSAvtP1qYC
	M4egy8418+Ib5jxXQnbZ8SMk1+9VSxGkFHBLma4ezF6lJaPDNB/+Jsbalqm+tBdliCaMjDmTCzm
	3ye98Hfrug13Gn3/3Qwm+pg6jwF5Gk37EM3hY2uX4TAU/WfLHprbL6g9i6Z/3yuwk4WupaSgrK/
	bUOOgaeOoTPGoINt9LQ==
X-Google-Smtp-Source: AGHT+IGVujox0fyaNT3MucK6Cw+loJTsxMamdU8PPqz9OPA70Qfq4hxxfxRZjg3jA0wAYGw/vNjnww==
X-Received: by 2002:a17:903:183:b0:268:1623:f8ce with SMTP id d9443c01a7336-269ba40dccdmr118789165ad.10.1758479907783;
        Sun, 21 Sep 2025 11:38:27 -0700 (PDT)
Received: from fedora ([45.116.149.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 11:38:27 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/panel/lpm102a188a: Switch to mipi_dsi_generic_write_seq_multi()
Date: Mon, 22 Sep 2025 00:07:18 +0530
Message-ID: <20250921183720.237761-2-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeev Tapadia <rtapadia730@gmail.com>

Replace deprecated mipi_dsi_generic_write_seq() calls with
mipi_dsi_generic_write_seq_multi(). This avoids hidden early returns
and matches the direction of other panel drivers.

No functional change intended.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---

Question for reviewers:
In this patch, I switched to using mipi_dsi_generic_write_seq_multi().
Currently, if both link1 and link2 return errors, only one error is
reported via accum_err. How should this ideally be handled? Should we
report the first error, the last, or combine them somehow?

 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5f897e143758..982cb61849a0 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -162,27 +162,34 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	struct mipi_dsi_multi_context dsi_ctx1 = {.dsi = jdi->link1};
+	struct mipi_dsi_multi_context dsi_ctx2 = {.dsi = jdi->link2};
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
 	 * Change the VGH/VGL divide rations to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
+	if (dsi_ctx1.accum_err < 0)
+		return dsi_ctx1.accum_err;
+	if (dsi_ctx2.accum_err < 0)
+		return dsi_ctx2.accum_err;
 	return 0;
 }
 
-- 
2.51.0

