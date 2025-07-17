Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E9218AAA
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735492; cv=none; b=ffew3I2yW+jiYmoQ+e0nHDYHAe08WnX2O6hrle9Z4ViNbI2KvwQr6LSAW+U2YsheMuDd1FlkW9PgTOBlRl0O+1eVbIVpAUngCbbaW3Vto9n1pNhm+A/w7FN5UZQWrOLQEg08faZztODc/7QO61wseLTbnx6WYgc9rWl0dgZ1u2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735492; c=relaxed/simple;
	bh=Q+ZY9xjBuqQxqenQY7jqiguWkAzHexyUMMWNBcg78x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNbQjixwKdvi30c+BWbW64DFK6qEUKbjLIREalx+nYUEDecyS/InP0nanZWiSAPLRwwGXpLlnUioiNhAOv8AhqBdK8qXdnD0y4rQ6+39I+GYcc+fo9OCE9ZCoVxzrddLVf4yCAUyo/nmo4+PDkjSu6uGr6OQy0ZPvv6fjMi1+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=KNC0WW5l; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="KNC0WW5l"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7490acf57b9so514195b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735491; x=1753340291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
        b=KNC0WW5lKIGiProZ89bpfgdUA9WMenmyuuHPj81FuCYn7dlxTTePY8kAgQivRCgfYV
         w7SLa7HgTzCsnL81WydF4NvdXVicO8syIsyniyWJkAqattprtTN03sbZU/tqay18ZKZ9
         b6Ljnr14nIxWhRQLLK3dqpUzy7yzlFFxGRdNf5TjT0F9Xt+dg2VHcwivfsgvzplYWqWY
         KwbSBnqzneBn07Po7H6rYbnXPmBXOAU9TolXEP3vWxwhkO6Y+6vcaH4LhsrPYEIeOWrm
         j1O/Xw+hC2ZF+CO+yecPNfURVN5jPi252lshtepCpsF9YllcpLpwbwsbj85b/GQCFAZo
         Y8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735491; x=1753340291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
        b=vHNYOsCYRcqRjCKztGNKtEwNpIiC2CMMYodIea3YHdcACVlmy5YOgClA75q39xVgn3
         ISPl/Cumch7LegJ4mC8PFgLc1XVTPOFDZQnqS1yjTnRIBtlEulJeYJvkgvewTt29eSw+
         7C3FDKj66NQukRBkpebVg03KosnC5WSlB3O/rzniI4uEOsuLmCW2iwdOCsodt+7gefK4
         2J3/LaWhBkfaJ/+263z05jnnHEJi2qYTIbtxXWjidfBj0CpOwoxcrBRf6rq1Ke3JKrb+
         sTmWXIy6b7rzVF3/z0ANrV40c8ltT3t/OsxX7OVhfJxrNhjzt9iZ7YMrHj8HYms6Q0LW
         6ZFg==
X-Forwarded-Encrypted: i=1; AJvYcCVjV81Ur03fkO2IiTgbV/TDJ3qkab9dek7xY71/EWceJTg+EcWZNLW8iy1uV2PbwVfELexkIiKpcio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWehsqA6nE9zQmXKlwjS2bGJLyViIwgJWIyX186hmsvtk3bYI4
	7Hk3AbH/ZWWowrC+O5UW7BRJl8P0bn3XHnpmticxOUBTIu+dKlYa6nvmqQ4FNxQOVEw=
X-Gm-Gg: ASbGncuRKxb6e7oSywyoM7jLHyYQKlG2yLS7K2EPVgPHpKmPv14vgx8FwFd/6rgTlV9
	kC3F5aD7Krdagd0OVOX4FtVe5Z9MRbW6F5aqF1goHgZz21+Igi2G44Z8+quXzRJMuedMMqx+ZzI
	2iC2HCP0SOtB02Sn8XamLazeKKdcBe96BXFL2padTyi8S9CRIsnvOoA2Vd8gZmRPcKhuzFjssWB
	WZjTQ8bIWg8DWwHXB+GJLSTTGqSEFfLDn4LAol6Go+jiBRizx9RUFHC4KsGz/AiVDjvGHa4DhJw
	97HzU0pZNCZmI47y6XEpEXziBBGR+EoNqSB9Lobp76J+6snQwqPzaT/5mfqdsXmx0F4wh/Hs7g8
	budI55hBBlyrrOP6t+7gkxZAdg4tLolQW+yCQF7z7hoidVJPChtugrg==
X-Google-Smtp-Source: AGHT+IEliMbgtuTCQXNVVOMflDMHgY0pux0knysFK+gpotQ655Tfx39EtFZBf6v78DQtGzuRTvmzQw==
X-Received: by 2002:a05:6a00:170d:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-75724677639mr7982430b3a.21.1752735490724;
        Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 00:57:53 -0600
Message-ID: <20250717065757.246122-2-me@brighamcampbell.com>
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

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

In case it's not obvious, the indirection between mipi_dsi_dual and
_mipi_dsi_dual is meant to allow for the expansion of _func in the case
that _func is also a macro.

 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..32da8861f9de 100644
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
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) 		 \
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
2.49.0

