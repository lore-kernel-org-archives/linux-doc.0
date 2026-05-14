Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B038F939
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797593; cv=none; b=bmvOGJhzrIGlbPAgzjaw7sMdMiIDt04lNlNybRkWrJSgNYa658cLaeKYjCJxNUgmZQMZiS00bKAZ9Gm5gTQPI+VvL/MKKuQll9XYlyMRoEm/YKMtb9CSiwZfuOnz1K1EHNzIB9VqWdxxtpKLEW0BQwiUXBM2U3iMq6WxAL5R0xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797593; c=relaxed/simple;
	bh=GAkvPl1aYT4/hWJx1lZpBcP6BmfygBZcILSUemmf7eg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=F/WdVzwB+dimsiG6bFwv94PQSeVnJPxBgc05iaCe6hoZ5zUgTLZvQIoiWsen1lSxCUsp2M/+hzECzZi6DZXNbvf2Mr1RG04JpXrYpGBhc4JK1TVKEB1XczF8eF63wtwLRcynmxXaAiOHyc8XH7FGgUXHOIsXKeID1f7Nn3ybOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Z7EJXRiz; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Z7EJXRiz"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50fc496c8baso80336321cf.3
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797591; x=1779402391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKaeCysGolB8wQTRAqT3H/WnxvkmBcYreAX7ZFxRMf8=;
        b=Z7EJXRizGTQG0w7jbSDW8cnih3io2BcOqced8INVfUW5q71/W21xjhGuE5oB7wydrG
         BYvHOzs5mZHKOGld5EBu52vMIn61QuwZ0thpsTy6aYEKnU6+jAGRvpYwJp5gxJtQSHWc
         oN2EoblHoVpnhGFh4NkUAj9oD5Wb9ftoMOtYx89x8+1w+e1vv3r+35VvZQRRjKWpz11u
         TKrzTmObTEan+0SCCmogxkaN4NfBE1dWZPF9Cb463Gc1IG8F+4UDm5fMnC0R2eD3i32s
         pP7/nQlTQRGCn3w3YFGVGZzhkxqpGcDEZOJUi1c5qFJajWwyNE+9GZf//UfsehRnpDPm
         b4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797591; x=1779402391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKaeCysGolB8wQTRAqT3H/WnxvkmBcYreAX7ZFxRMf8=;
        b=WfeKjcJD3tpCbur6yDlppAgUGsaf72eBdi7Y+PDm8q78Z8os6LDCaRnmnZCdl5tvPC
         O2o1hNgHrbHPKxbMyt3aMqivcKjkqmT+sEeEzpocxyJe81QzviJOJUCH2+ynvOHk9UkF
         AbJ+gOK+SQuEPqd0/j0KQBp6RbMSGTTNuEEvtxHbf7oj5S4lPJKgfACR7zZhIOAx0Q6O
         bmy8zAkc1zccIHH1mdhrKRb6rZ8qQ23xpnvFztPep1ZSrdBxbVtWqgEWuT42Qxs+s+d1
         3vbQlRYXuHIIbAf9f1ogEPYn/6gao2DDN/b/SrQTvjkGJOmwQeG70C5123xGcB04kmTX
         pXaw==
X-Forwarded-Encrypted: i=1; AFNElJ+AK8djmP6H8Or9+JkFknP9FjA6pd0Swct9IYWr4k6Yv+vqxfiEmDJdKVb4h1DkD5GVBvWxDdvtP/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyoGRtxlGXzjktHOXS6ZYC8yUjWMeIhuc+6e3IKN4CrYgpbsfE
	DTTa5SwGTS1fLlcjROCf9RI/7HbfxiVj27mzfmn+EFyupB6qb0JRT0nhAeN17hdMEM0=
X-Gm-Gg: Acq92OGI2MuC+QOVL0cftmkZ1A5CuTUJiEGjXtx0cvfa/W2LGlLaVXV6yyM2patq4dF
	7MNcBTIgeao0rNVBX8EGF+kqoZwyogrTcWEWyHbHPdWjb8jc6/GKOTyy1A5SxyYEKGVTqd5Iw8j
	nyiTrpDOwFcqlhEyD256CdTHmkzkdSQ8lFNr7N5QhnBFWzSMIAjr4Dgfkyev1YfQz3D0yIujYUz
	SA8Rbo730zPEyv+4QWH36C+d0vsTVwaotws0Bus7kSC1+LYeEqhYAU/Zibcmkg/vqh+mHSocwSz
	e2GsMX4xDO/9fFj/mZUOiWz/qkeyUH8t06A9ZqgaLz8dRp+8re3Sdjq0y30oxQF9/cbVkfcC8O6
	eSEJ8SsLymf0MWerqfOnATgOT/wVqT/LJd8bPJMNj6uzU/qBcHlrhDCZFlqm0T+mwsEBr7fVKtu
	LDxzecSRJmn36IuI4TvuiF+1V58e78gAtc0vpcagrlMNmGMSZ+hwU=
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr20823261cf.2.1778797591454;
        Thu, 14 May 2026 15:26:31 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:30 -0700 (PDT)
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
Subject: [PATCH v2 00/10] liveupdate: Remove limits on the number of files and sessions
Date: Thu, 14 May 2026 22:26:18 +0000
Message-ID: <20260514222628.931312-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the fixed limits on the number of files that can
be preserved within a single session, and the total number of sessions
managed by the Live Update Orchestrator.

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
    - Introduced LUO_MAX_BLOCKS (10000) as a safeguard against stupid
      excessive allocations or corrupted cyclic lists during restore.

3.  Expanded Selftests:
    - Added new kexec-based tests verifying preservation of
      2000 sessions and 500 files per session.
    - Added self-tests for many sessions and many files management.

Changes v2:
   - Addressed all comments from Pratyush
   - Consolidated LUO state management from FDT into struct luo_ser.
   - Extracted luo_file_deserialize_one and luo_session_deserialize_one
     helpers to improve modularity, and later review (Pratyush).
   - Added dedicated luo_block.c for unified linked-block serialization
     and management.

Pasha Tatashin (10):
  liveupdate: centralize state management into struct luo_ser
  liveupdate: Extract luo_file_deserialize_one helper
  liveupdate: Extract luo_session_deserialize_one helper
  liveupdate: add support for linked-block serialization
  liveupdate: defer session block allocation and PA setting
  liveupdate: Remove limit on the number of sessions
  liveupdate: Remove limit on the number of files per session
  selftests/liveupdate: Test session and file limit removal
  selftests/liveupdate: Add stress-sessions kexec test
  selftests/liveupdate: Add stress-files kexec test

 Documentation/core-api/liveupdate.rst         |   8 +
 include/linux/kho/abi/luo.h                   | 140 +++----
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/luo_block.c                 | 388 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  57 ++-
 kernel/liveupdate/luo_file.c                  | 209 +++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  70 +++-
 kernel/liveupdate/luo_session.c               | 202 ++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   | 101 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 15 files changed, 1068 insertions(+), 378 deletions(-)
 create mode 100644 kernel/liveupdate/luo_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 34e8f02817e31826e76bb2ded48bf28fe921f20b
-- 
2.53.0

