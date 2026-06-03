Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490833264D2
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481845; cv=none; b=tSwwBKTEXN8x/ojm/FrQQmGROEAA+hFAvpuSjQDAkAoBVoBs0zkJSj7yJyZhndB3EKMQnjY/oZw6vlTaglyhSZeI+e/HPeA5aLfPZcCaKqH04WNP7/7vNf859L2TlIHUkQTAutdA3xUMeLZ+nihCAQSt97bTQ7ovJne0a58S31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481845; c=relaxed/simple;
	bh=zsB6b2mSax8ijZe6CEgFqKmviDOUVPzm4axnSMhYsEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iVRaYDx7fwwwDbAL0OTgTLVWAcrFR1jNJMkK6+ptC/5ewSuOaqZ34q2/UuhrPDahuxLxtjQTId1bfZPoJf4to3vuyRTI089lwZbFpP6YqKBHrxcfY1izIFJ81lxXBZVpzEe0T85VFp5jG7K19Lw7RHTnwiAoAJUjrT+mUo7/CIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THk3eZJd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THk3eZJd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4526135e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481842; x=1781086642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7B6wlqSPvHP4/6Eu04K7r/NtlTz65B+jmw25he2xI0=;
        b=THk3eZJdWo5qRIXNqAra4V3rLfUC5FA3stNJoe0/oULgaYqUEgVocsgsxae3SbJmM9
         Y/Fbgqr9QbMB3zQzSdhewnvexi3Aux6iPgaASmdTIunBD716eHl0CgBnWqWFFKVsX5+V
         cJa6vndrU/ECOwQ6hbaj63P7P7GLrxMWBpssi0s1R8wYPW1y7bBDGQBNhHgv9JscmXcp
         aCygPYzTrxHsEyHJIaUqfzRfqSoz29Xh/33g/Mk/E98Zm3skaOp2efVVOcaf9Mq5dyr9
         d9Nv+yckNVpSl/HL79j636PmBCyw+RikzozXPA9KzkfzAKQg4Vb3cFC58LkAZskicjJQ
         BRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481842; x=1781086642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7B6wlqSPvHP4/6Eu04K7r/NtlTz65B+jmw25he2xI0=;
        b=ZJNgiJMnMf9FnTrwnT1emDJ+QDeElYvpEokGgsiFw6WK4v2AOw38uwteK3nNxo+11t
         wihVpy8uni127bkGIx3sPNbQEshfnnjVqhFXVwKBEn/w2sFFq4V8sYz5YA80oHd26w6v
         dtfTcybZY9nwjn6BRd5AYB53Izb7wHUJB7mvKPqNClC59/PYSUNv/NhtxijobgX3qajb
         w1/6hK876j8CNH/sU4TKIX7reI6aWYC8ymIhgpKviYC7Tsz38etxCLUtdsHwFVpkJXZk
         g/hY3Y6r8c+1JkIgjqcvgvbYlNJD5RWqtTgFZl/qY5i002vp9AgJkAhNCUbSC2ofd7D+
         NRag==
X-Forwarded-Encrypted: i=1; AFNElJ/iZkpTiV57Olnq7XnwOnKGmBoRdn2TtbgPIi53diNRpd9JxFeT848FM7OEM++Zf7Z0qinaKKyEqD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTqmdEtIoKw/WXi9U86yClE8n924gTPENzQ0X9oN9rQX8GBQY
	HUswBhbc6HrSMwYc/+8Lyy+B2ufgqPGYgtO1dgxNb8ZX+oMkxlaagfmA2y993AKUfGU=
X-Gm-Gg: Acq92OEYtDiWpMWKWBJvTHwgQ5S30Ht2I3TtZERqv8/+P9LcPBvyF/vfn6sJlj/GqNZ
	zayX5t1C86XNLVykDm54Wb7Y7knGnyzwfEw2+6+oaePPvr08k9K/g1hWKRnf9jgxexK/8y5l6Ks
	8u1rnW6VEeKYw/M/gaDvZrmUjDcc+Di0MIztkRS7b9IpDXdJLkUT3gpYrZWUg1H0KNGzVbvfm//
	VTS/sug9sI3HvzE3nLYOitIFMZyQd9Tgxx3TfeWW6DyTWZZToWmxVoHzHfswZLMNMvU8l5alT48
	Z2bSDNELjjvTyLrRt1lIiMTX8frJx3ZOFyMkezowh2MbJIKXPX2mc7mS10vjdq9rWyVUU1CoAGQ
	6qxfdkVhwx9xIgvMmZD0CslVnf+V64cPmg+WhkILj+yAc7kosmA1mCtFa27y43u5ReWuB2FGLnG
	Le/xK0op0EGRTjtNF50CNJToGftN2chEzYaPOfJHf0vWI=
X-Received: by 2002:a05:600c:8b2a:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490b614df8dmr33957045e9.13.1780481841724;
        Wed, 03 Jun 2026 03:17:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/19] perf cs-etm: Queue context packets for frontend
Date: Wed, 03 Jun 2026 11:17:04 +0100
Message-Id: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACD/H2oC/4XNTQrDIBAF4KsE152ithrTVe9RujBmktgfLRokJ
 eTuNaFQugrM5j0e30wkYrAYyamYSMBko/Uuh8OuIKbXrkOwTc6EUy6pYAJu+okRTD7vBhwHGII
 2d+s6aO0IpThWlao1ltiQbLwC5nr1L9ecexsHH97ru8SW9itzuSEnBhSwbiTlyBRX5flhnQ5+7
 0NHFjrxH5dHWxzPnBK1MChbIYz84+Z5/gBQaP5BGgEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Fix thread tracking when decoding Coresight trace and add a new test for
it.

The new test is added as a Perf test workload instead of a custom binary
with its own build system, but this requires a new feature in Perf test
to pass in control pipes which can enable and disable events. This
scopes the recording to just the workload and helps to reduce the amount
of data recorded in tracing tests.

With this new feature we can re-write all of the Coresight tests to make
use of it and remove the remaining binaries which fixes the following
issues:

 * They didn't work in out of source builds
 * A lot of the tests unnecessarily required root and didn't skip
   without it
 * They were mainly qualitative tests which didn't look for specific
   behavior

Most importantly, the long build and runtime has been reduced. On a
Radxa Orion O6, unroll_loop_thread.c took 37s to compile which is longer
than the entire Perf build. Now the build time is negligible and the
before and after test runtimes for all the Coresight tests are:

          |   N1SDP   |   Orion O6
  -----------------------------------
  Before  |   4m  0s  |    14m 49s
  After   |      26s  |        56s
  -----------------------------------

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Minor sashiko comments
  - Close some more pipes
  - Fix warning messages
  - Error handling improvements
- Pass packet into cs_etm__synth_instruction_sample()
- Fixup stale comment (Leo)
- Link to v2: https://lore.kernel.org/r/20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org

Changes in v2:
- Add --workload-ctl option to Perf test
- Re-write all the Coresight tests and speed them up
- Pass packet to memory access function so frontend can use either the
  previous or current packet's EL
- Link to v1: https://lore.kernel.org/r/20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org

---
James Clark (19):
      perf cs-etm: Queue context packets for frontend
      perf test: Add workload-ctl option
      perf test: Add a workload that forces context switches
      perf test cs-etm: Test process attribution
      perf test: Add deterministic workload
      perf test cs-etm: Replace unroll loop thread with deterministic decode test
      perf test cs-etm: Remove asm_pure_loop test
      perf test cs-etm: Replace memcpy test with raw dump stress test
      perf test: Add named_threads workload
      perf test cs-etm: Test decoding for concurrent threads test
      perf test cs-etm: Remove duplicate branch tests
      perf test cs-etm: Skip if not root
      perf test cs-etm: Reduce snapshot size
      perf test cs-etm: Speed up basic test
      perf test cs-etm: Remove unused Coresight workloads
      perf test cs-etm: Make disassembly test use kcore
      perf test cs-etm: Add all branch instructions to test
      perf test cs-etm: Speed up disassembly test
      perf test cs-etm: Move existing tests to coresight folder

 Documentation/trace/coresight/coresight-perf.rst   |  78 +------
 MAINTAINERS                                        |   2 -
 tools/perf/Documentation/perf-test.txt             |  18 +-
 tools/perf/Makefile.perf                           |  14 +-
 tools/perf/scripts/python/arm-cs-trace-disasm.py   |  20 +-
 tools/perf/tests/builtin-test.c                    | 187 +++++++++++++++-
 tools/perf/tests/shell/coresight/Makefile          |  29 ---
 .../perf/tests/shell/coresight/Makefile.miniconfig |  14 --
 tools/perf/tests/shell/coresight/asm_pure_loop.sh  |  22 --
 .../tests/shell/coresight/asm_pure_loop/.gitignore |   1 -
 .../tests/shell/coresight/asm_pure_loop/Makefile   |  34 ---
 .../shell/coresight/asm_pure_loop/asm_pure_loop.S  |  30 ---
 .../tests/shell/coresight/concurrent_threads.sh    |  45 ++++
 .../tests/shell/coresight/context_switch_thread.sh |  69 ++++++
 tools/perf/tests/shell/coresight/deterministic.sh  |  71 +++++++
 .../tests/shell/coresight/memcpy_thread/.gitignore |   1 -
 .../tests/shell/coresight/memcpy_thread/Makefile   |  33 ---
 .../shell/coresight/memcpy_thread/memcpy_thread.c  |  80 -------
 .../tests/shell/coresight/memcpy_thread_16k_10.sh  |  22 --
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  48 +++++
 .../shell/{ => coresight}/test_arm_coresight.sh    |  43 ++--
 .../{ => coresight}/test_arm_coresight_disasm.sh   |  17 +-
 .../tests/shell/coresight/thread_loop/.gitignore   |   1 -
 .../tests/shell/coresight/thread_loop/Makefile     |  33 ---
 .../shell/coresight/thread_loop/thread_loop.c      |  85 --------
 .../shell/coresight/thread_loop_check_tid_10.sh    |  23 --
 .../shell/coresight/thread_loop_check_tid_2.sh     |  23 --
 .../shell/coresight/unroll_loop_thread/.gitignore  |   1 -
 .../shell/coresight/unroll_loop_thread/Makefile    |  33 ---
 .../unroll_loop_thread/unroll_loop_thread.c        |  75 -------
 .../tests/shell/coresight/unroll_loop_thread_10.sh |  22 --
 tools/perf/tests/shell/lib/coresight.sh            | 134 ------------
 tools/perf/tests/tests.h                           |   3 +
 tools/perf/tests/workloads/Build                   |   4 +
 tools/perf/tests/workloads/context_switch_loop.c   | 101 +++++++++
 tools/perf/tests/workloads/deterministic.c         |  39 ++++
 tools/perf/tests/workloads/named_threads.c         | 109 ++++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  21 +-
 tools/perf/util/cs-etm.c                           | 234 ++++++++++++---------
 tools/perf/util/cs-etm.h                           |   8 +-
 40 files changed, 889 insertions(+), 938 deletions(-)
---
base-commit: 5f0ca6b80b12bab1ce06839cdffb6148bb650ff4
change-id: 20260515-james-cs-context-tracking-fix-754998bae7ed

Best regards,
-- 
James Clark <james.clark@linaro.org>

