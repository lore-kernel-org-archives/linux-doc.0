Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1A26770A
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551541; cv=none; b=SL2Xq2cSik2geKTlt1c+otUB9vRQw5wLtsn+/YsuRX0iCailAF7coHZ13k54DQMKgBPntaKhtUkK1ioy+ETR8yiwMoIQTwHlmI0hWb/Af2lFF+6H9l+KEhTfPQRO3mfOBbd/Uap8D4jbWCkJ/FK6pUh49eS4IkcD00vCufvI7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551541; c=relaxed/simple;
	bh=O/Cgz/sNloT4p2sEDuZ9Z/7WzZX+Hiv6oAtunAv14gs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ahUz42G4Il+S56t/Y90Eilupl7MbquQhoURTYdg8BFHjgqEyjw9+P7KFBb5dmGmHHvBQQULe+8jIxUCoFljBA5BlTxILrsuZda69RW8yNK5/kG1tvVghiDR7HWKxINnmFgpXh0HaatcEgLutU/dLR8IoP08mSjZMLHkCN/TTuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Pa8yLKt5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Pa8yLKt5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc11834404so9976317a91.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740551539; x=1741156339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtUWquMOJu8M6vXYzl7Hez8XDGzXf5hk21OpP0Wr4oE=;
        b=Pa8yLKt5PVImOj0oTJv/2yk6WXgJ2K9pQAPfhk4o729b4mu21AddPsfiOftZeVagrD
         b11Vx4AOUHK8oV3xXT1ZLgrJTLaQPng2rFF4yuVJ5CtV2hzi5vAOjCFL6D4HqzL3IL36
         1aaIfQNvJUvhRB1FV62JiIPuvNWAOxeL5uM2b3spIxHLHOl9UjfBie5HaiZqiAT1CHPV
         n+BS/4lTzF+50dEfybh4l2NfGDV2Ib0mDtrCgBzYv0t1ADWCAXTJ59dyeDC63fDWqr56
         +T+4uepWx1OzQQnsn8I6CJDg8Ttjwi+4xkUhvBw29oBAGHBWXbFwA5Aa5XR9AKqfNWaq
         VTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551539; x=1741156339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtUWquMOJu8M6vXYzl7Hez8XDGzXf5hk21OpP0Wr4oE=;
        b=f3+VweIG+ZZPq37y+ee/BHdYau2EYQmRmRIXIKTfDxxL5SpyVLxiTbopOAhH3sOSkk
         1rj7ZBZlFz/ituDv6oFk3wAvmBhTPl23h6iC9AQWdPY+zsGMkV8V/oZu5M97/y7iBrR2
         jC/phWyHm3u9Jqef+rPtT9TFm4PjDhwsUN3mJ3JCmW543znXgITLJwE54wqGPWycLJlU
         jEfJT74LNYIf+7BzYQpJPC97YmmZAuw5cAWoRo9oQKresg8BUYxbwD6r2uwO1msJOA6r
         3bGIDk8X8nRGnbVLyrKlvAhV3D0D05lSdVARR7sA8ABwlwOnvlaJIRNY+Las1YF/5sXH
         bQsg==
X-Forwarded-Encrypted: i=1; AJvYcCVaLwY8wqM/kjusgV6hyHEZ/37gotgym+1k3L6kXX40jcSvQqlWdM9i/WsOn3IBh9NGKZefaZCdxBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDb6LClOG9LAkllkAC4bgT4dNHi2xLoqBi1J54jsk3s8G5eaqW
	8wJdac6vk6rXLq+s4phFG6v5M/b66RA99euF+9ZJIMpp6aOotYORrr+XTpjVh8U=
X-Gm-Gg: ASbGncuFdqfsm//RFLXzeVRwmjQCCn4yWAzl8c7gHY5mNjqaFZkigebDJRhi8uHu2CY
	KCmi2s8ALhRsZb4sX5Hw2hxv84BLMyPEQ2FzxaOjiD5O324ltfZCNHtBIFgi3MylYtHM3EV91aM
	FGxx+0fSX1wUHMUpQgdwTebmABEFBll8vFmv/YS195cqJQpIgvMuMmP+aYKhMk4v6aDtTkrL7wH
	EWttQb02RIlyL1N7VS/4wgIkv/qokl6VjYklaJT1hoS/n+dMNuyr1UpmYkh3dc7oVOMlV/oY1Bp
	NZBxsEfIZP+DN7oRqz26H7KJ9+x0Ke3CTRvwM5S1fSHsUwSqbavCJCSVjb4a
X-Google-Smtp-Source: AGHT+IG2mAiXspI0vkCYd+e4u0ND+Y2lMAuAlqRh2tnsq4uOKE0Trc7s5XDT5FmuMUha5uITuEAAhQ==
X-Received: by 2002:a17:90b:3e8a:b0:2f1:4715:5987 with SMTP id 98e67ed59e1d1-2fce86ae503mr34768209a91.9.1740551538640;
        Tue, 25 Feb 2025 22:32:18 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f152sm682599a91.46.2025.02.25.22.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Feb 2025 22:32:18 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v7 0/3] Enable Zicbom in usermode
Date: Wed, 26 Feb 2025 14:32:03 +0800
Message-Id: <20250226063206.71216-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

v6:
Change hwprobe_ext0_has's second param to u64.

v7:
Rebase to the latest code of linux-next.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  8 ++-
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.39.2

