Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14138335BC0
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671801; cv=none; b=N7Zrayo3POoxPH+RtAwLkdFsVUNorVXQnG6/WzBvV//cR8v4Xi73c5E4qr5hqTMfk6cT1As3jZtJj2gyG/CI8vcz37Xk9CqIugvmmVPSwPulMD5DRNpYm/Adm693g5TDR+VuZTqYKX1ZSiK2XuYsESPXv3NpP2ZSK/WlcqNYlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671801; c=relaxed/simple;
	bh=GlkWkLBK9bxZRASV1tnxdjyIQDlS2V+z+6wJxSnbbr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpyTTxjY8F1rQUWLWyWiVsJzj/ngf8YQR4PSbfGvGBXLiiFK1FoPjZAsXGpBGExgeROy1H8LUCLEbOdPe/y7axNk8QbET3pHc0HxMENDqCwJeV6OlQ11LlxiDdSkawZlycy/DuF7Pce93mWEy1UyOdV8k+ZisWBr+yVUbQ3M/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mti23T3m; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mti23T3m"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7d18d02af68so392101a34.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671799; x=1770276599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAe388HmnkNAp4EcBQKWgnYHvJWduaYkVqBZMbUczf8=;
        b=mti23T3mz27WHNvp/YpU7x+vYB50tWMnqRqTn/EGTHu+Ju4eVnmQzgArBgEfvbZcF3
         0Ju40Fz/X2z4Cbq/P0t05x3+njSqwfZV3NtR/mEoUTat97Fnws+pu6wNVVJWLMAw0Iuw
         TDBOQ+yJ3s5sMy+OLnMyzL9Iq+/BdlbGJEaUgDv22wHVgXyPKD3KU5nHuI2NITaiuXAs
         ax8YSOkGVEegBvggVMenTu2+MONSs75vKFxC9Xzr2nOX0B8SzyMRig10Oaqe4YACotm8
         LXeRbZAFERm0ShOmuiUibZixoNYpytd0I8vVmXfUMnT0G9+UsU4zet4hMjLtlAbhGn92
         zTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671799; x=1770276599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAe388HmnkNAp4EcBQKWgnYHvJWduaYkVqBZMbUczf8=;
        b=mGRl1H+WKh65+BVSGHeCpbaZuuCVgnYZpLnHUTegTEqRrJ5H3J++D+jCKyBZg7w3Ie
         458QFYww6ryyIorRtD/krg7ybHs/ynabmrPRqo2GNM8hM7UKA3MvPknn7C1SmmaqNabD
         X1PVZIdhGxac+VBO2zloJm17dIOIOTd2ZdOZ9Z+y54edkGifOQBXQIqVkp314+f0sAGw
         G56JUq2f/GcOqZCvpnpxIViQvYWr9qMNbb+jVpc4fk2zyWxU+AXjKGV3887ag0k7g67e
         n75y5RsR/xTUd4ztD1JhjCLfX55l7SvTnxm4GdZRk0d6ND7pS+EwR3RlyEXIdOXvK/NS
         UyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCcVvm5Whsjwj92GSGQ6HZ1TESzl9ibz9krS215mNLgnRBVh51YpHlCQbyyUgrOmx1ouLwtw+VVcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztWdxF6jbGaTc40ZDlGIiBO7tSgThDgc7UnZgvLzcPglWqnqGs
	wFMniFAmE7IXBTExGVHk0bPAH5KaStuYtRnntmiAgZx4Mvlx+auW6VZ7
X-Gm-Gg: AZuq6aJZN0SObKhMNNkMrVk9GCP4ncqZpkAnDIFJpic34+AutVGAI5k1q9/0C49v1Xb
	Kit9Pwj837CMI7VWKqGm7At/W7fh9MT67e9yOGsBSsWmdYN9jyLG3Ca0abZFsZq2rv2OK93fL1V
	/nNbaMVMPrpZoephzNd6eNGA+hdEuGiVCpkyfggBW+2jyh/4ufU/9M2erhI/P4jp6lKx2wnELbn
	jCtgPCxz6CkEkTX43/tBfTcZ++lTavhOr19pV4XMDbtbl7s/l7j7I6zTyNBrRmayogfQIWmVgAE
	UzwnZX8HtwoQwzagvQRTxu0a4BIu9nvjsLSsX0DhHHA+Kah/nL/Hmi/29GotIlizdDljrxRSPDo
	AP+qyQRKZFoFg/pQfVp1QsTdepvX0ke/HlS7BuaasCovfmtaKYLiCIMoFeS+jQrSEiYKUbLH+Vm
	tPKH6Aby6sFfxu5SpmUYHvHWQfzIV8DRtIOiQbUerVNdqj1iYRPq4=
X-Received: by 2002:a05:6830:82d4:b0:7c6:cd24:6392 with SMTP id 46e09a7af769-7d18511dc11mr5341352a34.34.1769671798950;
        Wed, 28 Jan 2026 23:29:58 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c7cf291sm3171016a34.19.2026.01.28.23.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:29:58 -0800 (PST)
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
Subject: [PATCH v9 02/32] dyndbg: factor ddebug_match_desc out from ddebug_change
Date: Thu, 29 Jan 2026 00:28:48 -0700
Message-ID: <20260129072932.2190803-3-jim.cromie@gmail.com>
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
index 7d7892e57a01..e7578507945a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -172,6 +172,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
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
@@ -204,42 +250,7 @@ static int ddebug_change(const struct ddebug_query *query,
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

