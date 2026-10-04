Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E6471CEC
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135316; cv=none; b=nCndP0+4QAVVKHNcp/8YL9pqNrkajyC6tc1vjMlVvRfw58D+ui99wwjsrgS1LH88hqBdNhZd44hZ17x4J9G+31Z1v5XKH/N+d7Ya+yyv1dzdJcKwV6Ytw60oXBtaaPS5pQbHzaqaROPeNPjnKkfdcs/NFHEjUpRpuyzNidaW41Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135316; c=relaxed/simple;
	bh=bP6kDGyFt3pSjYQAf41QGrRFuGNBrE/A6VLuZxy0aRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pg3k2R9YDJbGOJY1/v0xJh3g2YNfXC+FScFwCBj7KbHyyfFItKNWHnMZiRFRZcAUhn9w05HWrqBpa1vPOMvrKiG+q3GUs7sgWJFy4JoN4IVZTV8mg/Jt6vyrlGKq/KTLJrZ7Ckz1/J5EQDwdX8DtF/tBF8xUOS/OqC7TSfOhuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW1M8NOy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW1M8NOy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-873a4edb243so760231b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 10:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791135310; x=1791740110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dn1khiiBx/qPuh1ccNEwWHRK3a1yYP7lWHo8iux0ST8=;
        b=hW1M8NOynorLTGeADroRWa0mMR78MWCWfsuGs9+pw3qRqNzAXPBnN7usRSoGV69YyP
         L3YL7XuOR/o5yBR8yJjTQMNu3FDJQ0mopx05LXlWQ/THHM1TLvZHdQceSDoZfVH6wTre
         e0DUXdOdbxx4UydQRkL7CAFlmrw1rFFhDgEq99u6Fz6ktxMgVF90rr7sf4294QA1Keq4
         dsN+My6X91Bq7raS10CntJr7HJQ4tco6f/BX3ALvgM2PTl2tQOdEAIslMbhMwmgsX/uT
         lVcP21YLuxX7gb7PiuVAk4BmWwu86mtJumF2h3g4nKjNHx1SMd2U4cB8YEW+ryfSkZBs
         8OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135310; x=1791740110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn1khiiBx/qPuh1ccNEwWHRK3a1yYP7lWHo8iux0ST8=;
        b=AnospfY2fRGJXecLJB3+npKU6mggzkGBPu0tutHi7L+ZRRBmkYh83GRqH7EST0jJQe
         yXuL++IgIXrVJDJM4k3kQeQlDPOJACIBoo3T4tSMh80WjRNCXTJVqUfMNMbxjizN3Ymj
         hloSyOgZz/9Rt/CWi8ROKPZKb66/1JDjLpjZIEDNekQ0V7wHAqqOn9tUJMGDq+GQjyC/
         8uhFZPFV+aFmfj+9xVJe/uP3XSioXL1b725PFXS83o0fyjWVr/9lctW/3/Bw26Yg5Vqe
         X0Lp3GolWoiDPmzfxkSMKqUpttQTgoXjOovZCF4wJ4QSrhdYxhFwu59cwoYE4wrN7khs
         zbcw==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ/oIw+ZpWlQDrgtWcSUHgolQ4/4vdqqTxMvrJj8FfSJMgxwCOo8NsgG0ttRkOYk/xa3PO/M377M=@vger.kernel.org
X-Gm-Message-State: AFuF++mP2ZzGkBOY6j27FpDWX6nMSCT88gZfZxukpcITnsmAVgcnO6zo
	LusAFqSy6mxZg+jCAh5zl3I8ooqkz6PzPpym31M0j/u8s6FLgSvvIl+B
X-Gm-Gg: AYBFou2AQVuFAu3UgFsm72evrtVp2hYLXM66xQ5kIArleKvvnNyIKb7TB4HCJIlJw9x
	8pLCK3QlX0Enp0IYhjsfKK5zAGcUOK7KujfdMB6h9FY9NR5UeV3Wph86S2yUfIOlolmTVD2GS1s
	U/7ChRdP/MY3nDP+GygPG5UQYQQ6uvwd1zqxceryH2pGZbh7V3Y0Vaw6E9EwsHfcr7luLdbfIL3
	9xufAMERmt0illjPpTXqZyAVVM4672eDQ2JIQMl9SMRpvpjnznzxOi6xQLLo1vfJKXnZycyeko/
	Po1aJso9rQQ+PanKBTx1IR/y5eCXOjtP1CWiWwsKX8WZwbDtlQn2+YBcLaw92rTJrajGFdHzl7E
	iGrCBRmvTsjDVaElX0V6YjaW/Kd4TpFheOnKTxS59+pgIQkqn0JOso7WuQainHnaQWyTJnYe07S
	bHWb9tuK6hkcs/2vDVUU6K0fnfdfMtmAlw1MoGfKPdjbfKxCiZDFwJbCqZ9lE7d2SxbzFxhwFvE
	WVHUhOqNokkpZmNzsoDbx+dPiTAaFefbqUUwKi1
X-Received: by 2002:a05:6a00:4197:b0:88b:af3d:2886 with SMTP id d2e1a72fcca58-88c6398df4bmr5157775b3a.23.1791135309729;
        Sun, 04 Oct 2026 10:35:09 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d247930sm2678370b3a.54.2026.10.04.10.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:35:09 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: sj@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	kunwu.chan@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/5] perf/core: add AUX buffer kernel-consumer API
Date: Mon,  5 Oct 2026 01:34:52 +0800
Message-ID: <20261004173458.837842-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM SPE and other tracing PMUs write records directly to perf AUX
buffers.  Unlike ordinary sampling PMUs, they do not necessarily
generate a perf_event_overflow() callback for each record.  A kernel
consumer therefore needs to own and drain an AUX buffer rather than
rely on the overflow path.

Userspace obtains AUX storage through perf_event_open() and mmap().
Kernel consumers created through perf_event_create_kernel_counter()
currently have no interface to allocate and manage AUX buffers.

This series adds the minimal perf-core interfaces needed for that use
case.  It was previously posted as RFC [1]; this version incorporates
feedback from that posting and is intended for review toward merging.
Patches 1-2 add the AUX owner interface, lifecycle helpers, and
cursor/copy operations without exposing perf's internal page layout.
Patches 3-5 exercise the new interfaces with KUnit, a userspace
regression test, and a selftest script.  The first consumer is a DAMON
ARM SPE backend, but this series is independent of DAMON and adds no
consumer-specific policy to perf.

The API follows the existing non-overwrite AUX ring-buffer protocol.
Setup and release serialise buffer lifetime transitions through
event->mmap_mutex.  Cursor reads/writes use the same ordering rules as
the userspace mmap consumer, and copy validates ranges in the absolute
cursor domain before applying the ring mask.

Testing
=======

The series builds cleanly at each step.

arm64 (Kunpeng 920, 256 CPUs, SPEv1.1), Image built from this series
and booted on the hardware:

KUnit: pass:39 fail:0 skip:0.  Userspace regression (arm_spe_0): full
pass; the producer head advances with live SPE traffic.  Selftest
script: 92 passed, 0 failed, 2 skipped (both environment skips).
perf record with arm_spe_0 captures data; dmesg stays clean.

x86_64 (vmlinux build, qemu/kvm): KUnit pass:39 fail:0 skip:0, also
under KASAN + lockdep (PROVE_LOCKING) and 15 repeated boots with no
splat.  Userspace regression (Intel PT): full pass.  The selftest
script also runs from installed selftest locations.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>

Changes since RFC [1]:

- Serialize AUX teardown under event->mmap_mutex and fix lifetime
  handling around ring_buffer_attach().
- Improve KUnit cleanup, concurrent-release coverage, and buffer-full
  assertions.
- Extend userspace and selftest coverage, including environment
  handling fixes and installed selftest support.
- Clarify AUX lifecycle, ordering, and cursor validation
  documentation.

[1] https://lore.kernel.org/linux-perf-users/20260814144927.489172-1-kunwu.chan@linux.dev/

Kunwu Chan (3):
  perf/core: add AUX buffer ownership for kernel events
  perf/core: add AUX ring accessors for kernel consumers
  selftests/perf_events: add AUX kernel API selftest script

Lian Wang (2):
  perf/core: add KUnit tests for AUX kernel-consumer API
  selftests/perf_events: add userspace AUX regression test

 .../userspace-api/perf_ring_buffer.rst        |   62 +-
 include/linux/perf_event.h                    |   18 +
 kernel/events/Makefile                        |    1 +
 kernel/events/aux_kernel_test.c               | 1152 +++++++++++++++++
 kernel/events/core.c                          |  164 +++
 kernel/events/internal.h                      |    6 +
 kernel/events/ring_buffer.c                   |  211 ++-
 lib/Kconfig.debug                             |   14 +
 tools/testing/selftests/perf_events/Makefile  |    2 +
 .../selftests/perf_events/aux_kernel.sh       |  631 +++++++++
 .../perf_events/aux_kernel_usermode.c         |  627 +++++++++
 tools/testing/selftests/perf_events/config    |    2 +
 12 files changed, 2885 insertions(+), 5 deletions(-)
 create mode 100644 kernel/events/aux_kernel_test.c
 create mode 100755 tools/testing/selftests/perf_events/aux_kernel.sh
 create mode 100644 tools/testing/selftests/perf_events/aux_kernel_usermode.c


base-commit: 6350de8671b94afb7691d110f63bcda42f658a69
-- 
2.43.0

