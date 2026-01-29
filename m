Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A737D123
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671898; cv=none; b=B3MA3NJT3O/KyBrTNHvGH1yICj3ec/eOpiQ2EfwsvcDGOPZq1qRZutqdlH71SoQWcrmD58FQQ/PhmUZZP+3PHrPGygSqkYGC8C3tiCiyukvJkzvqgYdBjDu6z+SuenR0DreKE4SOeO+pfNF/XW+Kyxi+i7HO6kVy/tsHfKv409s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671898; c=relaxed/simple;
	bh=Y6op64SH3HVRwLLGtoxME3mldm3/W0c1FqQmgPaP16k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtHQGjaCd8H6WLUp2+SlrHQ4W3kryk9HMcUgkpZD8HGioVrDvAVBzDfFxnu1QZj8evnNjZW0WHxelhYQjkylEuZfLB/R5pTpd71VpPXHowxspdw7DvD93jtECtcwvjQGfdfLSenfIYgBK1e84T4gebdOnj4huaIXg88zW9AhPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqlKmiu4; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqlKmiu4"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4042f55de3aso477085fac.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671895; x=1770276695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=JqlKmiu42rjPUESJkCQLR0nL1cfkRQZxEWu8YU9SnBmhGtGtxpWO9sG50N/Fs8JdlL
         bHK+Muh4OQA6UFUYwmEt7sTrqbGlPQZrYmSBhsW0PrV2om8wBy4vr/KjX5+JnaXE76yL
         nNQq7xVS5RHvk00X6v9auGJ3IletGgRAGHXiCzNEJ87uKhm37GYygRKR7Q7CX1kVJN6c
         umgPZIIlK33OrWGFHQfAQAAM8fVjzbdHFS7LIwQ56oS9PEj8KELOgR7n9Ll6AAVAWZJv
         02RCgQB0/RX7c7eIAgz8MoDWYBNEL6gycEnByJzGIawSHp7U7zbIPS83PfHQ7MXznXJW
         CqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671895; x=1770276695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=kM93JnuZXoSacIOWHQ43aguB8k5ZbUawQS8N0Jygw7EeeP8dsCJMFrx0fVXTD4J6IS
         QQ4wMic0MrpERdHrGPcbJ0+V69KqJ5a4J0xi3P5/C+Sz8PWuwbBLLv1omj6I3WLKav3u
         xu9iI4I2IU0MTKFW7cGmWA+PbYQW2uGbiG0GtWE6TyPVLL7Vq//v1jlw1g+JHEQ72f62
         KELMqcWdBWUXKK3POhqK556CGojCKKFWjTcN+xu3OwMnxaOzvdqKaTTlMb1ez8L1FD04
         SLVQ5JDE+RZlzzjKCXDSxxMIjA90209/FRaAPIVIIxZK284hFVTWOfZeqcTfOeWHJcE/
         1Gjw==
X-Forwarded-Encrypted: i=1; AJvYcCWIxUvYo8JqwLVGSSxW7nuWklEd0Ux/l8rkWaGMtVJH1vWwb0zE+rxYnKVnZUqCWaeQBcmp7dX7hQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNj5KRTwsFH7k78m0/EQjWIKC9AcnWgTZ5ELWDH9xMdwoCl1Xv
	DeYlVopFGt5+2a6fir5wffgic/NXY7F4n5bVgFb2Ws7OOW3oI+WOqTDONffU6Ph2
X-Gm-Gg: AZuq6aIU8I4R0D377PnlxI/Uf/J4SDqwS6Mj/8cM3muJv+6moRsBHYtMKfWdbQwvbi5
	8TQV2+9mf2yYwpHZ1odISmXvEkPUbum7Pxi9zr9yleFLiaRvuthqjy18dEgTnRG/Njq24NmFqf8
	inU3YFWi8IlCTBYOw+y2oi7OsRJfoouBu+5Ma4G1fX1L1GzIMtSZDHZ6Z3JM9wFR8GQdK2TcOhr
	OiXQSY/L9HFcUh36kn7Kb4PUFZySz0ehC3PoPX1GLM1Smhe9YPGz/loNQydozdOIo2hlj4JY5EM
	s0Isx0vqYIRUWuRTiY7Te37roRZFtfAg4NyLFmNTdLcRb7xEPKGeX5Bm6kek1W1wWw94CFJ31GY
	7Wio62PW7m1yTdLBmjt4N+o1d7ktfup+vuOd5VS701uONLFaNpcfKGL+gLIGphOnpbG7PC+EbGx
	Jt0+0mQHDthUUYJ2DKBfSjBg0/Uue6F6CXILyG/UpVI67qB3oixqA=
X-Received: by 2002:a05:6871:b10:b0:409:6148:e23e with SMTP id 586e51a60fabf-4097fb7cc1dmr1086285fac.10.1769671895554;
        Wed, 28 Jan 2026 23:31:35 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-409570f1413sm3442581fac.2.2026.01.28.23.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:35 -0800 (PST)
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
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 29/32] selftests-dyndbg: add test_mod_submod
Date: Thu, 29 Jan 2026 00:29:15 -0700
Message-ID: <20260129072932.2190803-30-jim.cromie@gmail.com>
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

