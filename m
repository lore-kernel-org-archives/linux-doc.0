Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207FB273D8D
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671832; cv=none; b=Wo1DnkFh0ydvHvba/XNJS8jEwW8WEXFHOaU8nRJO8OgAE7N2dsBx1rkH4I9lgNSCXiFwQbnqjFeWS4EkalTz4k4hH3qU7E86cFMXxyl24lMn9jimD210q2MkE3FtBDUpaJtAr6+mQX5xvdCr/8LazZgVZvNlvy8elTQdslJ51Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671832; c=relaxed/simple;
	bh=/lWebHN5luJsInBIQD6JGCuNIKU4/sqawQlzkal/Mmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDfV6GZnmVIpSdePY2jXAYYT+tvOsppUCCLnR0jGgWNaFNkqn8Ox6wJTutp/rogwO/a2DakS3wrMcyvjClvqH5hWOzlpwrH1P364Og6BtWFFFzRN4vqp2Vv85FZ2Us/pormZ4I5RDwYm5UZp+70JCE2xaB6WEEtklrflkPYix1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jql29upJ; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jql29upJ"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4043b27ddeaso345182fac.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671830; x=1770276630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz5zzfg8pcusMEZZp850Dw50TP/sbtgwQCCnRUO1DWo=;
        b=jql29upJy719ox3bOn85RHK8530erKnvIBeLzTF0JY75cp//ssgIox+4wmCj6mIelG
         PgfEBgr5lzewrUW20x2mJ3QLIPUqJbLxRyoW7gXcS8c8vup9BVmm8NJQqwCXnN8suuLe
         UBn2zT8N7iF2x0dTdkkTWFj7AifCsmsTGrRNF4iErJ9pVRLgcpsT04p+O9dnwE3saPMz
         GlKzShK0p0ZHvUszRytFGe2Wl7I4sbbuf81U+GA7ADmLXyIohG41xsHRkJz5tZO+EmWO
         jhHtu8MsWDVPIPCR2UJ7OcSKGIYj5m/UU6dYPXFr++M71kA0rJjc7JYuV/r6uylmrE/v
         Qpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671830; x=1770276630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fz5zzfg8pcusMEZZp850Dw50TP/sbtgwQCCnRUO1DWo=;
        b=cRv/r8dO47hJ+L+LGZSP5hq8Nv3x8kTeDFS1ANbUmdaQp1QUuyYDUlueySnG3z++qY
         H8Amg5P6qwQL0/oMqUa7ISGatk0QEXBxzlrO/6UmSyjnpvN/eeA19ST4XUDyvY4zhVLD
         LEyuANAdPjmIMz+1dKcaBWGUFfMwVXvQc9scglmlvdTkMx9srGc3Yhm1q/9OgqhMF4as
         bKBlMwOvUr5hja0jfsPKkK6ygBKPXql8UAu/iV04Eh8W2J4ivPcw0sHfvN2HT1eBknBP
         SYWzafGwXKf+AsZtRC4tQ96hec30SFZb9S5y1Y2cfG3QZ2KrizHdj1k72O0D2WmsGyRe
         AyNA==
X-Forwarded-Encrypted: i=1; AJvYcCUuIk5MKnub4K0NTi2jXRW+e6aUQOAcQYODttpJ6PHCXMM0eSbYPS/Pl5JL9+9ato+Ppg/rXZuI9xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2A9d9AUDJiS8OITquR/yJweqoXI1cP7aU3PX8+Q/kz3uf/EU5
	C20zIMErsm5UqjNtHPZEG30huZFefJihyJY7AKvf9OgBnFqkw+Q7nqmc
X-Gm-Gg: AZuq6aK3oTYF3auQRqEk8R90KTltzU3wavNbVTqBnUcLHDP0lRhVmcXYLQBbLfMRY5Z
	f7QiqQ/CG5VbQ4uad0fZGMTE08Q8kbuV+ke6Hcmt0NQZIzBc5YXyxFcog9ya8j5AbL3sMduNaRy
	fHBaj4quSEj4Gcm5tU3bIsepdZH8W+9YtGchLaX+tgLffZ8AGflcqy4fqFnH8X7hVCSFo429t98
	XPwzG3JuHDLgQ2PSOomXj/5Wx91EpI0tqNQlp0T6YKuqDz6Ane1XifWYgCTm+gsfETaV/K4XHjy
	i2/imOZFY2lmMhN/IcJNC63SdN/Kw5SIqZPhTE2Ky5aID0alupxDM25Mo3j0XAP2UFC94CjjWtC
	7dfRVDMv3/UJpBD1ly/CSZkAIjUDta/vyc63QWTY2Z3zQ3altAC1IztKgKlpgLjciOWcrJumeXN
	ZWy1EPhR0hKaMKIFYlu4HwWMv54C5cqHFy9ebjHfv1
X-Received: by 2002:a4a:ddd2:0:b0:662:f543:5d3c with SMTP id 006d021491bc7-662f54363a4mr3205655eaf.75.1769671829933;
        Wed, 28 Jan 2026 23:30:29 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-409570f3029sm3417250fac.1.2026.01.28.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:29 -0800 (PST)
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
Subject: [PATCH v9 11/32] dyndbg: reduce verbose/debug clutter
Date: Thu, 29 Jan 2026 00:28:57 -0700
Message-ID: <20260129072932.2190803-12-jim.cromie@gmail.com>
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
index fbe18b1f0b73..b5a3184288b0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -276,9 +276,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -511,7 +508,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -525,7 +521,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -541,7 +536,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -551,7 +546,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -569,10 +564,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
@@ -1246,11 +1238,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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

