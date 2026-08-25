Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85E280309
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 01:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623196; cv=none; b=uAonkM5S7TiKnxrwIwEmkvOQepybDhRY/3hyn2PzOq7z6/lpQJnlJC3VqRGPn2gM2Q4dydLbttrIywgxS35s1qZpIfu5w+GlmwfUhZJGlLMQ6hBZ4h7CvPkwpLYPHYAMqqRmunXw5E6kbZ+aurcmrS4P1tHytidBk+ZKX4OxQbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623196; c=relaxed/simple;
	bh=T5YW5CFuBsruw60Lh0nafi6isTN65QXG8kOoB1jxyko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fvP5CAdCTH20GNkW7wEuwwlJv9lV/XzwfFQR3D8/NTMYXIZwTCigxBv7iwQ9qBdf+uxJTwRkb1DLxCGP3wRxzfFavrWJxBe17am0ledLC34+HpnPbYV8OeXIH9PBECc25/NsOWnQu7DSsbimyzlHoB/RKuxDQxtaZrltbroIfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/Grd75A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Grd75A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2597368a12.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 18:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787623193; x=1788227993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhHoz17uhzvTdXS0vYq6oOhZqGXYkYOkqCoUJ92OGtQ=;
        b=S/Grd75Ak0VKAFbk13QHdr6H4KRrNJIT/ApSgJqFnolheseGrQTLZjokd+DDX3PDyS
         wv/173klLh7Uba07EaSPfcX4hgNX/NzBh6F5IRLC+U/Am5nrnEjFh4i87aPvecpylNZ9
         iyIs6VMz/E56CMEO/uO6so6jkSuXC1QPb/iENcvnL1tsaPhDLh83nggt03/aDcxQbllD
         Im15kuw6x0VkHM7ZyakZqhvRM2BdfB27IPYoJr4wlIyJtVgAD7CyA2MpCNHMUD9l6AEF
         qjHYcQ2tKgw/e+ovHvmj4YgSM4r2/CLI9YXfmI54iBhX7T3HNxLqS1i6RPTPF4hW9uff
         Nm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623193; x=1788227993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhHoz17uhzvTdXS0vYq6oOhZqGXYkYOkqCoUJ92OGtQ=;
        b=P1ICQZ1NgJNwLdhh9QqtKR7WW8lzduSZDSHseg2hzs/asO9H40QhtsCoxvrNcNhP+d
         6DGXtIQHp+lDsskbgem2NvEqZRa+kVtoITJtHGBoUMhRipoK3/bTAGZ+QqQAlsRCraSC
         WAT2jvqAmIbcYF9yEZh+aheqRppqFonQaRQ+ss2kBh+j4r3s0GfzJX5R5hSsWqAwr3Li
         lPiaK0QGLQF4nA2faSjzRqP3Z95CZrAkmoh5hf11y+EwRO16p2lGkn+lLfd6D6nc0VKt
         xNM0Hr2F7RUkE8reOwkWXUBvU/SuoE1V7vfAeabxbWyPLwSCEAjURVGutC0K1m69NjI9
         EBUw==
X-Forwarded-Encrypted: i=1; AHgh+RogMMYY/Tp06h5JyX9fUKuPgRY6mPo26GZtkh62yCocXDYg4JKZCM6TP8bG3rRO6MC0+gol6H/s/PA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJDKOM7ONaiVUe52pVWdgtTMWnIkJBQa6N9UWSglAE8hVYutUa
	aZL47v57x+6x1+11ZgXjJKoIehKT32dJIqIWr5o6hAVMTZfZec9CYuOW
X-Gm-Gg: AR+sD12uz0eQsHjcmDYNJaL4uA8GBDOXOnjXEk1K9p1g9fODLRYMW79FbEPR4UoC7Vj
	Ims8occn36iPkvhGydwz9k36iMGEZuaeccVIhKpeAruq0l27KJZOIXGFam6c1vRJj2Dsr0fLkY2
	tVj22T1gPjAZhBcMAEsW07U1dUqUwdiPr+TceJtvQsrqLxN3cf+qQXhSCEaNl/ep/KHOYzTVX++
	x5gwFuKoeFmY8yrYNxyIIL+Kj9LlRnBJNxnjaD6ptnJ1Ji9X6YYoO6EpM0OxtMjeRwi4xoWMamv
	JDOtrbTU69ABfbzVQZMKbM08/PDWR8qP2VmMkCtxi1U1Bk+DXIrkmgDhxdbvH19z2/SMEwxsSkn
	BjKZf2T7RVkUx+wa8nR/ZQAFsh2wDT9WcE9INhBSf6Tkf6kXF+RvuSYpTYPnqObheDxsciIIfKT
	XPD5D+LwIqZIWE99R4cAWP9IpqvFsabIyzN2G19nUeYTFcUCWUaadpAZo8cxdhemfknd5mDy8Zx
	LIHfb1J73R4j6vbWVfnW/xUNsyorZ0GwrH9M4ysoNzV+EYIHoR0wdSFQJ7wvjxnaWa4rQyXF19E
X-Received: by 2002:a17:90b:590b:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-396464ce7c7mr6288216a91.10.1787623193305;
        Mon, 24 Aug 2026 18:59:53 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b17eeasm1704829a91.3.2026.08.24.18.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:59:52 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 7A77515C677A; Tue, 25 Aug 2026 10:59:50 +0900 (JST)
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
Subject: [PATCH v2 0/2] support kselftest on nommu platform
Date: Tue, 25 Aug 2026 10:59:43 +0900
Message-ID: <20260825015945.141739-1-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We add an ability to execute kselftest on nommu platforms.

Currently there are several issues if we wish to run kselftests on nommu
targets:

- it cannot compile/build test binaries because the current files mainly
  assume to build with glibc,
- some of the tests are not able to run on nommu targets as there are no
  fork(2) syscall.

The first issue can be avoided if we can build static PIE binaries (if
targets support it), but in our case (build on ubuntu/glibc and run on
alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
mechanism.  Thus, we need to cross-compile with musl toolchain, which
needs to be solved the first issue.

The second issue is the lack of fork(2) syscall on those platforms.
Especially the test harness helper (kselftest_harness.h) uses the
syscall, which cannot be simply with vfork(2).  `timeout` command used
in `runner.sh` never works for nommu platform as it uses fork(2).

nommu component in the mm subsystem has several known issues and having
test cases should help this situation, thus this patchset is very first
step toward enriching test environment which has not been well tested
for a while.  The test cases is implemented based on the document
(Documentation/admin-guide/mm/nommu-mmap.rst).

So, for the first step, nommu targets only support low-level API of
kselftests (kselftest.h), and implement tests in a new target,
TARGETS=mm/nommu.  Other targets are currently not even able to build
due to toolchain issues but will be addressed once the initial
introduction which mainly focuses on nommu test will be settled.

The patch was initially combined with other patches but is decoupled to
only focus on test framework and testcases.

- rfc:
https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/

Hajime Tazaki (2):
  selftests: run tests on nommu architecture
  selftests/mm: add nommu mmap and mremap behavior tests

 Documentation/dev-tools/kselftest.rst         |  14 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/kselftest/runner.sh   |   9 +-
 tools/testing/selftests/kselftest_harness.h   |   4 +
 tools/testing/selftests/lib.mk                |   8 +
 tools/testing/selftests/mm/nommu/Makefile     |   7 +
 .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
 .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
 8 files changed, 659 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/mm/nommu/Makefile
 create mode 100644 tools/testing/selftests/mm/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/mm/nommu/nommu_mremap_test.c


base-commit: 55b50d965aee5f66cefe4dde3907a0e272f96b91
-- 
2.43.0

