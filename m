Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364555;
	b=BDD5AuoqaE+7flkTEmp4A3aokNduxJ+PoNnmBv7zpKNB4r8TTS9cRfixijTxes8OKOCv
	 MIKSu8gn85CCdwQh1TBPzh6VH/oDZ7bH4+f1YcwJhyaBOZiV+HRnX682OqQRYOQa9RZ3k
	 QXsxuuiIH1rNGJcPwvtPOoougrOACIcFjGc1oHY4n/i2nAMBNdWUe0hi3p8BvN3MBh212
	 uIeX6QtS7H+2Wurf5A+j1pc1nzcLYenH/hUyAw6+6R6WQO7nZhhdqRGTg4eI3V1L1UR6x
	 TPG8bLLcQ39aGkJzpfbBoyj9GXucEY9Rv1UjyuaB2I5qNH/nb9xq95FaM2zYbceZ0BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
	b=PIf5l0yPUO14PjOiOVVp0NgNJ9Ba8cgdIgVXvLvFk6QFyeKQMZwR3fMZiD/8bX2vqW0S
	 p65h4CFz01LEn4BrpetEN6mxEzehoErltIKBqFY3gVukRBxqSjdjV1f3EjdxGzQ8j4Dst
	 UZKUua2ZPB8QDsScEbHpdB+N2Zpz+hUJ++UKfu6u+wy/XkU96ifCoPZXDI4cwWB+MnWam
	 6Usbp+fPWtKReuZXS2r40vlCAjhAZvp7VEhrh2107biFpUboPw6zoBw0KFlPr1YG1RihX
	 cGld9+OQ16cbEooOwx2Io6Jp/oVXiFiukF/ICAD6lKAygLTah8qaheqOvj6ioZ6yqPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdpO8OlD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1A606A320
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E1A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdpO8OlD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f6295304dso3561747eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364554; x=1794969354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
        b=kdpO8OlDuqFGxJ6pYbm8Eaa90beQ0xoCFDd3zMa/4VEP+NaHxsAXkHAvgi28M/RDnF
         RAMYOXkE952mBG90pGuP/RY8/psMI/ddWvyJAzpCX3fLPcN/Ogr7/MzO5OYCLiaKOkrq
         pkr1abSKO9yLHD34ENOIJS668yBBCud4Ynmo0/7go9ggpgfrBYoAJWpevHj1NajYfiBV
         Ve2p5Zt5IdMTPTypm8YgI1HO6FrmFSPyR7COQbjw1G5jr3bRVjril9MOilyETwxtzBy0
         4KOEc+B3e0GTJiNasFdeX18tbLmKUu9CXgg6/olRgTsP+AJ8fDZvTFcocQOJuCv+EaNB
         p9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364554; x=1794969354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zeVpQQIPxzRW921jNzANvtYeiWb1Rf7rLm7zqTskZk=;
        b=sy8iwWHR8fCpImy0QKNMRHgdWKSmiW/h1F5qamTadFOIXVDMd0Zzs7wBuJuwMMm7bn
         QB3RFWrOJ5HdApLxgB0qqjazel5DxWivFF59gKrgYKk7ido7m7QZdEERIUTuwZ1Te+n8
         FFxrZLvne5pouYmAg3gz+lprzA5yJYdl8owaIvQM9F0bRzHJABglfwhuhOgIh0uphQ17
         pDzarc8cBGn7AJOstUG8s0o9c1/q3s2FGo9hlGRpMwkwtyErXxVrn8Qc++z65UyqE6aK
         gBHBOrCSqDbqedU12ACBfFCtNuN/P8BnxDwJyE055jd7KA4RxPWCsS02JGn41m5W0b75
         NR8A==
X-Forwarded-Encrypted: i=1; AL+hErH22fQ6Dw9u4UksM/8bF6prXvyNIO9zjZ2f8UdkV5hnx5PoNecACpT7E6MA7H4G2hSWY+UuipiIB94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s+1c2VZadlKyK6RE9ZEsNIlcMRlfMYqCtoG7zavTMv5DUGFTT
	0lWlJqSp2FDbTEtp+Vg19ntVaKa9ZgooAHq9oQXaL2ktGbaNMhN2iAzM
X-Gm-Gg: AYBFou0RFl5ybx9ZneTWtWdIOXpz2fK50aJN5ESadNugb0YAZDdH3zoHd8doa8LYhe/
	cwMikKIuyRMKFVzCzvN+eaWjDffptcQT081NF46dMq5jPYeeF+r7oEQVtCAGWE137lDuYlei3et
	HgcEF017Re0rkbiV2F5NujGSWXB4ywf2rsPADXLtxo74CTPpEwIm60dPvjM55lqL4PHE2X3hsOp
	Abnpplk5XTtf5f98BOciho8ctAXOmimGpGAMZvB6VCgVn0263Lr5ZvbfbfP46SJyydNf15GcfRn
	xH2cufqIoY5ze2E1zMj6b7EQF/RJLGttdkpVgvTZYnwHa+LQWBxzq9vEukSIYnACZELcfGwymG4
	N0kvUdLwckEukmILlSvBva//GH5kWF2a8iHWSoTzh322903kz2D6IGE6iu0t0NlrO4y2m2cbWtC
	Q4RYJKS6q0rnRlJ3RwpZgjd+3Ye9paycAbcBw9+9WyQmx3fa8Xecw9NmoCamiHW/WDCGMJkHDbR
	EFp22CBXMLX7wNf+y8QYXHLCXWGqK9vRehABbcYHnZMZsvrZwnkzUKlIP3+KnOHru8QnP9DxOMI
	G5FQM3U47DpBKIYxeqaB
X-Received: by 2002:a05:7300:1486:b0:376:feb:2df3 with SMTP id 5a478bee46e88-376861801e9mr2280854eec.20.1794364553911;
        Tue, 10 Nov 2026 18:35:53 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm20493219eec.18.2026.11.10.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:35:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 11 Nov 2026 02:35:50 +0000
Message-ID: <20261111023550.1971639-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234551.1474417-1-takano32@gmail.com>
References: <20261106234551.1474417-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but the file does not exist: no file of that name is in
tools/perf/arch/arm64/tests/, and no commit in the history leading to this
base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant. Remove it and the link target
rather than pointing at another test, and move the instruction for running
the example into the How-to section, next to the reference it belongs to.

v1 pointed the reference at tools/perf/tests/mmap-basic.c. The review said
that file is a confusing example and that the section above already covers
the how-to, which is what this version does.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

