Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE292F4A10
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355934; cv=none; b=cPP7WKr0+cLRjpQMAzVTgMtv0d9aXJTFWyPHWzo7/xDVPCcWQWUTvODJJQPw5XrlEjUnVTSbVyN63NGcqyE28c337Sm4j7SFvXYGYQ0KUurx+gW8ck0e46P42h59oc9xXfoxIEYH8eIZHJ8M43mKjH1Obd79TRfQa0dOpx8qb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355934; c=relaxed/simple;
	bh=qcJ9WTVfS0uIhrALRso7IA2CF/K5hLrMPEervT/QQok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiOKnEEZnwPNueGbDcp4jV9ac2uKFafG5LKoJq6f+Ccrv4RXY7gdmQy1E1+7y/jOV6FuxrHeF9CENvJOTZIcZfwayFkhZi58qCAtZAte8rzTfS7j4ZvYfCDvQ9evL9igS/fLDGuDanfwOW2TPQeuSs+o46bsPKvChOS3PoBMQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4TP4YOb; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4TP4YOb"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7cfcb5b1e2fso92623a34.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355932; x=1768960732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=F4TP4YObB0sTRljRjnPa4bn148Ydgc7cCZathvFMZxSGlOBrYOo5wDXXICWBXJRhFI
         TTFDg9FFB5b2wiFCk3Kyr7YAfG2m52pO8lEcdRan+jT2OUBRROdOSsbNSQiVz0oJtSRG
         zwqzmikELmJOExjhvPzmvuV7FDK82VU9SFWT6E9kZW9ACQKfaVCD0VNOkzFWw61hyMCz
         oe/3VfYXgWFgnBI6+zUKa6b0sfQfi4RcnD7H6cNI7rT0nHQY3ePGmC5wmCSoaD+sklk9
         bTB54h5DSMW/YcckExIUKrDv8QZTuQifVBBO58SwQ26RNPbNDzHDDRPL4V7slEjL4H2H
         DvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355932; x=1768960732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=vUwtUs9IdF0I27/w744PapgRC0jI3Ndt3LgEmpfAQOVX4NClaLf9kr4tVZmWm9dzIs
         FMTc/HytyMFI2ppn+AgsmgUqvv2lMInFtL8KmtbrSbdvoclYzm9UtNXKqJZE7LEM3Cqu
         pxL2Dp3cELn/Z4QCOSZv1YWA3BoRVcBGJRuRb5W6u+9OW+Fm5Hw4L9k0o4R3rBSJpn5l
         itUPEV/kwhpoLXFr/W2bYNIpfAZVKmM2+qUvLgZbVYWZAKBKM7Besrd4fus/Pwua1cuf
         286LvGFVsj759EBOasjlVFEbUF6g5bn4yrJBY/Ruq+SSWic+XFxyP1SGiUrxqyU+U/pA
         4dNA==
X-Forwarded-Encrypted: i=1; AJvYcCW8rvt3zYC/Zql/fsWNAr4eSNYw/wOSXoa226zP4Dj9vlJuHqs2aZ49/aco54/ZhjvXRCL3NhBe0XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygD15SPc1WtPVEP5ceOhjWc4ba4A184hTzstnblviDyFEIxcv/
	rPG6jDexA2KjKVMEkA7xF2AcQ2rCWxeUxdsthBL0ma7GdTfgUN7k0WnB
X-Gm-Gg: AY/fxX4Xded7fh5riCmpYz1yZLu7214v7jm52dOW7BIpNGkrHYKLgg2XMgn7mf743lW
	7asqmrngKjLbkwADA06ak40Tfw6xM5dxBcvHkxGIOEjgMD3AvBItmh9yy48m0LYfecaPYc+skyt
	NQFbOL7gEPw7L/6vfvAYjfvNHZVHSbIbhUKG4ENHIHPOZFgcRSP7QY9S3wy6YKco24tFhFU/QbP
	hkudGuPMkkhRK7AdSYYpmy/b0mmqY6wO5Rn2foZHXqzBGWfoCa1UcHQQ1MINq8kuAoUnWdHuFL4
	atyw8o/dK+Kyo4SsBjum+U0zVFEDspexjYpR0dXj/0KJIxR4i+wEN1pUrQCh2JyFIIeJ42OXgwn
	CNVoDL6Lq6+TM94/Rp2eihmFShBA6NGZIKuTrznRs2GpVFBadnanGqopQxXqEp4WDCLwG/Q/uHN
	56fOTFILV01AyQtNXWQ7Q1zZxRJzJOy9fiy0He
X-Received: by 2002:a05:6830:3148:b0:7c6:cf19:1dec with SMTP id 46e09a7af769-7cfc8b73711mr1019391a34.33.1768355931685;
        Tue, 13 Jan 2026 17:58:51 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478d9c17sm17120860a34.22.2026.01.13.17.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:58:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Tue, 13 Jan 2026 18:57:18 -0700
Message-ID: <20260114015815.1565725-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..98a36e2f94b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,27 +92,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -137,6 +116,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -303,6 +303,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.52.0

