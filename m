Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101072FE056
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356039; cv=none; b=NyzKsklwkfUFphc0XB+UqNTh/gH659P0Rm+G3GaeenjMo0CA83uGm3eBXFmaEBnbUEAWmlkg/FIvUx3uIKMkzU4liBDtesYCeTqBdxjSMPDg2ZvDMiiCZSID+Un4JB/YaPEOhZlKNDhvhYYnLYXuwK1DYWFvkHTDPjiE0AFpVMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356039; c=relaxed/simple;
	bh=Y6op64SH3HVRwLLGtoxME3mldm3/W0c1FqQmgPaP16k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlW7K+xghsE1rnh0xxsCPyA5TG7av0f4UR0rmvMditt/BZ2h2vvp18EeoJlvuyXTAnBjrFL8n2FD1fCbag2BnMlo9gXd8KDdal8WNPA02yGw8uwX9sxxuzCQD4cBPqEs2fBjUvSM5C294o3ERqEMBSXSQzlsgt7NckS3Q76Fu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYXGM8RH; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYXGM8RH"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-450b2715b6cso4759439b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356037; x=1768960837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=nYXGM8RHTeOBYjUFRG1DXn/1gdgzU6y1E1aRq8u4ksASTpidCfCqG7rtCpKepO7iDu
         Ch4uiXWXg3zT61tK71VTY/uFpjtspAn1XUTFHKA8QRgJvcpiNn8kPd1lrK9D5weqHJti
         /ua2yO7M52QFR63ompFgfiUhHfSiXkHWKWFgs/pZ04wcvdk+gAg3z4rQQOQT25SvaPNF
         fBksaQLVd6MjzlilWdQYHAtYHEF3hsL7rBlI8R2MzNXV9udYUOwKPDa2S5AMoiOxBpBZ
         RYXpIUuSqmW3xv2L+crf2eWlxrMJ0LhmsAtV+Cd6GVX0VJt/4mC8rAN/xIxXos+QSNi6
         dCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356037; x=1768960837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=jtK+Dzr9lIDAnlvmconBc/YLw9kpjtCq1k8vQY2u0BNYKwJio6rTz9IfPEo7/xxpFC
         cWPpcgu2yuzSxc627s1Cbj5VP/ibVL00nlUbqoa71TVROcC2fa5KYF4BwR+0enxMMFRE
         pLvtO85Ygax9ECh9L5xW2xL9x0bUu3TokD7K2xOVNigBxvHMUva3ttLxTbp63iuHCX9P
         VTr40gOt+PRHiiT5PBmk3JKsYmv3uNARixQDCx8zQa8E6oUOerxrM1zBBunUSaBkPkf1
         JHYcXH8bGio7atN1qUPGmOLSv1kP5ijTwAXQNWgDhlYpwAEu/shkA17cQvKABdBS2lyU
         oZZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGfY51iwqnf7+KklD8j7MKG5ioFu8ndaA0kuIj+llL5OZiQbT6+kiUGAMcX089dh+sxMrh+lQy5vY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRJYJYNXOt4Od4vlx/HJTomKXAkm9cydl4OkMZrzV1UUSpImc
	LqelSbr20DmycWDora/xdR89PYwuJ1LDgdEcpIOLR6DDnkvgr0fI+vMF
X-Gm-Gg: AY/fxX47s6waEVBnbBM5CAbHBTXReJBwOAFhj2v8uHNyUcsjojrxabITWNPHd5aGku5
	ceXo4cWF8ZFMLr3O2nLV0UTtFKu5QyJKvNVpmTQH4LB+KFG5MaHSutIxWYcPOe17xX5Z8L+Vwj+
	kA7Wx4kyo0pscFNzg9zARgm+MagOHr+9pyzkxEKcmxU6ScGbNv0cJMKIjm6bDAmiYvMIA4jLFk/
	a30kFlHmRxSmyFwggUc7VKUH2UU5E6akS0iVjWgwT721lCEJtSVBtCkkHKI3vdSeI7kVquIggfp
	ifccg9bk3+Kp/6VEGK3CK6/43SWHo2kcNOsbLoc3//fDTtULzZJoX/RJNnRWFpkGOtFM3dMCC0T
	br+H321gS1BEro4SsPzyFkj6wNnStEHtPtK6eqUpkBit8m2KVNQhrv1ZIwMkr92DamHNVk61AaZ
	jIDzdDXRPP2wg0G8veQt+DHidCuM21lahzx0gwf1J4CN42KP0=
X-Received: by 2002:a05:6808:178c:b0:45a:55e6:12aa with SMTP id 5614622812f47-45c7157ac7emr579179b6e.53.1768356036240;
        Tue, 13 Jan 2026 18:00:36 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45a5e2894e0sm10347195b6e.13.2026.01.13.18.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:35 -0800 (PST)
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
Subject: [PATCH v8 28/31] selftests-dyndbg: add test_mod_submod
Date: Tue, 13 Jan 2026 18:57:44 -0700
Message-ID: <20260114015815.1565725-29-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.52.0

