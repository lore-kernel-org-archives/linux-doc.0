Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822528725A
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671805; cv=none; b=kRnCuIf0mFrvvyJMTkAqm1hQD3KoDzBc1/pWirGoVk5fGbmMpRWOgjvkVOuz8lJu5BKlxsQNe4IHDRfReMQeJMKGgUUO3gAFWdhL5DQUk/io/6+x3mCC07rM0oCXfInfxSjyB6ys8qF+ECfTFzH8kUFG1b+O5Ci1xqEC8Pq0UjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671805; c=relaxed/simple;
	bh=31BisjOWpNOV9VgMeOTtJc9kptN58GBAr85+CB9tEn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLunAtW3qISlsLLCo7txF2gYv4E8AafJJOcAYYrv/Zu6ypwBuUTKbyPf1AEVTbViuuHACYGkxtpXxxoBx6nN9mlGzXS/HisVkHK5vfUaW3lXeeBZ3nbapSEyZdBqxc2Bg3/FgxOTr3IWofv9JQ3hYFERYg6oYj79KEfs5H3wXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOX4S0Gk; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOX4S0Gk"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45c838069e5so473406b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671802; x=1770276602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5gXEQgZF2TyzrHlQjfTB2Beeczi0YDWfEQdvkkWaMc=;
        b=gOX4S0GkjeK1rOMg/jz1l35rGLrwHYgwoLszx3gz+Ox1UnALXMDNJXdJbKlhrOR7kA
         SbZ5k4ZMo9e7BhuOONY6/G1E9sjZn/7z+R9Zq9WZwzhtQC8CibbEkICvOvAVYUMWH88H
         9lGpQ5A/3ySqH54UImgI4EBxXAPVMwPdjwiCN7ETi/OGQq2aZYTCVfsDR6WqCXHUCWl8
         +dYB53Xt3SiFLDdM0W8/Rvl4VmESTeEp22IScvRXZfSB4csw1w7+Pjie/SRvYNR3+jU8
         II0ayAJiukkGZybMmzNJNgUO6DZDNRLi9H4eVg+KcYqGR+G9MKIM1plqfLKbl2qxtkjG
         WIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671802; x=1770276602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5gXEQgZF2TyzrHlQjfTB2Beeczi0YDWfEQdvkkWaMc=;
        b=BWQ1tqRBsu8+ZzccJbU9mpSIYNe8DG3iHZ0Nrd2Yg4LZo2ePfxRfweVoyDWrO82pVq
         J/rCtoDr2OxUJqn2jVPbQ3Yne1fyu9kLq5iNLKM/pPmMClULCnZevPZiunfNxhz2yREa
         T8PeOL21/L9/BrMafYPe8TWy2TZKWp2QSz0cnm1FpMg4Y5nRiejcDSRrClsvCS9SGlc5
         rpgUfCj4PX7cgupHY5c/VzmTjYxGbtOzvM0Thcbmh7xF4LBr3DyAU+KYg3MfW4ebWe0J
         D28TbhNPGMPGaPS4Aj/wrE8PvzuNPa+hD0wUhJat4j8mwdyB8xiX6LXkDbozPBHuLb4q
         gv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpuFAIZDkTJXo07xjL0Y8988spIKLHl2axrI/smKURu/4u09rtUHBuAwgSpVdgu8XIrkGPG+j48/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66UsNDA9Ixi4bmLjvMhNrXvpG96pBizyU/qvGpxPJUlcTB2Gs
	nOA71vlovntmSWcdsIxEuGh7odb11TPsFxTqyQQDmblb3uBppo5BJ5ji
X-Gm-Gg: AZuq6aLhgwpWbvbctYpSfQBU5LYYLnbd4ganM3ZwHBKDo06fJ+M33fQWxqEQma3Nk35
	Z5XGhrzEJ7viL6iOcmChobNKACMVfeuL208qB+irTXX1Ek4i9pBI19d4O69AWanO6S6hq87J4uh
	fi1L0i5NlF/6deLKnLUHI0bdo0ov47o0+hDlriloXXCOkrOQoiHtpOxs18lnP4+El6uUkQ9jjgC
	fDpNSmRQsRdnBX6rotliPKbP13uZp33+ejZiatUmQRfBvSiLhcA6r8SJJYxoP4B96tqheUMq358
	fHurZMZHqkraJQJKvi19s08WkSLasVxbfMx94F8z+gdG9RlPCvmlRHxqGTVuWvS4kKrKTiWSuAb
	ydgrhTgMIxpwX9HCsvSsCUY4/fbVFqAXraAGLujFnUzf3ZB0lx7Nsb/zEv8yphY4WAjswz2Q0kp
	ztjpEFDQOae+FudgutIJicWMfrY8DB9e59RpHQ9JDn
X-Received: by 2002:a05:6808:151e:b0:44d:c08a:e039 with SMTP id 5614622812f47-45efc5027c2mr4278906b6e.10.1769671802237;
        Wed, 28 Jan 2026 23:30:02 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4095749f274sm3426811fac.14.2026.01.28.23.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/32] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Thu, 29 Jan 2026 00:28:49 -0700
Message-ID: <20260129072932.2190803-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
index 05743900a116..a10adac8e8f0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -93,27 +93,6 @@ struct ddebug_class_map {
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
@@ -138,6 +117,27 @@ struct ddebug_class_param {
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
 
@@ -314,6 +314,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.52.0

