Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0C322522
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678547; cv=none; b=eKBpTAAllvo3eosJh5gGkC3E62/62ekBlLyEiLO6TmAr96FY/MpQqdR+nzBAHTE+OfGsfCG6cto2KHYsi5ynjMYBX5Gbf2ORbKds1+iVliyn7HAWh7C/BqQHEr1B2Hnb4tigK2Laz00lYhW0heibmh++okOR0x17t+PrlQezql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678547; c=relaxed/simple;
	bh=E1VF4T7M7c35q9Qypwa46ANAajyN9sx88/WRdouByGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYiKu/2JYS0DIZ/irKu8VG0Ez9DCPI2/+MzYZ6rtF8pZS3+/0Btak+MWMYR/0McUZZrFAf6K6n64dwGo7mJ0/dlhkYxkY0OdOqnZnXMJsk556x/m6Py0+7rD8j60xTvAH9neDgAKz1AfQVU9ZFn9mt1ez04KVJLUy6UmMlaxlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC5H+HsB; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC5H+HsB"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-682fce74c06so119821eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775678545; x=1776283345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=lC5H+HsB7LjjlA9mRpxkvYVRssBvFBiq40kbqZGSv59ZpCYnwzW5hwIEpSrnU3Ls6A
         bG0ejlRFSnYDu93tO0wdTnVzXsQ9dPdz6DvmrGhVes/x34zGxH7/YW2AZMS6bKxzNhOM
         i2OXCzziFoGscl8Dc0hQP5M330soJ2BvBEFxlAz0fs89ewJY6KkupjuYZxRoZy7WXYqr
         QNnmIRsi+TOp6pB2iGj0XiFuOqt93wz6BS7ud+b/2dD7SWEMMnILXJeqmRKaKFaztGJE
         4B/OkQmBkh9EpS8uIdaUoGx7plkLBtiBEi8pniIGY3gg666NKmewLgXyZl45dCOlw7MI
         xq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775678545; x=1776283345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=D5BhP79bjTomIZESc/SLCksnGXq9aH7Jt+sWFiHt0VZwhRvq5z6S1oCwlqIO4Cd7M1
         Pj+J45WOsNh5B4UqZ9PqZoo7JkiMt6PvuZxLMYwLXOfpH1U1PrgRarIgQ7HdRdAJYFgt
         XxPaThiY8j5UKz1+8wP+Wkg0gBsECG0qlHtygmlqCRukKk+5nSKhBic84f6XW41YnF+h
         m7ky5qh8dKpuxq7SgtbOa1d5hPD6LGGCMZZU4X0xHCtE1HiMbukkz5NMrEo9s4B9N0YU
         srmEgrrJLo0K0DxZxaSdXU8muPQfjzpxwwTmC5EA2T6Ur77aJvGnB+GZN4xB1bwKlweW
         BOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBv/68GbrzhXeFn6tVkgPnH9oD7+GwNUEqbMdSoOWyzorPO+8cYv+GbU/2/+UkBofi6O1xyk1H90g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSe4lOHSu9d278xZRRgSKR/WLfju9jvX2MLUulXSmNRVJGn9Fx
	xXBtX18u0evppIc5ZprGP+GUZOCcWwWosktjSd23SqoWAFZ/cZFBp15l
X-Gm-Gg: AeBDieuw1m12PBPVDAq5TgfgROUX620H2DETn7NR/bUUuU9tF8JU+tCQxkGI/byP9qv
	llx+ebfpxRJ2OXi55ncCdQ5hw2bJ8SJh/mCR2Uq5lEQHjFuJQKsUPnO2Jo2ViSg1MJBGqstJgm4
	bMJp/Jf2VOAtQv5DxdrpQDNpXrnaNml/SsGd9rN2J2xZTOHMh4VCxNyhH0vPewpP6qk+m3INjJ5
	+JFZceTYFQUmMB8eldIDkZ3YbUol7ISFziQ8bF46spIfhn3d/nUkExckk4z8q093RElAROb6hiW
	UaS2A+youMQM2ANcNn8SsGhIcvnEM8II2uxZ03IzMW+yAWRCpTrFQZPHbcllkeXopePE4bkVCxn
	95TAdg7qWGwcCcjZKxTYWKeInCNCk33is6Ex41fupjRqS6jIqDfHwY8cuYjYz9IW4buhkAJ4nkE
	MzPSm923zLyNCX4/d1msYoQoW+d9GrjN3dDR8vS7tkMhq7AS1s4Dz9ycKnRkiEClzIoIVG7wNyL
	g4=
X-Received: by 2002:a05:6820:2004:b0:682:644b:ba03 with SMTP id 006d021491bc7-682644bbbaamr12449783eaf.16.1775678544819;
        Wed, 08 Apr 2026 13:02:24 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm12254208eaf.8.2026.04.08.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:02:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jbaron@akamai.com,
	louis.chauvet@bootlin.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v13 08/36] docs/dyndbg: explain flags parse 1st
Date: Wed,  8 Apr 2026 14:01:43 -0600
Message-ID: <20260408200211.43821-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408200211.43821-1-jim.cromie@gmail.com>
References: <20260408200211.43821-1-jim.cromie@gmail.com>
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
2.53.0

