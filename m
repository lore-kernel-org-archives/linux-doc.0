Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B65A3B71DF
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477153; cv=none; b=J16seQxSIZSxOomjVml5ZD1Ju6w79h3+FmnBuDj1B6H+4GzVYwKhioTtY9Pnslls7IynoNiNVkU5t8Q41QqHy7yWWuCe5465DQJio0d4K+ARpuCcxPeb3jjJ+6lbG2dNfWquTCE3Z+jKXTGUtCsKRGpla+jFV+YADp9uZNmOJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477153; c=relaxed/simple;
	bh=x7Lmuj8LN3O7Zdv08MDGavB+OL7HP+Z+IL4O8u3sLcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzyHXnb8a/752ugumZI861DBthWi523l6BJP+xLlGCgDOcoPksdo2vxDs7mS4rTdF0mP/VeJxniCoePW3QTmw7UtwPOSOr7aA4kzvt8K67jy1XS1PvYfeoavb8l5rIOsZ4WGPj6IEIHSsHuc4gCU/Ywf3qFtFKuTW79HA0aKyNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edsYDpzl; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edsYDpzl"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-497d3e4460aso1305832b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477148; x=1784081948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEjbqhV2gwoIMldtbZBgfn/e8I1IhfNrhj/88jNL8xA=;
        b=edsYDpzlnhXtbeoG7Ot2Rvj0DHvh3HGcrxaJhM8gLcXiMUpSpxsRvdpn8ccH9BFXOg
         0b3pagiztUe4F/nsLqrAJV8dLVVTLaKsSP5Z7sCJD6luyufgCNlplbhSRfYEeRr8CmqC
         T7M2DPJLeDGk5z9zHtdpHp9NBYBVWsM4SewrE3zt4/u0Y5nmQRa9SOGSwL/bTb/sj3C6
         YeeeXpmfV1dYiKIfa89jL8oir5L8XbQ9RRAT1WTb3O2H84ADdNH6d/2Iv5MqTRRGF7vQ
         Jv7BPsONWxTMHZwjDeC9eDcVSN2SxyUqk78i3KNgSaxswBx4JG7zKicOQR0CiUnbwtVI
         BK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477148; x=1784081948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QEjbqhV2gwoIMldtbZBgfn/e8I1IhfNrhj/88jNL8xA=;
        b=BRQwYHEeWLmlGRdO9EWPSNKwz/poNMBwWKxyTXr2P6WylsoyxSW0sw92oqYzfoY7gi
         PvlOEStAcSZ+tUchYZsEHnAhyyt36U86/49UewSXEzCiIkmHm39LBjMNKSLVqeoe8BGj
         yAfpoUJvlR79rFgX/mquIhX7aUb3Xe41SiN2cgbbecQMSK0a9RafXTpOUpTazMaPN8vz
         ENcnJaKbnoUScNetrWAoPBL+J6wbq08VFoAg7oXyOp/eBPJ6I5slxEUfVtoDWEff9A6q
         QOl3LWNkvswwm+1dWMopHB3yr4fS/oIhG2xcto0vvmTjHryIn96RAFraPwtiD128K0v7
         noNQ==
X-Forwarded-Encrypted: i=1; AFNElJ90Dr7MYOKcl2dv/gcL/8c53HxeoCzaFsyCawFrz5FPjVm5n9cyuLpMZo0/fiFGZymWs/kvKevqbwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyguJW3rL8gIaI0A9dDG9cXmRr+9Gtxnn12JoYYXQfXpxeFHusr
	1oO0Rd2FBwIm1cVW9pe52nhxfQMhWBWuP28056oBWlQEvTjoZzdaw/WR
X-Gm-Gg: AfdE7cnvIFUkHT757niUeafIkczyeUIW2yxXN65gi86G9poHc7UF/o3/BRHfjmsrgq6
	VDRNWqL+YIS4j4dlImx0tnB3zXBme/30ZtSE+/T82PSBOJ86XJQTT1Wf84+jCuUk+O0A2qbO3vb
	3ZYJaaXE7qQf7UDIX4+u1VrJC6WJk960mbdRIMw/gHd7uJAwDJdvoxYF70CGMcyDlRCvGM+x1e9
	D0BRX2IN3OeJ0GOQY6m2p653nNnfpDYVS7Y4wO0UvC4dwKLRY0Z/JcnTeoXiGLnXNDxuDBhRwfJ
	4+pv0l7n1pFpEz2Gw5KfBYZzjqEzKt+F8T8ZHFi5wQgLJiP8nZzrixPMwgC6uuqUTVE0Gt0vtI5
	Mb48oj+PwCeYWk2qRqSetQaTCAckSL7SCxsulkkXNBBufFF2J3D8e7cq0qsD0uj05fRZxeocKK6
	OVeloDi2svmD9VpRSCslBwciQPCkLfhCS1UlfpgqLOUbz8KP/4wTtxwdWxSrC3jA==
X-Received: by 2002:a05:6808:3502:b0:4a1:8ace:b41f with SMTP id 5614622812f47-4a1f090567cmr454807b6e.10.1783477148516;
        Tue, 07 Jul 2026 19:19:08 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:19:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:23 -0600
Subject: [PATCH v6 23/24] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-23-381f3edb0045@gmail.com>
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
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=3522;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=x7Lmuj8LN3O7Zdv08MDGavB+OL7HP+Z+IL4O8u3sLcQ=;
 b=auMc58zWcPnKYuLlJzABwZIDMclW0m/WEujPrsC0hQmmgedi7cqvgzrPVVb/aJbMKrOobeRnz
 DBkn9Zgm7FKBGU/A4pvfN0yNcOY+GUSa1HBOOL551M4YWstK6tjcURa
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Additionally, change the dynamic_hex_dump() fallback macro (used when
CONFIG_DYNAMIC_DEBUG is disabled) from a do-while-0 statement into a
statement expression returning 0.  This ensures that the fallback form
of dynamic_hex_dump() behaves consistently with its enabled form, and
makes it safe for use in conditional expression contexts.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---

v5: also convert dynamic_hex_dump() stub

v2:

fix statement-expressions to return 0 (not void) like their respective fallbacks

   1. Add 0; to __dynamic_func_call_cls
   2. Add 0; to __dynamic_func_call_cls_no_desc
   3. Convert the disabled fallback of dynamic_hex_dump from do { ... } while(0) to ({ ... 0; })

move RvB after SoB
---
 include/linux/dynamic_debug.h | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 355f2cb11733..8822f9a3605f 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -238,24 +238,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {				\
 		func(&id, ##__VA_ARGS__);			\
 		__dynamic_dump_stack(id);			\
 	}							\
-} while (0)
+	0; /* match no_printk return value */			\
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {					\
 		func(__VA_ARGS__);					\
 		__dynamic_dump_stack(id);				\
 	}								\
-} while (0)
+	0; /* match no_printk return value */				\
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
@@ -335,10 +337,12 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	dev_no_printk(KERN_DEBUG, dev, fmt, ##__VA_ARGS__)
 #define dynamic_hex_dump(prefix_str, prefix_type, rowsize,		\
 			 groupsize, buf, len, ascii)			\
-	do { if (0)							\
+({									\
+	if (0)								\
 		print_hex_dump(KERN_DEBUG, prefix_str, prefix_type,	\
-				rowsize, groupsize, buf, len, ascii);	\
-	} while (0)
+			       rowsize, groupsize, buf, len, ascii);	\
+	0;								\
+})
 
 #endif /* CONFIG_DYNAMIC_DEBUG || (CONFIG_DYNAMIC_DEBUG_CORE && DYNAMIC_DEBUG_MODULE) */
 

-- 
2.55.0

