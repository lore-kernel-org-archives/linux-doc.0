Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D04261B9E
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179583; cv=none; b=A5IHha8+sWlULB5s50QxXU919ThP9Np9U5uK7CXc81YIBF/jDQc0jkaXImG1fMBihN2sRe7Ce3nBMVsE/YnMZsEZXj7IxJO2BvIETVPtI6Lt/t9T2LoHZ3OkMOTBnowyjbH6PVL58r35mep55SYyK1Aac2GQWGJkirka1PRYGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179583; c=relaxed/simple;
	bh=9loOIylvqKy8l4oNQ0D0Nse0Yq2cB9nHrVbowE29lco=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SYk0N3uXF9rhfPEjVZBohmSGSt8k07EjpHqMWZCng39JLbNYdlSjPGJHBj+uuL8lCpmBpuftDFC1Wk2LTC5Et93Ex0ZCUoye6zs37MjBI1M9ed3ZFlqbVPHs/Aa8vfKlxfLdDfIXHBmyhVjqyH6+BXtgmMrx47QjeY6ztyALD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=boRTZkUE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="boRTZkUE"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9154ca1aa1dso53032985a.0
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179581; x=1780784381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Pvi4u9YaDjGAHaiBChsK2kBa75JO+Ko/uXGwG0BtI=;
        b=boRTZkUEFmCKBXnukhUyIuxvQyzc/Fuf25kl1S+YomK/Wj1DdNAbjmyYvrwdG3V2a3
         37KZhgYEe9CBNuZ8i8ehkCgvFT6GUbEMSqVFu3KXHfrQVeVTs0uM+GREgq7dGRlGZlyp
         3Bo/1NERmUAAoeuJ+++Sn1FoYmdBVGPu81PNW22jmNtnuRBathj1+VUjI58xtQ8Ol1IP
         4gr19ywqX4PaXIgmYFvqm/TYdLHCh+GrPxzWAsljMih0E6sJg1OzjN5MczOT6r8+7Z20
         0tNd8SXnHI1wnwahh03y+GahKvewbLi/rMzzmP91ULAoT8VqbwAfBpVNY1rcVm0NIA1U
         IoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179581; x=1780784381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Pvi4u9YaDjGAHaiBChsK2kBa75JO+Ko/uXGwG0BtI=;
        b=hx6Lu/n82x8DBbNdgC54bUppmilPLzlmVoVApznJA40fDQROS3lrSC4vt7gSOxZLv1
         cSsVKeu01UKMe0q814dv01bEYs0T8y6MYfQYTAaSq8YHFDkF8jyn9DtzbnyqpvySaTIT
         5Cmx08seNBi3gILwnhRCctdRGLicGBA6yz67AaUDD+47WmWWtos5W4Uk+PZsfCt0zxxN
         hGk00bNNUb+scSO1FanO5c43edZkURw5avd6RLRrfqLLbCT1EdJkge4PGdjkHCqhAp8F
         S65+Vf7MTxe7oAqksUHyZEh5LjQjGpkGNVHEPWnhD17kYv7iZx6Bb7L+wDUWfSNDG64o
         3WiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PcKKHt9+ZPj4fj2ByvDh8fd26Nq29LxFj5VmsdcLgXRAAZIbpRo7qBcg3yZSHf4EGPhl30bWdCA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyemRdpvoN7eUA8m9oYmxxSsqq4dVE3GuHf2EYmP86xAJeuBJmL
	SRCjYrGdPDaYl7CnBROQcEImcCjdaeZeLmVoO67CHdn8za6wlvfZFjPVRpVqUwlz+uw=
X-Gm-Gg: Acq92OFdJvWSgaNKzC8REwjlERbZs1/XYhFJjQjQQ0ypOXujAkD+MkrEACC8t7MvW9h
	byab5DlP5WvDmZxdLsoK/KWqUFcuAZFRmUSFl4INc1xHTz1hZF+VJDY8UPiuNafG6isN65rdHWZ
	N9Zvpp4ycUw46PYleLAbbPkDu8aDVGezXBY7hKZuIau8T4b4bMMv0+tPA7ZYao5dGl/bXEIAK1N
	BYCCI0+nF4GEV6+RyEQNoXeFYr3Rt1Paj4Mfw9iUI8i7IlwBAAzmr8gOAt7s+X0LSGAUgYOr+6l
	Apo8FEu7wqnHXF9VkqGyHkvdeB+3e26nfcEkZgp+7dc0a9KhXxsU6k5mbcWy0OmzaSYaZpXGQpS
	nPFa4gxPPegN5Y2vDobVxi9VICgsjHhXfNjsMEG+qrPlJ7CXorLsf3DDYqxSnRTQd85fvate5qD
	txwgi658I5MOcv1Y3vUNSAbAEL5CLcpSSFEd7N6d5lZ1oJD1CjGZXgC/6padfTOA==
X-Received: by 2002:a05:620a:172a:b0:8cf:d80c:5ab0 with SMTP id af79cd13be357-9153e0a76dbmr564555385a.17.1780179581378;
        Sat, 30 May 2026 15:19:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:40 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v4 00/13] liveupdate: Remove limits on sessions and files
Date: Sat, 30 May 2026 22:19:25 +0000
Message-ID: <20260530221938.115978-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series removes the fixed limits on the number of files that can
be preserved within a single session, and the total number of sessions
managed by the Live Update Orchestrator (LUO).

The core of the change is a transition from single contiguous memory
blocks for metadata serialization to a chain of linked blocks. This
allows LUO to scale dynamically.

1.  ABI Evolution:
    - Introduced linked-block headers for both file and session
      serialization.
    - Bumped session ABI version to v4.

2.  Memory Management & Security:
    - Implemented a dynamic block allocation and reuse strategy. Blocks
      are allocated only when existing ones are exhausted and are reused
      during session/file removal cycles.
    - Introduced KHO_MAX_BLOCKS (10000) as a safeguard against stupid
      excessive allocations or corrupted cyclic lists during restore.

3.  Expanded Selftests:
    - Added new kexec-based tests verifying preservation of
      2000 sessions and 500 files per session.
    - Added self-tests for many sessions and many files management.

Tree: git.kernel.org/pub/scm/linux/kernel/git/tatashin/linux.git
Branch: luo-remove-max-files-sessions-limits/v4

Changes v4:
- Addressed comments from Sashiko:
  - Enforced file count mismatches during deserialization as a hard
    failure.
  - Reset bs->head_pa to 0 in kho_block_restore() on cyclic block
    detection.
  - Added two small fixes to pre-existing problems at the beginning of
    the series:
    - "liveupdate: change file_set->count type to u64 for type safety"
    - "liveupdate: avoid mixing cleanup guards with goto in
      luo_session_retrieve_fd"

Changes v3:
- Moved the linked-block serialization infrastructure from
  LUO-specific (luo_block.c) to generic KHO helper infrastructure
  (kho_block.c, include/linux/kho_block.h,
  include/linux/kho/abi/block.h).
- Registered luo_ser directly as a raw KHO subtree instead of
  wrapping it inside FDT.
- Collected Acked-by tags from Mike Rapoport.

Please review.

Thanks,
Pasha

Pasha Tatashin (13):
  liveupdate: change file_set->count type to u64 for type safety
  liveupdate: avoid mixing cleanup guards with goto in
    luo_session_retrieve_fd
  liveupdate: centralize state management into struct luo_ser
  liveupdate: register luo_ser as KHO subtree
  liveupdate: Extract luo_file_deserialize_one helper
  liveupdate: Extract luo_session_deserialize_one helper
  kho: add support for linked-block serialization
  liveupdate: defer session block allocation and PA setting
  liveupdate: Remove limit on the number of sessions
  liveupdate: Remove limit on the number of files per session
  selftests/liveupdate: Test session and file limit removal
  selftests/liveupdate: Add stress-sessions kexec test
  selftests/liveupdate: Add stress-files kexec test

 Documentation/core-api/kho/abi.rst            |   5 +
 Documentation/core-api/kho/index.rst          |  11 +
 MAINTAINERS                                   |   1 +
 include/linux/kho/abi/block.h                 |  56 +++
 include/linux/kho/abi/luo.h                   | 149 ++-----
 include/linux/kho_block.h                     |  79 ++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 384 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 211 +++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 242 +++++------
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1161 insertions(+), 460 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 5428435567cbe06c19914592fc22ca23c9ca1de5
-- 
2.53.0

