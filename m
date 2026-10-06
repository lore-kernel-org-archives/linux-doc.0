Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D93CA4AB
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277018; cv=none; b=hKGP8xWYFoSEIi7lg0+mmvTf73Ntm2lgjDCY2KdOg4hHjGmHcVkRNEcKHemgYYAu7co/3LtTs37b4hnFSwyB5vrNJ4cQeRkQWCY+NPmYa6kVaw7J/Q+v0AV6/Am5u0PSYjcKAT0qxP7wXue58PnHozEZ7uGylr2T72maFY6UghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277018; c=relaxed/simple;
	bh=ubH7/psvqopb8GipsGx/sgKujO0o2/7H6Pe55OSnpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCu5lORB3Q3bH6CdyezyPxxGe3wwlaRJlkHJP8kbEo2d79ZiMfuXYebOnaqT5sXKQrSeLyzAoE0XDqz2jbWQjjXyrtkMmXTmGhokAA04QDDDw6/EZhPbY7RVHeLlK31mgTUBQmZW52rkFx/0pf75AS79dAT5CDVrwL8554tF34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkiCAP1g; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkiCAP1g"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso232813a91.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791277016; x=1791881816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZc7x+1xFrkceqpJwcgU1RKoagSWQzy1+YI5nAgqplo=;
        b=GkiCAP1gPHp+HP3FqyIKFTM4wAEGCtp8eglWKuH9EZn6UTmUv/FpaWHzoT31z2KjR7
         s3aasXq+CxOQfuPebhEzCNj5Zj0eexPCQW1Jw7NShPq4CJQJjNtTHCCA+KRZi6CRNkzo
         2fnMkAsA/9qtSSbkniJoLX1CEO3XkcwSY+phO0yFP5SyvSHuizskl1F7/NcbYX41d9OC
         Wnc0uWU6It71Xm/ElXcm8v4fQrgOK3EW1VtCS4vGYrVZGhAAK/niK3kxnFFpSp+rHXVJ
         BanYZnCc+g4sc4a1LpGQTtUtg+rg2lWqjsGcvmtbOhfgiegiPJUJa9RyWecCpwSDN1NT
         aWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277016; x=1791881816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZc7x+1xFrkceqpJwcgU1RKoagSWQzy1+YI5nAgqplo=;
        b=pFDUGlR4/oWEj8DrzzrBgyRaJmRO+PPLWIHKVVreBOS4HFnEuTnbco3/2ZOy7Uy0Q9
         UrY97t97jbJf+BPRpAlNSf72dy4M+Zp3kCaqWGijueMn8SWmfmEa4WSm0BWgdPh2IDhe
         IaP4njhjqxLzx34AY/RYVxD/RAzi0Ox7YPmw5ZtfTJGa6SDS0muw1OwP1VPcFv+77ZgX
         gqn/i9HCCYs0fX2/6rcVIo6F4iAoTgoip5k72a5f2YfQ/TKvVwW42At7aAeqnnRctTO5
         On8oRgLIshhk+4jRCLkXF8rgCZI3sMjMiIBVggFYFxy9U2sKKo1SGFtwZX7wZ7Kq1xwq
         uLew==
X-Forwarded-Encrypted: i=1; AKwUvBwUdOCuCtlx75ZXJcqwbjO0dOUfK7HRuzYLC42pfYzJJqSCAxz11K3S8HwKGiFKlIkxTeOxNPl8rY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+RV0990XMG5Zyq2LdVwHWfwifkSg4et4QIW1VUi2NC2MXvFx0
	IknW4rE8uRiq5PgB9wCSRr+PC9xBag8NXz/YnvvLk/4bByriNeuOdG8+
X-Gm-Gg: AYBFou2GOwZBDS0dH4iKcGtjwzdJO4k12NxdLU8E93ojqMb7dVMc0c6oTO6W45bNr0o
	fUUIh7eTj4J+XfaXuajBo54S65My1JjsXdiEgQzJ93rG8BskCcnYPa7Rab2GTobegE3SOQEFWBd
	aFvs/TJLUe9MTDwX3NC+OAjshm/YAVcQKoCUKDccxdFYbRqx6rfrINchAzkrRzLazeSCty4YxP1
	bGWq/pF45YZRA1a2yW/xxlBUuAlb8C767tT+zrPWLK5zplgXSTUSxe+9QpgvM1KXk7DW3TRPPbH
	W4LD1ii0yGowmhyPWssg0BCj1WeUzf430cBh2PyTRkRwoT3EFcLGdY9+3CTJTe5ll9ShZbtVa9T
	EnxPfnlxr0VLmnYZTqSbX1OPtQU4fOhTleDcqovU4XmaA2BretIqq8qWjt8m3ctDbPHk87DNbTY
	rsB60+lcg+B/dti570WO1YJoCHI8fMpuAvwQFtEQJFyKB0/CSXup/66bAPnOw58UNhoc2TFdB/c
	TgHzHgSMtx9ijYJAXWYwAmz6hsCLf7mqWKJY/Yde/Hkq4VyrhpbHVAL8VdzCLRpJI7lkD6OM2lY
	J/lGCDtl5qdQgKVwVIXVpoymuym45nTf3GJbYTzIagrGxHYGfI/YQhXyNpxXI3Tlf6reqkl9
X-Received: by 2002:a17:90b:33d1:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3a8735173f6mr510245a91.18.1791277016147;
        Tue, 06 Oct 2026 01:56:56 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm3761921a91.13.2026.10.06.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:56:55 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 4543816FBFD1; Tue,  6 Oct 2026 17:56:54 +0900 (JST)
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
Subject: [PATCH v5 1/2] selftests: run tests on nommu architecture
Date: Tue,  6 Oct 2026 17:56:41 +0900
Message-ID: <20261006085642.3852152-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006085642.3852152-1-thehajime@gmail.com>
References: <20261006085642.3852152-1-thehajime@gmail.com>
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

- Detect NOMMU at runtime from the MmapCopy field in /proc/meminfo
  and avoid timeout, which requires fork(2).
- Document how to build and run the NOMMU tests, including the procfs
  prerequisite for runtime detection.

Build and run the tests with:

 $ make ARCH=um O=build kselftest-all TARGETS=nommu
 $ make ARCH=um O=build kselftest-install TARGETS=nommu
 $ ./build/kselftest/kselftest_install/run_kselftest.sh -p -c nommu

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

v4 => v5
- remove build-time selection and detect NOMMU at runtime

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
 Documentation/dev-tools/kselftest.rst       | 18 ++++++++++++++++++
 tools/testing/selftests/kselftest/runner.sh | 11 ++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec742..fc4dc1f9d 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -230,6 +230,24 @@ section::
 
 .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
 
+Build and test on nommu target
+==============================
+
+The nommu selftests detect NOMMU at runtime by checking for the ``MmapCopy``
+entry in ``/proc/meminfo``. Ensure procfs is mounted at ``/proc`` before
+building and running the tests.
+
+::
+
+  $ make ARCH=um O=build kselftest-all TARGETS=nommu  # <= build-only
+  $ make ARCH=um O=build kselftest-install TARGETS=nommu
+  $ ./build/kselftest/kselftest_install/run_kselftest.sh -p -c nommu
+
+The C tests report a skip if ``/proc/meminfo`` is unavailable. On a NOMMU
+system, the runner needs that file to avoid wrapping the tests in ``timeout``
+before they can report a skip. Mounting procfs is therefore a prerequisite
+for running this target through the kselftest runner.
+
 Contributing new tests
 ======================
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc5..45fb8ec38 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -36,10 +36,19 @@ tap_prefix()
 	fi
 }
 
+is_nommu()
+{
+	grep -q '^MmapCopy:' /proc/meminfo 2>/dev/null
+}
+
 tap_timeout()
 {
+	# nommu doesn't support timeout command (missing fork(2))
+	if is_nommu; then
+		echo "timeout isn't supported for NOMMU"
+		$1
 	# Make sure tests will time out if utility is available.
-	if [ -x /usr/bin/timeout ] ; then
+	elif [ -x /usr/bin/timeout ]; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
 			/usr/bin/timeout "$kselftest_timeout" $1
 	else
-- 
2.52.0

