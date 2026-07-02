Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC735F602
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010481; cv=none; b=CEmkjI5e7hPX+0RcU3FiRbd6U1mYMkOfMIIwsXsPkknPtleslWZT7q4acS9sk87yIxWBN7EopcwgXW7lSwlFWoqfKaNua//v0UsZsM3E2j3/wX7KedxlQRl/sSOtASE2WgMJN92Hxx1Ed7t6CGxLq6u4pYUtDsvygvela3LhH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010481; c=relaxed/simple;
	bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyJIzMly4C/7KGOzopA9mY6azz1HqU4NoLW9xNxB8jAVXxtl2vNeXxlL8u6cz8kQVxJGVzgr/9qMT5LpKtmEFy6TpnIc7w1WoUmMxXjCYNph8J9ruBgQDK6IIVpZ/R7K3icEkPAo8xY2T2syTERSvEi/vOyfl9cPp0pmeT491gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzugMmsf; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzugMmsf"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-448b0ff4a57so1056505fac.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010477; x=1783615277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=DzugMmsfuxQ41t/aRqQPzsRc0ecfKgSGOQuxPDm9krCZfLP2akZthQF5oARGSJOvxb
         ev5z8yy35SwP6GVmJnOopOPxEePi7JZBK1FMh4CA42siMq8j4TlaVhWnyS6MjglDLbD8
         z6WnVQ1dCC1fBemLlGFxqUWJKFkism5knxTU7nbZQOTFqDshlK49QvLl8mNVQXCXWOza
         j9qiOT6eIzRDmlOKo+RbERFWVNTKVgx1LnmdLXLteTjpFx7smL4JN2nBQlLBfhl0IEEj
         g2vRx1dvBNwn2mqSU/0JbYRWBzOh3/OM+h8wphTzSvIlKYPeiBONGj/imB/lr+gwVLzW
         c9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010477; x=1783615277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=AP94GcHzdSoBuUrKGuAgrJRXB+DMGm3rY454+Y3pvRhOl1xi6DSVfLTGHhttvALop2
         iJkQJwvcQk45h03qjAh4NvQbGI68/ZC9+5CECHbXvyOoJ7hwPcBwksoisGjvv+3hVcVl
         NlPsIBBYN73GDXrtpXRi2Nt0nazRBfe9rdkLwyO2n2R8gNO5yg85V8m6ew/zQaARGUkW
         sxzM/yZ34TrVUIL3HDidEXzXinR+N+HuR4rLQJMtdcmE75tHjEiCJMdIjAXivS4ap/7G
         ghCMyGbxHiAMimGOxtgAmMG6YUKSv5A+8t8u2qRIiY3KjKXixPyk6yokjstn8VMhdk9Q
         EQAw==
X-Forwarded-Encrypted: i=1; AHgh+RoU37gR37Eq+BO/65qhVzp6pgPOP43e5ywXVLW2pXYeJvdlssVn5BGkrI0OVTOEnDiflznRDnapbNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwItthwiwXh/NHalZmT8uxuTAkgLZhJ/iZrdK8jNdp+AWJTtnv9
	a+QbzdKqPhmaHkiwAmTK5kVdHgL1zKFtLujlZ2O44Mas4IMdVHcS09L7
X-Gm-Gg: AfdE7cmFW0NvDBrX6/Z3oJS39ZwWsBdXxPnDw/aV6iBX0UbXGcb7L73nLWit/UQ5iX1
	QqHnSlTEVqgEED7+y4tkW2E7Dy4FttdqM35UD0jxGyLuB0iJT+C4XLH+5DDpYLNQ/S2CNmF/Dvi
	p6avsa5jqwEGKZ2o3Gl5JZTGtQc/zsTIgr1k9bYaDfamyHOfSzBVYK5BHU+KXHYSRNH5p2ev/QC
	1DdvVlxYVPRDA6SLS3wdSU2klCPSAJdgeSF9MJ5SqL7NDU1s/swGnIiTtNV51PK3EI/BapmoRFf
	VW5WeCJudmY31nlqNC0JN2gXyQtgL+tz9Qv6j3+6fCVdWTp6+0hXmaLrExFEZp+TqcDBrsVSKzX
	/nAzKlSKNioGAj2dyybdKLkPdJh9+w+Pvs9eqQaOhKF6ZrTm5uVM/MsyRfsu6i/fQFnILeUay9z
	c6UpmVD0VSd+CRlBLDAVaFsX/2RUECLBnyJOmC+DP2iBgUXOEx5Qww3L7eztjRYg==
X-Received: by 2002:a05:6871:c8ce:b0:448:501d:9c80 with SMTP id 586e51a60fabf-44cb466ec74mr3708004fac.30.1783010477603;
        Thu, 02 Jul 2026 09:41:17 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:40:54 -0600
Subject: [PATCH v5 02/18] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-2-24f22b052bf2@gmail.com>
References: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
In-Reply-To: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
 b=s3V8oxULKuOEwzd0zRiR4WVTXWzlzQAHWMQGPjEk1YtVvFgMWa7Ii++Nul57WSvKUwkHFcYcH
 obiCY5GqJZPAwDtHEDzD89Poxk1fRQkZ1aqcT763rr3ApG33oWvKUnk
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
2.54.0

