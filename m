Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D62F3632
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355971; cv=none; b=UG6xR6vum/uOVQ/OToav8BZ0KPdm+TSKmMAeZIhBcZctaXb3dleZWn1JZu+GonDImA9HVgGCCJcSWOZoyXhms9nuZYXKS/slluGifVKD+uadidlkN4ts1Qp5rZKfzuoS7Lk3S0rAHNisLEN3/m1h04X2EGVUoK3bBF+o05N6lZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355971; c=relaxed/simple;
	bh=a7QzjZykrf+nhpVu0FMe0jqhJkw6SImZcec8zbEQ0hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfHHvDU+uAn7lEwDrgYoqRYsSVrSXxeMbhhhb5xkjCJM1rBlgqYKvRngMcpgTLU8D1G7yyhRKy8TSsOlkqbhRW3yE/94/R9LGSdjy3SjOSIvz4TmFjkXrshj0M9acDtscddjsBeKixxjmGyPAuqpj+cKyuOLek/6I4OOrN2nIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXR9e8gX; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXR9e8gX"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65f65bf8c70so4868799eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355964; x=1768960764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=OXR9e8gXcY3x1YldMw97J7zXMnH04IszzQ2MvGxvvZsRtgk9rf2oSBYVe16QgFl4Gn
         D0RM7/p5yp2g66mX6YoWJ8EGBHdQEluUpbJTAVrtAq039lWoO2BCKPjCbUEDV336FW3X
         y5VpTQoEr0hsJQASSeiYhEKCngeTLTdf4/HJk5gojYDCleAPSCr5v0Ll1mE50CGJ4hZ7
         QJsBkDlyHjzPSE1Jy8efBNtomC/LPAMiNRanTdQbngDgmg4sS6TVaCDXDIfKRExS5D0e
         eDXQ2pUQnUEtvw9jW+SsMGWo2khJFYsmT01d/W7OvLt7F185Er+pymEOzIdiI4xW9635
         f15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355964; x=1768960764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=ADPhOTlVp7QCnMGYF7m5bhcBuIoxGCIimn+UvYzm3SG8Z26dnTdKyaJ2GICTyu50jN
         5rzW6ZdRSyQT/qA1FP9T2q0qp+0ur1vpNaIb17QUyuUoV6Gwui57q59GUlO6CEteTguU
         nzk3+YQlX5+bDIa2MLPv1LseiQEYyxgTnbTO20zV6tvdEG3VIRLBcSb5tx9V17J78xKG
         cgVBEUX4QV58eRGYlkP3IJ0Uc7JFSzpb9ybsOeEIJ9I9HiPgf0QnLdZGNI6V8tYsAn9/
         3IUEQfxHsbHzKHH1Ii/Vqx2Z1MNJDk+UJ/hMM6D5JAxAQU9v0l4S4UQMG8HSFLBhgJux
         +Kxw==
X-Forwarded-Encrypted: i=1; AJvYcCVfDxSX1xOKU5Dhujh77lRyEy1PWHxg7uvcJ/DlW7phjY5PFnH4+PCd9W+M11nSixHNaLucKlj3xyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Uj1BrHIUGp2RGYoz3Wyr/MLahnIk5kNO1gClpcSKciGoA8cn
	oJv5iEFkEzZd/Iho8yxe4kUJ1ktb9ylA943hCgQRePj9VV3OKiaD0KkI
X-Gm-Gg: AY/fxX6Z6o1hpszira2+ELt/L47NCBdzSQGCkWcyMTK9AAtJbof+BjXO2KwgZJGAzrR
	thafL6JMzN318Xa2LGPh0FB7eRLYkJTqKeKhaj3mKGZLbbOT7HwzGR2DoswUhK+h9ody+qW/uUh
	eWVmqF6RAi9Pr9em7KOXoU7MjBJIqKBMOFcZ1tBm/7EtoAnBJ5DWJmQDvEHCe1mkmhT0KszIwF7
	5S59HWCLc7qa9JSuj9svagAghEA5vLoL6FVGaR9fsjWuykpOY8fsSy5/r6oAPjeBYU+hoDnA2c1
	lo9vCgez/0udTlCAer1w8oCEThiRcCPRwdlvZlpms8/PRlP8wvEytD6yY1MWlu4NMC1SYGhniSz
	om1NTdp9k+vu9/AqGFx6swAO2K4E1GYt0Go5Hl/d46lCZaJ9gc7MPCeAS4X8OKZ1sD4LGhYbRK8
	Pvx6jeqaJaRL1qe8VA1YPgzLFyFfAtWGdUB21X
X-Received: by 2002:a05:6820:430e:b0:65d:4d4:e7c4 with SMTP id 006d021491bc7-661006d3539mr639488eaf.38.1768355963839;
        Tue, 13 Jan 2026 17:59:23 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-65f48ccf24esm9067492eaf.14.2026.01.13.17.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:23 -0800 (PST)
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
Subject: [PATCH v8 10/31] dyndbg: reduce verbose/debug clutter
Date: Tue, 13 Jan 2026 18:57:26 -0700
Message-ID: <20260114015815.1565725-11-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 21c1db7e8705..1db2f627237a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -275,9 +275,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -510,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -524,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -540,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -550,7 +545,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -568,10 +563,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1245,11 +1237,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.52.0

