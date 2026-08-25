Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA7C3431E3
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623197; cv=none; b=M0Z0Z/PbX3owuQUcOfU9+JIDH6SUeKr5riSNAWo5IEFIy3LrfTEHI860ieZb6xwXQWFfihfC8OgJJRRajteY+Imn+14zZjmE3s77cS2fE9ndpf/dznX2b4M71v7ZMqMYvBVcNAao1BJdQweFT1g4KyaC5XJ1ivaEKsOKxAYLLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623197; c=relaxed/simple;
	bh=4vlzH09iGIOfsleQo7FY4Tmg/lfAVoegVLohMXSdxkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmrAuwSSH+KiAMz93zJ25+9H9H/btxYFT2zVxJOqbHh8SiQStmCSd6Wp//z9L4GqKtLQNGOU5JddlRxM8mF1UhYyYdyRplVaazengL3D7KN5spE9/7h2d+b/L2AxSgipFrqXzfQgCWPvDpAKjIq5m9ZuJ5kK7GiUquYmy5/1sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGQGU7sN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGQGU7sN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso5888364a91.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 18:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787623195; x=1788227995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXZ6arscy3bI1yYYXMDFd7SBEHMelfRFPGbyYXY2R+o=;
        b=jGQGU7sNGmsyw8sP74gJdllyJT0B1zUv8MmYhrwsZfHTLrqZlmk97WCG7h8gnO+3Ox
         Y0PGG55PPFKO9lwL6AWH85BRmKW1N6wo2//RaDuhghGxSIm0PHMHyZVHDKhHIGk3zF06
         sJHCsrZUblMx78lFVBN7vYPlbLubHCrRKbk90Qygp+d9i7Zifv3Lh0jFIA5OBCCXfwxK
         JeiEplmqjyKuBcqtQ4FkGXePjpsWl1m0f2mtnbNA1Y/U5YWYWCq9WqF42K8qjhuxHjHU
         4G5v/zTTl84aYmRNno2BI9JvZaJtlcD9S77+PQ2eGSfQCXtNHdgcb24MUhN3T2TDP91H
         H3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623195; x=1788227995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXZ6arscy3bI1yYYXMDFd7SBEHMelfRFPGbyYXY2R+o=;
        b=RagjZZ876DD4JzxW5ld5bhSXVSZzTczuyNwAXTtevZd/4I4i6+0IuIgOHNpe3j+eqg
         teuCGUMFeniRNI/5lBUwIITxiCTVjXrm3SJDs7fnf8RS6/a7jB5pxtZd2dU16HMESDWB
         DZ+hznZvSR+/vI+A7krnOCHgVnaFmG3idHKjuBxM2sExHCfYbiEbjr1ClMVXBw/LKZNh
         RWhZV8aRk7mjxodMdByUtSRiccp7XOwCJolZbD4BGaZVpgiMlVH3mfNDDeE9oQe3IrjG
         xtKiHjiA7iUhMeoiw7CgeuGD6f5Z4gmbj9RcrIHHrMfELf51zZIj65IQw3JANpQEMOPd
         EnlA==
X-Forwarded-Encrypted: i=1; AHgh+RrL7bLPM93NKbYcaZXpAj+z1vIVe1+n4P6x40DhPfM9OZ0ogCURtjcxaq5PHl6vRUD08n2bEqAx8jQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lB/aaM24MP6tPeU61SBwLINtBRyxT1kO46YVzIrLEqvFVhq7L1
	DBc+i4Qn3AYqncA7pq60dahCHNeGV5SeLTxOudp+31gHphkaz7h6yEAs
X-Gm-Gg: AR+sD119iSEoPISoY0Fp6GbeoJautvSbeO7fiMxF+kpqVKfKSfvUvfuOkORBjPO4bry
	j+mPaaT468sQNlgYGC4K3ijue3Fq1007koV8yYmA7OZJZ06W+yD5fIK+v/OsKWipdvYTLT/QuLD
	i2uYDxBgS5fshzULStnvDJWijc8zHcYk6zfv8XN1TuJyrsMu2kXSYqNjw7LGorDNGxE6gDJ8Tya
	gEkRuBiPQ5MUijiaLbY4NoSGNT6VrMFdAc7ipoujSMU0abChpVbEa8nfdXLnr7SgvRvVfrOXx1m
	wxEMVBenz83DCv/rQSgzOXfZBUXD0A6bo1iSDQHRGMxxwfQsVA3Jzatppm8p1Awrq8Rnpgm808s
	OXlgmHGz3J6r6eeJRxwsGwRuJGJJyU9q07GufDcn/GuftV8w9KX2ARrk/XbkQo+mvbumZ3Tynwb
	sTChli90CAZANNX0a//IVJiCx7C6VcOvAe3w5c79X0OXgs1J7ibWL0bCvk8U8IS9o2HZiTmgbxc
	+geUa0a/YIa7wi4McqtDZug9xl+NqjNWy2eudL09+ROmld6E36Jf/AaA0fsZjkJNIZq6kndihqw
X-Received: by 2002:a17:90b:56c8:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3964652108bmr6382091a91.12.1787623195352;
        Mon, 24 Aug 2026 18:59:55 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b08ca0sm1725042a91.2.2026.08.24.18.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:59:54 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A42B915C677C; Tue, 25 Aug 2026 10:59:53 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v2 1/2] selftests: run tests on nommu architecture
Date: Tue, 25 Aug 2026 10:59:44 +0900
Message-ID: <20260825015945.141739-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825015945.141739-1-thehajime@gmail.com>
References: <20260825015945.141739-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures lacks MMU doesn't support fork(2) syscall and only
vfork(2) is available with limitations.  Thus, we cannot run kselftest
on nommu architecture as is.

This commit addresses this issue with the following changes:

- on build stage, add -DCONFIG_NOMMU to CFLAGS when NOMMU=1 variable
  added to the build/make argument.
- on test run stage, avoid calling timeout command when NOMMU=1 variable
  added to environmental variable, since timeout command uses fork
  syscall which nommu platform doesn't support.
- kselftest_harness.h: skip the tests if the file is include when
  executing on NOMMU platform, as there is no fork(2) syscall.
- replace "cd -" use as it is not available a shell supported on nommu
  (e.g., busybox hush), use cd "$OLDDIR" instead.
- describe the difference of nommu tests in the document.

So command line to build/execute tests for nommu should be like below:

 $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu
 $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
 $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
   -c mm/nommu

Cc: Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org
Closes: https://sashiko.dev/#/patchset/20260813063401.1786548-1-thehajime%40gmail.com
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

--

rfc => v2
- reformat ktap header, reported by Sashiko review

rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
 tools/testing/selftests/kselftest_harness.h |  4 ++++
 tools/testing/selftests/lib.mk              |  8 ++++++++
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec7428a2..a65f3ebc5906 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -230,6 +230,20 @@ section::
 
 .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
 
+Build and test on nommu target
+==============================
+
+If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use
+``NOMMU=1`` as a make variable/environment setting to tell build system to do the additional
+checks.  These nommu targets may differ in several ways, such as not supporting fork(2) or
+using musl or another libc.  Set this variable to apply the necessary build and test adjustments.
+
+::
+
+  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu  # <= build-only
+  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
+  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c mm/nommu
+
 Contributing new tests
 ======================
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..7287d8290b6c 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -38,8 +38,12 @@ tap_prefix()
 
 tap_timeout()
 {
+	# nommu doesn't support timeout command (missing fork(2))
+	if [ "$NOMMU" = "1" ] ; then
+		echo "timeout isn't supported for nommu"
+		$1
 	# Make sure tests will time out if utility is available.
-	if [ -x /usr/bin/timeout ] ; then
+	elif [ -x /usr/bin/timeout ] ; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
 			/usr/bin/timeout "$kselftest_timeout" $1
 	else
@@ -130,6 +134,7 @@ run_one()
 				return $KSFT_FAIL
 			fi
 		fi
+		OLDDIR=$(pwd)
 		cd `dirname $TEST` > /dev/null
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
@@ -147,7 +152,7 @@ run_one()
 		*)
 			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
 		esac
-		cd - >/dev/null
+		cd "$OLDDIR" >/dev/null
 	fi
 
 	return $rc
diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..0d05946a5e7a 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
 	unsigned int count = 0;
 	unsigned int pass_count = 0;
 
+#ifdef CONFIG_NOMMU
+	ksft_print_header();
+	ksft_exit_skip("kselftest harness requires fork(2), unavailable on NOMMU\n");
+#endif /* CONFIG_NOMMU */
 	ret = test_harness_argv_check(argc, argv);
 	if (ret != KSFT_PASS)
 		return ret;
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..fdb895967768 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -97,6 +97,14 @@ TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
 TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
 TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
 
+# detect if users request NOMMU build or not
+# User can set NOMMU to 1 to build/test for NOMMU platforms
+NOMMU ?= 0
+ifeq ($(NOMMU),1)
+CFLAGS += -DCONFIG_NOMMU
+export NOMMU
+endif
+
 all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) \
 	$(if $(TEST_GEN_MODS_DIR),gen_mods_dir)
 
-- 
2.43.0

