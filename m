Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5F2D7398
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384910; cv=none; b=QY4bRyoJIJAGLKrQ++om2Bp1/yDdaymOzAF/vLHu+K6CziFOyERu6ariY0OJMcTe6oX1gMWV+dMgOzd2vh7O3mpxKNxmfzDtyUMe+tKsWue8gu8y/KryxuLpygwuNYChmymmo+AM47QvdkKqs5fr7TJnCvkEsNeQcOjagDJ7dA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384910; c=relaxed/simple;
	bh=ClXBs/ZC8nypYmLskEITrtBd0icyBriOb/izKBF2yOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aniQEqbVN52agwX5NpMMnmy8vffbIEzt2Li9ju+i89DfgcsQNSEzKyCLTHnHZZPkuizHd1zcVX9/cNpG7Dq6kypeXyP1OAmCfTlhNBSOpxmmMgGncSwi9tHyJ6xmnVkgKZHTehej3B2fMzUrq3QYz6SGecwxHo3OFziTaYmCGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmBMYQmM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmBMYQmM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so612197a12.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384907; x=1790989707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCkD0NEbpweweLPyYmTDv9COC7AncTDYJNFGXpSt24U=;
        b=LmBMYQmMCmg3APyQ/FIhlurbho3w4grAVupATAr0GE9npeefp+SJ5BqB6+mrCbuqfT
         r6yl65T11XrUhrvS3RD95K3TnSFsYsLNDi6wbxNsMfUTbsYnU0LWpWZqts0QrQ7+SJij
         xFa2mntzE98WCG+g7kZMLuE+UmsOMIUyIik7u/ixawAzB7y43iTXerxZsQPe8dqCm4l5
         kS2f9C4MVkZhzbnbmF9b5czg9hW4VxcpjdTfzI9E7HmTlst3mBMNgvZyIK7p2h5tWXYq
         D9YPfAWT9+vPGyBJjER/x+s/flthujgqoYh42Q80pucF1XqrRFROsLu93mDUse0ysWDj
         3Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384907; x=1790989707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCkD0NEbpweweLPyYmTDv9COC7AncTDYJNFGXpSt24U=;
        b=fVeBPL8F9KegcybVTzw2Q54Vgr6L+hA64Z7glLW/jcfX37PLuB1qZn/Xx5oPT2QnrC
         j2dyY477gBV3ct8+UM0T0NH7e9LtWgsigjwbqKQ0I4L+MtAUNXqRmzCwOUR038eF7o1+
         kzC4q+HfVxpzsAk0SQB2ksfSOOXVeCfzONFKwZGJleKxaAsjTc5vHju2REpuBB2WbdXF
         v1nkCqWGB6rYnoqYGbqIgjspTUOaG4dMR7qj9uUsHy7FuEgISwwE0rla65Bp5jfk/KqT
         63tx2Ov1Uf+PpwcvXkcT5p0KeI8PU85b/osA6beElyn/SivpMlZaFUzHRs4jb/TvsNl4
         kocQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG2FbEGKOi3tyYmmCzBxnWIeOyl0HqS2pW+McA3y9m1Uzad670w4S378VkFFQYb9nPSz40GCm+DN0=@vger.kernel.org
X-Gm-Message-State: AFuF++n3CVdSPhYLv/1W9Nib11fF+5DmAN/yhTgzWBKKAl43fu6LwzOL
	aHql+DihUHn0LDOxpM3bG70AsV2lz3Shg+1XaxMZ1gnYKe0fmknd7gss
X-Gm-Gg: AYBFou01Em7/OyFlgiwj15PluaAhjBbfyq1pyzdQMSQhZuuMw3w63DC/dVBTETz9gLm
	D/0XU3CiUZiSYF/IfEBJplt6sZtKtNfeLHyLwGE7K+IjlYR38uWnQi9BYnYXvFE0NttxLkakghn
	Prj35ZZgZ1QWuWqnO1GB3zF7t9+f2+N7qpC5PbgS2jfyHUPtu3J0md5odREvVx8G8SE7DuQVPr2
	Kl1Um/M0qrLAFlTMbHy8f6ChmdTnrUtdrP+btd9zCy4NDAiEH09ZI8PjdGTdGfM732sRXv4gmiG
	39QZJ1JAVBJf92TEbu7xApkkkHHqwoontwh/8nq4A/mNIJGnC88CPTGVBb56UALLd14EDwdBE5H
	Ctg/cJ6NQvy27sbFCQhHyqmUU6akaHJXaVRPIGi33wSsyMzMLFP7cohdZpjBWlFVjb/Ajhxb6Kl
	nxJYOtNztzP+fgAnOlEWBYesgWZ/nktZPfJnA3C9xdJ5DMU7zhsD8+m3L8Os/+RzGZqoewDPOd/
	sG6nmyhegNIzrozkXIaY07snHJPSpD/cTDPCm9SoD0VdVE4svc3kA2ROZGTz/2KvFyFHeyquANL
	E0i+Xf8V6drje21lI79GIEhzc6UPgnFUOWgl+nQBQZE2dHSV2zgatMu+LitRFw==
X-Received: by 2002:a17:90b:39a6:b0:3a0:c0f0:9a96 with SMTP id 98e67ed59e1d1-3a0c0f0ab36mr2504067a91.62.1790384906461;
        Fri, 25 Sep 2026 18:08:26 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99dcd78sm7026970a91.15.2026.09.25.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:08:25 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id DFEC716C9C98; Sat, 26 Sep 2026 10:08:24 +0900 (JST)
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
Subject: [PATCH v3 2/3] selftests: run tests on nommu architecture
Date: Sat, 26 Sep 2026 10:08:18 +0900
Message-ID: <20260926010819.604346-3-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926010819.604346-1-thehajime@gmail.com>
References: <20260926010819.604346-1-thehajime@gmail.com>
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
index 8fc1018d6fec..95b5ebb8bbb9 100644
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

