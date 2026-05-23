Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CF367F5F
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520545; cv=none; b=j6bIAs6oehWyNIcahAmchww+KDYaHjrX95mvBthpy27gfw/c3dqDvBraIUacyhw9hhR4aaZbu7ZJQO2T7f9SCaagKhwK1f78/qeFD5ryqB5OHPGTvTwakdj6RLlXKR6bL0gDDWv3UDebNcsyHamVIWAwtgL7RxDjMbRTs56GZNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520545; c=relaxed/simple;
	bh=fJJj649T3B3bmwoMx3I1b8H3sX85+6tYQ9gU6si3lQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/YbrFgNr0S1r+BjYJSiAZiF06AUKsnkfpEZvin2sE0kWwym6eGp5poa9v5m8hp6GiXH0YQc+39Cs85F1RAqPCbh7pczRq5FAQaEomZoOBFvCAPnUTzXQX71nz+O9VujuTZrZjuFRjgGXc5ST++dmuN0M2F+epYtjd5ysdlWyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCJmpk2o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCJmpk2o"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48fde648a71so54393745e9.0
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520541; x=1780125341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDLU5WQYt4oY/SVN5IVezPdfdTCoMnWFmJoSA2Xzdlg=;
        b=NCJmpk2oVJTOOsaGZ2M26DywtgLPU7+XxtNgrjDPyYL1NQxdjlAMyOfyOf+K7ApSio
         UynJQo3NfEUU7LZONXyGU81D8kX1PlHtvh9ungsvWyESHQpN+Bcz+WSUuWIRZj8BFeBF
         OFCN5Xt9Kvexqy2ee6eQrxQEZPkNAiIB1MhDP+qjwKfi+fCvIWNf/OdtzWioA5oVCeJ9
         XxS5wjdLgH5kPiVOXFzSYQE5d9SnSMvbo7pFJUZnjih2WEGqbY5KCJhuuhkz1TFqWzdV
         qjN4JkL6k6osvQNg68jgvCJd0NSMjX7NsCY3Gh63ELDMZ9sQTmWR/j8gVZqh6M9ZGlK4
         rPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520541; x=1780125341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDLU5WQYt4oY/SVN5IVezPdfdTCoMnWFmJoSA2Xzdlg=;
        b=fgivONsCtcGl3bBpFxpbOCF13AB0KtU3yBYhsrb5VOu1+P1P4du+CYfw+CuCcmdGYU
         HpGrwW8fJoDDEcZydLEsormXaMmmDpymDGlSHkR7adQFeXwoejh1Af10tWDyksNcr4ms
         iEO93FB0h+g08Ad5xjyi5AOwI/YqbstQmIy4FIachj9vdrwXbjM+b28tSsdp6VzG2sfC
         qTbULpD0HPimUQPkCbrbaqrrXtLQRlAXVgMSxz1fluwIzdlUYFL9G2WVc/F8O4gYiCGl
         VHl0QfUS7fl6Q2jIyLY6cPmh9YGcNhuwDPGMbRiCkDMLA411t6XiQw6aEvNO/FNExVLa
         yJOg==
X-Gm-Message-State: AOJu0YzpvqVycXMFJYuRQX0s9l2B+i2+HldWdzwnij+vJjmH+ZOTxZOX
	WenbdZpT2jmPOBpX1GjFoj2tP4+ZqAk3gno0eDtbPHQYH44c08FAviG8
X-Gm-Gg: Acq92OE9Vg/UtMGCauucqO4+DLg74m2pPYPo3R05D840tGCtJl1Qofe2chhf0DLyVlN
	pspEPuFcvAQqufqzP0luLhuWE0l8sXjvvv41EKPesDrFcR0XBrDEQQSGZQdBMrqQZWE57YDifiI
	RBxURlyPMh+vNn7k4ChMSWPRncldip299cmuJYQ6jj5y99HTjtHuEyxRfICYANeHv/r5UXEfSF2
	aObP6Z2atUC+4EEn5RCFQv2NFFWb8R/5uRF/m9gEPZR3xifMTTBPpqdVqn6bF0tRkPp5+qgc0LS
	B2Rc1qPaGAKJcOm4BicA9oS2abgjbFUiL977EmTZ7hV7MR+/vVBc1VuWpXdHacgm0Hzxp7rypzZ
	8TGwaz2JWoVyDpZq2TNu4sUpSQwq4xwat4rapbXdcP379mqMv4HCK0KEHrKznUJ9PtpJTFdG/rT
	ntSrGicdJLq1uAWWWiGqdfTFu61h4btM+VZkUj8qU=
X-Received: by 2002:a05:600c:4506:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-49038381676mr146718845e9.13.1779520540573;
        Sat, 23 May 2026 00:15:40 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:56 -0600
Subject: [PATCH v2 23/24] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-23-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=3131;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fJJj649T3B3bmwoMx3I1b8H3sX85+6tYQ9gU6si3lQg=;
 b=V+8IE8KkGtFIdYyLDVrlrxn/sAoLHZdpVxJ31MGCeHA9ThYCUNqh2uYEtT6ZbgcGiaE/3Lu6i
 OMECpf5DJmoCzNLsou0p27ZdFaR4zl/W0edvspiJbNugzW2jMTcUHFw
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
index 11ec40f488f3..fe73aa27b350 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -224,24 +224,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
@@ -321,10 +323,12 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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

