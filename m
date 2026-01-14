Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420363064AA
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356029; cv=none; b=DkiV5SbZYg0ScT7vmRMr4OgXRijXmPFMws5pXtu7KxbFCB3CLb42r3nOMWWNTz94P0hHYALShDx1O8g6QE4hI76r8F4hBhxjim9TtL2GodfI46243YQkQtez3xS0c5FJlv3T7OAeUtdZ4FxL1y+CnQuksCUG1UyCuhLCb4jjaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356029; c=relaxed/simple;
	bh=9ih6W8Y/5V2V98AP03k684uMSvrAzs/VQOAmnnbAdf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUul4ccjJ4GiJYEVlgrCBta0A9B9792T/FierNWgAKPIrjRFx8tD2nG/VDasCLAcDvQBzYsFnCJze4DZylVSghIFEepjT2fSg3qFU0SZ9YBC/1qN5bGRYQHEj0V//J8JytbXMt1Hq/fhH/Ub3PS8dlcQ/RqoCCTeWemntG2bR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCdsd1t1; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCdsd1t1"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c75a5cb752so6116059a34.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356027; x=1768960827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=aCdsd1t1bpjo9kktuakmkzMMneXG6iL0Zx/ZOSfFoQvfNwu5vjgkk7A2rX6Uz6laXO
         dQb7+CNRwtYJZEgqIyEQhXMKvaUE16uHMNaurej8Eoi6qLuuoCkKpXHbcwYw/K4NGp4N
         zreIne/rUJ3ImpHWh/CHMpdjXDIgKYVbkB+VQqKnS2UWmfjvYbp/6W9HMwWokez4gUuP
         1PSLd1nZzHCZ2OdgNnJvjzmUBKZmYnPnZnXjpDNt4oO7DNkZO1L9XAzxg2VXkaO0W75H
         6Ti4wn+6n6k/FC/osMNZXi3L2NazYT3KU2OCJGmQasQMZnuipzJ9gK18a7O0CG43Wn6i
         fTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356027; x=1768960827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=aYWaz60c6/UwwXIfJ8PlFzAEri2VHwrTkPToKlKII9G4trwBo+R7AYZvRFS1SAQD2A
         2YFZzcFgbfwYvMlWC9DjPMVRwlwCKEoyFZcu3MWIV4fqxW6gblpHenuUCzinTJ5DURo5
         DOLWoyz94z86ssPlpPVATVrpRz7P1DemUiLdZJ17Ou9XgPMKU/JTTd/k6Yqlo55OGL4J
         58JJtxgfYcw1efLkIKAgi+ApALI3cAuHWvEoH/oSMzgGTUHETkFjsJKspl/tDM8Nv+Pe
         lAjFTv/eSYdVJjEkly9vub5TdRIbNqCnHch7uwMBDcH41jVrxXFarX9VazE7hL2/wOIU
         hatg==
X-Forwarded-Encrypted: i=1; AJvYcCXxx/DiHH6wpIJ2kXySek4coU+4yVHhEtuMJZBBSLhc5i6zf+R1ENeJX5VKeOVr5d+ydnVKHfszIsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZD/wDKzTM7nOGUBNhWFivEs16PUh6rqKKAbiB88YRPoxNlgen
	OMtu2irRvkQcBwA8vWUHqVBW6n3ulTaiGWzF12Dmtkd4NM6dAL1k87DF
X-Gm-Gg: AY/fxX4OTT8GyyYzV8A0PJ5jiA/WKp4xgNtsKGKtwiTUwyG8niIKe8pju7pcpofJkF1
	77hG+WLAiq85JUKm6SJTnaI1BL3LMArDFth/9glPmCHD3NGl/UFM8yhdYthUaRhb683UturQT90
	tD38+c079+sF5L7J7vuY/mESMU0zA/OktP9x1JFqmswXKhTZwjmlsAavTF1wrKUbLuC8QBSZ4xt
	GneXytVeNkkubpCrTujEtZuSKmqnZsdwxtYLaDpoV5NVCnBIyTlarzgCV/N0FLA+w7uo6Wy/Y7C
	vhyaNKzkivW9pys6u1LGLFDdyPohRIH/cGHeizfbK/3trkqbAbCH8X9QhN7e82fdRihXQ/Q0Isv
	8AHQm89knHyHYfEbQG5EwPrW49o7zWwLqdOEMLnLno/7Z9Ti2ejHxE7Ev1zDU/7Oi/X61dvphav
	6Soqc+YU/EGFiGycq87LhmYI4kM7Uh7KAaQ84u
X-Received: by 2002:a05:6830:4c8b:b0:7b2:aba7:f4e with SMTP id 46e09a7af769-7cfc8a99a10mr780858a34.10.1768356026972;
        Tue, 13 Jan 2026 18:00:26 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478ee668sm17747037a34.29.2026.01.13.18.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:26 -0800 (PST)
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
Subject: [PATCH v8 26/31] dyndbg: treat comma as a token separator
Date: Tue, 13 Jan 2026 18:57:42 -0700
Message-ID: <20260114015815.1565725-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e76ccd987704..350d93834e19 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1da2de7b1769..5ac7248d51bb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -320,6 +320,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -333,8 +341,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -350,7 +358,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -622,7 +630,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.52.0

