Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23831ED7D
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408188; cv=none; b=WDxWKFBnTKQksig/28QtvA73Lw3865GNn6dmbWmhZMXRaWIkkXGeQihnZlUzp/rvDut+8h6bObgyGSurQEs1NFDFB0KKVFPK+OsMQSDr7HZbS/ki10Vjeg/C5yLVXYlP2TeYn0ufTuc6J7zesJ7PRsTLiqdUYpOYNN/Q2uH25Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408188; c=relaxed/simple;
	bh=E1VF4T7M7c35q9Qypwa46ANAajyN9sx88/WRdouByGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJL/HW7i5+ZXlXEP2pt4DYq0EyJZiTvg81JozH65ZlQEXLsqcK7ccf2l5iXfpakh48t2EeJhFYNn/jUVo//h+yrzimOrwPPoyoRn4zuzSsa6L+BmlmEqvTkCfrAInUuRhlut9Ju6AZviGQClfFw/rJLY7gf76c4/NI1VlUCQDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCS2F5jr; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCS2F5jr"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-46704177508so1464974b6e.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408186; x=1774012986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=cCS2F5jrWy3+pT9/v3IFHHzZRS4ryUIg2i5U9DlQ3jvYgExUV+hhfaSNFOwja33kyt
         tDbbvGXw9k7Ax8T9XzYUNYpjvSVOwi83ch0X/idihNFsJoB7oyPXgXxBSDlO2ghS15S1
         Q06mKVbT/q1WoKwM9js3bl+m+OyPSsV4L8qxzkw/af1srfOm3uX3Xo0WQQ7OBTh1rq5M
         /SNbhXVHtjENZQDlx4cb52hYayqCMblD3RnVsiHeBwEmrZ1hUyyUTV6JsfcDu4kPB7eG
         iMXPf+rs/1kDiKN1SpsaIQuPtComD4Y7vOKKGWDhgCLFjuORGnktQ1ew7Tp/i9vrZ4nL
         m01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408186; x=1774012986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=KC4Yi2Qb6OO08WnyBHxNHC+ZDeR2aFxeZbQKoSDeW1dpKR7yP4JNu1nh2SqDoKzr0h
         IPTNPt4F+cd4Utk2WyXIKl5aKMriPedM50SbG1SAVUKQt1wGBS7Q5F8Lejy5OLssMmHZ
         YG2dMiEeL1SFyCG0RXBL3bwCdAUaqwPviLzTzh+mSNVcYKk5TmYwZwgteVU113EVPGNE
         Ud4ve0oa84lNLZCKlH3CJnajpCpkS3uC/M59lASzoceMPag1LMJG7ZBiD2jJDjlfImeX
         VL2mY3A/LxtHWmvaQJf1c5b7Yk1mqwC6J/DxQe5bnr4ZpQrrdcwkBQQyPEkKdxZEUd/T
         rhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHbtobzAkghAz6dAGrqi7XJxiVTWbS+3bvDLq5UNRrXx/BBW6WBkk3LgjRc9NNMDPGSp3bfyQImTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0aTTK1V/IvjppXDQOLTaP4+9LBOEV12xvsAlBDow2JizBewG
	X8UNgdiwtdU2+35iSDwhPpVaIaHR90OjpdsqdVVAu8CV8OwrNnUwIJog
X-Gm-Gg: ATEYQzwxteZcU3S/P7JelP62xYgFv8tV9HUWR4l0hnhcBuTGTCTWNXUhCmHsPwlzlCp
	g1uIJXMkCKv4+3EZFpkvdbK3EbhwIq1g5xx2HT/GP4VWHpzFeOHFCxq2sIkEOFk9hxb00/FBE4p
	A+tBxyEQAKk19cpNTn2C37vZentH2BPUXF3PSNb+uWM/eRi+oVNDGa1HUTf4Xyo4assNWGmpqHv
	FmswkPD1B2r2FMKmnlWsOaou1hpIZd8aF41CBW4OmlUTL6tMol5Z1kf27RvllIraX6NZT9X8B4J
	67YdgrQZCGksbYF19L0ekKI7k/Jj+x0mxh059NYJ4ZVpUbfCRjAcZhc8bmftn3MVno28Aec6L/D
	1d/lR82y7jZv7L786EA+tgwZg2jAg+/d1zjeHpKKRYCNrAxS2Wy65JAtEodbksA/TEXfQ8VECU5
	nMVDIVjDRq/DJecN4S4z+WKOWxJ4nogdYYXVRSiuqrpgXpAZfQ
X-Received: by 2002:a05:6808:15a2:b0:467:1e5:6766 with SMTP id 5614622812f47-4675766748fmr1758674b6e.45.1773408185885;
        Fri, 13 Mar 2026 06:23:05 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 05/65] docs/dyndbg: explain flags parse 1st
Date: Fri, 13 Mar 2026 07:19:30 -0600
Message-ID: <20260313132103.2529746-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
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

