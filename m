Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2F3D953D
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010509; cv=none; b=PHYmvZlz9xCVt0Sbk+FEPxY+up/QdWXZjkNefHmt60IjkhkwvYdVf2D4nsU0fNn314vF4stYqh3gwa1yY7ajE0r+w+LTQJ65V7W9WRuVYdeH9h0N0kgY5/xOWuIXJBSIVwWEBE39ImAMvgkmzAy1cY7/PtEjhPtNLMEJa8BYtsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010509; c=relaxed/simple;
	bh=YU9RtpCuL4COYNbswz5a4pt8F0knHWGAcRYBMAoMlB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oufb4HtFZmoBVvbCazTKcbM01HEqLeAmwyN3CjivPc6fiMs4U1sqEJLMWCF2VQCdIkAIm7oIxY83aiTt5ABBJkljUuktE5mneyewcm4Q/4bAAIkuZzCYG88AIN5zrmjBmrCGD2V1uonX4ua/nxhcp+PUGJd3QuFdlgU2aoO0PJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSpUG/ic; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSpUG/ic"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a19a5691bbso1336345eaf.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010501; x=1783615301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyPGwMs+hyIl4H1Hb9ukL6abOywy+AKG/840NZGmH+I=;
        b=iSpUG/ichah8p1H/vTarvmpyQ0bg3THP4IxgD/1N5Pi/SpDV27eW4X3GV4aSrpT1Vh
         TAZBBilHzgAMTrWQD7PME3lmI13GIkjkuNYqIjEuvj/mOoP+zjIwCWsw5fJ1IUZTJuoa
         /viFrOTewAxGuJ+2O7tEKcHqVCD40wWU+lNGqspZNbVio/4YJI4DG8GVEwIJ23O2yRGG
         rziUIPJAFp5CApF6UCbbgpyYYn/82FWJkw8S5SW6GItHDOks9rL5qvrU1B8ALfl7rCDp
         E3Bwy/ZJRNmahsDuz37k7KCw6V7ROq7Kv6IpXpZqg+L53q3o9tjwDK+o0+6rABgENkwP
         FzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010501; x=1783615301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyPGwMs+hyIl4H1Hb9ukL6abOywy+AKG/840NZGmH+I=;
        b=rL9cdJqwCvMpKyT2fW02d09X00CGgywwg8507KMF3s2Tdf61KMIhWqbVAdJ7v3dLQc
         M16m6G+iUJm00/A5JyUq5FgURlBeODpRV9TK+DOyQ+N8Yd/Ia2rxeWUgonQW58RgS1BV
         kkBQK/ypOxzLTDi/QIJ4tgrcZ6Rq0olPvF6fF8VbmZCbsS3TtiyuLohluP+BUK/cbn0S
         yNiZsZ1QloL9wkaZh9covL2bGavIUoV1t38pxyssLqr8/gjLStWs5Msm1qcoxCRN32Tx
         CQD8gHSXBIN9jJzznvUyqA3ho8HToO4u+Yp1/0l6a7VogtvBXrm/hmTd2ibFQiD9Tpy3
         ZPWA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q6uSsyMAds0z8jCjAaorkEtQVE4BGOo5/2/Htd8HPLR9OrTQgXuQOIH8E8VB9b29Sq6+9tJYGJo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENU4VQfpbTLXhnrbMrjoBuTL+ScViZ89eXl7+kR1nbulxGxCT
	Ls5e3pVJFlCodX+rk3K3ud4ZAJsKAVJusX+Yg3DBZPhlbAA3LoAGGpl3
X-Gm-Gg: AfdE7ckdim1seuc9/Q+PU1aA7kE+x6phhalsS0XiaVkfLW0J8gioF7uCxm4hKW3OMkO
	uSsB3kk5J17+jcWUkN7GVw/isNqZ2rw4T4N9Xz5xPTGyZTDwKSoAXGvKS/XkVYw3f2v+HQtIm97
	mso1sowbsbAxyP9wjtJHlLHOFbF/VAe4UBXO+gmVYSTeI8LzIrtxa41ZQkQOf7QyOAt7I/6tzAu
	gee3oZ8+TBHj3tNxiMfspTaCsfYR6u/a5Gc0M7U50Ee+Buq0uz9IY5Yr2swf7q3WG0F+/ni3Lvb
	hM++O+yK74jc0vX+gWsaQyCxoAEZubMZpmiZzKMT7Ceqex6R1xRZ3mi/K14Llf/uW2xsG899RKK
	b0rZPKZFq1DlwgprW3Z7sXYvdC2RiAjHHoVGSrVwDmSmYCoA5qvcXAOR9UdooVKYjNudC8dHhZK
	k1iSCvljgExnjP+/oLDYqnxCY1N58tMQ4/ViLkUKojJTR592GvFN0=
X-Received: by 2002:a4a:ee12:0:b0:6a0:f7ed:8cd1 with SMTP id 006d021491bc7-6a30d7c9b39mr3509681eaf.18.1783010500952;
        Thu, 02 Jul 2026 09:41:40 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:41:10 -0600
Subject: [PATCH v5 18/18] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-18-24f22b052bf2@gmail.com>
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
 linux-modules@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=3522;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=YU9RtpCuL4COYNbswz5a4pt8F0knHWGAcRYBMAoMlB4=;
 b=u1c5Bhx9ascuV1Z7IHMlzsMCgPWlLsPkLIrMukkxro3mfC29P+COzhh7x2marMupmlPL+tRsT
 lqnL2g7lVnFCnJsDVXIR9nXv+uSk+s33YWUS/+uMa2ooHIyyqr8Y/55
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
2.54.0

