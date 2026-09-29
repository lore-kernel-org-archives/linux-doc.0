Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF54F96B8
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 23:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726238; cv=none; b=j3VQ1fKwbN5OfEdwQAuFkWS9HBl4sBwC50cS662B9L8U3IW8s7TdSz+KDjeeD9AT90YDSqjAGoT2ymYFc4df2xSqmBWEGLmOKF3/hwZ+sP1J5+snaJ/AhFTqE0l/AAbcdkmCaLEWRQN2OmRBwdSGK0/V2Y3f4XoK0YIMhlIggOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726238; c=relaxed/simple;
	bh=znZ2OtOo6Mbk2gAeJiy7h1+AWKSZnrYx+jKuqF79nSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXCZLXvZEKGVcIa7ELJtamGUFzyGNPKPul79fLqZ/pkrOs26DiZnDhkIccN4EiqayOuVpsXZKdPAbmMiLsz+C+4QeMk03whtbSulRpP656u8p30APTdpx2+fIyvITfScM7kvNX6+XUY7O9Y74ZKP32gsCwzFRL/4wVf6gCybwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltecB0ju; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltecB0ju"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1493121a91.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 16:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790726236; x=1791331036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFwQ7bBmiDvOjFgxrjCdqBVWt11ayQv2mN1CYnb1whI=;
        b=ltecB0ju5New/FQi+n6YsQqAqjPLsbT08hxWjoD/3lHutIwS7sfmtpxA1+28984PQh
         GF6XLrc4y/oI+fpQmlM3xPgJ46drU4KfqbSbvVvRP8QM78e5SiAeU2GaH8zpOLQ1vtbg
         R4iLUYvPl7I4SjkLCw0kqc6Bj9UhYcDU/5y/Yfu8cFk0mN7S+L2gVbKUZi8/paav7QRr
         WNOsGCJBDV9jYGMOo5aHeDctCavsvw/snIJXFDP06tS+Q0Md578RtNHZG2red+XP8ayR
         K5pNie93EjVdGpxWuyeF5MWf/lJnE2ygjwGTXp1WgLsnT5JEum8x5kSWKKwb37eXCaQ1
         4asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790726236; x=1791331036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFwQ7bBmiDvOjFgxrjCdqBVWt11ayQv2mN1CYnb1whI=;
        b=eLSR9uRXV3Tv8SMYOZuEleZt7/8hUBTcQEqjMMXh+0lQKZF/ABeVt5PgizBd6CJsJH
         So3dyYB2kQCumNt1ZAkHYqYlqIYxY7duw3d4qZaoHozTNTDIP6eV6+MVoImgs5TYGzUK
         5mAF3mNS0gGCyxgG632+DcRTtBRX5/Rs4fP+8R5dBWZ+flPE7iVi5k8az0abb+iyd5PN
         bjD+2n11Dn7rujwbLXn5c4pDpq79k3h/WRWiPDy8W+l34u9hJ/9J2yfw0ryU4UXbo0Jo
         2c/HFjS94fmcN6BhZiKzHWuHl5cs73FhPCFauoQtoplC2DZOT8PUm9y+EYg01cr7WFDc
         Bn3w==
X-Forwarded-Encrypted: i=1; AKwUvBybck490f97NWhSnIiNjrIZXv1kHdMILZFWdOHxcPT56wMyfxtI79B++b9kk/XU5KfY+Liuehc+/FI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUbXICm4oL+bqZBqL5BTqTAa9geRqFdf7gc1NaU/UB48YOwcDl
	EcGUoL1MWgqHcNylgc+C4uxs0yEJrKJqPk29inrtpS0MAeKC5hTispmj
X-Gm-Gg: AYBFou3nOstCJUMTh7qKTsbCXfpSWpHK1WKHXaZJU0e2zfovXxNZv0uG8h3dimgUTTt
	yFCbGYtnm8ONoW3e1jCeG83Y5njueNE9pIPkdb4zUOVGJ/jWG4uViXleKPRRNg9xVUtssskUbNI
	oofkDWo1QQcj12E81fFwxXZ5ss3j72hqPj4a/jaX/mAAjfFGt2qmHpExl9PxCQfI8J8OITuwXTE
	fud4EYqCLXS3n2pIyL9nO0bVY4zM8B1GXccT78afMj1I01oL6YRxUXXLPLYFGbQcMCJ8sxbo5Zl
	W2rWyoUrSKv9nBr3axfN/t4FYsv6xEfKP4WOH0iQHN7eJ3P0t4f6E0NydcurWFr+TsfJ8WJ0+6j
	kx7k4XLwY0J2wx6jFLHnQTgEkcj+0p6UxX12Hzyyxc5E0ZX4QKce43HpVuQ5WdPpLp4p0/7rd0f
	jsFb9SIhDd1y5TQBd2Kyr+ke5TYvM/9G2GrvvLoCysIf1u0ma3xVFDGeY4kVk/Y3Bubx/w6DRrI
	NFxVRo5fqWeMM5YHmOpdoy7kmy8pHDJZgOZYhQ8hu5QKNIZvsev1RJdb7wREoHNL37tjHXMkoQb
	o0SLAO5ZHqRHCoHCZNtTSbh9Xj0Qok6wfzRrlbq3tGNLQmXSAoAJsifKfRJpyOQ=
X-Received: by 2002:a17:90b:2604:b0:3a0:7c6c:9824 with SMTP id 98e67ed59e1d1-3a4bfe867e4mr468724a91.33.1790726236229;
        Tue, 29 Sep 2026 16:57:16 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca4498f1sm265230a91.11.2026.09.29.16.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:57:15 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A488B16DC6A2; Wed, 30 Sep 2026 08:57:14 +0900 (JST)
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
Subject: [PATCH v4 1/2] selftests: run tests on nommu architecture
Date: Wed, 30 Sep 2026 08:57:10 +0900
Message-ID: <20260929235711.2287931-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929235711.2287931-1-thehajime@gmail.com>
References: <20260929235711.2287931-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures lacking MMU don't support fork(2) syscall and only
vfork(2) is available with limitations.  Thus, we cannot run kselftest
on nommu architecture as is.

This commit addresses this issue with the following changes:

- on test run stage, avoid calling timeout command when NOMMU=1 variable
  added to environmental variable, since timeout command uses fork
  syscall which nommu platform doesn't support.
- describe the difference of nommu tests in the document.

So command line to build/execute tests for nommu should be like below:

 $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
 $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
 $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
   -c nommu

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

v3 => v4
- fix typos in commit message

v2 => v3
- remove unnecessary modification
- new target is moved from TARGETS=mm/nommu to TARGETS=nommu
- rename CONFIG_NOMMU to NOMMU to avoid confusion to kernel config

rfc => v2
- reformat ktap header, reported by Sashiko review
- https://lore.kernel.org/linux-mm/20260825015945.141739-2-thehajime@gmail.com/

rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec7428a2..c35b819947b7 100644
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
+  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu  # <= build-only
+  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
+  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c nommu
+
 Contributing new tests
 ======================
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..ee2c1f0403d9 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -38,8 +38,12 @@ tap_prefix()
 
 tap_timeout()
 {
+	# nommu doesn't support timeout command (missing fork(2))
+	if [ "$NOMMU" = "1" ] ; then
+		echo "timeout isn't supported for NOMMU"
+		$1
 	# Make sure tests will time out if utility is available.
-	if [ -x /usr/bin/timeout ] ; then
+	elif [ -x /usr/bin/timeout ] ; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
 			/usr/bin/timeout "$kselftest_timeout" $1
 	else
-- 
2.43.0

