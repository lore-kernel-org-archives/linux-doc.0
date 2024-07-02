Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31487168A8
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 03:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719891475; cv=none; b=otbDWIToc7MGEkD23vSsl/nEsPw4lIOytk10OOGMFSQvzqEnSBxK0VIdD69mEvCFi9RO+dhrOF6PN2EE11mq34+D0VPvAcRcr9TlMBEBfeHde5urSTVbf2Cjvj0cvFBjsqVmGdwJVE319A+oqXdZFjwOVnsXi6hr3AFklzvmwTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719891475; c=relaxed/simple;
	bh=Ylxlhu8pitiJMGoNLtEeZ4/PG8OkC1k5mKTmQNdXJ/k=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=UMukNKePxh2kjfSoNgvCbiF17VSFZd2jDVWbCtBWiSBWL8wZJhED8ki1m0XwBA52uRlyneuZEbgCOmlE2oEg10toPZ3ZQK83qUgZXpdx9T+R4P+plH3xdI2CspMzp19Cp2a7zyYL+P9WiX1noUVljuU/nnRddnxejRd5kmnBUNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ea+DiHhS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ea+DiHhS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70abb539f41so1586982b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 20:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719891473; x=1720496273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBV6I+MqJPgMEAtSd8jBWBXMlcHc0d1F6+6qwZyHh5A=;
        b=ea+DiHhSUPjHV/72SSjZK3h2udTGb4tOe7W7nsCA7EOebRE2eK8XOyDG8uWnfC83W7
         bqQdztb6LdQM9Fpsanlr3II5JjKxOuzVTToALsf7QXEOuSkztWeOlwZN2F9TuDtEqdwf
         D9uZ7INBSTMHRHHxWU96vFq1Jl9Fs2FgJRFXt6cGAwgbR3bbidC0yEmGpdgSbGln6iLP
         oEXMP3hs+NBKORdNMlxJYjIkmKTdGGIAHm3NwOLm4u+MiFYyMKK2TpuIb2UzsclfkEjY
         CYWyuzhL/6O5jUSkzr2GDqKNoK8HlP+d83E00Z9IXEVUkjwP8RWleLt6TH6k97ET5f0L
         UqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719891473; x=1720496273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBV6I+MqJPgMEAtSd8jBWBXMlcHc0d1F6+6qwZyHh5A=;
        b=uxeXZDqHppTlLK0BgZ5kG13M/mCznkXyuVJs1klWnS6iw3sA8ovqtaT4fbUnQBt3rI
         MoSt27aWjOLDhCevadIbg1UVSFK4UoCUREUcz624rYodUGFQduNyl0cqIMtHalELdc+C
         T5Yx182YQsKhlsxW7fw9Q6jQ3aky1ht4jHrDg13pC/2HnHDJb92+ipDTJkHW/B7m7Q/n
         jvsfvdBTcPcUhDiipNlcns0ZIQc5J4zEvoqUdS9Wt7qA+vL9M/Smn2iBk+gY0b+Os7p0
         6dxK9ZIbkWFyX9zH5o9MULf4HpQ5HfGrRZx7d0kfUOT64aJ9pDbViK3DSfIRxmNES8Ht
         DVug==
X-Forwarded-Encrypted: i=1; AJvYcCXGFmL2mS4eubYWSCxlDdAcFtvmq9a2y+qIOgGqkmPNEKhX0XpBxnWk5fxBYMZGLPhNJyCdaT9ptnmXG3u7M523qYrX7h/fUwXj
X-Gm-Message-State: AOJu0YzHohUJnChRqO9yoEze3C7Al/gW5b0jQu0j4ole4xaUkIZzJiRY
	lylXhhFyMfn0kPrT5Jq1AnFU0YuRFfYK0g6OCNMZoBJXuAzksM5TsyMzl+Hqw1Q=
X-Google-Smtp-Source: AGHT+IFk5RP5dXJvyMBaQp4ZKscBjgf9M2xCAF4MEw8fIURDOrxvHlRLQdBn0ujX5vkXejd2l0qxRQ==
X-Received: by 2002:a05:6a00:218e:b0:705:9fc7:9133 with SMTP id d2e1a72fcca58-70aaaf08df3mr8800144b3a.23.1719891473506;
        Mon, 01 Jul 2024 20:37:53 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045aac85sm7537263b3a.174.2024.07.01.20.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jul 2024 20:37:53 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	sunilvl@ventanamicro.com,
	jesse@rivosinc.com,
	jrtc27@jrtc27.com,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Provide the frequency of time CSR via hwprobe
Date: Tue,  2 Jul 2024 11:37:30 +0800
Message-Id: <20240702033731.71955-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some applications (e.g., DPDK) use the time counter for basic performance
analysis as well as fine grained time-keeping. So we need export the time CSR
frequency to userspace by hwporbe syscall.

Changes:
v1->v2:
Modify "mtime" to "time CSR".

v2->v3:
Rebase "RISCV_HWPROBE_MAX_KEY 7" to "RISCV_HWPROBE_MAX_KEY 8" from
Jesse.

v3->v4:
1. Update the commit log from Punit.

2. Because RISCV_HWPROBE_MAX_KEY in
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/tree/arch/riscv/include/asm/hwprobe.h?h=for-next is 6,
so keep RISCV_HWPROBE_MAX_KEY to 7

Palmer Dabbelt (1):
  RISC-V: Provide the frequency of time CSR via hwprobe

 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.20.1

