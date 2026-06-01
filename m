Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803DD38D41F
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315536; cv=none; b=suf1VsZgh3pMVeK/Q0GfQSl+N3Rg3pVRptJmzLqsV/z0SfuI9r9zFMlPfj9U/FIxmuPELENqUaBuIJ+aJepO0bL6BirW6Fgl1Yzk2mdUaZojB+lSjOrK3ddgVSHfrUDvc7BkCqq+PT2M5ZnfKZwzKFoQmqQyJrEOHQEfKi67E7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315536; c=relaxed/simple;
	bh=DidtLQdtySXkRLzEbeRMwRKF7/hq+UTu6iYkRqLCz0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8SATqbEGTkgCh1Vkd5ngME6YPzA/dQt5X7vQhLcH4kGSXZlSroLD0d90NVxMotlhjOuH3u4MW+FIxWuj/BItXXWhsGTPOoV+yh+cm7xE9YLzfbi2QIHmSKrFGFqG67qy/QZYvMyHJr8Xr2vAM7oFwYw1vPNRhjNKjGsEyx6Hlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLcC2WSV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLcC2WSV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490aaa51683so5716785e9.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315532; x=1780920332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2M5oRZ/p2EuYw6GIpW+wKMVVLqveBuY5+15T3rurn0=;
        b=nLcC2WSV+ujaOeeXwgzhy39iC1s1graeI/WuxkQ5gxAZcs8yEOe1K2ZwxvlHS88e4p
         05BW2T2XCnOEJNIpn6J8AxqYc9vIU5rknIBwK3NaJVlLW19WTrZ88EMwev0QhWlAJVXf
         PMcRXAqpMUgKHnCwWKUQ33r/i/CwVtlsTLEdzsnqnnac4YN1nn0ozUOgc0NjLKoSYKE/
         pVFh2MmOT9AtvTHtb7L+TwRAVwbnGdFSHtdHgvM5GI1lejz2yRO/pLsLQWRvWcHjkgF0
         n9zQ/9Q5JCVYqKP5RD+8lG14x/BgoXROuVIOFy81N7jO4KaVtiW8v4ljqlIohw8q2zgk
         mxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315532; x=1780920332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2M5oRZ/p2EuYw6GIpW+wKMVVLqveBuY5+15T3rurn0=;
        b=DgvfTO7EC66q6n4LF7CT5GHH49s3S1kB0tMc6aAIzhRee11Y8dhSMzR1INen4A6Io7
         Rl1vkB8w9njm1YLWFiI6v3D+G5FldcACzc56s4sIDRBTMC5kRcwA6QHPf16VxB+KlNY0
         O1U9ZTKVZgS63h4n29Wu6DEkO5+kQvpDg7CKJXom9lS7j/yfytygCO3QUWkGK5WMwDYJ
         MMGGtWD4S96hLKfXvUlmTgHBAO7no5cEgy/0AN23yOdT3o/sNiky7WkSok5vhsZRUZ1d
         or5scdMNXSaf5rI4gfaTq8F9DiZaKXQEI63piGT9bKN3p7vb+rwVJfEObE2ibounin8o
         GfzQ==
X-Gm-Message-State: AOJu0YzWHIVZSxTvPLcrqTG5xfrYXGm0jN/Hj0hjQI21K2kjP6DbJuBL
	L4J9MDFP/IuuQuF8x8WOfll4ODSk+tq/Jv5AZQRJiRFQnDNBn3ImaRkR
X-Gm-Gg: Acq92OH8u7q+FEKZHbDJW7RVJs1sFoVP6x0wE5Q1S8mmauIqlZtKpB6jIc0i5OEfwm+
	Tsm3eYN5hn1DNts/fC5SPlu6xui+aCrrA7sNlBXZyhBJ9eNUHEC7svUKBjlJd/OODZvPv8oRg+L
	7xVA2NDIaCO0N6RBzFWpSs8XJCEtXXhRE7vyCGoZl40o6s+LPQcCB5NiL1ToK/yvLh3JSa2zzN9
	XdPotTEyp/5jjXxFNCbkBgBUKdAJDekQ/WzcEO9IUvKidINz1U3KJnqIloDTFcA/SW1mRmHHeom
	R7uVqFpOBAhdmX2sjXbfr+8z0JVg/O0g6hymuzqFJCQabLuOF3n4/5yK3+ZbAAi+Yn2PdK3bMYL
	ihnz+psw5vFGEsFMR4+6hpq/F34fkksHWLC8lItWqMTHYPtdQJNdSn5ErFB+a32IMtgZqN70urW
	SB9vMFpvFAfORrPOGeRs82OZQf3g09kpK2PUsDFZ+TBA==
X-Received: by 2002:a05:600c:190e:b0:490:a9d6:8f2f with SMTP id 5b1f17b1804b1-490af3ace6cmr14372945e9.4.1780315531775;
        Mon, 01 Jun 2026 05:05:31 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:59 +0000
Subject: [PATCH v3 13/24] dyndbg: reduce verbose/debug clutter
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-13-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=4140;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=DidtLQdtySXkRLzEbeRMwRKF7/hq+UTu6iYkRqLCz0k=;
 b=YYxJCdy3bIfqzVtI7FPcxytUyCArgoEmIQX5xynIfWnMP6R26XQ00vt4jmSbcsr2kARUaWXJ8
 I8YccdeO8g2C/E7Kz7Hlr44VpQYzxfYPEdiewhboS7gJR892v3FDMlw
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

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

 dyndbg: query 0: "class DRM_UT_CORE +p"
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 maskp=0xffffffff
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also drop several verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2:

RvB after SoB

trivial change to verbose-debug output line to output the actual
"module" keyword rather than "mod:", and do so only when the module is
constrained by the callchain (ie as part of a modprobe).

 was:   query X: "(keyword value)* [+-=]flags" mod:*
 now:   query X: "(keyword value)* [+-=]flags"
   or   query X: module FOO "keyword value)* [+-=]flags"

IOW, adjust output to reflect the input grammar more closely.

drop-info-parsed

vinfo-applied-nomatch
---
 lib/dynamic_debug.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0377d9f8dcd1..bacb55f960fa 100644
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
 
@@ -487,7 +484,6 @@ static int ddebug_parse_query(char *words[], int nwords,
 		 */
 		query->module = modname;
 
-	vpr_info_dq(query, "parsed");
 	return 0;
 }
 
@@ -511,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -525,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -541,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -593,7 +587,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		vpr_info("query %d: \"%s\" mod:%s\n", i, query, modname ?: "*");
+		vpr_info("query %d: %s%s \"%s\"\n", i,
+			 modname ? "module " : "", modname ?: "", query);
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -1159,11 +1154,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
 
 	dt = kzalloc_obj(*dt);
 	if (dt == NULL) {

-- 
2.54.0

