Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692711D0DEE
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626024; cv=none; b=FQXUy21TaGdWXjRx/o6Dxzm8AMpnVgPZ28CG0CQjN6kcEzKwFDqDE4YYfc1plXJHMggdaI37oW8q850KE6qdhTjSjkzwcMa9RNZtxi56U9dH0Jn8CYFZIY9Jmh0DE+GGH3llhcN5UYcPkQoiuexMfZEZSUJxUElow1/Df9fXKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626024; c=relaxed/simple;
	bh=sA59ZYLqRjQRcEDrdphsOdS3J6yviy7YDv1qUdw1/7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+ydRvgGzslby1N/S1RCom2d6VLZnnT9/4lDlorITyHhUSTPXS7BAV7+sWYEni4ko4O3s3Jxx0ozYf7Vff4PctEmHIXV512b1/gLCg6u4F0BgfyCu4qWP8UH+HcwyQAdtK2k0LUglniOs4BDLbzKN2QNchapt89Xl55zUecfH6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7b00927607eso585778a34.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626021; x=1761230821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUqEP1dwmUVPaxUfPgQ2bKqmT6S9ky2aoE0uUBHPT0g=;
        b=xSKmux0k1H21kLgL9yGmjMz6jtZKm5jGkv1tdLZcjZklipqEaL82O1/9KEy+mZEDVq
         17NYEUVQhbfUEs6hovGGAaRNVonO/a1li9e2tGTla0QJtcQ3PJURGc/a40AHRjkfljGm
         LzwCHHez5j4oHuGCd7UYm64J4Tf1jzVVHme1vhn4ZIRBmzT53aYnnfxpTVY/z1bXCv3n
         fqAo8kLD8uYUPEAIlHIRxigmcE8r0iizt1ao3dbJUShco65MhPuboFl4US8dObBAjAFd
         ZSYnUwQKxM5tLPdYB5Irig1YeK3b3+SaRD4rnId6Ve3/2uLhnH++aR5PxnSsE7OrkgKv
         UaCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEnXnzNaUeI8X4jFr1Jw7EjSTwZBosIZmIxA5T9iFnRQHorhaER6hfjpstclw0ukJIrXsxYu9ooYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFHJD99RX4FuKUxsT+Hq6qtEoF+Pr7As9MEB2gNSRYvmBSdsE
	Sr/24WCPZSXSrRQ3s/8EL+EACNEBb2hLagGF255U3TCyrQKOT2bSAWaF
X-Gm-Gg: ASbGncusvvMBu4jZAC6cBrmoI3n2bGQEaO3qFaf6PwFRbbKGKkBuCMUm5R81KiZ2XRE
	KgbMtoK5pDXchuHpxrqI1UOCGKyWBUHgfCmZvQb8jACI6oPSS9tSjImBFgLzH+JOFjnZeWrpWrB
	t6FwIoWyICTgKRCVck6/xa2ZSLGcXtkTpx8RK/N3lZfDhXVhA6uEc/8osTtef5rCIyIBezdQueL
	xlhnyPjAregr+saQMskJFq7XGmrulM3hoHNKToCgROY5/0xyFYkbpWxdpp4pkxn9lUi/hfh3RBV
	fJJgGctEUiiVKMEWezgieOtay9aU0Q/FmJBxwxecdHHDjy7GIdH+xmNBOCYkMZ/rs4ymP150qUm
	wCOycefQIOKjMys++P175MJ+8juUtaoU8W4vo6tS6p6NkZbeVpWhNL8fvP5GEBV3XSlxmpZ3/8q
	poFwL3Dp667iL/vUErSVpVNh3ywPgxB9C992wE97zEgGcHXdAGy2xVPDgVE2UaQmT8e1A=
X-Google-Smtp-Source: AGHT+IF9DW0Z61L6docyCir97py3czxMKDh5vf9yDUOUUa5eqZnxxy3L15m2srpQ+v03IN0vXX5rpA==
X-Received: by 2002:a05:6808:30a2:b0:438:3350:8d25 with SMTP id 5614622812f47-443a2ff491dmr103652b6e.40.1760626021433;
        Thu, 16 Oct 2025 07:47:01 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc812f24sm3678018b6e.12.2025.10.16.07.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Oct 2025 07:47:01 -0700 (PDT)
From: Jonathan Perry <yonch@yonch.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Morse <james.morse@arm.com>,
	Roman Storozhenko <romeusmeister@gmail.com>,
	Jonathan Perry <yonch@yonch.com>
Subject: [PATCH 0/8] resctrl: Add perf PMU for resctrl monitoring
Date: Thu, 16 Oct 2025 09:46:48 -0500
Message-ID: <20251016144656.74928-1-yonch@yonch.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose resctrl monitoring data via a lightweight perf PMU. 

Background: The kernel's initial cache-monitoring interface shipped via 
perf (commit 4afbb24ce5e7, 2015). That approach tied monitoring to tasks
and cgroups. Later, cache control was designed around the resctrl 
filesystem to better match hardware semantics, and the incompatible perf 
CQM code was removed (commit c39a0e2c8850, 2017). This series implements
a thin, generic perf PMU that _is_ compatible with resctrl.

Motivation: perf support enables measuring cache occupancy and memory 
bandwidth metrics on hrtimer (high resolution timer) interrupts via eBPF.
Compared with polling from userspace, hrtimer-based reads remove 
scheduling jitter and context switch overhead. Further, PMU reads can be 
parallel, since the PMU read path need not lock resctrl's rdtgroup_mutex.
Parallelization and reduced jitter enable more accurate snapshots of
cache occupancy and memory bandwidth. [1] has more details on the 
motivation and design.

Design: The "resctrl" PMU is a small adapter on top of resctrl's 
monitoring path:
- Event selection uses `attr.config` to pass an open `mon_data` fd
  (e.g. `mon_L3_00/llc_occupancy`).
- Events must be CPU-bound within the file's domain. Perf is responsible 
  the read executes on the bound CPU.
- Event init resolves and pins the rdtgroup, prepares struct rmid_read via
  mon_event_setup_read(), and validates the bound CPU is in the file's 
  domain CPU mask.
- Sampling is not supported; reads match the `mon_data` file contents.
- If the rdtgroup is deleted, reads return 0.

Includes a new selftest (tools/testing/selftests/resctrl/pmu_test.c)
to validate the PMU event init path, and adds PMU testing to existing 
CMT tests.

Example usage (see Documentation/filesystems/resctrl.rst):
Open a monitoring file and pass its fd in `perf_event_attr.config`, with
`attr.type` set to the `resctrl` PMU type.

The patches are based on top of v6.18-rc1 (commit 3a8660878839).

[1] https://www.youtube.com/watch?v=4BGhAMJdZTc

Jonathan Perry (8):
  resctrl: Pin rdtgroup for mon_data file lifetime
  resctrl/mon: Split RMID read init from execution
  resctrl/mon: Select cpumask before invoking mon_event_read()
  resctrl/mon: Create mon_event_setup_read() helper
  resctrl: Propagate CPU mask validation error via rr->err
  resctrl/pmu: Introduce skeleton PMU and selftests
  resctrl/pmu: Use mon_event_setup_read() and validate CPU
  resctrl/pmu: Implement .read via direct RMID read; add LLC selftest

 Documentation/filesystems/resctrl.rst         |  64 ++++
 fs/resctrl/Makefile                           |   2 +-
 fs/resctrl/ctrlmondata.c                      | 118 ++++---
 fs/resctrl/internal.h                         |  24 +-
 fs/resctrl/monitor.c                          |   8 +-
 fs/resctrl/pmu.c                              | 217 +++++++++++++
 fs/resctrl/rdtgroup.c                         | 131 +++++++-
 tools/testing/selftests/resctrl/cache.c       |  94 +++++-
 tools/testing/selftests/resctrl/cmt_test.c    |  17 +-
 tools/testing/selftests/resctrl/pmu_test.c    | 292 ++++++++++++++++++
 tools/testing/selftests/resctrl/pmu_utils.c   |  32 ++
 tools/testing/selftests/resctrl/resctrl.h     |   4 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 13 files changed, 948 insertions(+), 56 deletions(-)
 create mode 100644 fs/resctrl/pmu.c
 create mode 100644 tools/testing/selftests/resctrl/pmu_test.c
 create mode 100644 tools/testing/selftests/resctrl/pmu_utils.c

