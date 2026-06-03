Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209E93CF69C
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501447; cv=none; b=IkZNQWgDwneZ6oBQbKyfQ3sY214WJ7fXIYJKWyM+nchAvrHI7Ad8VYdTTCMS9xQqY3hJobZ/ihofLAkXoOdFziGcp4VBiOo8yYB7xiIwZ3OCTGtj3M8XqV9i+QMKcmJjaG9l8VzHwuZpGZ/Ua8QYih7iBpnzUkql/zQPZ5qeX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501447; c=relaxed/simple;
	bh=b2e1N3WNuvDqJwLy2iHEiZO66j92zWhizs+pziHMFdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Hk32pmV7BZ5d1n63W3BKAAWOwvMfpxy+yNADmWE0pbc0xVSxQzNXBQ9eiQIdUL9sAv9xZ51NhMVezCYeATPIKm/V+I+gNPAQreLcB562qgs5ZN7q+rRNYP2n4q9+KiOqXoaD/OolSHRIAmRVs5qOsybfIO5Bf+DxXFJr7hYZtrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AeiP4o0S; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AeiP4o0S"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5177945a279so10231821cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501444; x=1781106244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIUnOidiefXcspEuuyeBWqUN2o/RTn4ccvxerf6qmvg=;
        b=AeiP4o0SQs7/+qjbTS8pfRnvXLty/b/jQXIr6AWkElFAJ9pRuFYSYDVI66tO+WJix7
         vDQFa+AyfGmup2BfSHgl+4xss3il2lHzjBjTua904POHAo0DdUTmSyMLdyxDg7jm9tWD
         FTGo5BFq9hmWMSMVto95LsTbTiEyXl2z2R72Z06aavfPbIhiD5FV5MKOMV/e0N885H5p
         WSq2d0FM/bE5Rv7qAB/FN5u8MmqiZBDvovlB8+CBU2i4ZSJMwPlRHAEcSl2KInR+L7Pv
         upmYRsrkHqQL/p3cRuF2FyVoc0NcUtnDzeV7nHQn9arnbI3dBo/xL33YjFuOPPkBP1tw
         O0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501444; x=1781106244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIUnOidiefXcspEuuyeBWqUN2o/RTn4ccvxerf6qmvg=;
        b=aQMxvO01elQtOI7r41ZTVfIbztOj5pRwUBAK/m4SmvvcodQ6Sg86dLvulRtjYSw/bc
         f4vkZHWpuXm3d2DNiKce85xjsKj7cg/hmmwoaqP6Wtd3WS9GQz8cJWog6QjfMyw4Ctv3
         /UKzJZrB3CAB9Hk2LqI5Pe5BNJ9uVJxOQZE+bbcXHf0C0vGKuVCdSDY0wCvKgL1WmHgK
         fZ9qKkYuhD7NtM/umCVrziQiQkMrNiP/0w6lVEhRJhIdqYEA64cYLpQ5+bEVMyjMIduP
         ZLAPz2UgZvKYHIomiGmImEKBJ2PDhPjYP+LRtDTKc7K73zTyPQz2lQs6HhoBrUNKBrui
         5j5g==
X-Forwarded-Encrypted: i=1; AFNElJ+Ez8GrDgT9rIvwubz5VAJdG5D8Vp94bB3jelM7YIWPtHtRsHJaJm29lqu/4JeCXjITCd0zEuUpDhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OTqNGqs9NLbV+hDQEIif56bFG5irHZnz33X2Blnd9ZehPbZM
	u5JR+hsFBhN/Bk0hXk+kuGU6YHxX0Z1C1SRMqhMw7lXyL1XwLzgvLVOa4FAPg7zUkqg=
X-Gm-Gg: Acq92OFb77zwVH+OwJeIFFP09yO79UCA0pwlo6BFP9tQyedmfAg4+nqHkae5GC9tI/7
	11V7uxTwQ2r6Q894AZthdCol+4q/kAYUnHqky2zE5n4N3TxcOCbeFzGq0oImHsKoB3zX5EzquWZ
	p/N0aWwINV9voPlZU0RdTCp9s7mISYGFGoy9+zGgLoLlx6Dmsjj2YA4gopCZuyz9CMJDkkWG7qx
	x9LHFAGCYSrw5ryn/j65tpFt7XxD73FMfZA1OCeZA0lQKGvyJ2UESj6IHryX/NTfX9etBImuWzG
	5rTLfiIqlcFH6gaju0erl0oHDV4/dhaUMXevBEKOfNVUXjMCH2GwuTF8exvVB+Sk2Ll+TQOjXPz
	tVbRXYGv1uQz1sAK3OUaX59G8njR0RRnpDkSz+gqYz5pBjVIvIgeEg7YNhZK3wPwEQkjhODhQ4K
	eJmHRLZIi8SE7DAFz2cSl2dz64/gCgNrJlfOKbM1fEjpkgtdpjZWoltd6V7HEkMg==
X-Received: by 2002:a05:622a:313:b0:516:508b:bf4d with SMTP id d75a77b69052e-51778789b11mr58906021cf.56.1780501444077;
        Wed, 03 Jun 2026 08:44:04 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm26996561cf.4.2026.06.03.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:44:03 -0700 (PDT)
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
Subject: [PATCH v7 00/13] liveupdate: Remove limits on sessions and files
Date: Wed,  3 Jun 2026 15:43:49 +0000
Message-ID: <20260603154402.468928-1-pasha.tatashin@soleen.com>
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

Changes v7:
- Addressed comments from Mike.
- For changes in kho_block.c, and updated to use gloval KHO compatability.
- Collected review-by's and acks.

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
 include/linux/kho/abi/block.h                 |  54 +++
 include/linux/kho/abi/kexec_handover.h        |   2 +-
 include/linux/kho/abi/luo.h                   | 148 ++-----
 include/linux/kho_block.h                     | 106 +++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 416 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 205 ++++-----
 kernel/liveupdate/luo_flb.c                   |  60 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 219 +++++----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 ++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 +
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 20 files changed, 1199 insertions(+), 446 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.53.0

