Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA3458123C
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202901; cv=none; b=BUwBKGzSvzPxgkrJo6QGMaD5wDA6SJy1JdBc1hwo80HO3l5GiHmaI8OpPjjx2mExnkSu2YnLNgiijS2XtAoZnlcRWzjntgUdElTaDUrCfwk1tQuUQam+9rQeMavjjqr5nLeccTL4G//cWCl0RlykH0XUJKw5FP6Q4Gl5Qy/raDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202901; c=relaxed/simple;
	bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPNHHJuSSA7S+jhsATUVd+CNsvAhRfB5sWbtrW0YXR0leTnYkuOlAzljg+Okif3coeiGvDYnlOn5khRWMH8hq348qAmmztqYqSvJWU/nhzXplP1QON8FI2+MJwj1q7z1aYnozY+9SIb2WFZKiO7/bpWn0DjYEhcIYw1J6PZz1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sr+yYhzo; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sr+yYhzo"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1b1d128a0so224691eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202896; x=1790807696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=sr+yYhzocGGPN7Pn/NjiVs0BbQqzzkVrYAaUei/t3AG56zITF8gpmgLKCIYN0c8jY7
         0ucB6t4lz3b42eWBIsWsHj4kndnNwu+qlG0TqO66Yig1bYWMVs9BD6p0Vo63wdUWsdbh
         TOlAN2E3deqsZ0/C9Gy0CAuyvksxx8WWBO9APo5YLgDugjZNe4O2b2eZaKfysjLoOLdX
         V+SaGkJ67rEZ/HINNl7xmppV6JhgljAT+ESCY706nrpXZdOB62hwCs1Y4DB4LKlOYAww
         S9WP8gi1lWkLNGMM43pHhsJJlBijG5F9us+MaKpUL+TDMl/bm6ifBs4LnBm5w30CB9H9
         iygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202896; x=1790807696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=W3f9V1fQHkG3abNU4bSuRzVJFCEyXYMhl+nQh9XQDp9PVN/ZWRgE3w1ii3SfEtDXW1
         4BPsPFtHlyPkeIhOBl0pkUX2sAVAi6bsrnvpnZAX2firfGtxZTNImXf4CuA6Ytu6zRQm
         NoAEp6UhGKw/kpnZ9ygeBeHW9jiZZXBQNJM9dnf3qQD2I26vTsQAgsdk+pQQHTlFbjJI
         YQFpy0X3Vvb5GTlqTHJJ8Sek2uNspGOUD4sljanPQAnw3FXN/9jW0V0RGfP6rKnm/s/L
         hUy2JK85YKpuqaJas4AYywtZLwAh3IGN2B/FwSgzXWTRl/CgGFOXvApppIdw04HDU1Rc
         J8KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSzC7AaHV7JOowPOISCO7UiZ9IIt9FVLTd07g7Mo8Xm7uRxLuZSlVbArKu4pEwrdpmNLLnSeROfIk=@vger.kernel.org
X-Gm-Message-State: AFuF++lBtrDwI+rSz7tay9ECBEQAl9xBVFqJeWFq3CRB+Hie2gX9Ht4w
	pg/DV9V0HfW1UBd3L1EmEUoGqwhIwkKMaGZDEBmucBL6Uk+FxIj4Wb5q
X-Gm-Gg: AYBFou2ycaO0vNDSMMAFKgEYVpEs8nqiGNaxFNTSCv1hOwbICoMZu0S9S927RAO3gwc
	+enIRfdRIbqqoV56+vs3LV93YNLEkNrQWkS2cgyZckXpSUj21foLEbkSoiOnEpQUNOq6KyoskN4
	ik1ZXM9nkxnTZVecQBHOSFcPz33f7WbG0gUuoamC9goi+hlLWE9aMLTtqtZFi/dx8fL3M69tT3A
	L1c9wWe2xHkiBdbNCq16gI+t3N+76uMd/1oj+AcMzFCEcHzLJPf/JxW0bC4vVKUx5AIc2r3J3jb
	gpnt3lWwMNbe1HQGaet17iDA4G6rCtx1+i/+AXnDB0ogZKMtqe5Cv3zUpu+Rvan3SNWoiGUiaY3
	giEM3/iyLRXR18PO4u/VM/MasKYD4Ir0DRLdocixqkxvSmpkHOxciCs+/zzwGz0j7P/GLEm4xCo
	/7lqacPTkgl1/2IqSwzqm9907UtzfNwLt/7riE16F+Lm4Qyb/zI9om0NviNqY6RkvjWgYFTsUtF
	8XlSSZS3cBiOLgVQn1YVJvCRBtjFjNhTy/WetFurSFINJh0FrejLrYOpn9ylmHz/ZflKidAP+Ty
	SZpkaYcnsCpAIUJKgCk=
X-Received: by 2002:a05:6820:184b:b0:6d3:abd1:9b92 with SMTP id 006d021491bc7-6d4417a0305mr572343eaf.56.1790202896410;
        Wed, 23 Sep 2026 15:34:56 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:34:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:32 -0600
Subject: [PATCH v11 08/38] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-8-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
 b=cFiUQCHIl8Z4t48oIQu3yHhG2L5LBXo/MO7Iuhjmrd9SbV9RgD25fkw2PoMOxn1mE+8jp8rxK
 3fgXCxDoibsBwlH58Y6vngo+1u7JVHUnrHhDnEm91pon7izPcbgrnXy
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++++++---------------------
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
2.55.0

