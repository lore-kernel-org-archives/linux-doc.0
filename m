Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27DF3F0AA4
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457349; cv=none; b=QecCXlQZUEWa3TTq5Dwqfpa17LhCPyK42/RzuKLhXMAIqfXgHluVaQTIDRAkY08SGmTUDSanOhPhhmhc2ww5do2aNM1uXekxheKWq6hrEIHiQDjMnTBUMxqu8c78E1eXGS2CHHWgjJhdfAzi93CDWbofZH/py+uLbN66drGkqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457349; c=relaxed/simple;
	bh=4eqNP3XoePVXzwv3BCh7E9Y7MGv7TTYrbKrgAOH3xww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lJmhr/6oksoNMjhdJK3/nzacilAvM30jxc+/OOBFKvUit7/9qp61d409rWni//ngVUWEfk4FRHPvYP45ElVm4n2TXXRiLvaflfOxMOTTLU90BJT/aOVDpTplGze684q/IUspxS3MMfL3fQp1OiLiuhEV7+5T9VoX088G8y/WgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=E696315j; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="E696315j"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccce57762cso70424886d6.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457347; x=1781062147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4+c0fQ4LYrHNLHZUplyns5z+KGYVI4xj+rLgvLL9F4=;
        b=E696315jW/n+q05CVbFIqsLaoXWuwP6nug+3hc2iWe5GQkaz5hxaA54RMEUD8LmqNA
         YTT3zvRLJWEanUb9YGBcvhGa65XwVUjB8ASrUiCDvU3bIRJQ5w+Sbn8C6DQmev6l6Tnk
         YpmJluwhJFDzgX9EOZP16r5Rq/9aUyIjy89ij0caByoIEsiHrqDhLSI6xYZA+iw21dAp
         gf0HoGNwNfKebPhx2/Y2MkgF+xWw5Hg6b5ma0FgUkzxG0HDRaL0idd1xECwBGxJWoH1X
         z9GK6eZTZrdDKovuPZGpZjk+/gl6JzrDHk90YbAwnoFkcbMw9rxOMTix92NYruIWYfXC
         EdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457347; x=1781062147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4+c0fQ4LYrHNLHZUplyns5z+KGYVI4xj+rLgvLL9F4=;
        b=NWntiD4BBAP6i8GyxRjT+KKMSS0kVZuo2MGihd/a11R1iV8lqh5XoyFGfUCAUcgfDH
         +cXOcENuiqjQ47/fC9eaUDgzmt6wFAnlTFPPtOR30nAfLDyGGOFNGICvBnYqssNALRey
         r0ZiSWFGs3scISTmDKbQWelt5O2nMQ3cahYpsCSEx8z251h04NgsXWorEgTf47hrbUnR
         w153ICLam6xGRTcvGtCgTW1KDGPEeGoUlglEdCjag2g9z6q5s2ahxSnSpFMi1RZdKlQ8
         udeuN2qjRRAMBew/9P62w/zJsH6yvey2VCNbfE37avnRd6V5/hRx4ZodMNzb+6GC0PO7
         qJnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vF1Rc/r27LeV+G2YMbn9eOBPlZ/nn5MSMlfSULjZjNG9DBoYeptCEr0sN9s2pF81ldsFlZ8z95XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8ZFDaQ2zkb2cFRv0/s7OPOFN0lmzHuauhvAE4uMbFquWu3QC
	u4DqNxOkivzP702PAQlc9a8zfSHlnhDRbpXwn56hLlv6D1/ljBkHsBgRP1Jns6Ot9e8=
X-Gm-Gg: Acq92OHrm+2oIsUezWYjDqlaqZDx009rEitE1Q0mcPVcvwpE9WzaHkzUwnlq3iaVvnR
	uzwurGZyQTLOWkIf8lzUY7ZhfTImP/4js2PdJ+KQW5KaVyVOktxQVK7rZ9GYtPnjjwSFpqk+A/W
	eiKkRs341DQyDxbcEpwm/rMVcnH7o7gUjYMYwz7Ic2ZuJgttWNRevV9BqhVKaPqEq7ENCl/3Ttb
	xfYTt6nU6rsRHPLTrltwhSXhQmdifiOQlEvk7oGydEn/mqOmZvh8Hzn+bICZ+D9+UoTS3KSnWRB
	1VVh/22J2NoFKYuOZyO/5jyD8NNBpOapkFkndmadZFYrKck2mzoQrf0EXwR1cbYt4ooANgJtXNh
	X7p8ME8DySkCNd7p7X2GirR6tvNenPI/5Fsm/McxW+sCI37htBzrPVNVFIXvaUGcAcaM4iqXIcQ
	aJT8wSnOguQGjQve5yXLfWfpufJ66N2Ihvzc1YgmqKjdCyQlZXhy0aRA91ryZMMg==
X-Received: by 2002:a05:6214:493:b0:8a1:8b0a:6678 with SMTP id 6a1803df08f44-8cece03811amr23330036d6.31.1780457346835;
        Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
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
Subject: [PATCH v6 00/13] liveupdate: Remove limits on sessions and files
Date: Wed,  3 Jun 2026 03:28:51 +0000
Message-ID: <20260603032905.344462-1-pasha.tatashin@soleen.com>
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
Branch: luo-remove-max-files-sessions-limits/v6

Changes v6:
- Addressed comments from Mike and Pratyush:
- Simplified kho_block_set_destroy() to only free successfully tracked blocks
- Enabled dynamic entry count tracking in kho_block_set_it_reserve_entry()
  to automatically update the count field in block headers on every reserve.
- Removed the error kho_block_set_it_finalize().
- Renamed various kho_block_* APIs to kho_block_set_* (e.g. kho_block_set_grow,
  kho_block_set_shrink, struct kho_block_set_it, etc.).

Changes v5:
- Addressed comments from Pratyush:
  - Renamed kho_block_restore -> kho_block_set_restore, kho_block_destroy -> kho_block_set_destroy.
  - Renamed block iterator next/read functions to reserve_entry/read_entry.
  - Added public helpers kho_block_set_head_pa() and kho_block_set_is_empty().
  - Added validation to treat zero-count blocks as errors during restoration.
  - Simplified block iterator reading loop from a while to an if statement.
  - Changed standard WARN_ON macros to WARN_ON_ONCE on iterator allocation checks, and added warning details.
  - Simplified session serialization by removing a redundant NULL check on sessions_pa.

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
  liveupdate: defer session block allocation and physical address
    setting
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
 include/linux/kho_block.h                     | 106 +++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 411 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 205 ++++-----
 kernel/liveupdate/luo_flb.c                   |  60 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 219 +++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 +
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1196 insertions(+), 445 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.53.0

