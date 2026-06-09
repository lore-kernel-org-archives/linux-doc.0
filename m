Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DA3306B08
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015479; cv=none; b=HSKsZEGx4T8tnMe3j4iCqGNjH1xe5E1ohQWHXXlDfem30GaQeJ5YwIoTkUTM8m2ir0XUZCNie0mvPyvE8yqPm4yvHdaUc+e0GAwDBLnIeZPNtf0NLsC6YaVwGVEtB0xZmxrObxnz7dP/HPtN0/jM4tp87tCqlpAnZZx0Bhxp/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015479; c=relaxed/simple;
	bh=VLB3LNmx7V/VNIGVdREIpmVHrjpyTYSbQJO/EkCLJnE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jdx50wYn2id06mpYoPuG3Z/JHr5/zO3x/1Q7RGmEq3lda44xrHlXXDrGialMSMrzAKoBQm7wjKiMT+bj+x5ZwOLiH7E4X5lrDSeofRkkOKmWwtZpA4+PRC1BaAYsYfcyhDAXt03CqpJgPhlc5DgIAUxcEI38bJd0rQKEpLTjQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKSajG1v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKSajG1v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef82204c6so3031017f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015476; x=1781620276; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1AgYkBw0B8QdE09Wmm5dTf6CFmpMsD1GNAWvOPIXac=;
        b=BKSajG1vbhnlAZ+KFCFhpL6E5d1Leong3fkp17MSwzvyHQrc0xOieyc5NylN2hYVYn
         3F0hpEBEXKOUaafzck5y7dG2vHAb3r2VutCj2Dq7qitvZT4VXH/npvJ7IvHOuPvhHUCW
         bZjuCad3d5oRcouMLjVt8q6863GZsGIPsaQS1fn7sZzik2fepld3ZmRv659kVISQ34RR
         YiUIjZsCdqKLW0EFAxJD18fu1K81mB0Y01C5ELW8ceUwMNNYD79KzE7q8xcwGns6lpPk
         Keg3qO8djxXkAKul7fRHU+uOkv2H5RcGvkCgBrCzOh9SVNlOs+waTj5SH69QmafvdENi
         bzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015476; x=1781620276;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1AgYkBw0B8QdE09Wmm5dTf6CFmpMsD1GNAWvOPIXac=;
        b=nQzPIcdRm/6OZ6fM/8AjKquV8yWrWtv+io3Yu49nPgOFDuFTmsQXVaCOBCUjopaVmg
         88/Dh8jIv89yifn/oWhp22R7nIe+RWdN5Wfe7qu4J1LYgHygW/ctK4/lZ1jFfGd2rsS8
         5Rrfh9NqyvSLGp52KLK89/G+6ClBan+dMvr93/5YK+rKPOftYNHzEZy1SrVp2iEy8i9a
         z3/WoKqi7REhqTWplxH2W2GGsGQjvMDHcqnsDikQWa2a/Dxxk8tafrmNSkqCBZTfLPSv
         VkOb2CSZubGMsFTZ86enkUQT0uHA5EwNF2UNgQVCi15GLkXbx26sy6t9Z2Qt+tdbZwkB
         WZ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Uv1TrbVAnFWEI6yl2oIvLX08DW75IouZjH5Ppir9KJlCjpV7yjdPpAXujvPtUjUHs9fMLixiLsbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8yQAR4qA6CghhYFeqG7fsJdT2+qXTDaCqTtRf263lroirYmfd
	bpNCRMCFMaoaARRvwTLU5dGgVCTVr/wp93dSMvoT0gx2t6Gtpy23xO+7PUt7QOoHHE23nu5ikNT
	x7YIpVfA=
X-Gm-Gg: Acq92OEfeEEn2AgRfBstuEdvCdWw2N+1mp+jbxem4HG0LqpgtZReFheJiRfo6bSnePA
	qm5j3OfI6+2mvE7ial9uwGSPZmDANSrlv2vGKnLGye1y+Oonp75lYcWSCsN7RB1ELF4D9aqpvGn
	0ALfReIvvCNqU+bzcemqeF1aeU2kvXEw77YeV+bNPohhWt+5z7/FU2ZdvoNhih8JPHoGT3A6nk/
	/XX5A7kkhmA/t4HJRfn67kqkCFyP6o0k52Lo5hcwq+KZ1UaY+4k0SE2cBitwE0IBuhfYr6rP5D/
	Lftl86htn9RC5TQj8KboQRd5Yqc5ZJ9Z9nY8wdOc3zkAMhoYUJWOjVmY7yixzcnCmIBhbgOljUK
	sLfg3zdT0rNrQUBXIAKyPDS90/TAF3dOyO3fJl5LWfjEVu6D63pf1vHA7fQUomq92kWXMPfwIAX
	PxLkwlUe6QJ2pAOr0vHbSoZ9vaT0A/ND1D5ucjEauVbJ3W+XMmRd+eEA==
X-Received: by 2002:a05:6000:2993:20b0:460:138d:c9b0 with SMTP id ffacd0b85a97d-460302dc735mr24612953f8f.2.1781015475494;
        Tue, 09 Jun 2026 07:31:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/19] perf cs-etm: Queue context packets for frontend
Date: Tue, 09 Jun 2026 15:30:53 +0100
Message-Id: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0jKGoC/4XNTQrCMBAF4KtI1kbatJM2rryHuEiTscafRJJSK
 qV3dyqCiovCbN7j8c3IEkaHiW1XI4vYu+SCp1CuV8yctG+RO0uZiUzIDHLgZ33DxA1d8B0OHe+
 iNhfnW350A6+gVKpuNFZoGRn3iFS//P2B8smlLsTH612fz+1bFnJB7nOecWyszATmtair3dV5H
 cMmxJbNdC8+HI2WOEFcDQ0YlEcAI/+44psrlriCOFMooUqwCi38cNM0PQFtI8J0aQEAAA==
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
Changes in v4:
- Rename workload-ctl to record-ctl and improve docs (Leo)
- Use new packet argument everywhere in
  cs_etm__synth_instruction_sample() (Sashiko)
- Test for actual length of expected raw dump (Leo)
- Use -fno-inline instead of keyword (Leo)
- Don't test any brace or call lines in deterministic test
- Make sure context switch loop test does cleanup on failure (Sashiko)
- Remove undef int overflows in workloads (Sashiko)
- Link to v3: https://lore.kernel.org/r/20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org

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
 tools/perf/Documentation/perf-test.txt             |  24 ++-
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
 tools/perf/tests/shell/coresight/deterministic.sh  |  72 +++++++
 .../tests/shell/coresight/memcpy_thread/.gitignore |   1 -
 .../tests/shell/coresight/memcpy_thread/Makefile   |  33 ---
 .../shell/coresight/memcpy_thread/memcpy_thread.c  |  80 -------
 .../tests/shell/coresight/memcpy_thread_16k_10.sh  |  22 --
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  47 ++++
 .../shell/{ => coresight}/test_arm_coresight.sh    |  43 ++--
 .../{ => coresight}/test_arm_coresight_disasm.sh   |  23 +-
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
 tools/perf/tests/workloads/context_switch_loop.c   | 110 ++++++++++
 tools/perf/tests/workloads/deterministic.c         |  39 ++++
 tools/perf/tests/workloads/named_threads.c         | 109 ++++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  21 +-
 tools/perf/util/cs-etm.c                           | 236 ++++++++++++---------
 tools/perf/util/cs-etm.h                           |   8 +-
 40 files changed, 908 insertions(+), 942 deletions(-)
---
base-commit: 351a37f2fda4db668cff8ba12f2992d73dccdaea
change-id: 20260515-james-cs-context-tracking-fix-754998bae7ed

Best regards,
-- 
James Clark <james.clark@linaro.org>

