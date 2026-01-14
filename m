Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654B30F52B
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356034; cv=none; b=rB/pqJ8M78Flw2iLuCIhvZYRlE7MQvw1xnXwMdjr5kIi9umG+TDpRLiY3MQgV4X2GLk5UC4A7AOr0k47kVP5J1bEh9Z7e7SSUC8Nsnuv9PfsJh41sbPj1BLYvDFYcXipp6RMLa4ipRCWvFsDGvZZwT3p7cFy3D58Is26rlb2/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356034; c=relaxed/simple;
	bh=NiDfgm9IIZPO7vTOaAaoNFPcWN2xiAR0IE0jA7B36/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvXUYiOOWa6WUKPQHdEjpK5ZmWeLi4boMuo1TkOy7ReuQbSo7tw3NlQ4/JfuVSLele8OP5qbSx7QePQ9B5CI3Zx7PSNdL94pdAKYnm32frQIN4fOrAAenUli+y3qjVIJ2IYElS+DFLHEmIpQbiNPneqapUI0Hi2I5aQuAPiZu9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD9aZrc6; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD9aZrc6"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65cf050a5cdso230804eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356032; x=1768960832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=KD9aZrc6LziXFGGc2giGdpGlzQJewqWKn9hpf61nKw0cM+byzX5OLnWsva/aCrVo0q
         ngk8gw6ppxE449l6SGQ9fSOXjw4IaUb2WMSB69RgO1mBL3k062kfY6U5yfhvNzBU4wK/
         c+l4NkVk6XEsL7gXl16IWTegAxMKdPQD3PKekb+iNpnlk+bp6jKPNWgphDlz/tx5ve17
         rLj8PYV1IvIgcdBv+iG9Hip9TYhAW72N2hIy/M+hU/6UaaLUgbdqN+maNGbEUbzq3FsB
         mjBvH4tHLCmNiwl38o70p5IcHWLIDfqtgTuBU/GlPoAiVUOTSvCTl97HSQ5rXvRoFX93
         jY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356032; x=1768960832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=LxnZf5l/jgh6RpKlvHlQ0dUDi7Ofq3a9M0aAvVz/CmsAEKA9GcJo4COf68CZUX+0WD
         reurmT2GZjinr9LpsbJxsasMrY6qwIh8Zik83its5i23w/LqAt4+UgTccfvWi9Oz7Fwf
         dkTaO4urnd0duEb+YjzS1XF3g3hNvwGPkHqB0QRkPOkEPAu1qjLGxRwzaJohHQRhud0G
         JaShbEGEPUGLjBiifUmzYOzwoKlfu9WCyH9gnc2uaEl5F95FBYkj7NEVYSLtr3sBe0Ec
         42t8bd/5lywC+W6mcP7oW0se9/retmtGFbSUKl6TPd0Sok0bnkHnHrSbsFrZpeAP4JNu
         JgKg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0zGtWa00Ri8z8Wu946H9NycCBCu+TRc0zA5+snSszJZiphZD8aOFCO7i+N7XG13MaxwnQZl/AuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLlg4rK52dKBGn5Dokzdr9MVLiJyivMeg59+WxceAcuRS/24B
	8R6/zB6OksxkuRqrrZev0Bw+gnAHS0TUBKEBnFV9+mcTAi1rEp4SL+ii
X-Gm-Gg: AY/fxX54Vb+Ox2HNtjnuBJdfhSCB9iW76LRf83v3uMEmwr82RpSfmTKoZmtLurE+jln
	3AP9TJxsAXEkJJEz2ZnTDlFuOtZRwnEUjZauFUJz6Ad3HU4d53xP9lsBI5uUL8BgnTaGTAbAfRG
	IU5rTIptRlf1RuZnWDylie/bRc2o3RGRijFKFnI6C7ION0YB7VgdQN2Or8Q11bubvUAQVLzBSIS
	n+1X8MGXRm4A+jKcMJz5iXeKlBee70LPGHPZegD1YMfb/MUbauhV2FoqdhDFHWVfWHlbCMRhzjQ
	aTAkJ2P0cPfKNrUgHgwIEyxxlNo99GGHeT9EmsIYDbzNBG3QcQP9qu6u+ajgP8aWDByesou3U12
	cibACDjrvo78oTTWiTyxmpTyEg/D/wPO6Ro4LjyvU6euhwV27YJgh6Lf5sVfnXcyDZFm6RD8DQv
	2aPyJkZNsEDJlB1rIA91r4NruiiCGr2FHpdlAe
X-Received: by 2002:a05:6820:c00e:b0:661:45:9b7f with SMTP id 006d021491bc7-661010be2a1mr505522eaf.39.1768356031942;
        Tue, 13 Jan 2026 18:00:31 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-65f48cb03d4sm9629865eaf.12.2026.01.13.18.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:31 -0800 (PST)
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
Subject: [PATCH v8 27/31] dyndbg: split multi-query strings with %
Date: Tue, 13 Jan 2026 18:57:43 -0700
Message-ID: <20260114015815.1565725-28-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 350d93834e19..89ee15d7ae58 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5ac7248d51bb..c50836c262b4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.52.0

