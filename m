Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C437AA73
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671816; cv=none; b=haRxRyEu4MZT/dQ1jVaaAK3vCamt8RfPOkGQpe2REHwFB0ZU947n56We5iXMdSqm9hLjvLLPYkcwk/Anw2w+idMk30A6gAyQ/mGRJZZLTXPGBZikemx1ckdwyDR4qh5pVvtavAcYgRA8vUg6H/W+9miX1Uz3TuChYzx//bTVSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671816; c=relaxed/simple;
	bh=fM95hmZ04ed6zy8idewI3EL31tuL2KItDxeKe01AAec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+j5juXgXHMw4AQlWadT6V2qq+X80RuxYcJg3/WTZOeqqNSJ9pBCodQKt07MBAD5jRusRzwnEd/m0Fts7WdbJbhDH1iK1fQbLzY9LX8wFt1axTDREwXPKa0Gh/7VSeclwi9fYzrCYi530Q35WCWwR1l7sKgqHboo4DJ8XnRu5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3kz6DLW; arc=none smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3kz6DLW"
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-4044854464fso315335fac.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671814; x=1770276614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=B3kz6DLWhERWg1XYhZJhKDmy1vVqBczD0SordZicRW8afQReb4/KEseFoBPoYYEIpV
         GXsWbc1a/yOHlyrNdtvKZXAdDW6aOLsebSAJWiWKLqrWaX8AWPc70w4NYU14brrllwa/
         V9r1NvBxyYUeovyqkzJ86a5s9Zrf6iPOwCCV63VsgDMaCIq9XLkYTZbzSWxXdxU2u6SH
         PeLYAK3P2Ba1stugc9ro05vPoca6E5UjNjCwQWVvUw12wUA5QRF64+A+qRC2+VRmEM9L
         PRS6jTdtrVgc9Kppgyb2O5OhSZAP00c1L5fuA3hhb55xjZD5MW+al38aKY+jRGQVvugc
         FvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671814; x=1770276614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=bfVW1Ajy/naBtfLErlHJbe1KqkXNFWvG7gfVtalE15Sz0AGnSnifltdaDLeLPxzS6n
         tXHN3llN7mLfGkzahj4BfptXyO4Oli3dDwQEDdqYSeJikpetsmNQx/IdVBGgYEeZysyY
         1Z6yLoU9R7MpCC9GVXdC2cL+DU2o7FMRigH0J9fDXxhOUcY7Q3Hh7wwqBXiHu1SNgqF3
         Ih5AcpfinSBykSECTE0kf9ZCtmrhWw6KMtwwSsQyGHbo4rSQyamEk4J0VvRmQadb8/gu
         c6oOmPLNL8WyvRPJQci5juX1hVckKQ4AmtaD6V+6uoIkQqlrnk0YzJC1ON2sGvLIkkzs
         hZpw==
X-Forwarded-Encrypted: i=1; AJvYcCWwyzq0PeWJibyesX6hCYXi/UktglwIUmCvsfOFmdKy63rzlUBUjDq0hj3ZLa+aZL+iYXwHvpCV7eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEX1No8gLspIHryJ6MNnimaJ7/r7zfZwZnwLmSbfMuo4DAWE6a
	9oe+tWySM6MtFRlO7fx9k9VOIQUvkhEoGUXE8yGwlJT45pVCm+6CgwvB
X-Gm-Gg: AZuq6aKUhuXnTY8ca86EMTOSiS+Bwthz436OLDX2ZubBQMpMM6U8XNjeBJNK1eIXQG2
	hK362LXsnoXdwjE+gi3yvYlRcHZ2t3TXVz/8jXG2n3RqpoaAlcSzmDeyQBlHOVnCmSSDP/wxiiQ
	pn80MdZHpDdY0K62EspE4zFDkC3BzHzOwexRaEdLb5x+S/y+LXvNY7vQiTxMVXyTgEnH8nM3AcY
	AUPawh9XWXemUMJxItTfuJC6HV+U6KAWiyYuL8Dcj3khRonYFf/1VZOZuV97x7E2QisGALxg2KX
	80im41DHzBTwiIiGf4RJRBT274bFlRFLuuIK5yiLrhINR0QHt0JVE2VoKDIj+N8rLUp1BcgI7MB
	pTAGroTDfjTZpxQodp7vnguSvKrF55WuXe3jjLxGi0xYoBH5nEmHQt4M68poI23uGZfQ9kvNci6
	LkKRxIO6nIs+gEgSi+b1LAmM8RM+QyCgbtiSbfp4fL
X-Received: by 2002:a05:6820:440f:b0:65f:1296:76a2 with SMTP id 006d021491bc7-662f20db184mr4107061eaf.67.1769671813988;
        Wed, 28 Jan 2026 23:30:13 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-662f9961dffsm2868953eaf.5.2026.01.28.23.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:13 -0800 (PST)
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
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 06/32] test-dyndbg: fixup CLASSMAP usage error
Date: Thu, 29 Jan 2026 00:28:52 -0700
Message-ID: <20260129072932.2190803-7-jim.cromie@gmail.com>
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

