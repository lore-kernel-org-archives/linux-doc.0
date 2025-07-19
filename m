Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA22356DA
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913627; cv=none; b=CdkvetQQCBoeO3WR8/pIdtuYS91pBpL6dGnq5iurHwqqNDWQg3b74ysEHDN6afqFTiudNwfFQPcObmaSWkZc1sihWF+wEuQlc572tyyK5YaKKq0ruokYMI78L1eAKEB47tBqOg/bMm5JEPGHodkmeMpJh/EO1ghQrVqpm6bhyww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913627; c=relaxed/simple;
	bh=pmTES+4CkX/QOuHNX+Rkrb431Re78drHxNxUfxOx9dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuDyhTSFCpm11MGZNNpCUNaCpCv96fajvZLesAfeGVk2Psxil2n1DJp9m3tLrQTLW8n24ZuBr3YBqaYbo9n9VtTQ6kZE/8gOyfwcA7q0yRR7GOzpByyXhScsbW45h5KK1LjMwvIZRJIi2oiX+WHfwsivJNAASqtjM8j4MYtUlHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ZGyXMDzt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZGyXMDzt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1923570b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913624; x=1753518424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
        b=ZGyXMDztpMJQZ9vK3VwvhNqftnpmQViKc21f/KSgoLwWMJrI9n7Bnhd9lN0Ysqb1Dv
         Eq4muB4fSG7pT8s+Vgk1j2TcUksLmLtPv/VtVy6w/f7zqnhnWFkPJ3pW6vgzKU/GF2XF
         rRiBuoUT16JbvK/9SS6Lwf2izyhtuhytwJg+XS1Jt3nnIhkoMcagqxnd7rAMWXjX+FSq
         puDIdWxWvI60XkD6OPyjgvUzN2vDfOa64TEc7THTHAptINlQOcvhsDJjGCIoqzcq/hd9
         bTFdfbK2jL03Cnx80jvOHsLNWvzMrWLHVMp6yxM+RoMkXiYaZmZWAULDuRpLtl40+OBf
         gVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913624; x=1753518424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
        b=AXfkD3rOwreLQBURdrnG9LzmMSElmwnCZoS8cNdPALK3mqhHZyk+RKQTVqx1aKT2hm
         PNkxGMj9Qy5aVVkAKsoL6HTDw4GDciNH8GGSXjoh9R4xouXtp9cH92ZJ0g6cNaWyvdTX
         7QDghXPDu/WUkpTM0FXFMhlw+YrvSotagB/T6jdKHtqSb2zPjrIGuCEZHLnA+XnJG88N
         7ewjrBEev9AUqTlNwI9NW7b9/ET6l3yMW+CCxz6z/EbHrINJMawpbeWh9SuCRqqLkhTU
         DCkt/q0LwQ+l++vczj6byStDv8RAHEIJF1ALbCQ1ByroaDnUYg1KgBnCv94mKd/E6OYb
         859g==
X-Forwarded-Encrypted: i=1; AJvYcCUxeBOG5A93IStsOpeoNpAwJFJaLHa8tbsbnuTjk/mAQ4i6VoMHfem1ukwNrU9u6JukUkPr/LfitCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQkm+7t2uljz87bbfXWhXvbZP8soxOZMUJsgGKtf7ghrJXWkhU
	X8CIqYyJOKxvUcpO2Dwdt677JGrCEP6hbBLpGSC7mvnqGEZEGJsOkBUkOrBPbBN5Dt4=
X-Gm-Gg: ASbGncucBAHfD/7VAtWJf0QmojEcblRHoOOK9lO591w/wqqo0PiOBBMz3byXIW4Appa
	I8NV/hY8KO3ZkW5YPFsodKjYH5TMXkhX8aGPHQ4utR+kCogsDmTyx66J9/5SGUiuzG0IEJovTTe
	ABDrZ+k8i+9qWKwCOZtS/9nyhWzWIG6DzYM9Mi0u+FxuUJY1r3QBxZcY1hW6WQLcgpNzO21+4vs
	i7mUOB11lRWhKiZCNzvPsfc60+0G1HWDtbjyb3IDyG7j0j1kDGkXR8DnHXBv/TsSguD9A4eleie
	kcVIEkIK6iIQ5gIKVuivNexLBaYihNnwpK1lILAPbH6reKbdGRAlzHszHER248ZQ3s0jahIP+xB
	Yb6b8G+S6USHKI7bBkhWT57YmicfZdD3WlTAs6m9tGqbmPqCL6A==
X-Google-Smtp-Source: AGHT+IEookr+a3eTQEBmol8DGigr1hM4wxeOxAzpxnN5vNTt7ozZfZj7qFtqjv6WzZYiLjYmaNRGvg==
X-Received: by 2002:a05:6a21:62c9:b0:238:3f54:78ea with SMTP id adf61e73a8af0-2391ca917fcmr7914227637.44.1752913624038;
        Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:03 -0700 (PDT)
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
Subject: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Date: Sat, 19 Jul 2025 02:26:35 -0600
Message-ID: <20250719082639.307545-2-me@brighamcampbell.com>
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

Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
by two parallel serial interfaces. This allows for the reduction of code
duplication in drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
included in this patch for completeness and in anticipation of its use
in other drivers in the future.

 drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..4a7ca1261105 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @payload: Buffer containing the payload
+ * @size: Size of payload buffer
+ *
+ * A wrapper around mipi_dsi_generic_write_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				      struct mipi_dsi_device *dsi2,
+				      struct mipi_dsi_multi_context *ctx,
+				      const void *payload, size_t size)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_generic_write_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -1006,6 +1030,30 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
 
+/**
+ * mipi_dsi_dual_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @data: Buffer containing data to be transmitted
+ * @len: Size of transmission buffer
+ *
+ * A wrapper around mipi_dsi_dcs_write_buffer_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_dcs_write_buffer_multi);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..ffdfcb57cbd4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -289,6 +289,10 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				       struct mipi_dsi_device *dsi2,
+				       struct mipi_dsi_multi_context *ctx,
+				       const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
@@ -329,6 +333,10 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
 				     const void *data, size_t len);
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 				     const void *data, size_t len);
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * WARNING: This macro reuses the _func argument and the optional trailing
+ * arguments twice each, which may cause unintended side effects. For example,
+ * adding the postfix increment ++ operator to one of the arguments to be
+ * passed to _func will cause the variable to be incremented twice instead of
+ * once and the variable will be its original value + 1 when sent to _dsi2.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	do {							 \
+		struct mipi_dsi_multi_context *_ctxcpy = (_ctx); \
+		(_ctxcpy)->dsi = (_dsi1);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+		(_ctxcpy)->dsi = (_dsi2);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+	} while (0)
+
+/**
+ * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic write
+ * packet to two dsi interfaces, one after the other
+ *
+ * This macro will send the specified generic packet twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the packet to the first DSI
+ * interface, the packet will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq...)	\
+	do {									\
+		static const u8 d[] = { _seq };					\
+		mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d,	\
+							 ARRAY_SIZE(d));	\
+	} while (0)
+
+/**
+ * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with payload to
+ * two dsi interfaces, one after the other
+ *
+ * This macro will send the specified DCS command with payload twice, once per
+ * each of the two interfaces supplied. This is useful for reducing duplication
+ * of code in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the payload to the first DSI
+ * interface, the payload will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_cmd: Command
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq)   \
+	do {								    \
+		static const u8 d[] = { _cmd, _seq };			    \
+		mipi_dsi_dual_dcs_write_buffer_multi(_dsi1, _dsi2, _ctx, d, \
+						     ARRAY_SIZE(d));	    \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

