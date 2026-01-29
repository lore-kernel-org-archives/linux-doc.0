Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD7437AA86
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671867; cv=none; b=mPj4OkD5scf7Aabl1h3TkN2Puq4KGCCdufBaFYzZInD302ujI6zhoyOQGorsa2vGOW/HkDubCVU3P4cm3mxSiGCCB0W7Y/6J66H6QFvFteoP7X+wVGvsMceYdxmGOqksPY796MPU6cQXVT879IYO8N1xRryNdPf1Nfyf+gVdgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671867; c=relaxed/simple;
	bh=yM/EZzicB/LJbH28E/Ov+aYec8slDHbgHdL21Jt9WaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRLmVr4BJkijqf1aFdflAmCZAmtEOgVSSGhxOqP2gL3ybHZaGxk373UqmaAo+QJC6vJKyiJIzvWjlE/vVxo3FD7nebkhFQkzuho9zfZWdqKA0ukedw963gqePFTKonpH2pdwMrE3WAuwMSbLZoyDiFvMKPljGKmWuS/tEaayqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo+QkVMj; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo+QkVMj"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d122733808so211931a34.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671865; x=1770276665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3er90csC+U6nwKxQoTNrtHNSDK50GgtKIw5zKU1QZVE=;
        b=Lo+QkVMj7yNfi0Tyio9KLZHBpHgejJmYau7da0mLw2zBkueCW7HLBw1YfLOD5c2ylQ
         hKu2bn80Lyyh+ytWr46WzGVcgT5SOPLqbz1RiYS9U9vkCHAmlqAyAcPcEXlnNGrokVQV
         2ZtaYl8ADlPGQYfIEcE1C4ZryYd8m8nK3+Mk5sUiXmfTj/Iq/fzqf2UCcuKYWhxZaFCb
         uaWhhnyITklaGuKeCsun6LpubtsN+aAlu4uAhsYcBelptlXeVgSXSreEpVI4xlDtHRCJ
         nQ4u/w5KqL7Lis4e4JqL3Txh+pleYsDI6VDv8eNxSxFSbpxlT21JXUNz2u99kZXHAczP
         KJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671865; x=1770276665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3er90csC+U6nwKxQoTNrtHNSDK50GgtKIw5zKU1QZVE=;
        b=o9s901waDets6z4KJy7g+tWNT44rBoglWM1SXvcNpJGukN28n1QEgZ8VrS4HAxnXlC
         MBEu2oaq6nlK/caJGcNGmw9b1WDQ+ZraAI1ebObv50J0Gnda9rRYPdVSbbwU4DIfGW/x
         pgUXYbSzscU798//R/Uy5izbumoAScnEWCte+EWCrSxogc8RVM5BQefRFWQOaan3KYen
         13mXHjpriIOKMuZ8e610iJVqfaKFEFmW+uAf4lZXXxXVBZX982qZx31ow5l2/o7AZnIR
         c76unETW446xPGtMm83Zl03etP3UUFWrC26VFo/RDyucEH9RYJBDGWnmrK2BXMovNilH
         PZfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Catlu1jfIuVWZvYVAIjhgOAWGAeXwmTyFGvM78m36fk3zupmcbuhFI4/OnpWx/xhVmrBmGhsAFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxY6cXepjgvm/9lT4li6AFYB58XaqA+T3bGYHmTuSJsOIX787q
	+BLpjmAlfQ9Y825EZqOzBrrpNVyMyVFCfIMVGOjspW2m45B8vqhtIFWK
X-Gm-Gg: AZuq6aLe+PlEEoBh3XCYebPzp12+R2l16ExZBdbduZWjBmOjykjNprxaIQGkO/C5BST
	XaQwBdypqH4tgIQ1SR2dW72W7xdrIr95whw4wx3nC5+JvEYp71uSfQYoDZz0gET3N/2DYdOw4Lj
	roCAiizS/RiP58Qh/lZ5eRyBCQ+uYQJsryShpsubo17UEqlesuMa2LMk8fSzsKixsvm33fwyBFJ
	m+/KW4T/v4vaTiCpyUATU7/vGu4L5am1lOzJEGc8pNJXhq3/Y8kZjh0QTx/3VesMVPHgWMuQAWE
	cdSPxNepsIFRo0jsweYY9CtGlSqaq1cx0PSbBtQZ5QDs1gHVacsrMVGAAP4zfoOO310PrLH0ky0
	1zepOcm3bq8T0v35e64OMhiH0h9FGBN8TCkIaAtL3K+w0GGc5diSFKuOKHFl+X9wmxGmvzp/nv7
	heIazwhCOtyE1VFkp0B3oOeXZaUJH3LaHvJ+RvOt5JbaUoWIuN4Ys=
X-Received: by 2002:a05:6830:82cd:b0:7c7:3b3:fdbc with SMTP id 46e09a7af769-7d18503b851mr5188498a34.14.1769671864926;
        Wed, 28 Jan 2026 23:31:04 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c670734sm3193692a34.4.2026.01.28.23.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:04 -0800 (PST)
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
Subject: [PATCH v9 21/32] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Thu, 29 Jan 2026 00:29:07 -0700
Message-ID: <20260129072932.2190803-22-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b6198ecc854d..80160028461a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -224,24 +224,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.52.0

