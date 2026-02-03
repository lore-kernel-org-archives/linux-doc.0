Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517632DF6F6
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153660; cv=none; b=qYjXqr5dXTf3t8EglGN19mNEIMp6Ka3u7cfFdzKgSJf7FSPQRPJOzHl+Y+7fsr7kk+N5sNU1TvKYckAyYkf8PFnXmhSRgjvnRv1QHmkWz3cpaOBJoXMg2bWmcCr/4SHdNUfbfcKrtNlVHl4mVKK//jxjrd8ecLI1X1P5mL6rFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153660; c=relaxed/simple;
	bh=FmkY4SatpzjGfLIPpd6Gpluj/xLWyAKYAcW7/q3R5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPkDeyy0idqQUoUmE/qqcc5IiukcDJQSA99wtp9lFUPhDdzzj0sHabkGpzxUJ9vlW9i804JCKVPqV9MN7mVfDAygXWNvvGgOv+7qOrMbYLAtj90zXPW3jrBjCaYfN25yeXCbfKvsT+gAP7E1XLxqZTNKBLQ7NHDbSPAOsMlP9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjv9a/gN; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjv9a/gN"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d19d3c7208so3339822a34.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770153658; x=1770758458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
        b=bjv9a/gNoA37N7LkV7D/4YEOZA126g/gfEYRycvNGnbtn6UWxwlquYAxKHTL2EmG4y
         N3iIMf1/oFDKOyNE66ajmNkX6gyFzw/1Vt+RKAYjKV7iHD0wJTzUr8HceVlxH0wycERd
         HGYh2q2Gi+HFUNRBs3i/pdTAY/A1zbma4xou6xp1PdNdgORbURuyy2fUVXEJnH8Dg7fM
         gnZWgqfvwgL2bnW2XrH3io2IK+UYIWAVJ79WmohKkOFUKME/zA30btOIw5A8FRLif93A
         32fUa57eK50/3z1V20ezS99qZ8/x6w+Rdgqt44n2ybjy5WZZFRwZ3P2X65ag9apBFcpu
         Vr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153658; x=1770758458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
        b=mrmRoWk9CAtue9w8uMjB81UFK9G6CjlSAG0dER5qAD31zW9bEANKLtKlZ+hX3SjbOS
         Tv7PwUjX9sLJ8kJRfnWHTixcRB8/iHIMfeQkrN2OVGLyr466YcKMP2rww3eYhlLCRfbd
         rZyY1ZIKknsXz4m1RyH5aCdvKJSclhf3Jcj3yOeBOGIfhJ/oblG4UhBsf+crmycowqi7
         roVJxQSr69dpFLrBAap2IaGpChQwWGuGnobwfmbQ5E6rA+SyLu9QVF2gesKIP6kH/Kjf
         pSIyF/M/DhovdBD2FenUA5ze/OPCzo5XSFAt4tHRD5WwSeJFYSd63Us2uMo53rTMfw5P
         csTw==
X-Forwarded-Encrypted: i=1; AJvYcCXEGgIYtzVyLDH7jzQjOCT5s6BuD29ip+V4Ulwr1o/0gkECX6zVrRp4Ua0z4kAzAHlwz/r3bG39a5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0qyNxESHmoYre2HnHgaGxkOLhMBqWReGG4qFDfsBda4L1rvd
	u1Sy+gHjVJ1B0H1rcEfi7nPWVnljW32iZIC00DrAEaVUpdtb+LFRJ0xZ
X-Gm-Gg: AZuq6aJYKuX3Xhfb1N/35T4ibSTJJXpNpAVQPl2eJPadmIl1tln0MJlVsLptTofpcXL
	Y1QkyqkZ/U6nXQXWJ755XP5+7RXGvOktqbXdJKy9nZkxeuZoAWN6MUn3p/ALFS11NDh9ulJyJcH
	PuPm/k0pEYr5837N72i+whZb6E6V3OIY2PSGkPMKHrk4CDGBQzzb0UX4Xu08gdGpsbGWGtd+Geg
	Wso/dNIsXAwUCplFuKL+gjcv+2O3U8OSLwaXFQ/V+kfjYmy505yu2fDtgZvrSPALZNn4EtkWJ2S
	TK/KRZzotOeRQv62x1AAy2FLw+l6fU9mtTOcGDt97WfTWMubLsww3WorcFJ3NKBZ4pik+am5YiV
	ICGaQVNrPeQv+fWQZNyVxJP2fJpcDG79Q9erDYivdhj9PzZYMyu4KM1gPQurZUCpdciHJt+PuQ2
	ubrQ/v0dtxyFfZNm3RXiB6AfdhObCmV/Qellp8
X-Received: by 2002:a05:6830:91d:b0:7cf:e4a1:8a9d with SMTP id 46e09a7af769-7d4489af712mr603151a34.14.1770153658124;
        Tue, 03 Feb 2026 13:20:58 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d4490f35b7sm454939a34.1.2026.02.03.13.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:20:57 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 05/60] docs/dyndbg: explain flags parse 1st
Date: Tue,  3 Feb 2026 14:19:26 -0700
Message-ID: <20260203212027.1130311-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203212027.1130311-1-jim.cromie@gmail.com>
References: <20260203212027.1130311-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

