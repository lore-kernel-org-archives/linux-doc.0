Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F075395ADD
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462249; cv=none; b=QFMgUKfd6aludxbJSJnysoNO63bpWVEKVjNDI3XC07mwvhlT8LdJQ5sQgQ13kBKbWiJEDDYiMW+dphd5higcRxw9uPbJYdpuQXmWQq4zCRLztDxnbz00GHnQodG6tqXmssFiSumqNptmw3bJewpZjzIKqTC8lzNZBtFfDSksVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462249; c=relaxed/simple;
	bh=jkGm2XnEEYvI3D+wc+k8mgIXGLOkNXkPZcP/RQghtd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jA5hfLVf/YRbHM3GuzJVL7EofVi5VvKvxkXt7JuF5STcdrJQD43l+PX7OuNQUC10EwZ2hc/i1cD8lzYi/j86bpNhtYlWo46br+pWcyClLpz7PdxVFzSyqPzKIlLjKZvsH3eZYnVed8omnvhNrrwd3q7mehU+2GMCe7k1Tsu0W/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kC3rP5hk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kC3rP5hk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so25333115e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462246; x=1787067046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qG1LYmIXQwJhNszNA6JSaXd2z4OF9GJH1weAVjbiHlk=;
        b=kC3rP5hkgN4sClZg1VauGmPR2XBcWF7X+u5bcrbGwVlGzpsrj9wvr8T4qCvJqOl7dN
         wbDMq3SlGRN3OuPrIJjAafzbeG+Tq9z9txmeNj0iW81OiXgUXy/MI0j0nSfZsm+QZSO4
         JTnJPSb05SSv9WgCVIAA8laM3STH5hPqgu8ioje44JFSn1+ujlfCjMlu2NIOsCVHg6bR
         jbAdQhPKa7rcJ4Chq664KDJh6YoMEl1bm9WrfsdE4YLEmWHHKFmqNel4aA2lg3k97vEf
         XZzRZRv9fFEOkBOny9+6uQshGATyU3pjub65/FkEmeo/QQQ4690CObQgIqeeD3dOrIhM
         bR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462246; x=1787067046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qG1LYmIXQwJhNszNA6JSaXd2z4OF9GJH1weAVjbiHlk=;
        b=J2ujH4WvdONFSegg9L6OFz05fNaonCQssPKpEi+iAojInAiCoZt8xpRFcflCFRrtq0
         BX7/BfTMUtWqQT3ARUezBo117S5ZJ1G4gVlynDEaqulV+aNu2jKTRDLAUjucvTwAT1h3
         P+lNoMXyc/V4sML1ElqkhHEPVArqgHfMBpVg6AOKnMoTWEqi5r9aFuDFYW68wzw3ybhv
         8voNFV22FTotubYcsyJhI2iKIubNZ8fsP9lfVkZLBX0v8vJStMx8Wpqx/sHiG7W1Bkmc
         uPvIDc3Usuj6t96dQs3vtoYhB8oxuUiZiJQYOKkh4HoGiimD1iCvxsNPPhLVH6FXts9o
         ABzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro98/2qTSfd6S0MB1QaBmR1gL9hGF4+t8x3QCt6Ozbsh4nVsj3EuVI7Fkq9CSvsXho8aQ7RFsmyE7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9VQ7hbvkLuy5dniqAf/9PDWa1+VrcZTK7OjRh+mDrw4BooOE
	zaMR13nt4s72AinhsDPyTlYp2K0xvs5xjVWvDwBD/T9rknpPB90dbbrKfR71VSlem76uJblLYFm
	JlkNg/lg=
X-Gm-Gg: AR+sD13xHJCaXG0pS1HBBDcBhabv6ElcVktqkQVW9fd70HN8ARZsvGnY9bycj7mliqG
	Fu56yTR1kMohJ9ndLrSD5nm3122/yKBjIGJTgzUkLPLW7BC788/xBYdQs9qCeLr3LUNVbwo8We+
	byGTyXRsyExoOR7QCmFFDDu8qJtzHplDhR26qinmIbK7AwNmX9Zl8kQLNZZq+U7kk6CrM6Yqram
	mK3sL3n/z4Gp7zGDRdPqSMmllOND+CAhD6ALbaKqK3hhF97WnQXkRcQjQvmTf4BPJI/Y1NwhvsI
	0Y95OQzUaNNxKFHDCTHLtU9FjEhBDvheiRR+79dYzxys91n+xAVzkCqhC9U5C894uIiaJZ/By+A
	bqcjl73gIFR4ZcD9+WjibsHNAksF5tXGY97f7BwuIBmmF9f4BAFjYx+GEFLa/d83SoaUUu56A2l
	9I+yMpFRWsbREAy8oL8ZzDH36i7LvJD6/1MhDupIhzEONTMlqMeTvshJNZtJeKxk2L
X-Received: by 2002:a05:600c:8595:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-4997846c98fmr70953065e9.17.1786462245612;
        Tue, 11 Aug 2026 08:30:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/14] perf cs-etm: Per-thread mode fixes and snapshot wrap
 support
Date: Tue, 11 Aug 2026 16:30:03 +0100
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPw/e2oC/x3NQQrCMBCF4auUWTsQI23Bq4iLoZmYEZqUmViUk
 rsbXX5v8f4DjFXY4DocoLyLSckd59MAS6L8YJTQDd75yU1uxCetbLgYvnIsulKtHHBjxZqUKWC
 UN46OZ38hmqNj6E+bcp//ldu9O4nVop9ftLX2BR8T+p6EAAAA
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
 Suyash Mahar <smahar@meta.com>
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
 tools/perf/util/cs-etm.c                           |  98 ++++++++++----
 13 files changed, 382 insertions(+), 368 deletions(-)
---
base-commit: bf10e6ee2ac3034c9068e03eed418fd16961984e
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e

Best regards,
--  
James Clark <james.clark@linaro.org>

