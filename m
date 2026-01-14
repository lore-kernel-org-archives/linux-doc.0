Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F42F39B9
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355950; cv=none; b=flvmGWl1jDMJbECU2bHidWQsZtc+mSxUbrWH8dI1v3WpRvxMuqZY3UH97jedMfd64+qDn4mCFmbCSFljz5nIogr43ZSYBTP3/BCLtopbRe5drbIk+YnXgmPaPhjpBgGnxPOne3HGNXQpVvRQbH2kjWzqKWS8TTU9hflDOj2WyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355950; c=relaxed/simple;
	bh=fM95hmZ04ed6zy8idewI3EL31tuL2KItDxeKe01AAec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zym4Pw5lpVFLcy8J9yQHaKn/6oPdYfxVrKlpzfgjFUVt0uED2PepPrhUNR05F3+6wguD7XnPPAsUk9/0yeUm9yf5TgLHkusUBt1ePiyEUUL0KUPnZ47BDsXDfEjfH2O3WVtOSXKayG3xsoklQ2WwjgtMUuxvLUjoqzzhwudV4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2P8o88E; arc=none smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2P8o88E"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-45391956bfcso6109552b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355944; x=1768960744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=F2P8o88EZ6FOol0KFM6oRgkUV+ZiBeg+RkJVqmm8I8ZxyqFpQTfS8iozFd1koz0ZXg
         RgD5xwNXHPMfa+cwy8FV9z7Rjhs2DBUUfcA63DUGCuEQL78M9gCS033+5FToMoCpGkt3
         rlBq3p0Smmq1SvfuTs0E0lI2u+NynaDMzO6U4R+iumLju/5TVDqReftdeOE5rkZOQgRM
         hcc+RbnQIt4elku6/5F+vWgnqWQ9oMBhGeYYhmeVgx38y8V6FIgkRHsQeV6WOVVvPCfU
         3UbgajGBiNs6xYZs80lz2XpQ2UpBDJRa4ksO9czL/jyAAAD4wxhh4eApEtDAaaCalgxk
         KUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355944; x=1768960744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=fUoI6Rf+yMf975SpIBAyBouDpsoeKR3j3n0aiF+OrtKIk0lUgCQQmZkiURQPQVTvRL
         pvNx7vLzbepB/Uvbm5VYbgPBSYaN+wQRWjtXgRzqTa8qs2gih+ZPqS+cQ2bqGapZEJft
         oC0YUzx6ive7wLMPS33LYR5NPRrkOYVA/GnKDC7zF1cAPDU96U9lk5/uEFrwKhZb9NYK
         /XvxEPhxjqQw6l9t46V56Mi+unrUCNEkYBtj8jUqkefk1eysiC7bR3pdSqFPf9snqSVF
         g5tnQUwnv7ao6owozP8Lo7StmVoY+xArbi1xVEmmM1tgHuKZoAgbJfG3wlFQNcnEZF2g
         ulpg==
X-Forwarded-Encrypted: i=1; AJvYcCWbk0ZIit/h5DUqIVIDAmI4sI3BZDv9cncdB37Z1k2miUiPgqp7iGco4PKGj/wqqmP2D62ugzu/78Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxamL1bK7zp9gmUvTRJF6EwIzKWyk9cwZf+gnTsJJ1R9vvRdk0z
	TJqOI3mecYPRHIpti6r5eEfNzYFLwzx9wiPAnFw6IRxdUPGSisk4D7ug
X-Gm-Gg: AY/fxX6k0BwtheTGjjPthwJ0HFJjy5ViCNyjWlQPLiCZcVqMudiTmfC+l3Mnw92c2Dj
	oBrMxOEklkVogdLD7tOAg1VNIbw5+pOARfQ0rRX8tQRdhOsQkOa8S9EqOrpdgYHMt8cVYumNliZ
	NOlN2v9ehiwJBNKGjswrrPPrpJQZK6f5mhGzXErG1RLWPIvR4HJWkjFpdLWQaflLi+N2j9hBMm+
	JhZAWz93Cj+vepIJO6UjXvsFITjyDXdXbFMnJ3CRQi6pf0jqmrLgKg7oiIqIXWoZ6MApq5Htl4W
	bzWWNnt9gIysuQZgnLMm8x4M7iwPqXVyom606Ua8c9uG/lWU7z238sh4FBOXLCtkeQzvaVgoO7y
	qWy0YJyBO1yeakXFfz3ncZdi1d+Yt305XqGLThgRdSW8W5uVrTJn0Ipw3DUpGxnXb4GgVSxwt7l
	tUbX8/v65hMl2hVdIVvTfEhRHsBNXYk7JDGOzP
X-Received: by 2002:a05:6808:1785:b0:45a:a4b7:e5a9 with SMTP id 5614622812f47-45c71553f80mr625400b6e.61.1768355943758;
        Tue, 13 Jan 2026 17:59:03 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45a5dfb6256sm10704815b6e.0.2026.01.13.17.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:03 -0800 (PST)
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
Subject: [PATCH v8 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Tue, 13 Jan 2026 18:57:21 -0700
Message-ID: <20260114015815.1565725-6-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.52.0

