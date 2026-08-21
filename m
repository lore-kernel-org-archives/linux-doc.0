Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3355D39099C
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305778; cv=none; b=atB/CLczwuoJ85J0iHrd1mu8QpXHNVArCDZ89FNLKPj71NL7gQWBjYUZaU8kEgg8flQU8KwCdiQT7SHdtsy3lDnBWbmy1GsmnpvWKh3ASXF+2vJh4gQmnvNBIu7SgrnWOVIf9fWUais1g5kfybOEwkZ464F+kAiZNvcu+z/6C74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305778; c=relaxed/simple;
	bh=BvEhtMEa1nXBKNc/TSdOjljZ3zSi1XnO2c5vq2aQM0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DJ6CIlagcqcg51C1ogaUP8JYlszPO0NFPvCzLXGCLjYTaz2IIEh0Zd5oy6DLMqk66jHJSZSPJbMI42QXmSycu1b+yIS3Jz4MS4gQx0+/pE89yZ6/+mgaTcVAusrvf+ltZK8pETrV4uqZfq49/jtPaJ943wXIWJ4Y6KkCdJl1WMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3LOmKJI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3LOmKJI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f703a9d05so493543f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305765; x=1787910565; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nglHA7/3MMjKEoG2M+lIJ5S7PK5gm+FyJaV8ZvyaR0k=;
        b=X3LOmKJIC78BcFEKnTSnvPaM2hb+Kg73ZgSuWuz58TyGh0K75z03kKbhCARg6YvpAq
         Oww9ty699No9IVdTvlHv6LnPmbG0OExAgu8juE3cQ8IPrgyDojEN4GqpWKgXM3yg0jmz
         ab257/4vxHfJoe7P45KwzPgbKaYT4crGrRypql1VrAsir1HCVJSLf86Gk/vLoVqIZjCm
         OmGiss61Smc6l030GTuCMVIHOzUwLBfY729tE4toCdShtTFIDtM10fCIJJJJoe56luLW
         2PpL3wsHkp+iGViTv2Bt4InEZTk5kStyA6FqktjhWwElVq7q5DKGAQjV7gAFMAybPpAb
         VNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305765; x=1787910565;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nglHA7/3MMjKEoG2M+lIJ5S7PK5gm+FyJaV8ZvyaR0k=;
        b=KcxS9i+dK719JDv8OU/YmVmh0xdADrYF3JdgJwrfhYRf5l5TakcqZSPycmhwnjYDD3
         SLVB9QezonVvEtBGlz7tML8AcqZB37xFHQkrMv21VB0Ru62nXuzGqaUeSPLgRqerxIJZ
         vBAnjx3sryPHj4PACkNtKNikcWZat0ASCv/rqtRQAWPCp7+7j17CsNTEKBMcIbjvsXZc
         dtGkAlZ63v5gm4rkA/RpKwdUS3cr6wqXSBxloIDxSMBib8I22Qx9jTVNgvwubBLoLBeP
         3X3rWZkfEGDerLd+qbrfezrNeZ5HZSa3NfTGFJcjXdrcu1K1IVf7eqoZ73QBrZmbpH79
         CUdw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0QvK8RWjsP4eDSZMJ9bJs04rAyxQIqnLWqK3UPdBa5p6YCFkEiPpb90v1kZiJYGqSVCabHxrBCo4=@vger.kernel.org
X-Gm-Message-State: AFuF++m6GP2yFM4/Yw8FE9yNffMOO9S3uiCGzyURdUMbs8Cg+tIkS0ir
	08Dk5M7JoNEFcyPCtWiggEhV6oQ52Pb4T/aoPpwlBNQ3jrGUM7LMwQXNywXNIoEXMqY=
X-Gm-Gg: AR+sD11f7WUT9lOWB1MyrbfN/NybQg+cK1pC/hrnOmLfnTzJAcQ2/yYjMlHbHjx3ygU
	tHNBmBCQEAF+h5JkIY1XypqZzUFt7oJFXCbvJEYeNRnhyb8hH+dX93prCN1Qnc59QEWBq+k+36z
	aE5cbf9GnlAZ+POrp7VW0atLe9cUyiiwUuPjHu6ySLF4ML9+No9HhGCdiohQ2GwKb7N76XfDiQT
	PetrntbECL3yQBnTuFVYxaA4X8R9mR/BPlY64b7S42injdZincUgLZntECcUZeR/Occr3C6OvBF
	NtM7voDp2PBovh/I7Y77Ak17KLxiN9g1LHbx3X6jF60N5PxvGWzjAlqUJDrYPxfH5BFJnAQ0KIp
	srPyTXr6kBrscjqnh0VIm1wKsynHZYrE0G9BxhUETMyWZhRnWEPDJEEIrp2toA5uNU6Cy1swtM5
	8bsycAxVnsqrPNtJCSFhk0800oh3xPd7r8wOqXD4W+KRZLwiwUIDaASTXt0CKepFr+H74PFl5wR
	Bs=
X-Received: by 2002:a5d:59a7:0:b0:47f:93e4:5389 with SMTP id ffacd0b85a97d-482c0bb3a9fmr7556210f8f.20.1787305764643;
        Fri, 21 Aug 2026 02:49:24 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/14] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Fri, 21 Aug 2026 10:48:58 +0100
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAofiGoC/42NQQ6CMBAAv0J6dk1bUkBP/MNwaGALa6Ql20o0h
 L9b8QMeZw4zm4jIhFFci00wrhQp+Az6VIh+sn5EoCGz0FJXspIG7nbGCH2Ep3eBZ5sSDrAgQ5o
 Y7QCOXmAk1rq0tnYSRS4tjFkfl1uXeaKYAr+P6aq+9tdvlPqrvyqQcJGmMqVqnHFN+yBvOZwDj
 6Lb9/0DwG6C0tcAAAA=
X-Change-ID: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Fix a few issues with per-thread mode:
  - With TRBE, thread migrations hit a queue without a decoder assert
  - On nVHE, everything looks like guest trace instead of host
  - Tracing multiple threads didn't really work

After adding a tests for those, it turns out there were some snapshot
bugs not picked up by the other snapshot tests. That showed that the
different snapshot searches for Intel BTS and Arm SPE were inconsistent
and I think all tracers can benefit from using the same pointer fixup
logic, so that gets refactored into the common auxtrace.c. Then SPE can
just share the Intel BTS search as it was obviously copied from it
originally. IntelPT keeps the more advanced duplicate data search, but
in the future that could probably be made the common one and all tracers
would benefit from using it (except maybe BTS if it always has a very
small buffer, but I doubt the overhead of the duplicate search would be
an issue). For now this is more of a refactor rather than behavioral
change so don't do that yet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Remove stale "may be reset to -1 in per-thread mode" comment
- Set CPU when queueing auxtrace fragments otherwise
  auxtrace_queues__add_event() overwrites the queue's CPU
- Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org

---
James Clark (14):
      perf cs-etm: Fix nVHE per-thread decoding
      perf cs-etm: Warn for invalid timestamp option
      perf cs-etm: Turn on context packet timestamps in per-thread mode
      perf cs-etm: Use per-CPU queues for per-thread mode
      perf cs-etm: Increase default timestamp generation period
      perf auxtrace: Turn Intel BTS snapshot search into a generic one
      perf arm-spe: Use generic snapshot search
      perf auxtrace: intel-pt: Use new snapshot_has_wrapped callback
      perf cs-etm: Queue partial AUX records
      perf cs-etm: Don't print missing buffers in snapshot mode
      perf auxtrace: cs-etm: Capture wrapped snapshots
      perf test: Allow infinite named_thread loops
      perf test: Add test for per-thread mode
      perf cs-etm: Test multiple per-thread threads

 Documentation/userspace-api/perf_ring_buffer.rst   |   6 +-
 tools/perf/Documentation/perf-test.txt             |   2 +-
 tools/perf/arch/arm/util/cs-etm.c                  |  30 ++++-
 tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
 tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
 tools/perf/arch/x86/util/intel-pt.c                |  58 +++-----
 .../perf/tests/shell/coresight/per-thread-multi.sh |  78 +++++++++++
 tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 136 +++++++++++++++++--
 tools/perf/util/auxtrace.h                         |  20 ++-
 tools/perf/util/cs-etm.c                           | 101 ++++++++++----
 13 files changed, 384 insertions(+), 369 deletions(-)
---
base-commit: 9453bc6a69ef43755f1c28d5688cacdd69fa16bd
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e

Best regards,
--  
James Clark <james.clark@linaro.org>

