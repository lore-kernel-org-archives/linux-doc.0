Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E562F3624
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355930; cv=none; b=kQNhct17j9M0atyIterS9i0AR9TxByppjpiMMjpr2B2UlhY9b0bp/ABaXdKsTKIzsFT5g8//N8sDY1fzuJXKc8QK99ycNDM8l+zNoBdcybIH4j/PUcntBZvamBeyjf3Mu/YGpRujGrYZGRs0pNh1/v+0zlkXHBccQOKXn9KjT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355930; c=relaxed/simple;
	bh=J1eDk9ZVPw8FZKq7NBfxm7axQ7Jd97Z9A2H46UDDwHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9o8oOsxHZ21kPLO7yDpFAsvr7Dj39P+dPC1TETWJf8/Hksx3S0jtB11YPdjSUdCtG05jX5BSkblW+BE9uNI905s7jcBedTcElWNOrKkigDtir0ByFoUWF6CkjALlNSN5YZqg8QbjaeDbcYK7MbVkhgzkXBxMm1mS7C7bt0upJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzkkMq6D; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzkkMq6D"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7cfcbf34124so67813a34.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355928; x=1768960728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=NzkkMq6DKrxBwdDJbQF0KXJ/Bv6fpmu9qaNiJSRckfj+g7zGirqdj65Wyqo9MjA+ZG
         PEje0Z8fjUh2ZO4fC70tmut7UC1vGuJhQnsSuNLbm0reuG6OWE7SWLQv9CB/SGSaqooU
         yX2N7emaRSj5MDc+pkaJBR6RYmE8vRCm+LHfWUDkUGTyiFksdAfcQClSTX/quofom7UY
         zdDKP7aRztU1VgncBlciIRrnvpe48F1+i6TDgBypUQT2BRw7MGXgcP2i4a9nrRCyfUou
         k+ONxJ3G2XVRrrwVWHaFJyylxG6+rAHfcUVrtg9HSY7Ct/Hg7cmKhfexeUlE6sodO5tW
         Z++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355928; x=1768960728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=aDJ2s/spoD2uIn+U63Q08ewbSKAb6JmuWywnoVk8EwwUA+px7oQ55XPAGAMybeH6l7
         jq2ONDk/f9EXikMWibwnCV/g//CQRlZqgImLFr2ae4NUtuZ4HAe364qKWozRaRwKF5gg
         ToLAiSl9ZB0I/F2CaSydKRNLHduncTkUC/oXXkaUjzeb/d3gqebnfUNYgzS1Zkus8s0f
         FK5zh9KFpDj13dEvKkwg1/EMdO2e3GyW7nMQgp5PoP5Kcm+wNb74IpyV3MfPsucKGvsi
         jofbu5GzW9MmnZ9NM20z6GWRtW053yiPxi3IBrT7X3P+kwSSBvvxYQC1SI9M9KW8bTlN
         slLw==
X-Forwarded-Encrypted: i=1; AJvYcCUwv/uSX6b4iS0e8N9iy0DyR1S4bzs+bDMkmmnr29KTj6Q0MEF8VZ6hJCPJPijEg9UQjhJMe6V4jaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFgIj5vy7qAEjAlGT6YN+lNBKsxXfgqcXPUVJFWl4kAfwW+/C
	tAteLK7cfzoi9j6/72tbBFF9GReFpMkt2wJJhzi/JNPmQHuLDCXW/cCO
X-Gm-Gg: AY/fxX5KcAec9RuaSFjrIL05b9P37uKHkWdt87NRuZfmRB7uWRBSeW+ajFDi7Vx9x0/
	TzasjZasg3zCSnbQ7BWCSaORzoDm6HWZVvye+2+6/Vnsf917WJQX2zmcIy5JxBpKAmvLodCRsDK
	alVCA73/RbHUfpCDme7KUIcm1jUiTac71V/yuI5oR1UPF2vclOH/Qq7yXpYk8u9GIQYzK0bQM4B
	/EXiilNeXlkFtUIBpfSLT7qa6KBe9MrO2+Xq8eIxYcoWz7Ath4O+NfZsrhD277wKUiudb2V0Kjc
	2sajIdKST+oGiUi2JY7QOmF8VoeFFWcuXuQe3/qAs3/6ZL1Xgcs4TEIAvT1HGhsaFb+OyAtC+DP
	rmQ0nRlfae/KvFCB0PGBUtJ/rOqaDev1ignISrxRU0GCn34mevqBkWpzmszdeH6JzaBH7p+rZMH
	xBGp8Ee5n3taNyxsEUOZPj7xVsQTpj5R28vETv
X-Received: by 2002:a9d:708f:0:b0:7c7:8280:9206 with SMTP id 46e09a7af769-7cfcb6b1274mr339324a34.38.1768355927952;
        Tue, 13 Jan 2026 17:58:47 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce4781c447sm16782299a34.9.2026.01.13.17.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:58:47 -0800 (PST)
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
Subject: [PATCH v8 01/31] dyndbg: factor ddebug_match_desc out from ddebug_change
Date: Tue, 13 Jan 2026 18:57:17 -0700
Message-ID: <20260114015815.1565725-2-jim.cromie@gmail.com>
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
---
 lib/dynamic_debug.c | 83 +++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..eb5146bcfaca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -171,6 +171,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
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
@@ -203,42 +249,7 @@ static int ddebug_change(const struct ddebug_query *query,
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
2.52.0

