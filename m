Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612847;
	b=JiWt/vUaWIILHJH+Zz+/O/7YFZzhwDwNE8Pe5hlX8Jm1IDwz2zp7Ps6lKJi5n/1LcHsP
	 6mwFwhBIjW6CwRYQMXQWh2aBm7DtgPB0rhOWRDwnM4KivyqgXtHwckkU6rA32nuxN/EYB
	 ij/WvfO91elF9d2sY66rhQK4aV/HqzSAzbkHavm99lGxDtvDvUa8RlRQbHgr7gMk7hnbv
	 7fgnk+kIS89+irYLdljt3fooqk20XRypyYSON2lK0rKmxnMBnv3oUa95tGkqZOZZZz7vw
	 E2O91BLzuSTRu0sueI3Nr5wlbYMTxZCG4/dq7/j0IHbnAdInqSxglmAkrEeJRT0ip+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
	b=n6MATDKFZe0PZybIOmkxTRiSs3aHUFJtOdPllSZ1FmT7hgv01JKFv4zR7JvKphNC8zVn
	 ii6M0Yg8gryTNr/GU/NyaGrqHefdwrdgqB3EjyfVQkVBMRjd8IvsVrTr3tA+azCMU973Y
	 cBZqPs5ns8zFkrFh5wKEzUf2+VHjEWlNSJqrQjH/CNg4sDBNcxl/v6jhJr7ABqGRwqT02
	 cSvjPpFPSOxtukY6DmcWPYhQGNOW7z7YJNsNSS2yNbNAd/qIHeoTn5zJ02a3PvDoE8n2E
	 DpOV6b5EUq1Je6xzniCNdMm+MtVJM0xI0S6lw/Lf4XW09bqBx0I3IN5uZE0Km5NK5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC25606A332
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC25606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2903146eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 15:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612846; x=1795217646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=tACVrlV8XJeZsjfryb//f6qThpcS2cr5CPmVJSIUKq6P8bH5fo5gZO44daC4NdXhFT
         d1abIWSJRrZ56MtxEXnJFckn8bM9+vrbUJnw5b9iE1p17AYCSzO3fWLeCo6LBp3RYP5Z
         iO5DNTyHUxDctkK1mGgP4eYDZHXUt4q/BrqTa0AkuxIL7zFuZnETldAFbbslNegko9q8
         dxwB5OsFyrEYwUiiJ+SjXtal/X47hI2OV/t6aXJK3asAIqlAJP0RFQf68xARsZmzQc8k
         xDN+kw7riRQngvEcj7KueF/7yHCBglad8AD8oRMgubnfg6ApQeWxwUKzcptAo5j8kMZB
         MOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612846; x=1795217646;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=lqP6SHfslyRZzkIQsZy5BOres2r5kw+JEHCeHTe2r45ildAPiV2a+GhTSd/kwPliQ0
         IqZ9oV030a5BrVxDdHxITBWvdmcfIRl1batsEYcY0RyeVnhUidam+XWHTXC0vNd3eqpj
         T1YeoX844NMHowNEDYlAbBIuG4dEvPGw5ChMro4bADGIEWJ4oOLrMpVRrQ0fELjYCmhu
         kB/tVVo7d7C5pz3q9Akc3yKg+HU/Z0kB5d/RVnz43JytLHEGg/PYFchniLrcHOdL9Gqf
         azXSBi20gKDme8xXRZYQFsO+mDbCAvtm88syIhhA1H3hv6imBg/Aw7HQqg+Ni7OMPGHK
         SNjw==
X-Forwarded-Encrypted: i=1; AL+hErFNzmU80NR9rqaXHEvu9XgT3OZjGAhTfYlNAQO2UZS/R7ZcYwnTWAtVw59FI3+vbwgamTgMu3n4Oi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MMWvEHlKOiuCSjTrmDWYvYvUurHb6BWvZJyKf0YY8NK5MUiq/
	No0KDHzVBA4lw3DJztWCNYHlbm5vjA1609I2oNyReRbhdTdcIJsb1zJiGs1sEQ==
X-Gm-Gg: AYBFou3fA1aikxWSwoQlshPPOrinITOvacZqWzkWYHMlK9qemITFxjxY4b+U5ywaYD+
	OOYz8G76yJjHNaUwSr7JR53QW01+/re4rX+klkFmGZNzSA6U/exjafKXmoaSA/D9F9K2U7Oe9lQ
	Cfs2kqxLhTp56avbqHz+5vcjdlhtk67NEESjJQmfuS232uYR+OzEKlbkmUihfe8WovG0MqNQnYR
	iT9k7ZunuiFT+Y5rgKlT/njQgXE3DmJQtIOezPbgQFhcLHwkcQVRIn8wb7Tx5rkB1vWxDY/JsPV
	aL+AZOOeSdL54dc0ZV/XVC38T9dvrJtAlsb7KeQ0in5WgK9Ys6Pa4cwLgvjGf89vIwCEACZsoec
	SjMfDH3O7iS2VDWbOKvh+WeUy5v2NS9b2OA+c4L/JHFdldu8hVXbk8YqM3veov/OgREOGOnZlFO
	IhTlRcCWvBGpiDjSuRkqOk/z/2AB35MVTj+fgc74sTULIkpR2VT9JPBMrehXB1DFKP7XCYjz45w
	MoKJvVNKQMl/LH/meelcilXl+sSaniRZRWrkHAd1O6muPfAkt3MbmGGaRSLNYosdBL7Eq5H2Te7
	TCIr2rRv
X-Received: by 2002:a05:693c:8208:b0:378:314:402c with SMTP id 5a478bee46e88-37966e3806bmr3520013eec.28.1794612846033;
        Fri, 13 Nov 2026 15:34:06 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm10726041eec.9.2026.11.13.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:34:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 0/3] MIPS: SiByte: Add HW PMU support
Date: Fri, 13 Nov 2026 15:33:53 -0800
Message-ID: <20261113233358.538698-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Changes in v2:

• Preserve usercopy fault state during callchain unwinding. Save and
  restore current->thread.cp0_baduaddr so faulting unwinder reads cannot
  corrupt an interrupted usercopy’s recovery

• Balance PMU event initialization cleanup. Release resources exactly
  once on initialization failure and install the destroy callback only on
  success. Also check event type before rejecting unsupported attributes,
  allowing unrelated events to fall back to another PMU

• Keep disabled PMU interrupts masked after EOI. Add an SB1 IRQ flow
  wrapper that reapplies the mask when interrupt work disables the last
  event; the generic CPU IRQ EOI would otherwise unmask IP7 again

• Fix a documentation heading underline in sb1-pmu.rst (Randy, sashiko)

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 110 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 397 ++++++++++++++++++++++--
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 666 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

