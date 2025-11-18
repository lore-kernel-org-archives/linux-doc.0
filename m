Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B92FFF91
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497148; cv=none; b=lcd1XOiTBiAaXRbXfxTD8yfrBVBTt/NSH5BPpawkRAac0dwC9LVhXGmMrDBznu6deLqov8Hk9Ww3N7dSq73aGvQVUY+43ScST56nNj6FFHBKTPeDPm00D1yaxlJOVTybvJuuB5oTISdeUHk70of4C15sbMSEidW75R7wvOaYuVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497148; c=relaxed/simple;
	bh=YiavUBFlby9+q7R3jVOye6yVNiX9SzeQZ+DB+RZTe/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1ipMZDZTfpdj9cSCCLSYv3yku3vzwnK9jBi9fnIoqCMSNVdt5o/X0md/7Fa4nPTwh9C7Acs8OsmbehasgMZ1RW8oJ0JQlf7/kvbnzHlxaox3h2MwtyLsWj3xSpEqxb8owF+EgeWlzHuLyp8DbVBjFqe4B4poGzMrfI1YmU4CT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKW4jfDa; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKW4jfDa"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-88703c873d5so216686139f.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763497145; x=1764101945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLlQvuuD9MiSXKGka7d4IYEwieMdPmkGOdzcDHTOiMk=;
        b=iKW4jfDaJowZKfuyuNxHJ4us1Cwfy+9jnmit3sOgYDqRdlKlILwGQNBmgy7vJDLEd/
         y/Id8FL8VtuBvth+7BpyXX9vaNms4+xPRG2ubFFA34bdiYyWYt/v79bMAqGEau3172NU
         1TpAhpJjc7Kxl0u/5PJk1VQLH9dUPrr/FH3FAVllw4V5YIugHXjJ5/zWmUKDC8hnDJyQ
         zWtAfDOtn+zsjU2zNej1mFNqb1TZcDpCXN35MjECtJqyT1Xma+xzvENkQU1Ur39tDbZL
         tLtzywLnxHF+O3hoyhmU2fVcW7v6nX5Lev+hC6mr+tqtNnE4+bIZJmXnM64hq42qpHqj
         GnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497145; x=1764101945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLlQvuuD9MiSXKGka7d4IYEwieMdPmkGOdzcDHTOiMk=;
        b=o+2eW8XYRUSd3N3eWaWBiH/CPEv828/MyCxS9Yunpue3gVHnpAM7aglMYwsNq1MOaZ
         Ysge0XWM6wU/ErKNWE4Lsz+k9EhVb3MhEhhVj2A6+Tlu0AGStyH+PUGqmnWWn3tvu2ng
         aPG6RLPTNLhiK4s6okjkLgydSmw0HKfI6IaGSNt7y5QDolKwSpzKeXf1x9XsdrDi0wRH
         qo6lz3oyxX6yNCsp8yZRdoG83lLTphD0wnRuAjEUQRug/5fwGEOAeh5NRQbbp+iFy9gz
         o93WoworsTdZE6fOJP0E++Zti+TjWJLljoT4G78vhiZwB+qWCEmrbyo1sW/g5qmt/3+B
         TS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbt0l/4uYszV0i4sgSvpRiYf0SxlEuMf1EcrSZ2EEhSipbUOzptQiwzT5H4CMePCvPF3otJtQp/ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEyzHZK4RyNjRYq7gW3yNqZKcOFQvGkIc43kGJ/V6ik3n1vQub
	N7x2Lmrd9Kh6n1vg46t5rQA9tbKLUxJvs3Fq35P9PSZGf4WUqaWlZnRr
X-Gm-Gg: ASbGncsVFziPbji+oUZMqqVdmo0efrvZVBqJGQBQ86IjHO5tChbiYbINnae4Kls61VL
	i72uAG/4AyoH/sr1EZdybuzH7nXnd80PrwzvwKI9EEV3oa8qeY817gpAq9MKBMtx+XGnm9Is6ac
	sChoZqrnqYi4bPPw/V7oEirCUpz/IHqfFOI/xM56TSVdMER9utPRnSVicz97/VJhK0clyr4WZ7+
	kW8kebAnBVGhi6uKBrewHp/hNNiIJdAqtNFkEfxWVmrdWv4rtnulUvlaK0HfUheeCyimJdG6QYy
	mG+4C509smpgp1cavy+nqzSaJ+/1NasCzSelp2qhZPrcqlt+2SAop39dkgl/gcr9AW2apxQhTE7
	/hAWR0/eptYB2xWBBxI3IbA+ICXKNI1OwBHRVt8zm0lVYBUgnYWLNoPAqkbnWcPcJAtwJy40U3Z
	Es94LHt3+034H9XYCmavHn65DfKfgWebVXku1h2SaroISJHMOxZH/ROeQCeZzfmMLm5+4=
X-Google-Smtp-Source: AGHT+IEIscdoyaRBlf+VL0JUqG2kMnrPA8EkFzQ/Jz5eax8vm0Cs6+BH6q+0DbWPfuhn3YzO7H5xxQ==
X-Received: by 2002:a05:6602:1587:b0:92f:20b8:7e22 with SMTP id ca18e2360f4ac-948e0de1a6bmr2212655939f.18.1763497144913;
        Tue, 18 Nov 2025 12:19:04 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 12:19:04 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	jbaron@akamai.com
Cc: ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 04/31] docs/dyndbg: explain flags parse 1st
Date: Tue, 18 Nov 2025 13:18:14 -0700
Message-ID: <20251118201842.1447666-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..63a511f2337b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
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
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.51.1

