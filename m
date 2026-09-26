Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE554706B
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384906; cv=none; b=UXXFtWuajJOEFtJRNCh7Ru5Sfy/1HbqO2i+4QSsdaKVK8CHLcHGPdpqp8lBr2OeZmfPXjditUSV65Mg7iXzIJwMniF1D9tU55v6htlVNaNbU0nTAr0j+ovUzmXgl0dCfzVbIrFdcQXwCQ2C0lK0GYd8IhyJKB8wtBcHnjD8vyMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384906; c=relaxed/simple;
	bh=a+irTCgD+UMd1oRzH6NzbWWqcB8zfTi78hYIbsJsPNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oakdko9+MKrHQVSUVHHAaL1DZbX9rwO/mvR4ESiG+dn3UU1Okx0Y5J5rfGsJk7EwhdJ4W7BhDDxIodQ3nzNTdJrT/xADnDU9808SpPZXZvaKale6QwZYYJWxPuHu8+E928L1U54J/iXQZcRbag+Ou5eo6jxzsr0ySv2s+q5/II8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLDptfgH; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLDptfgH"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so936712a91.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384904; x=1790989704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8o3YWWPI331T0WI+WVvTTsIk9M0avmYjoyCPD/hirYQ=;
        b=LLDptfgHR+yuHy9GjFiybC1frDWERgyqfs/NznrOgFu+rkzg+mTwfZHZ2JtEC3OdlR
         ZLuRmayY1rBzdcD79UijreYKyfcX/LficTaRPs0mSnvHMxzAYWvm0kLaVq1GJ+AlDhSs
         ZNvvNdoAvR6ewlN351J4Gf7Ts9DcepmhUweYGx/9Oj6HETlTg/qzhkAZEJUoNr9nikPT
         psjeSq2dWHpC9iSBsd+p3YAvjVL5C+eWkiNcSshwVaF4ZCnOnVbO00LZZAvBAU+XgIXW
         DWCt2czXQ6UENYBW89vfhAUCB9JTcC8qaXNW6tBI5cxv3MWkDjtHFmqa/3rn7PIk8/kJ
         3Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384904; x=1790989704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8o3YWWPI331T0WI+WVvTTsIk9M0avmYjoyCPD/hirYQ=;
        b=pIOqDzQ38CdwLutOOnOQKAhpoXF+SOZmLIY+1enPkO0XrpwpeGi5PkpCKbfWTdWg1w
         Tm7rPSiTCTpXYcN05jT7BQU7830bwjpAvy41F3w+RtgZIa5ukUQKfWS5ttMDudnTmYw6
         pvgBZVL9cTh01n5uZblX4Sm+x3twomjBuT9FWKPbWrV+ChYyGL64t4O4XLef5t8bQFxu
         scWUJ5Q8K/Y0dHRjzUf/4UGN4V+0xJtQnfIXCebIxKZ5BDT4yagOdtws8d1ekoeEYFrB
         6X2HbCUNudoeJIXuNe+FXXxUICG4ZuPoYyuCBNPnmu0kiWW/Z6a70fhB/6Uf1c59xD8k
         pNcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcedBHFnRj8ACnYWHwDe2iAxkcfoLJvdAJQZVEb3HkqFELpvUGH8pOMmq0mZMbr2I/F1EzMnKhanY=@vger.kernel.org
X-Gm-Message-State: AFuF++nEL0W1GkZpqUX6+2Dm0BMIBrIHJJJb4qwuyb8j/d3QccttrlGe
	vT77SyTTYHPMmo2nQSps/s5oyiNDN2cs5yS4PPuuvdZqrdHgwuba4uhz
X-Gm-Gg: AYBFou0Ow2u13XwcsTWdw8tSMW9jkig1W4SJYQVd9zLDB/dTojjDwE6+GZWjiPAHtEX
	Ptnr+E3OpUfKVCu45wtsHuFPcucKFm/XEdYJ7v+kD0eTaXrTj3qepsseTeLdP4wPTqLSIDoVigD
	c84hytF0/bYCjQGS9ljTF7su1in/se3rXKfK/vKwZjIgCNTbPRNgoohHOYXxZEop2mfLgpdWWqc
	kJ1V6FypPnR9++R9kMeStIm6MJn50cREEhbpGU35NjAruFCI8w509rL6I1D4QwGKc+Db0A8DXBk
	nxyvs6+e4inGZXOjc9lVlHUG8aTKUynVGLFcGf2z2O/p0SVWvgrCpnevdCBaPtkgG63dJvxMev3
	Kw0kfi9frnhG0RKrHZaGl2huN2YjNtzyt1VIbz4o8lss+gVsgpDauMi0vGZf2D4sSAlcdQGZ+T6
	l5gl8dLMewSQ+vOhcm7iNzdraO6rh0qBbQrzfq8NgJXX1B/r0+Z+mAMEWCTfh2VVD+rWo5s0aVO
	C+M0in8GJ4GT+x/SD6HgcmmJMrEwENsS/I+DKx2GHYta6DeISChTJc/8VSpN+yaPI8bAZUdtAy+
	QJFipZieufvPS6jp/ui8nyPpOYhMrW/yF2BQaeSqi7rEFDn+ZfOabHG7o4bC
X-Received: by 2002:a17:90b:2604:b0:3a0:d9ee:a2e9 with SMTP id 98e67ed59e1d1-3a0d9eeb955mr765639a91.45.1790384904050;
        Fri, 25 Sep 2026 18:08:24 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm7032117a91.6.2026.09.25.18.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:08:23 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 5950016C9C94; Sat, 26 Sep 2026 10:08:21 +0900 (JST)
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
Subject: [PATCH v3 0/3] support kselftest on nommu platform
Date: Sat, 26 Sep 2026 10:08:16 +0900
Message-ID: <20260926010819.604346-1-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds an ability to execute kselftest on nommu platforms.

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

Initial shape for this patches is implemented as an opt-in TARGET, not
built/invoked automatically if users don't specify this nommu target.

- v2:
https://lore.kernel.org/linux-mm/20260825015945.141739-1-thehajime@gmail.com/
- rfc:
https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/

Hajime Tazaki (3):
  selftests: kselftest: avoid cd - in runner
  selftests: run tests on nommu architecture
  selftests/nommu: add nommu mmap and mremap behavior tests

 Documentation/dev-tools/kselftest.rst         |  14 +
 tools/testing/selftests/kselftest/runner.sh   |   9 +-
 tools/testing/selftests/nommu/Makefile        |   8 +
 tools/testing/selftests/nommu/local.mk        |   7 +
 .../testing/selftests/nommu/nommu_mmap_test.c | 258 +++++++++++++
 .../selftests/nommu/nommu_mremap_test.c       | 362 ++++++++++++++++++
 6 files changed, 656 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/nommu/Makefile
 create mode 100644 tools/testing/selftests/nommu/local.mk
 create mode 100644 tools/testing/selftests/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/nommu/nommu_mremap_test.c


base-commit: e8d0f6a1b2a447d02845984fa6288787543cb03c
-- 
2.43.0

