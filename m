Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E12F4A10
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355942; cv=none; b=Ndx1+NvUD5fadaARY9ymcFPZQEds7qHfiJf0i0cDnfN099fBquSgOoEj3M7N6o1bbGHSz5hqk1SPzgL+kcENe65MgkYTS21EoWcem805U0N02fjyIx2j0+R7mFhdXEfEpRSYj4YbwCnJpnzUKIj1LlBgLOHKC+36waIDWxzOZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355942; c=relaxed/simple;
	bh=EqxGeITc2UKYaMAzZMDYQfg02UCHl3X6FUpCJ4R9urE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7v2Eqw5hkKC5Egg2knMU1U6LzC1Wz9cd3pD1WSTEf6XJgA84rJMRWX06zngkmsfLaDC8QuUHxRqlrPqH/NKtINEJV2YVwqkyW5m1RD+tr0vvk6fxzQnE2NMJu4zSEhxOj4lVGPbpFEVAKTos0mKD75o1g1LUd+VS1K3B3DEzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8vVebGi; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8vVebGi"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3ffbfebae12so2700498fac.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355940; x=1768960740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=B8vVebGiYhihD0QIhIsJgmdhmqh1SaFfiusq+xMbXalNPyNmIrXg3afpRis6xfqhAi
         222xGjokB0CgddqX4gCFDfk0fd8y2nszCXU0CKhKnPI5LhZX/HiqXh/u42itp7waVF3v
         4gzYXP4+cOHEI8nZpN2fPqri3Lq6/gII/Sw4o+xMxzoa38p+I934dkOfsrmO7rfXK8a8
         f8s17AUJYG+aMRwReO3izqIu6gcLckDEntZsldvQt4Ncs7k0wlKYiZ0rOuPS7sTcUd3/
         o+FO0q/cYLWG22Ynl/xsTsp70To/rf/wwrv+EaKsSDQi5kfg36OqVTjpSV3dbMh6cEne
         V7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355940; x=1768960740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=Qh5nWgiB6mFpYWca43TYKgcRd4n6kayyXDMEEUWdQiJk+UizqkOKLE00A0N1XTRsgu
         1OdTvgsqvzWz9tyTUXuZjA7U+qkMw6ozFs2rkbuXliAOv/HKAR7aB05LbcpuR+mhUunS
         JYnOmgHbBbNF3pIlBhQ31dfETgLRdRVLewAWLMLR07z7Jm3MZ4jMYfsKzBK5BmMtwoUo
         jQLM4YmcxW1Rv7nQg8xVd+9iWvlhSY16A0OXLnkSr9VEWWwLy+7FATbvnC1/oSxJ3hVd
         BAGnKW+qkfgRpUrdXlxt7G/bdNYn3sC9DbsDHRbtIjT29Cv3wUT141wt0KRUoomray6m
         /+fg==
X-Forwarded-Encrypted: i=1; AJvYcCW+F1xvMoT/OmlL3RNPzfMPHAehTEkJ5xOwQCg+LsZNt287K4FJbZL+QKic/yn1Rnr77Vi73j6in3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIJM2ElqEhDRK1QHC6ocRSs/QJb/zJKgNkDuQrQFE8zGhGTRL
	KLnK7A9n21Ed5/7aB3N+S56kqGEzcES+Vlk2U0rNDupVclBL2O03Qg7x
X-Gm-Gg: AY/fxX7msmv+1uqWRt4XPWJvssif0jrcwDFfTOvAsS2v81sCrMPiRiLAMXuDx69qUBm
	wehmFrD0ZG2Ry72rVQmXRo94EG+Jlx+5a3OI4bfnIXptIy9PpCs315AZPG22h9IhSmszqToQD3f
	x5xqoBDihIZ4GXiRlSEhOruNjxHVSKX0zW0X8z2Zc5tPiqP4yW2pCGaZDDpx4yDUIgp12c+8RXm
	RBKE+/OwCPyBld4iqYVZJVPocRfu+5tAhNYC8grtTxHYjH10Riuz/55bKnT1xv0MCne+WmbqObY
	1Ow0BVQV26RjiCRXrhSJa0WFSKbYfN4FsL4bgc4gsJZkHjn04cEqxKhHcOYyJfeVJhoN5j4xXWZ
	n44KWwONPLkytp7XDehsF5v4/VR/90qy3dtyAov+KZY4VwXi1xLKbTtskkIPkeo1PYzCQgf577P
	gSHALDwT62Hr7U+kuOrFTjYaA5wLSD3a+579LW
X-Received: by 2002:a05:687c:409c:b0:3f5:d9b0:567e with SMTP id 586e51a60fabf-4040ba70e63mr407331fac.14.1768355939842;
        Tue, 13 Jan 2026 17:58:59 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-3ffa4e3e844sm15596198fac.9.2026.01.13.17.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:58:59 -0800 (PST)
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
Subject: [PATCH v8 04/31] docs/dyndbg: explain flags parse 1st
Date: Tue, 13 Jan 2026 18:57:20 -0700
Message-ID: <20260114015815.1565725-5-jim.cromie@gmail.com>
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
index 4ac18c0a1d95..e76ccd987704 100644
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

