Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1129ACD4
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960353; cv=none; b=d74IWa8k5KTs5fcK4uQpY+wON4LmaNTGkEJR9UVT4zXPlJU1ySnyogrEMSfP9spqRM7caczJHCFEg7nna7fkCPiOsCZfEiSHPuyhqRIlS4cTEa0nqtYCFdltPmgnUotHVUrZEv2qKEw+xRqUEAvMCFNUyTbb5DCDtkfS6QAeDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960353; c=relaxed/simple;
	bh=K49WJ9x7l3EnNvQfnQzsEUFr9wWh/GX1Tv+cJukjR4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xsc9xwITDlu5uab/DGb0QuFuvuiDrqM3udbnNzLdndYuT0B0ildufZf7dcRADo/eqLVncM7U/1ltzOSGxZ1qQSSa8hv39GNbx5P7CaeRvJSSgWwpVLOEdgZWia6ywEP43+Ss25CMlrv4NiZ/V0tZI4RI76cAkaa74oXowMPi6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=lL5qgyb5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="lL5qgyb5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e97cso3628982b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960351; x=1752565151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
        b=lL5qgyb5Svp9+A6ZOP+2UyOJ268fyxPTvo3AdJ8zjfPh3/2maUIXL05PC1PDTtV5Vn
         P3Az3UA7HGkTJX0xJl09Mt2jf5cw4b/saE9rSQssmJz26BIB5VMLZeoGtvYVzvFFmIre
         WpH7LVCCvuhgRu5NTGc86KRfQzuc4+MyUy/jmtx8TKxYOCvRV3ZHvduUjlSazBQs1xId
         d8LVMZx2ULf5Pcs9lxJ3HAF/cEgkkEbdvT7YGxdb1geEPPMChgI56wjiS7qXu1STS85n
         alSqaaxn1nUAPelcLwHA2ghu0VirGV3NAx2gvVYkeCLNbP/rNTJ7/6OLAe1tfM4a/uTW
         ezwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960351; x=1752565151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
        b=gW5S/TPqmhiVUbzvwLNJEIFfvspPNXE3tg1rKh1TKB0l5IHnZYzViZvYLxkbNHXXLU
         nGOOCp8Np7w41C9h4uFd0FuAoFjB8dlj6MQ2oCZ2kEf+O7XDvJXRlbZyQkJT3JKwu35F
         F32naECUvy81dYm0uYeK4NkF/KXTP/GgiYjWa6qUnVTDtgAMKquzvLs3Ib7cBCj7/lI0
         1G82JuPB8WE49AfmKUs/FJpsdExeOSDU/EtWmzPUzGMmy0UnRqJEYdLoe76j+feCkwZs
         wNWztvJehWxQBXe0vs+Qxt4jw163JilqyDR9e6vMy+ZDvH9QnQokD7/uNUdW9WXeQHkM
         THjw==
X-Forwarded-Encrypted: i=1; AJvYcCX0MqIl/dCEdYikMxJ7fJ92UMlqQ3Eq+vnd4WsvghVCNpYBwEaJRFrotDsuLPaQVXcTG2gdUZgyy4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwmV5tpSiGWw45o918DcYUFBlj6brRk4TnXhuH6Nx+ufrm8dV
	W7T/JT4/ddytOzvBDDsasLgPHGL0+3h463Qo+zlxeu1lBTKLdSbjfPZegd3wPTS8bK4=
X-Gm-Gg: ASbGncskrJEvkA6UWEx5wrW9L57DjV43UmuN5vCTmXv8WTeqTaxUBHiMQL+nvhUGGYy
	7f7fpicRfnp5ztpugGVlxczf0n5NXwqo3WcDpHoRPZwLKttJzibZVVXv+2Fn7Xm+Sq/TZ+V9kMJ
	E4+JPaMDj/x2ndXxQeDytppXsO2aR+/d+ImRtYM0Y+1zqchg4sGmlu35zMZGqrah/7aYn+ziOsh
	Cs6aW+/dJJO1FdCW8SN6Jgu/yFAYCO+mdDpKhkKUfc4LZtBj5IFMzveHs8zDL/n9vN3jdFyd0A6
	4lF79GUSpUY3puWV3E4I1yUlPxWDgIewUcXDoC497DIXyNxLiEvhyQit6rSzTeq9/eFrMB518xF
	eVzSnAp8eYNqprK6YbPBL2+gKkVa3
X-Google-Smtp-Source: AGHT+IEjjvMwCxlNvfS65ducwO3zjwiKKWiiOevnyebt6KaT7pnYdCus6N5MscGP8SruBVriyB/gpg==
X-Received: by 2002:a05:6a00:2e17:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ce6689123mr24357739b3a.18.1751960351056;
        Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:10 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Tue,  8 Jul 2025 01:38:59 -0600
Message-ID: <20250708073901.90027-3-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() and
mipi_dsi_generic_write_chatty() functions now that they are no longer
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

