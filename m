Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084859220A
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202954; cv=none; b=FcourVeWq7+ur7sAaItWWo+Z/Z5ElOKfg4EKP0l0+0ATGFhy1burFjbiCBPpKa8IyzasTmp8PbGXzJVtCZJ8d8AcykXc/osAY773QRljsMFvXheakeYgxCfQFYBCivhXJcRBSHfAkArdeQIb7DQIsVdE4Eda6NyEqxdwprVqquk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202954; c=relaxed/simple;
	bh=IsDXQ51HtE2Lt8zOvABFQGLczubwVPutni/gf4j8v54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkORrS+m6O67xhvcPHEGdcgywmq9PxSl9aYOr74JQHLeS5qKFz4Pfjs1KzvqvWO9H4R+mTK4lu3ov7AAcz6Vb//DYpHVePwLVHX0uPnqRt8BCsIpwEfTsbjcEHWdZFdMONOsNT9nd+cbmHAOWhpx1s5xl91V5P8OdrWBDIznfnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI3sqNjp; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI3sqNjp"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc20so1002481fac.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202947; x=1790807747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXncrwbb2UVrJg7WTg8/Ke8Z7Op+ef4vNpxgWS01GpY=;
        b=GI3sqNjplEszy1QgBcLLnd0Ax61pgQE5VXRJmRPpSaYpXxVBZSa836AmxUCG6PMxpp
         GnNohYtXHDPziPE9WeUjbwXGk8w8OAplCpuqxaTlSxbk0GbstL25zsUTLCdeeKFCPq5u
         CQJxIwbCbNJIVIgXbkh9DAgN6+qkoO/X2m7dCRJj+hHwn6bjZLUQBETrA9fPb+8OELVN
         0qggxiwkjpCWKV6I9tRyIVzLDX/7GRhBZ45oucpNpdvHGGh3E0ApPjM/VPYIXVpGSAyr
         6c0cJZOSuInBLHTqZqu/b8+bVwyd7EOmL3Wd+OYrJmMRtuqlyxmWlbxvz+dGKCOcFq8q
         ap5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202947; x=1790807747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXncrwbb2UVrJg7WTg8/Ke8Z7Op+ef4vNpxgWS01GpY=;
        b=N7IzVc/+crTJbYBwE2czMC2wm135VHy/aiVyB5GQ8dykzrPninDZ/R/pr/n/Hqo/L7
         H7l8vfjCXSidX1j+Fjo6P0bDnf6b11H5Lwwioq49OWBMUIa+0GskXoUellBZK8jeg9+G
         M1VIzuYs4YlM7HDDaMAAmi5vVhp/c5OSuYlQKevlBqAYYYrkaHVBri1xitsPWFw+DTFK
         kvEVHqODbEckTl4rjxtBS0LR99e/m+Dddn+XG+mKbtH0+CdHUcyhLWk2WMlUlaUbkEHt
         zrRjkhGZ5RscX3099DaTFoUkrWDRXuwUgcFnndJjkQL9NbPzyGUbZbVxiNIwZJFoWweI
         gM3w==
X-Forwarded-Encrypted: i=1; AKwUvBwG5Lvy/00MqWpJPZU8PYYwe5ltD9QJ4JbuJIrccnwKwo/2j+yQkgipppTLpSmp8pX8uDS/s37a/zw=@vger.kernel.org
X-Gm-Message-State: AFuF++nTXCFIecQNgTmo488V8ql8olITEp9SWeCkn069iAUxKY541D5S
	JGV9kFS2CW0HS2Z9Vzw7ZnNEscHVkS4PW259p9C+d/Ikx3QxDKkdaEVE
X-Gm-Gg: AYBFou0HMBhEjz0H64LrgV1Si52GIZBtC9ybHsUujwAH4WWPtDpyk4aIcUnaz9OJIZi
	hDYP2AogkozKZGTSKoOQJ4G0XyEGqcuUizeMLJDTT/mJ8/Tgh05bQ9+Gw/n2bCXK+azfXYMIiq5
	ryOtk6MEiZ9KdQa888XV8+ZMPMcm42JSLkp6nGBXpKm2crwvMwxKKdGWReE3b2j0dWu8O+cHZd6
	MDQtBMgWqzFnac3EbZoXprc9yV98iL7T6uwYZbVspJ2xrV+o0XUkAZ8E/ZCfK1N451LAtC2wHZn
	MOb3N9z+xd8M9erhocQVJ02i2sIij2VLjJVfXWFdhXOkdo+U9q7T3oDhpryt0C7O2100KImj3yU
	JzB2sEqj6+UTbbZNxqD3IxLILSYP1gPZpDHsF3vZGrRLE+LG+08/ZUOZwuA8ZSntMi7U7GBUc4V
	oFpG/LAWaLifEqoNnJIRjRqcwcfWKFEBzqD4qPpccwGMUZTjD03jtOlebfn015FbEUXps27XBpI
	iANdmFOSjizFZnlw/WIaUl0YTkaMwyCly4VgNDYb0FyclwcZpf1J+ZOFxrhoYeSgGjXVjdG5Pzg
	vI2Mqvwb7BaJs1xUM4A=
X-Received: by 2002:a05:6870:828d:b0:478:b8d8:2d60 with SMTP id 586e51a60fabf-491e493dee4mr689572fac.7.1790202947523;
        Wed, 23 Sep 2026 15:35:47 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:54 -0600
Subject: [PATCH v11 30/38] selftests: enable comma-terminator tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-30-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=3975;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=IsDXQ51HtE2Lt8zOvABFQGLczubwVPutni/gf4j8v54=;
 b=QRuVQyfvzDBhAJsqoYl0A/dp2j7k0bh5SmNjCVII0pNlDD0QHSD+Snr+bJpyQ/Z5RyH0sts5l
 l9aW+v5TsOyClLMW75DZo29Na8icJBgzZvh8+yjQR7PB3T8Bk67+M04
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Enable the FT_comma_terminators test block in dyndbg_selftest.sh to
verify control query parsing when queries are terminated by commas.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v11:
. convert modprobe dyndbg parameters in FT_test_classes and
  FT_classmap_inheritance to use comma separators
  ("class,D2_CORE,+pf;...").
  Sashiko review complaint (patch 24):
  "Are these load-time parameters truncated during module load due to
  how the shell handles quotes? When bash evaluates and strips the
  double quotes before executing modprobe, modprobe constructs the
  kernel options string without adding quotes around the parameters.
  The kernel's parse_args() function (using next_arg() in lib/cmdline.c)
  splits module parameters at unquoted spaces... treats D2_CORE and +pf
  as separate unknown parameters."
---
 .../selftests/dynamic_debug/dyndbg_selftest.sh     | 29 ++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index a357905e3606..133ab32aa175 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -340,6 +340,25 @@ function FT_basic_queries {
     ddcmd "file $f =_" "$f"
 }
 
+# test parsing on spaces, commas. testing against builtin file kernel/params.c
+function FT_comma_terminators {
+    v_echo "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires dynamic_debug built into kernel"
+	return
+    fi
+    local f='kernel/params.c'
+    ddcmd =_
+    ddcmd "file $f +p" "$f"
+
+    ddcmd "file,$f,=_" "$f"
+    ddcmd "file,$f,+mf" "$f"
+    # ignore empty tokens
+    ddcmd ",file ,, ,  $f, -p" "$f"
+    ddcmd " , file ,,, ,  $f, -m" "$f"
+
+    ddcmd =_
+}
 # testing classmap-based query enablers and class configurations
 function FT_test_classes {
     v_echo "${GREEN}# TEST_CLASSES - classmap-based query enablers and class configs ${NC}"
@@ -350,7 +369,7 @@ function FT_test_classes {
 
     # 1. Verify initial multi-query enablement state via file slice
     my_modprobe test_dynamic_debug \
-        dyndbg="class D2_CORE,+pf;class D2_KMS,+ps;class D2_ATOMIC +pm"
+        dyndbg="class,D2_CORE,+pf;class,D2_KMS,+ps;class,D2_ATOMIC,+pm"
     verify_control_slice '\[test_dynamic_debug\]'
 
     # 2. Verify state transition and live-printing end-to-end via ddcmd_load!
@@ -368,7 +387,7 @@ function FT_classmap_inheritance {
 
     # 1. Load submod directly (which auto-loads supermod with default parameters)
     my_modprobe test_dynamic_debug_submod \
-	"dyndbg=+p;class D2_CORE +pfs;class D2_KMS +pts;class D2_ATOMIC +pmf"
+	"dyndbg=+p;class,D2_CORE,+pfs;class,D2_KMS,+pts;class,D2_ATOMIC,+pmf"
     verify_control_slice 'test_dynamic_debug'
 
     # 2. Runtime parameter changes to supermod propagate to submod descriptors
@@ -447,6 +466,7 @@ builtin_tests=(
     FT_grammar_ok
     FT_grammar_errs
     FT_basic_queries
+    FT_comma_terminators
 )
 
 # Modular Feature Tests (Require CONFIG_MODULES=y and test_dynamic_debug*.ko available)
@@ -537,6 +557,11 @@ function GOLDEN_RECORDS {
 #K= 02e4fd94602e108cb89bfc70d47a5dad FT_basic_queries.5
 #K= f03a7ca7316e8db4c0e16523dc41e75d FT_basic_queries.6
 #K= c518a50ba30ba8099d0dc874a27ecf16 FT_basic_queries.7
+#K= c8bbbac639f244ed9088208ebb7d83a6 FT_comma_terminators.1
+#K= bed6350f058f600910837dae83a12f56 FT_comma_terminators.2
+#K= 6e8599556a312200fb6d484565b6c52f FT_comma_terminators.3
+#K= 68b329da9893e34099c7d8ad5cb9c940 FT_comma_terminators.4
+#K= adc1ef04304c861c87fe294a8ba4e402 FT_comma_terminators.5
 #K= 91838b4012c50a1dc1d9e210ba8d68f8 FT_test_classes.1
 #K= a15ec4843acd721fbdfddc0b512c8032 FT_test_classes.2
 #K= 2cee6842c9cdee5cb3bf50b2e3914813 FT_test_classes.3

-- 
2.55.0

