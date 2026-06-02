Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88203C554B
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440518; cv=none; b=nFfPJQAGVFPN1C0gq+ljIF34wnDBRSmKSKbJ+x5uG6wge/L2bcKMpABtX3+wh+T5w5odMss89hMhkEAHzNuApmmMZZBxozw7q/LqKqir80mVpgOiCndAiXiRGVl3HbSJN2v0z8GTvcJYBTw9TH00o/oozW5oVCN9E0eIKeMd1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440518; c=relaxed/simple;
	bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SblxAqMs8djZoLpFL0XMUasHa7y+gmZzPZlKAgPhMYb8XtrkuqBZkltwte/Ck3CWOAEoNyVqISxdeE34C052PEZchkPrVFXeJDLhB6IvrGH1R2LMKBALIcWfxADgHUxY5kd6+Iv3QQcuZkCzuIVK4cegBA2yCFBYys+bs+HH430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdm71sAh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdm71sAh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eeba68948so4423383f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440514; x=1781045314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=qdm71sAhQ3ko26Cw5K+WoH0aqzULaWlhIY52ZHndwnQkyWudXIXAm/7/0ZXkZzgABW
         a7hFn1agXWAt/CQZ6wzA4+pbX+iSrU2hCBd0a/LGJK84OpvrTak3KlpjMFkzO/PeBZJS
         mgAXNvxbx0Q0p9B8N5gngzrUXmse2Ih3uPOAY2AkQxIyW6qUc3Wwq9Cb/vFawO5+PHX1
         Lnu37mka0eYKXNUUM4MxLzAuPnMvcolpyL8X4yCjkB8FcsAgAlzF3YjjO5ALpnWF+e0J
         WLxNNSB5Jd9z2Y24+7qXm8TD6kAoy9MkPINGp0htPLW6DW6S31X2yI3Lz4dsz6jen/IQ
         57Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440514; x=1781045314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=qmuBapdvSvj0BE3itIWPGpL04K1fSRFeFOTFXZBHHv2XLQl+6la9HINo0FydJjdpIq
         a4TpkXVKhcHR5nbkmclpomCZFf/aqtsIE/e1wDrCPGGvNX2fZLfSZtIY7kths9mISqUj
         QLkbRQycEQNvQnmxhRqXeX6+/PZf1d5hyCqWgBfuUMo5QKds0GGk6gPmSIMtgQdnJeHi
         9JJ7/nRstAafDNvwPSGl0BOXOBBoRpVUEYdzbY4n35t8VeG/fDlg1Mh6vKVOs5tVW1um
         KtUfFKfYNZz85Q1HMeKGPCisEojD7JHVmMEqGXMecTXHUoC5CiVMyyfig4tPXY9fvxZO
         DG2g==
X-Gm-Message-State: AOJu0YwIkvKxlkxLWiUcu0J7UOUvI2Pz6zalVNHEl3HSimO6u34QqpLc
	G63Nfa8zNp3mvm06nL0m4mKoYzo9hbOKQDVpe42vTcnIl1isf5F8Pb6f
X-Gm-Gg: Acq92OFawo/S1l1mz3k8CHmNGQ6mSRW07rVdsW3kry9TfaTTEMAc1c89CzHPEHz48qH
	Pr1SkAzj7WYfJGyQ3WKuobfLndDPelzmCkCPIvkgFL3PnxOqK1pIFdBEPou1BZHA9NkyV5hyyqG
	DT5/YQtWkGZmQ+pzbtkVLwZ/1ZFuI9APLMCKfyQYIUF9fhua9BgOBCy3qY5E+kT61DD7wrx/qJx
	ODOX+WrlMMRrueZZlNEXiR+k8iTNGYj17pkZsLO1Lkir01mRbm2CKWLac/B7oPLsNgkJ0DWYXUd
	JbqkD3HrKYHpJbBUXIjH2HBhnqxSBYFzn9I5e8c5LclsiGZEQuiPE82AcFfcshKKVaGU8PefVLi
	tz5JU1OzrJtzTxB0Rs9Mnqkn3in60kVE6NLy+xFb9d00MbviQ36k7+WTwnNkZeED8Z538RbIAAt
	8yJLYNtELt2+EoZoLBgkRtLUMAbMHEmP1lW6nQ8j3UoA==
X-Received: by 2002:a5d:624a:0:b0:45e:ce28:666a with SMTP id ffacd0b85a97d-46021781a64mr481587f8f.1.1780440513739;
        Tue, 02 Jun 2026 15:48:33 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:48:05 +0000
Subject: [PATCH v4 08/25] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-8-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=4346;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
 b=5Nnx0wurAISA7XPWvLxIHjr9MiqVPJsdjQtzB3crXplmEx4Fh70GzBvOTm8YTKred1nIS6x5n
 Js4PINvk2WlBIWopr7o4sC+XOKirBZgfd5GHiAFVWak9zlb/tYYXGsy
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
 lib/dynamic_debug.c | 83 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 18a71a9108d3..6b1e983cfedc 100644
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
2.54.0

