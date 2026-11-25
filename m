Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601042;
	b=BsPpciaeStjBHirnM0I2qym1DvyXbOgei6vToLjlcnibzNZkVm1hXTzbb/n+h6RItDgA
	 HiInWFtO/k3mzsj7MvLRQtwbsHAlw/MRtCHoTO0EM+xRUiTj37F5cgtJxUlYx5I6vBx7h
	 4VQM58vqNpIRgeNNUAXIOVAUiYjVgt2C074jt1bXB9huxiLiPYzm9QYEBUwDMB9ml3UHn
	 eVf3lHy44NLPxqaFFtXqoHeAIc9PeDw2DstREe6mcU+hU0H0AGUWtEm7KbFXswV709McW
	 6inOb+QxoBAEF/yDGCP/Jh7DamyKgf90LS05hhpgVi28F9LQEIhNqYOEIj6h4QEgDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
	b=1No+d9JQArWvy7jwn8WO4gCrgQeR5zk2qoSm0jNzFn8aq945d2xu4An55qPue4Z2ftlv
	 M8ZehwuQaqGdU7UjEoi05xPjLmxNfngfniY1rhOIqAUAPWUtyIGHH5aEjTgY2nHkos5HT
	 kuLFIQckdh7BghMx3zWxE7hoTMPOz3ZjcQPU3PvzHpH7nZ/82URZ3kUJtCHiv1VN+OV9D
	 Q7/AKmFbbKsfPNNKe/sjjagRG6+EZdQgUID2vnUy7rwCNh3pCEbGVa7feSEY3bBOWFIc3
	 53e4Gu/+TSClMxNPy8+GDTSg1cpaifYPoyJVbJf+A6CLV5mKXHatBfFFNl9fZk/x8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6O+preA;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9E606A32C
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD9E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6O+preA
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so12595104c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601041; x=1796205841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=z6O+preAdIolvfuN+jX8kUQlDus4PRUpHLxLCJAFY6MqqPHg24PvRv5TNlbtYCjx3N
         l3dmDoHhKMexzrvmzvuONr90yOMj5ZbfQiUWKo5DkAT+o042s71GFCmIpGjNWCFggoPR
         9+LgyLUxOuS0Cmf50jtYFv9aT/jDFyevtyT/RklgIujtUrnnPFjMwAwKSBTTwxYln5WI
         CvJNysUa4auHWQr7KGhzKSxmSGX+wyvYgtJYVcdh9SosiIywyR14z2+wkJGUuJyY3Odw
         OgEQod33oicHWnQpYvA3pb9rg/q3kWc7Fdh29haqAyhh0eIGM8O2o1eFEqE7lYhhUp4K
         0UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601041; x=1796205841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=tHlgqG34qi/Kgf4GUv5ImC/WyS09EMjGpsfU3igu0gSgzYta82xR2yBMcR00cGk8M6
         DQD5GOBVdtZvqQzygIEWW67xamcFUM6i0tLnBU3sdIBuQWgXz1mX4S/SsPzcPfEVR54S
         hcO342dn+J1Cf9l+HSQCCU07nQBFXRJXEP4a4NdM/NVkSpgszmp7TfKMW2zEFGD9iKq4
         Sc7XLQrPdTR+T4ERWSeHztaReYerWeDzQsTTOH60gGYbpK0h8NKtbVQmdCsVYA6WFZs4
         jJL97fmsJM94NkF3rbv9kVqYHrC84VXQAgMo1RMsBEX6ZRrzxkmEmMzecw+JggeA+m4y
         R/ew==
X-Forwarded-Encrypted: i=1; AL+hErFUCtMN3PgzbALOolsF3lMlJIzHWTZOOvvjU6WFVgM1WhhyCjrYw2l/fx72FamK8P7Wu9Q2hHmlGOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yX2UUfM4i6zeMkLpE4zjhTaHYIgnX2h8q7k4gyUqq2qGh/DWi
	VcfkJj0SxRauRrjjCCiydEDNHDrQyrgxUP7ag9rx/0IxVT5QBRX+LPul
X-Gm-Gg: AZFdTZfqXLZCTOQxMXnC0KXDxjOaz6HxYu6gEIfy7c0A1sabUx/AVuzN1Yy39fvTgYi
	WIPbNCthgZtItEL2BsCMIQMnLIlAn+YJ9kmuV4i7cKBtVuRXEwVE/ijZalAZZ9OicjbrpQsC78i
	dpcJdo7nD40754PfuXtKRFwxa33HWGcB2rhuBZAqjiuypPaanqFTm9D4zErnUkVhxsglLUYXZ+q
	2ptrfs6hrHnsXTfFUy2lZetKy172leAETirLoVBdjbjRbXu+UbMeDoJy8//CsbHIOZNo/x86b/L
	/NZTDXOC+stXn48X5MdKDn4D3ue6tb1z+hAbCkpogIUdnqhzoQ5bE52onaOJ4QLLQmnaoEvDcoP
	gqH235JM7UcdNIfPNdYlfUmoFm+uFPKHPt2ygBqr22oW2noP7BNBk2gb7prd3nA9vyrLw105pCK
	P2V6fAkJiCRxjLIZIBFIUn2lbgYjdIeO6sr4/YmiTtNgMj826RI4+LBVYTeRZZENXLc4B9Tb5H+
	tSipjDDqGQ9XxD6DpHelPbUgQbt4upVqT3o2ai9HnqAe2nU13ruSQgowSZTY/mTl3aZd+56Co8T
	ngj8hR6C4YlojFIaUkCe
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr16762572c88.26.1795601041141;
        Wed, 25 Nov 2026 02:04:01 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm33863045c88.11.2026.11.25.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:04:00 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v4] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 25 Nov 2026 10:03:57 +0000
Message-ID: <20261125100357.1937729-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111034432.2020955-1-takano32@gmail.com>
References: <20261111034432.2020955-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but that file is not in the tree and no commit in the history
leading to this base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant.  Remove it and the link target
rather than pointing at another test, and give the commands to build and
run that example in the How-to section, next to the reference it belongs
to.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: drop the reference instead of pointing it at another file, and give
    the libperf build and run commands in the How-to section.  The
    perf test -v user step is not moved; it is gone.
v3: drop the v1 review history so the commit log is the change alone.  The
    missing file is stated once.  Raised by Sashiko:
    https://lore.kernel.org/all/sashiko-outbox-208137@kernel.org/
v4: rebased onto v7.4-rc4, with the Fixes tag and the note about the tool
    that wrote this changelog back.  The diff is unchanged from v3:
    https://lore.kernel.org/all/20261111034432.2020955-1-takano32@gmail.com/
    v2 and v3 did not go to linux-arm-kernel; v1 did, and James Clark
    answered it there.

 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

