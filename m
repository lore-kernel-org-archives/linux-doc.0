Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE53C3429
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277011; cv=none; b=tBXAgeZoE8VRcnXLFPE10Uisf4+K2c2EuqO36L9dk6+8H5cSKePiezKdhpYPWquA6e16beYw08XmhwvKxl2D+rlF+9zGoNvdzEvkXzGopNWgywhjho8/rAYP4RGDjTWCIS19bU29aGmsE3JL95y+THDRZ67bykKlTJK9keajGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277011; c=relaxed/simple;
	bh=JqOr+QH0eB1KZyAyZM/EYKd/SdOkih1C5MUT8GSFyMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjpXnZrSuKYvWxXXH2Uf9+kZDruMLq5fru9QR+Hvsvh2i2efxU+cfn1jjyYtGoCaEGGMvvYRwLJzDflki1PO16ofo2Yf8w32GvGHFY1IqRDlwfulwhNKDQOej7K0hA4jtNAo3ZvGiUDxgfGYoe+vS4NTrQ1S8OriNfDkJquLeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa3Ru1eM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa3Ru1eM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a82223ca9aso236722a91.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791277010; x=1791881810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI6VWWfK9pDI+BJghbGgcQFx9nHMTF0rsPh7AoTup44=;
        b=Pa3Ru1eMVrJ0adohcksQOK9r99fMywz5cSgJsDR9nf2Op1n104pAK/65zdeARA3aAt
         bE7Ld4+SCDiP71kBLAZk2ax2Uran5dVRC7NxAbQsqb/6/m4xK0zZXNcjmT4swLEJt5R4
         XlV3olhgGiCWfobXuhYu7nrUxmiXgC8CpQ2TF+3WbwnyJRbDvrw1TRyqvNxC8MmbX8x7
         zDQIJAtKtuU7laUr+Lfs9Yka8vIc1U9eVbdguApJW8lIwpSEsFoJXZMtn91OhsITfBhH
         dg37tgcRBy5mqI8MzetHmL77CDzH6L8APAydRUsoM3aw+ResOtABzqvoFhkKRUVIlnUJ
         WPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277010; x=1791881810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI6VWWfK9pDI+BJghbGgcQFx9nHMTF0rsPh7AoTup44=;
        b=dfbarIn9UTMj+OHNa5/UsXkY6SU1u6hwHi7pBsJ9hdYwaabtn+ZSAmXlwoKpd8xyo7
         2gBVRbCFgVFguckUPHCqfntNcypAuICL5Vb8B152c3uESJWVFI1jZ2cLWHbpdmeB5PX4
         SP2vW87ZTxQP6gmIGSRmWcopaGg5PXflea6iv3CbVm4iPoqyB7KKl9oHe5SbgUnsci+a
         JTp/3haEvYX8GUFxi1BZaewK3snNlqcEEBd1sDZq6XYR+Fjuculj7TW9eo++vqkVy11Q
         McHkZ7cW1D7YMF7+w2AjmY6voYuXMYRA3tZQVswUVxZvp+RIu2OPOavb26w7aEpDzhMT
         /WNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqc8F7ro5jXv4mHdUdHUm4huMAQyl+Y5UGmV5qTmLhU46dImxhd4zDooh8rxCLEa9GOFLbrjj+jQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvoQd8e91lYPELGBLD5MDwug/+RspXwEx3fsZjZZBuBwd6uyiR
	JCmbp7bluE1X1ZN9BtudqLuVvBuqQS08+igU8JHm3YKhqX15ES8yBeBe
X-Gm-Gg: AYBFou0Vp/kZM3omNPJpgA3/w7JjO4AcW+aCyWPuZMxmE73nz37A/SbnnO6FuvulOhz
	IzGfn2kOMdEaNf0ngodebYVp5EM7aXHHb+H56iHm5vEOJS8Z0nR4IvIObQWFTQTb3Nmm42594X7
	/ajgLYnp+ty12+7ocpsjtOHcx5THC4fbyEO40oEqvYsZWy1dhPAaDXa9eAn7EnCIwOUVfseNdZW
	bvVETBLHSNpqthtMyWAm2CsKQA1xV6grXD1Lyb0psbZmK0Kmt30b5/Ie85f3Acalj+SBvMtggXu
	uoq8e5f/7tNHB4QKvrXyTwnjO580vXpSX2tv03kId2e3pJmdX6Vdg4ApSle2m0HebTaUvFd9B4I
	H+MyeSnmxYiMo68YmxiQg6W5QvHwSRH3ctAhhFsohrEx6RygXJO9GPXzOPYiHP3IXrNp/NsLaW6
	xyiZDSkE/H02vyiNjL5r0J6TILjP0QiYaeMohyCmm2UJt/ryFeuF81O6HQFB4LQ35uyQZ6g7AwE
	3ObMbhG2CL0bH21MyJSlVaNGvBFTxCn011m8xd0LY/wJkXLhlgdz4SjjLJOYh8/Fre8fxdsUmhG
	hjfESdm4ZbGnRQRQ22d2D+/E1H0r4xth2FZlinr3aCpjRfXnBjeVMHuBM2sWpQ==
X-Received: by 2002:a17:90b:3c12:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8736af0d8mr491188a91.40.1791277009678;
        Tue, 06 Oct 2026 01:56:49 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853d00fc5sm3931542a91.16.2026.10.06.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:56:49 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id D975216FBFCF; Tue,  6 Oct 2026 17:56:47 +0900 (JST)
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
Subject: [PATCH v5 0/2] support kselftest on nommu platform
Date: Tue,  6 Oct 2026 17:56:40 +0900
Message-ID: <20261006085642.3852152-1-thehajime@gmail.com>
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

--

- v4:
https://lore.kernel.org/all/20260929235711.2287931-1-thehajime@gmail.com/
- v3:
https://lore.kernel.org/linux-mm/20260926010819.604346-1-thehajime@gmail.com/
- v2:
https://lore.kernel.org/linux-mm/20260825015945.141739-1-thehajime@gmail.com/
- rfc:
https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/

Hajime Tazaki (2):
  selftests: run tests on nommu architecture
  selftests/nommu: add nommu mmap and mremap behavior tests

 Documentation/dev-tools/kselftest.rst         |  18 +
 tools/testing/selftests/kselftest/runner.sh   |  11 +-
 tools/testing/selftests/nommu/Makefile        |   7 +
 tools/testing/selftests/nommu/nommu.h         |  33 ++
 .../testing/selftests/nommu/nommu_mmap_test.c | 264 +++++++++++++
 .../selftests/nommu/nommu_mremap_test.c       | 356 ++++++++++++++++++
 6 files changed, 688 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/nommu/Makefile
 create mode 100644 tools/testing/selftests/nommu/nommu.h
 create mode 100644 tools/testing/selftests/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/nommu/nommu_mremap_test.c


base-commit: e8d0f6a1b2a447d02845984fa6288787543cb03c
-- 
2.52.0

