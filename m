Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02434EF0E
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010480; cv=none; b=POq2CAFeMasSTYT+RScsMQiCEeaT00A10OhJKFL0xlcXUkG3H8sA0nTBMgwOtl7skeIEG7t62l5jm3E+5V9wh6HH9jwrmMH+W513ZMrXem8KHpXLFLG6zWmDhizs7DkDzVKIC2T5NhAdw7C0Q0WyCOPtZamutg9AiQoxe8/Eu/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010480; c=relaxed/simple;
	bh=rOK0DI4WBj/yprGM5lB4e5699JqPcU+lt1tA7vpH4gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIoPGhVVmVGEnpBVMJQmyH3c5G9QO1Xwemx2UHn5mG5vr+zT241ZJuFUIuKWK/xudY1IipTUEkKFmcoALHlr3ZiJd7VkAa8NyDpmpXm8OJtyNTxsmhi2i5SrtMGaIevICzk1hS/JxHKfM1eCLjlOQILvTbILqMwxeN1NG1JIPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU8R2hi5; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU8R2hi5"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4896ae35be9so907755b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010476; x=1783615276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8fTbja1t6IaR2B1RPD8t4oUf19W7cXH/RnkuoJsAkA=;
        b=oU8R2hi51BcjWc1vV/mg5+GHZUtcJEGkfkB5OTFIEXEoVtJ+HA96VftA5I162ce+JQ
         8Vr/ycS4mIDZCIhz5bfY6g4IWyxGJlVNGvoS3fA7KlOmz86wu4uPCjbic4BhA/A3Wsui
         SomEDXSYtFQWnPMzfQRpWLhKEjy/5hXvU0g0cPziq41QMpB/pCnCB4ZSk4mFbNPsO9FM
         6YdMtr5Tk6BjNG8IAIZQcMCH+OOzUXH2Cat2+W54zKFZMOOf+00wVovH3LTDaZqDpXVF
         kW+v1wvLQeHXrYdBCidKSsHRhb7+7by8rL6FXHfJ5lAhI/ZqFcTn/bQnsPp/QK35HUVn
         RFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010476; x=1783615276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P8fTbja1t6IaR2B1RPD8t4oUf19W7cXH/RnkuoJsAkA=;
        b=a9NXiQcfB36bS3x4clcBv+tk84+6PuSb1wqjuZWbuXlZipA8l1RJAZ5ChRi8G2U8Cl
         5GpkXJwObZ7PMRxoksJSVbyd/0oAI207wje4Z/qnCt74F/X1XXTDUebSBS/AstBLn6Vk
         WuPF76jeQ++PSZHHvQ4sPWFeDtsPgAK+75a9JLOCn28AbBlRDO7LMfGHc+m0iUpeleob
         WR/uDaS7oObkccHUToG230/LOkkdhLyQwFRe97Biy3l+/dy/nRvFCuxtHfA9JnVed2cW
         K//YLqZQQQZxOj2OoTTTCytt++oQTSUVJxefAYvYwthDwLHb9nnMCJRpfvDv2h/ni10u
         c+6A==
X-Forwarded-Encrypted: i=1; AFNElJ8lxmb4zqPUIXMxgSd3faNNXSfa2tXgO+yn+h2t0rs3pisF5nyTPYqv6TcqPM2UbW6gWD7rnJ9aPEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nTW7wpXRCWu0Jws+ZJfqCwxKV49eWPkCAzPgS0k43/ZuZvhq
	R/o129JapqOnwLrrUz/KDkVEwa6QXE3+DT+gwKky1BsEuFWGV76fy6er
X-Gm-Gg: AfdE7cm3wxLmatWZuezFHyvu4XD+Lw4W6COdffdW8b7YzffngQOqesfgmeoq3ttHH5/
	KgNnRAF1lSeoAPJjle/Cc839G7cjG+OrHIZr9r+Sgd903zpKJwjzBHtl72DciQ6OMCQ2PeR3Afz
	+ELTXwliVKg8EvAcs3vgtqQEwm6h4d85CVyGqC2U+ZIX6/MrfP8/0LT7oBhUTXhDeu0LJU5zCr6
	mlC7VhObBDm4oozSjkGaKuQDdjABRMYNVc4xQsTFahWizshjPNn/oASH10viRLiyw4HOO/Ads3F
	p9kqzwB1oDgGSmDyJ2XCsdvrk2EcUxVw7+xsdhtwjdthL63UeOkXrn670iy7Ydm9tRa5za6W+ww
	NlrtYVD5uKpzMI49/FAB7JZH6vKBZJvu8q4z07/BqkfR7MMm0KRkwumiRgC4GmPCTq3zaqZEy2a
	rMYYqi1jT2G002MU1jUleXWWfMxfqROLy8y4/DKERzhVC4IEMI+8U=
X-Received: by 2002:a05:6808:191a:b0:494:984b:39d8 with SMTP id 5614622812f47-4960f10eff7mr4621385b6e.41.1783010476167;
        Thu, 02 Jul 2026 09:41:16 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:40:53 -0600
Subject: [PATCH v5 01/18] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-1-24f22b052bf2@gmail.com>
References: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
In-Reply-To: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=4529;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=rOK0DI4WBj/yprGM5lB4e5699JqPcU+lt1tA7vpH4gw=;
 b=4cq4LpmAWnIaECSyT0/8uVstFNieJpKyOUKVxbCp9RndYjBkK/Iz3OMfFaJU6r+qS84FiJqql
 JfQTr/W2CpQAIbleE3d3FC2GTjWzX+0o+dTr8CGNSfncjIR6GvSm0gT
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ddebug_change() is a big (~100 lines) function with a nested for loop.

The outer loop walks the per-module ddebug_tables list, and does
module stuff: it filters on a query's "module FOO*" and "class BAR",
failures here skip the entire inner loop.

The inner loop (60 lines) scans a module's descriptors.  It starts
with a long block of filters on function, line, format, and the
validated "BAR" class (or the legacy/_DPRINTK_CLASS_DFLT).

These filters "continue" past pr_debugs that don't match the query
criteria, before it falls through the code below that counts matches,
then adjusts the flags and static-keys.  This is unnecessarily hard to
think about.

So move the per-descriptor filter-block into a boolean function:
ddebug_match_desc(desc), and change each "continue" to "return false".
This puts a clear interface in place, so any future changes are either
inside, outside, or across this interface.

also fix checkpatch complaints about spaces and braces.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v5: check for null format in callsite. shouldnt happen, but pr_debug() isnt illegal
---
 lib/dynamic_debug.c | 87 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 18a71a9108d3..577a07916072 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -172,6 +172,56 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
+static bool ddebug_match_desc(const struct ddebug_query *query,
+			      struct _ddebug *dp,
+			      int valid_class)
+{
+	/* match site against query-class */
+	if (dp->class_id != valid_class)
+		return false;
+
+	/* match against the source filename */
+	if (query->filename &&
+	    !match_wildcard(query->filename, dp->filename) &&
+	    !match_wildcard(query->filename,
+			    kbasename(dp->filename)) &&
+	    !match_wildcard(query->filename,
+			    trim_prefix(dp->filename)))
+		return false;
+
+	/* match against the function */
+	if (query->function &&
+	    !match_wildcard(query->function, dp->function))
+		return false;
+
+	/* match against the format */
+	if (query->format) {
+		if (!dp->format) {
+			pr_info("encountered a NULL format\n");
+			return false;
+		}
+		if (*query->format == '^') {
+			char *p;
+			/* anchored search. match must be at beginning */
+			p = strstr(dp->format, query->format + 1);
+			if (p != dp->format)
+				return false;
+		} else if (!strstr(dp->format, query->format)) {
+			return false;
+		}
+	}
+
+	/* match against the line number range */
+	if (query->first_lineno &&
+	    dp->lineno < query->first_lineno)
+		return false;
+	if (query->last_lineno &&
+	    dp->lineno > query->last_lineno)
+		return false;
+
+	return true;
+}
+
 static int ddebug_change(const struct ddebug_query *query,
 			 struct flag_settings *modifiers)
 {
@@ -204,42 +254,7 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
-			/* match against the source filename */
-			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
-			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
-			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
-				continue;
-
-			/* match against the function */
-			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
-				continue;
-
-			/* match against the format */
-			if (query->format) {
-				if (*query->format == '^') {
-					char *p;
-					/* anchored search. match must be at beginning */
-					p = strstr(dp->format, query->format+1);
-					if (p != dp->format)
-						continue;
-				} else if (!strstr(dp->format, query->format))
-					continue;
-			}
-
-			/* match against the line number range */
-			if (query->first_lineno &&
-			    dp->lineno < query->first_lineno)
-				continue;
-			if (query->last_lineno &&
-			    dp->lineno > query->last_lineno)
+			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
 
 			nfound++;

-- 
2.54.0

