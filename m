Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989621;
	b=4sj+nEQpAfnQcl4+P6SnwLzC+VddboxnkodolulzrIHdagqP/QihDioCmAqprBc9SlDM
	 8eYMMF+hnlqoinYjgdMKeU2j+699uUeC8iUGhFY+Pd71QHzYdh8thY7RLAb9gU7/nUPzW
	 rMBeOFuWWCptSSoDgT78Jzc1uQA6gkxvOYvzsKMcMyiUVg1Tr5hpcYmYXsdg1NMoEC6kf
	 vmASzfe/IYhv+/zp/jcK6U8+p7AcjDsYGLHUwyNsBsdTJSFch4WihmVEkDFG3NWf8pvmq
	 9UHmXl1JivlJcOOsQjDXD4tCsueDxs+SpsaR7svXTJKGCDHSqH04n/QNAnxHSSywmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
	b=aJY5R1NVxPjXGZKwMgz8hGK/elj2dC0lqPQCmlvj77MoB5ox0jAQMpLbHc+vsot2UZ6m
	 K4M+9bU3wpyPxuzQZs5fyr0cIsD9ofIbDk1QPKJAQIYBdaf1yAL+NoPNc/STllOfOGhof
	 q0QUD9RA+UNL7mSWi+QLMm2pT0mBvHHF535d+MJ8NPK5iOLguovdr6ndZ1iN0/ZLTIXNs
	 /8Aom5Qw4S6U4jSvpsxJiodgwTQNkTadFiTC6S2RNMsm0cP2akspKVx/4yjl3WGceFQVr
	 ydeeSmGwn3SP9zK73RYNyfCx1Radb2MMKz9ZSh3SeE7lu/TMfUjTE3MSyD8eAyrexjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TThBMSZi;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5292606A32A
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5292606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TThBMSZi
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3be948e60so362569a91.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989620; x=1795594420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=TThBMSZiw+PvnG1b8LSQGrJhYWQLRlegUJo62gfBKApKXvwtolZ6O6Qr6A53nqBwq2
         LBzovfqsF64ns6YJeynIyYQZElNYUVIxUpoQRkgmaGeCzDInMv9y+Ps6WUw9/y6tlMxY
         bO3xaiqwqwT1NO6cQ0wS/2lfvQDqAHLd/6wHctWZB+oOvpHZDOuDdoGsApmRGzmBwm0p
         /Vu45GoKhe8VGmWQMvjqcLn358ZZfTYdLmxeW9eBLLeepQvMy0UfOXBjeqBtYa/0JpVb
         W9yb0cj2CSzzDSJikBrAana++PjJ9XMaDcFW/xj9f9DVcMR8vIa5yHB+l3di9arMs6mS
         5Xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989620; x=1795594420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=u1BF+/aSqz/v9e0dTofOVm0Ze3P7yF3h7io0F8QKZiiD/Gdq55CVvhPWGJDthRPxey
         TWFTddgarf55v2TvhGQgnVfqCqXdaHjx/DqadNghOju5fiZixAyg5PhBqA7VPwGoEzZa
         Keu1LRZATZlsShkGU4PdpU0Vhk8P3/a25YaMXO6yK2bHV/M8Pzp7GsONX32hc26vUzm0
         9z4rs4nbU9OqPymZyCf7RfZJ/bMQBrHB1xQwIPvX+UiIJKEmLo9LuE/3LM4uee3WQ2nO
         VNo5TlkJVwZelkeuT4eMUiSJt2DdNx4ZCdi7Vph7A4JSNE8GCswpu83iWc4QOBHnXAle
         L+NQ==
X-Forwarded-Encrypted: i=1; AL+hErF04m7pZSw7RSCI9C2/BETxzrTcWgqmwCTaO7AisAd7vs+Pu4Iwu/s5TUJrexPEpWB9AIbwmrLrsic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jwn7eSzXS04BCrtkOaB17yPPrYtlsLLijNXSwQRvqFaRhdnQU
	cvb8v/jAMjvqJuJxla6EI9zFpdGLpEm1K5AGkomow43lzQIuBMpEgZ96k/OmfYfqGvg=
X-Gm-Gg: AZFdTZdGK8fjf5afmgJQe4Ic+z2tgo1OPBduizIBfHPM0CB9u0VIi1ETakkP87r9pem
	cxmLIlNwX4jUls7esNAWGMd0Ojid1/h0q2lhL8u0DgANL2r8uvBH8qvZS+UdDgw29OsKo76E8Je
	S1ukDAjloo8s+vRFM/bcrnQZGqz7eHgH7CTeVC4Fg+vVIjkw48RyYYEejU02ljqfKDMy6mfsMhG
	fp7FsCR0ppPcfpTvXguai2hGB0VhIs6yCb4y1asJ93NH9R2jLUiGE+jxKazzwno8OuSlEU2chQH
	BwLGbNAlJHEa9jvYzotN2UWnu/mqoXIWAxunYV4V6dMkma6hE6IotTzhZhbo7UBINai+Dnodpuj
	7XbBEVkYYIFH2BdVbI2aKvsGp/SE8FmpS6DbUj9+2Ukp1Aqpd61bY9AaNCBaOJ/eW9ysZqbmqn1
	DA4Ies8e6vFK3vAmeh39K9UcOnCeOsgKVfaGqKf7xHv7oc6wGo1mZ56qnkmHOSr+zB5Px4VjEEm
	Iy7kfHph8h6mHizNX4P48mpZP3FIAko6MEXU+VtNnULc6xJZgnqjB4J1v87RpcvDU/djf/5H5jw
	mYzZXZ3/5JWtTUMp++OkcUNJV4bGnUSUBKmeMJM7FgmZLHYPhDyQmhfl+C9RtxyZLp/ZMvDmqmz
	KS6zgX68=
X-Received: by 2002:a17:90b:2642:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3d07da366mr1810223a91.61.1794989619995;
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 0/5] RISC-V: Add perf support for PDIS
Date: Wed, 18 Nov 2026 16:13:28 +0800
Message-ID: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
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

This RFC exposes Precise Decoded Instruction Sampling (PDIS) as a
per-CPU perf event on RV64. It targets the Smpdis/Sspdis draft at
2de60e18118ce78e2da82ec33296345c94d8560c:

  https://github.com/riscv/riscv-performance-event-sampling/blob/2de60e18118ce78e2da82ec33296345c94d8560c/modules/ROOT/pages/spdis.adoc

The draft defines two destinations for sample records. With MEM=0,
hardware records samples in indirect supervisor control and status
registers (CSRs). With MEM=1, hardware writes records to the PDIS Memory
Buffer. This series implements the MEM=0 path and reads records from
the sample data CSRs.

PDIS selects instructions with its own counter and delivers records on
the local counter overflow interrupt shared with the SBI PMU. The
driver samples at a fixed period and reports the recorded PC. Each
event selects either host user mode or host supervisor mode. CSR
numbers and the state-enable bit are provisional. Probing requires a
matching CPU node and explicit boot opt-in.

Open questions
--------------

- The driver registers a dedicated perf PMU for per-CPU sampling. Is
  this a reasonable starting point for PDIS support in perf?

- The model cancels in-flight selections when software sets inhibit and
  clears spdisctl. What sequence guarantees that an old selection can no
  longer publish a record before Linux switches tasks or events?

- The CSR record lacks a privilege field. If user and supervisor
  sampling are enabled together, how should perf determine the mode of
  the sampled instruction? Would it make sense to include the mode in
  the record itself?

- The driver reports the recorded PC but rejects perf's precise_ip
  requests. What guarantees about instruction selection and the recorded
  PC would justify advertising a precise_ip level for PDIS?

- COUNT can reload several times before software reads it, while OF is
  a single sticky bit. What should read() on a PDIS perf event report
  when the driver can only estimate the number of matching instructions?

On firmware supporting SBI PMU snapshots, restarting ordinary counters
also requires the existing counter_idx_base fix posted by liutong:

  https://lore.kernel.org/r/20260823044337.517125-1-liutong@iscas.ac.cn/

The reference OpenSBI firmware uses the non-snapshot path.

Reproduction
------------

The matching experimental trees are:

  QEMU: https://github.com/bows7ring/qemu/tree/4ce5dec939149ccef78358d68ddc15df1fc0c55d
  OpenSBI: https://github.com/bows7ring/opensbi/tree/1cdbbd84f83d80fdc6d62ea3347a4417b388784c

Build generic OpenSBI with CONFIG_XPDIS_TEST=y and Linux with
CONFIG_RISCV_PDIS_CSR=y. Boot virt with the resulting fw_dynamic.bin,
Image and a guest initramfs containing perf and the workload.

Use these QEMU options:

  -machine virt -accel tcg -smp 2 -m 512M -icount shift=0,sleep=off
  -cpu rv64,smstateen=on,smcsrind=on,sscsrind=on,sscofpmf=on,smcdeleg=off,ssccfg=off,x-pdis-regs=on,x-pdis-sample=on

In the test DT, append sspdis to each CPU's riscv,isa-extensions and
set riscv,pdis-test-model = "csr-v1". Add riscv_pdis_test=1 to the
kernel command line. This setup uses provisional CSR encodings.

The test ran the following from a CPU 1-pinned init. The /workload
binary pins itself to CPU 0 and loops over a labelled load instruction
400,000 times (one load and one store per iteration).

  /perf record --no-inherit -m 8 -a -C 0 \
    -e 'riscv_pdis_test/select=1/u' -c 4099 \
    -o /tmp/pdis-u.data -- /workload
  /perf script -i /tmp/pdis-u.data -F ip,event

On the QEMU model, perf received the expected PDIS samples in both
user-mode and kernel-mode runs.

Zhanpeng Zhang (5):
  dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
  riscv: Detect Smpdis and Sspdis ISA extensions
  perf: riscv: Probe the experimental PDIS CSR layout on matching CPUs
  perf: riscv: Add PDIS event and counter callbacks
  perf: riscv: Deliver PDIS samples through the SBI PMU interrupt

 .../admin-guide/kernel-parameters.txt         |  10 +
 .../devicetree/bindings/riscv/extensions.yaml |  19 +
 MAINTAINERS                                   |   1 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 drivers/perf/Kconfig                          |  13 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/riscv_pdis.c                     | 558 ++++++++++++++++++
 drivers/perf/riscv_pdis.h                     |  23 +
 drivers/perf/riscv_pmu_sbi.c                  |  43 +-
 10 files changed, 660 insertions(+), 12 deletions(-)
 create mode 100644 drivers/perf/riscv_pdis.c
 create mode 100644 drivers/perf/riscv_pdis.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)

