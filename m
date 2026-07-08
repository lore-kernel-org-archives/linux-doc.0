Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E53B6C0A
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477120; cv=none; b=dVBG7aFC9CrqX+NrbRobpLhO+EH+ICsZ5w8FyuDROdk8h426HTnuLrlHvW9yKUsidhPmg1anG6qcOIrOBWnVm+S/NsLnYKRmV87PJ+YMXgqzVYypW1cwV/jh8KVNNtzyeru4TUfs/oqLtSzJunFu7Mmm9yqT/m8cbX6ss3kxNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477120; c=relaxed/simple;
	bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UarsE3zpHpkP3HxnMsauHkef+/DmYbI4xZzQCTZotPctCsl4pGe1OKwbgWKvYPu/4D6AW9/HwVdxa1nsQH02dlP8qSoPr6sAZ4jt0D9dWfNFILhATS2imTumqj0BmQGQZ73/fMNBv+8E4At6ixSo6E/xHzlYcNzVAJeDJr5nvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6KW+t23; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6KW+t23"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-497d3e4460aso1305414b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477117; x=1784081917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=K6KW+t23RRnF0eUDmExN1coP77KTqWHLZxvsn0s7bguE75vlYDrQS6KxCliW+SYmRd
         TxJMhyTwbBEv25jSMAkmDIZ2dHbHbphaOpVtoK6bT0/+gF4eb74y7uF8iUTAcyZ4LzeW
         gvOF7etrhUuc3VM3moP2Rzuf/rincvjdiY+TjpnandRFhBczCkb/VOsrbL46ZAz3CihT
         DG9+yHWJSXdK3+A+z0C1RpoCE2VVHps1SpQFqrzGPZjq4sL9s7+Iris3evUoU7Kwp6ph
         zGvu7StJ4Ow864bsmcUY8lKxKmYTzdmIL/saGrMjQKZxXyDv7Jn6G4p3in3N+tKwZXMm
         hpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477117; x=1784081917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=Lli6JQT4XRsFAqnkD+cIgu7Cv3a3YSL/OoYfMl/i6fxhG01HCIoxPb/luFCKnMc3Td
         AyuePlQq8ylKvGXP0yXHAFx9NDn8+xBrq3BO8iRbxdyWGIDeMa/DHmiDpZbcSIg7c5qV
         VfEAF/fmgNQ0Mmrue/njBxVxDlp3Xb+j3F9s8m0t2DRBsl14NkxvOy4/48wLCUqP5fnr
         3oiemo1db9wSJ26iwfXln+RnKYwlk8sa3p7aq4xLM2gSXsMJ1EXWG/Gxl5Hg6FqEYWUO
         0aurL+AKtZzXPS8INj/UVuoqN5twvuAx5cEjIyEIb0GNmoRGjQ0z3zy7v0Lyt3Cwe/ur
         DbUQ==
X-Forwarded-Encrypted: i=1; AFNElJ89f3HNYmkLxIdNXqPPSFXYejPka4lY8xVSvK0fL7wt3IIahFen+q1fcxPLjFkIuGxHIvUyeB6SqMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3f9JNTS3uYDmvcxKJgkGBoYSvYn4lP8Syqe4RWoIzHgHTj5Rl
	fzBQbVRrTtUiS743hRoLXzqHWpOa45U9k8cuN8g1PfzB95fH3hLtHAS5
X-Gm-Gg: AfdE7cm9KdVo5WeMc3zom+hIgMiLAkJj7UvS4W+5oUT1ta98HBC8PPbWSe0XUAHmLhk
	i1uyixfUh33HiuLskPPYuo8q0Ks24Udqx4lDQkBo6p177OqAWrynHAhCWLtzY3jvMjOWLfxv9cX
	QDIJJiSljE+RDIBlUYo8ovpGiTGKQjiUNGrgtQu1HjKxcXb+lLCRE4O8tIJJpdmfdjN0MfCPtwD
	8tZuHYt8nvY50s5k82wurX/CPCVsX1p24LblpQUoBNRClJG+WOfcyKwWcDBSKt4yH1vRgiczUAD
	93zIje6yCNwNcZNLY28DWWbNbaxmIfR6fHpn0tRcY7Gkjx2YLfDxikCTpwoXkwv7Dpj1SQFLWx2
	qAoEUcy/a4kTEsDTU2jTMiEsc0ACX013XRAK87758uh/cPVntvu49EOF3h+3vWU5ufxa/0MLWFn
	xvK1PcPFkj1fTV6uFic1fBR/kFNKVSpDZUzJXxFnvZ/Q8f6KAfcxM=
X-Received: by 2002:a05:6808:5383:b0:495:dd23:1634 with SMTP id 5614622812f47-4a078d678fdmr4414093b6e.15.1783477117572;
        Tue, 07 Jul 2026 19:18:37 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:07 -0600
Subject: [PATCH v6 07/24] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-7-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
 b=Df/3Jimg35ze3m1P/ozSvM5FvBWV8r61gESD6JGx3nop2TPly5KJeYBPy+kA2q5XrW74Hvatj
 GIqsDorjqu3DRe7lb5t9WSRn+uPKlFWyrPUIZa3ReDIinFblSpF4CJw
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

