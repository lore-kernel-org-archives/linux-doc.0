Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16552FBFEC
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770501; cv=none; b=jM8gSpB8uAZblkvQRVm5wTwKqtugdmnstNBF/bb0wCDNbhvY24DLSlegWGbcdVZowE21kVuqG6PjdpSyI6PQiV9DsDNwyCOAYRik6u2Tzj4rjYWBHky/Z8YrGjKlt0zNHSMKbmmbpjQ3acxmWTcAoK6pO4biW8vI2oVPwzqCqtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770501; c=relaxed/simple;
	bh=YLKILSjo4gQh4BZ0qx0l+2zG73ZqW4nHbnOsQdg4SY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy/tX6o26GzYCjUipbQOUbhmIJCMrzSVYWLYTkP9lb1X7FwJ/Zpk9f+JBGA8vcE8lKgxqs7contFesb8nlBAsUMQC3KEYy9kM6yDwXcr272zBnqMxSiPZq5on4peG7XVtiZUa4b1cA5noMjEfIsVSyTP1ZtiJBChB0rWbCOx5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Ie73LO4B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Ie73LO4B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so10414285ad.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770499; x=1753375299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
        b=Ie73LO4BX90aVPpluunlWmMLQEamy8wSpew1K/owDWJ4st88EBEcpelHBV/auagXjP
         17+kYmpncjHWghr4ppcm0VQ1LFQoNb4yT4AC49kRPzwGllBmjy+LDrj2aw0D2woJYLEP
         LqzaOJNID7As9K6GL48Og8JOxv1OT6nRfy00XitKclxm5RBEb4ggnNOVNVaF4lIC+8H+
         PV9/zn+wuF16e5xALnM/q3yYjYCOzLcTv6xWUQyrUnS8XqNEMVRBBKDzwexp969dyUqB
         ZzGBG9TGKecqZM0Xyj1ktvtYlbpRcmMlkFwLfA4tWgTzNbEcthVk85JTYJrLRGhr6mY1
         hTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770499; x=1753375299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
        b=pjqHppIzoRhHLQ+JF0+cpV5FR9VwoqktwmrrtZkMU3qsC7/KBFSc7Gvy4+oq/MGzwE
         lmztmPJzs37OKck3uVHNXve0GNKzqnF0F+lxvknozAy0eWUo8UezHub434JTbRzli1kH
         CDNcOvvFkTksQ0k6uJ/zmjUgfNv7jbDjEF4BpQPZnbQ3waoBkISMQyK+djb6Wp1wVlfl
         WfunPR3RaQtFTwEPmzywNSVgFtOpQb1xntLvORl2ZmCD6kvjCiym7pSHTDwJ/nag6271
         FgftfrftHMTYOrZU0m8pNuIgKijDfTYj+nOWrwBEjQstYv78OxKUQAuuXd2D/XSVTPvE
         RQGA==
X-Forwarded-Encrypted: i=1; AJvYcCXqhyATTSymXP148Jt3NhUvZFiOnj29iTJFeMQTockduVNLUBfc9Z5rH/pdtDxy59ZwmMlGZsflfQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN6ab28N+jZW6uIc1SGeK7n+vW3QM2PxydNsMo3AheHkcCogWk
	EMo7r6sMz0pIf4qjG+RZ/QT4QMs95oS8kXED5MLb9GB5yrptZYnKfELC4jyWMmzQ+Ps=
X-Gm-Gg: ASbGncvWLv/DLwXeSRctvAEwQF9Iz8JWFsJ/jj4SUAHo8naPetplyr7mBQU5scaOXXL
	3KDeMBkFDaGxJ5Vacf9BqBzEgiGdRc62qwkrDQDEbG3pXF9jh3PR6fX2Wb/3aFrVrwt88lp6DkN
	0EGnqhR3SY/7fGlIjkj32rDcZ+62bZdA3rpH9LJC4KWhtoprfr11P+4QgSQpuPjXzPNjKSSMoqD
	mJII9Lm4l7T9+uicbzJTMY5ZFOV/jjfGN9OYGBZ2IgWnYHURCBAc63T3/cRxngWf3DLnnLl0TJm
	rzdySYTMO+PnrLXLw4DCk1Lm1BSSVLA9woE38BSY3l0Bp8r5A4dnGzL7jUiayA9wwIURuOj8K5W
	GpQmVw6XA26RKHeRHFxsO3qWkS2SHmKRr98/as1gbCEsb7h759FlFahsPZtxL
X-Google-Smtp-Source: AGHT+IHQUhEP8RVdomUjbzwvcSpmkLRrN2k+b3W2P/yZEwrE1afYAZj5NI3TgnCfzxILvDYUugHslQ==
X-Received: by 2002:a17:90b:4e:b0:31c:15da:2175 with SMTP id 98e67ed59e1d1-31c9f47c6e9mr10439506a91.9.1752770499083;
        Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:38 -0700 (PDT)
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
Subject: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 10:40:49 -0600
Message-ID: <20250717164053.284969-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..03199c966ea5 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	_mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
+
+#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
+	do {					       \
+		(_ctx)->dsi = (_dsi1);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+		(_ctx)->dsi = (_dsi2);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

